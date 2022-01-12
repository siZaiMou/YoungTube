package com.youngtube.demo.controller;

import com.youngtube.demo.entity.Video;
import com.youngtube.demo.service.UserService;
import com.youngtube.demo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
        model.addAttribute("videos_rank",videos);
        return "index::video_rank_category"+videoCategory;
    }

}
