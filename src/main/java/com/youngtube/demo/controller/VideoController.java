package com.youngtube.demo.controller;

import com.github.pagehelper.PageInfo;
import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoCategory;
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

import javax.servlet.http.HttpSession;
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
    public String loadOneWithUp(@PathVariable("videoId") int videoId, Model model,HttpSession session)
    {
        Video video;
        User up = null;
        if (true) //if中应为满足热点视频的条件，由算法得出
        {
            video = (Video) redisUtil.get("videoId" + videoId);
            if(video!=null)
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

        if(!redisUtil.hasKey("videoId_viewCount"+videoId)) //如果redis中没有存放该video的播放量(单独的数据结构)，则将数据库中播放量放入redis
        {
            redisUtil.set("videoId_viewCount"+videoId,video.getVideoViewCount(),24*60*60);
        }
        else //将redis中的播放量取出，此处可能导致的redis和mysql的数据不一致会在切面的after方法中解决
        {
            int videoViewCount = (int) redisUtil.get("videoId_viewCount"+videoId);
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
        interactionService.insertVideoPraise(videoId, userId);
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
}
