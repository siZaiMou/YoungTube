package com.youngtube.demo.controller;

import com.github.pagehelper.PageInfo;
import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoCategory;
import com.youngtube.demo.entity.VideoUploadEntity;
import com.youngtube.demo.service.FavoriteService;
import com.youngtube.demo.service.InteractionService;
import com.youngtube.demo.service.UserService;
import com.youngtube.demo.service.VideoService;
import com.youngtube.demo.untils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/video")
public class VideoController
{
    @Autowired
    VideoService videoService;

    @Autowired
    UserService userService;

    @Autowired
    InteractionService interactionService;

    @Autowired
    FavoriteService favoriteService;

    @Autowired
    RedisUtil redisUtil;

    //在主页为用户推荐6个视频，可刷新，不分区
    @RequestMapping("/loadOnRecommand")
    public String loadOnRecommand(Model model)
    {
        List<Video> videos = videoService.findVideoToRecommend();
        Map<Integer, String> userNames = userService.findUserNames(videos);
        model.addAttribute("videos_recommend", videos);
        model.addAttribute("userNames_recommend", userNames);
        return "index::video_recommend"; //thymeleaf中的th:fragment结合ajax异步刷新数据
    }

    //在主页按照分区为用户推荐8个视频，可刷新
    @RequestMapping("/loadOnHomePageWithCategory/{videoCategory}")
    public String loadOnHomePageWithCategory(Model model, @PathVariable("videoCategory") int videoCategory)
    {
        List<Video> videos = videoService.findVideoToHomePage(videoCategory);
        Collections.shuffle(videos); //乱序，数据不够，测试使用
        Map<Integer, String> userNames = userService.findUserNames(videos);
        model.addAttribute("videos", videos);
        model.addAttribute("userNames", userNames);
        return "index::video_homepage" + videoCategory;
    }

    //7条分区热榜视频，不可刷新
    @RequestMapping("/loadOnRankWithCategory/{videoCategory}")
    public String loadOnRankWithCategory(Model model, @PathVariable("videoCategory") int videoCategory)
    {
        List<Video> videos = videoService.findVideoToRank(videoCategory);
        Collections.shuffle(videos); //乱序，数据不够，测试使用
        model.addAttribute("videos_rank", videos);
        return "index::video_rank_category" + videoCategory;
    }

    //加载视频列表中的实时热榜
    @RequestMapping("/loadTimeHot")
    public String loadTimeHot(Model model)
    {
        List<Video> videos = videoService.findTimeHotVideos();
        Map<Integer, String> userNames = userService.findUserNames(videos);
        model.addAttribute("vidos_timeHot", videos);
        model.addAttribute("ups_timeHot", userNames);
        System.out.println(videos);
        return "videoList::videos_timeHot";
    }

    //根据视频id获得视频和up主信息，返回视频播放界面
    @RequestMapping("/loadOneWithUp/{videoId}")
    public String loadOneWithUp(@PathVariable("videoId") int videoId, Model model, HttpSession session)
    {
        Video video;
        User up = null;
        if (true) //if中应为满足热点视频的条件，由算法得出
        {
            video = (Video) redisUtil.get("videoId" + videoId);
            if (video != null)
            {
                up = (User) redisUtil.get("userId" + video.getVideoUpId());
            }
        }
        if (video == null)
        {
            video = videoService.findOneByVideoId(videoId);
            int praiseCount = interactionService.getVideoPraiseCount(videoId);
            int coinCount = interactionService.getVideoCoinCount(videoId);
//            int favoriteCount = favoriteService.findVideoFavoriteCount(videoId);
            video.setVideoPraiseCount(praiseCount);
            video.setVideoCoinCount(coinCount);
//            video.setVideoFavoriteCount(favoriteCount);
        }
        if (up == null)
        {
            up = userService.findOneByUserId(video.getVideoUpId());
            int userFans = userService.findUserFansCount(video.getVideoUpId());
            up.setUserFans(userFans);
            redisUtil.set("userId" + video.getVideoUpId(), up, 24 * 60 * 60);
        }

        int favoriteCount = favoriteService.findVideoFavoriteCount(videoId);
        video.setVideoFavoriteCount(favoriteCount); //获取收藏该视频的人数，收藏夹和用户为多对一关系，收藏操作多选框，不能通过简单的增加和取消收藏改变收藏人数

        if (!redisUtil.hasKey("videoId_viewCount" + videoId)) //如果redis中没有存放该video的播放量(单独的数据结构)，则将数据库中播放量放入redis
        {
            redisUtil.set("videoId_viewCount" + videoId, video.getVideoViewCount(), 24 * 60 * 60);
        }
        else //将redis中的播放量取出，此处可能导致的redis和mysql的数据不一致会在切面的after方法中解决
        {
            int videoViewCount = (int) redisUtil.get("videoId_viewCount" + videoId);
            video.setVideoViewCount(videoViewCount);
        }

        redisUtil.set("videoId" + videoId, video, 24 * 60 * 60);//暂时无法通过redis执行收藏数的更新操作，此项数据从数据库中读取后再统一存入redis


        model.addAttribute("video", video);
        model.addAttribute("up", up);
        return "videoPlay";
    }

    //查询与当前视频相关联的20个视频
    @RequestMapping("/loadOnRelate/{videoId}")
    public String loadOnRelate(@PathVariable("videoId") int videoId, Model model)
    {
        List<Video> videos = videoService.findVideoToRelate(videoId);
        Map<Integer, String> userNames = userService.findUserNames(videos);
        model.addAttribute("videos_relate", videos);
        model.addAttribute("userNames", userNames);
        return "videoPlay::video_relate";
    }

    //视频点赞
    @RequestMapping("/sendVideoPraise")
    @ResponseBody
    public void sendVideoPraise(int videoId, int userId)
    {
        interactionService.insertVideoPraise_MQ_producer(videoId, userId);
    }

    //取消点赞
    @RequestMapping("/cancelVideoPraise")
    @ResponseBody
    public void cancelVideoPraise(int videoId, int userId)
    {
        interactionService.deleteVideoPraise(videoId, userId);
    }

    //判断当前用户是否给视频点赞
    @RequestMapping("/videoIsPraise")
    @ResponseBody
    public boolean videoIsPraise(int videoId, int userId)
    {
        return interactionService.videoIsPraiseByUserId(videoId, userId);
    }

    //视频投币
    @RequestMapping("/sendVideoCoin")
    @ResponseBody
    public void sendVideoCoin(int videoId, int userId, @RequestParam(value = "coinCount", required = false, defaultValue = "1") int coinCount)
    {
        userService.changeUserCoin(userId, coinCount);
        interactionService.insertVideoCoin(videoId, userId, coinCount);
    }

    //判断视频是否投币
    @RequestMapping("/videoIsCoin")
    @ResponseBody
    public boolean videoIsCoin(int videoId, int userId)
    {
        return interactionService.videoIsCoinByUserId(videoId, userId);
    }

    //返回分区、查询得到的视频列表(同步)
    @RequestMapping("/loadVideoList")
    public String loadVideoList(int categoryId, String searchTex, int searchMode, int currentPage, Model model) //使用searchText作为参数名时，出现重复拼接问题
    {
        List<Video> videoList = videoService.searchVideos(categoryId, searchTex, searchMode, currentPage);
        Map<Integer, String> upNames = userService.findVideosUpNames(videoList);
//        System.out.println(upNames);
        List<VideoCategory> videoCategoryList = videoService.findAllCategory();
        PageInfo<Video> pageInfo = new PageInfo(videoList);
//        System.out.println(pageInfo);
        model.addAttribute("videos_page", pageInfo);
        model.addAttribute("video_up_names", upNames);
        model.addAttribute("video_categorys", videoCategoryList);
        return "videoList";
    }

    //查询用户投稿的视频
    @RequestMapping("/loadVideosByUserId/{userId}")
    public String loadVideosByUserId(@PathVariable("userId") int userId, Model model)
    {
        List<Video> up_videos = videoService.findVideoByUpId(userId);
        model.addAttribute("up_videos", up_videos);
        return "userSpace::up_videos";
    }

    @RequestMapping("/videoUpload")
    public String videoUpload(@RequestParam("videoFiles") MultipartFile[] files, HttpServletRequest request, Video upVideo,HttpSession session)
    {
        if (files != null && files.length > 0) {
            // 循环获取file数组中得文件
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                Long timelable = System.currentTimeMillis();
                String lable_time=timelable+"";
                //myvideo.set
                // 保存文件
                System.out.println("正在调用保存方法");
                // saveFile(file);
                // 判断文件是否为空
                if (!file.isEmpty()) {
                    try {

                        // new 出一个实体
                        VideoUploadEntity videoFile = new VideoUploadEntity();
                        // 放入session中
                        request.getSession().setAttribute("videoFile", videoFile);// 放入到session中

                        System.out.println("文件总大小" + file.getSize());
                        // 文件保存路径

                        String filePath = "D:\\Java_IDE\\SouceCode\\YoungTube\\src\\main\\resources\\static\\video\\" + lable_time+"_"+file.getOriginalFilename();
                        if(!file.getOriginalFilename().contains(".mp4")) {
                            filePath = "D:\\Java_IDE\\SouceCode\\YoungTube\\src\\main\\resources\\static\\video\\videoFont\\" + lable_time+"_"+file.getOriginalFilename();
                        }

                        System.out.println(filePath);
                        /******************** 测试 **************************/
                        File storeFile = new File(filePath);
                        // 得到输入流
                        InputStream in = file.getInputStream();
                        // 得到文件的输出流
                        OutputStream out = new FileOutputStream(storeFile);
                        // 文件总大小
                        long max = file.getSize();
                        videoFile.setFileSize(max);
                        videoFile.setFileName(file.getOriginalFilename());
                        // 剩余大小
                        long other = max;
                        int len = 0;// 读取写入长度
                        // 读写缓冲
                        byte[] b = new byte[300];
                        // 循环从输入流写入到输出流,结束循环是len==-1
                        while ((len = in.read(b)) != -1) {
                            out.write(b, 0, len);
                            other -= len;
                            videoFile.setFileSY(other);
                            // System.out.println("剩余大小:"+other);
                            // 给DTO设置other
                            // dto.setOther(other);
                            // System.out.println("总大小="+max+"剩余大小="+other);
                            // z总 max
                            // 剩余 other
                            // 传了 max-other
                            float zong = (float) (Integer.parseInt(String.valueOf(max)));
                            int shengxia = Integer.parseInt(String.valueOf(other));
                            float ii3 = (float) zong - shengxia;// 传了多少
                            if (shengxia != 0) {
                                int baifenbi = (int) ((ii3 / zong) * 100);
                                videoFile.setPercent(baifenbi);
                                // request.getSession().setAttribute("baifenbi",
                                // baifenbi);
                                // sSystem.out.println(baifenbi);
                            }
                        }
                        out.flush();// 刷新
                        out.close();// 关闭
                        in.close();// 关闭
                        videoFile.setTag(1);// 标记为1的时候表示上传成功
                        System.out.println("上传成功");


                        if(file.getOriginalFilename().contains(".mp4")) {
                            upVideo.setVideoSrc("/video/" + lable_time + "_" + file.getOriginalFilename());
                        }else {
                            upVideo.setVideoFrontSrc("/video/videoFont/" + lable_time + "_" + file.getOriginalFilename());

                        }

                        upVideo.setVideoUpId(((User)session.getAttribute("nowUser")).getUserId());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }


                }
            }
        }
        videoService.saveVideo(upVideo);
        System.out.println("上传结束");

        return "videoUpload";
    }

    @RequestMapping("/viewHistory/{userId}")
    public String viewHistory(@PathVariable("userId") int userId,Model model)
    {
        List<Video> historyVideos = videoService.findViewHistory(userId);
        model.addAttribute("historyVideos",historyVideos);
       // List<History> historyVideos = videoService.findViewHistory(userId);
        return "viewHistory";
    }
}
