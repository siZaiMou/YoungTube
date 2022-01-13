package com.youngtube.demo.controller;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.service.UserService;
import com.youngtube.demo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
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
        System.out.println(videos);
        model.addAttribute("userNames",userNames);
        return "videoPlay::video_relate";
    }
}
