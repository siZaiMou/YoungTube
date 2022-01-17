package com.youngtube.demo.controller;

import com.github.pagehelper.PageInfo;
import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.service.InteractionService;
import com.youngtube.demo.service.UserService;
import com.youngtube.demo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    //在主页为用户推荐6个视频，可刷新，不分区
    @RequestMapping("/loadOnRecommand")
    public String loadOnRecommand(Model model)
    {
        List<Video> videos = videoService.findVideoToRecommend();
        Map<Integer,String> userNames = userService.findUserNames(videos);
        model.addAttribute("videos_recommend",videos);
        model.addAttribute("userNames_recommend",userNames);
        return "index::video_recommend"; //thymeleaf中的th:fragment结合ajax异步刷新数据
    }

    //在主页按照分区为用户推荐8个视频，可刷新
    @RequestMapping("/loadOnHomePageWithCategory/{videoCategory}")
    public String loadOnHomePageWithCategory(Model model,@PathVariable("videoCategory")int videoCategory)
    {
        List<Video> videos = videoService.findVideoToHomePage(videoCategory);
        Collections.shuffle(videos); //乱序，数据不够，测试使用
        Map<Integer,String> userNames = userService.findUserNames(videos);
        model.addAttribute("videos",videos);
        model.addAttribute("userNames",userNames);
        return "index::video_homepage"+videoCategory;
    }

    //7条分区热榜视频，不可刷新
    @RequestMapping("/loadOnRankWithCategory/{videoCategory}")
    public String loadOnRankWithCategory(Model model,@PathVariable("videoCategory")int videoCategory)
    {
        List<Video> videos = videoService.findVideoToRank(videoCategory);
        Collections.shuffle(videos); //乱序，数据不够，测试使用
        model.addAttribute("videos_rank",videos);
        return "index::video_rank_category"+videoCategory;
    }

    //根据视频id获得视频和up主信息，返回视频播放界面
    @RequestMapping("/loadOneWithUp/{videoId}")
    public String loadOneWithUp(@PathVariable("videoId")int videoId,Model model)
    {
        Video video = videoService.findOneByVideoId(videoId);
        User up = userService.findOneByUserId(video.getVideoUpId());
        int praiseCount = interactionService.getVideoPraiseCount(videoId);
        int coinCount = interactionService.getVideoCoinCount(videoId);
        int userFans = userService.findUserFansCount(video.getVideoUpId());
        video.setVideoPraiseCount(praiseCount);
        video.setVideoCoinCount(coinCount);
        up.setUserFans(userFans);
        model.addAttribute("video",video);
        model.addAttribute("up",up);
        return "videoPlay";
    }

    //查询与当前视频相关联的20个视频
    @RequestMapping("/loadOnRelate/{videoId}")
    public String loadOnRelate(@PathVariable("videoId")int videoId,Model model)
    {
        List<Video> videos = videoService.findVideoToRelate(videoId);
        Map<Integer,String> userNames = userService.findUserNames(videos);
        model.addAttribute("videos_relate",videos);
        model.addAttribute("userNames",userNames);
        return "videoPlay::video_relate";
    }

    //视频点赞
    @RequestMapping("/sendVideoPraise")
    @ResponseBody
    public void sendVideoPraise(int videoId,int userId)
    {
        interactionService.insertVideoPraise(videoId,userId);
    }

    //取消点赞
    @RequestMapping("/cancelVideoPraise")
    @ResponseBody
    public void cancelVideoPraise(int videoId,int userId)
    {
        interactionService.deleteVideoPraise(videoId,userId);
    }

    //判断当前用户是否给视频点赞
    @RequestMapping("/videoIsPraise")
    @ResponseBody
    public boolean videoIsPraise(int videoId,int userId)
    {
        return interactionService.videoIsPraiseByUserId(videoId,userId);
    }

    //视频投币
    @RequestMapping("/sendVideoCoin")
    @ResponseBody
    public void sendVideoCoin(int videoId,int userId,@RequestParam(value="coinCount",required = false,defaultValue = "1") int coinCount)
    {
        userService.changeUserCoin(userId,coinCount);
        interactionService.insertVideoCoin(videoId,userId,coinCount);
    }

    //判断视频是否投币
    @RequestMapping("/videoIsCoin")
    @ResponseBody
    public boolean videoIsCoin(int videoId,int userId)
    {
        return interactionService.videoIsCoinByUserId(videoId,userId);
    }

    //返回分区、查询得到的视频列表(同步)
    @RequestMapping("/loadVideoList")
    public String toVideoList(int categoryId,String searchTex,int searchMode,int currentPage,Model model) //使用searchText作为参数名时，出现重复拼接问题
    {
        List<Video>videoList = videoService.searchVideos(categoryId,searchTex,searchMode,currentPage);
        Map<Integer,User>ups = userService.findVideosUps(videoList);
        PageInfo<Video> pageInfo = new PageInfo(videoList);
//        for(int i=0;i<=pageInfo.getList().size();i++)
//        {
//            System.out.println("pagelist"+i+pageInfo.getList().get(i));
//        }
        model.addAttribute("videos_page",pageInfo);
        model.addAttribute("video_ups",ups);
        return "videoList";
    }
}
