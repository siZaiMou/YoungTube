package com.youngtube.demo.controller;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoCategory;
import com.youngtube.demo.entity.VideoClick;
import com.youngtube.demo.service.CommentService;
import com.youngtube.demo.service.VideoService;
import com.youngtube.demo.untils.HeatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/pages")
public class PageController
{
    @Autowired
    VideoService videoService;
    @Autowired
    CommentService commentService;



    @RequestMapping("/framtest")
    public String framtest(Model model)
    {
        model.addAttribute("categorys1",videoService.findAllCategory());
        return "test::testul"+1;
    }

    @RequestMapping("/toRegist")
    public String toRegist()
    {
        return "regist";
    }

    @RequestMapping("/toLogin")
    public String toLogin(Model model)
    {
        model.addAttribute("loginStatus",true);
        return "login";
    }
    @RequestMapping("/toIndex")
    public String toIndex(HttpSession session) throws ParseException {
        System.out.println((User)session.getAttribute("nowUser"));
       /* SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Video> allVideo = videoService.findAllVideo();
        for (int i = 0; i < allVideo.size(); i++) {
            int videoViewCount = allVideo.get(i).getVideoViewCount();
            int videoLikeCount = videoService.findLikeCount(allVideo.get(i).getVideoId());
            int videoDislikeCount = videoService.findDislikeCount(allVideo.get(i).getVideoId());
            String videoIssuingTime = sf.format(allVideo.get(i).getVideoIssuingTime());
            int commentCount = commentService.findOneVideoCommentCount(allVideo.get(i).getVideoId());
            int commentLikeCount = 0;
            int commentDislikeCount = 0;
            String commentLast = "";
            if (commentService.findLastComment(allVideo.get(i).getVideoId()).isEmpty()) {
                commentLast = "1970-01-01 00:00:00";
            } else {
                commentLast = sf.format((commentService.findLastComment(allVideo.get(i).getVideoId()).get(0).getCommentDate()));
            }


            String nowTime = sf.format(new Date());


            HeatUtils heatUtils = new HeatUtils(videoViewCount, videoLikeCount, videoDislikeCount, videoIssuingTime, commentCount, commentLikeCount, commentDislikeCount, commentLast, nowTime);

videoService.insertTotalHeat(allVideo.get(i).getVideoId(),allVideo.get(i).getVideoCategory(),heatUtils.getHeat());
        }*/
        return "index";
    }

    @RequestMapping("/toVideoPlay/{videoId}")
    public String toVideoPlay(@PathVariable("videoId")int videoId,HttpSession session)
    {
        return "forward:/video/loadOneWithUp/"+videoId;
    }

    @RequestMapping("/getCategory1")
    public String loadCategory1(Model model) //首页上方
    {
        model.addAttribute("categorys1",videoService.findAllCategory());
        return "index::top_bar_ul";
    }

    @RequestMapping("/getCategory2") //首页右侧
    public String loadCategory2(Model model)
    {
        model.addAttribute("categorys2",videoService.findAllCategory());
        return "index::right_bar_ul";
    }

    //搜索、分区跳转至视频列表,mode=0为按热度，mode=1为按时间(暂),"n.u.l.l."暂标识无搜索内容的情况，与搜索内容为""区别开
    @RequestMapping("/toVideoList")
    public String toVideoList(@RequestParam(value="categoryId",required = false,defaultValue = "0")String str_categoryId,@RequestParam(value="searchText",required = false,defaultValue = "n.u.l.l.")String searchText,@RequestParam(value="searchMode",required = false,defaultValue = "0")int searchMode,@RequestParam(name="currentPage",required = false,defaultValue = "1")int currentPage,HttpSession session)
    {
        int categoryId=0;
        try
        {
            categoryId = Integer.parseInt(str_categoryId);
        }
        catch (Exception e)
        {
            categoryId=0;
        }
        String str = "forward:/video/loadVideoList?searchTex="+searchText+"&categoryId="+categoryId+"&searchMode="+searchMode+"&currentPage="+currentPage;
        return str;
    }

    @RequestMapping("/toUserSpace/{userId}")
    public String toPersonSpace(@PathVariable("userId")int userId)
    {
        return "forward:/user/loadUserSpace/"+userId;
    }

    @RequestMapping("/toDynamicList/{userId}")
    public String toDynamicList(@PathVariable("userId")int userId,HttpSession session)
    {
        return "forward:/dynamic/loadDynamicList/"+userId;
    }

    @RequestMapping("/toSendDynamic")
    public String toSendDynamic(HttpSession session)
    {
        return "sendDynamic";
    }

    @RequestMapping("/toVideoFavorite/{userId}")
    public String toVideoFavorite(@PathVariable("userId")int userId,HttpSession session)
    {
        return "forward:/favorite/loadFavoriteList/"+userId;
    }

    @RequestMapping("/toVideoUpload")
    public String toVideoUpload(Model model,HttpSession session)
    {
        List<VideoCategory> allCategory = videoService.findAllCategory();

        model.addAttribute("categorys",allCategory);
        return "videoUpload";
    }

    @RequestMapping("/toViewHistory/{userId}")
    public String toViewHistory(@PathVariable("userId")int userId,HttpSession session)
    {
        return "forward:/video/viewHistory/"+userId;
    }

    @RequestMapping("/toViewTag/{videoId}")
    public String toVedioTag(@PathVariable("videoId")int videoId,HttpSession session)
    {
        return "forward:/video/viewTag/"+videoId;
    }

    @RequestMapping("/toViewTagCosine/{videoId}")
    public String toVedioTagCosine(@PathVariable("videoId")int videoId,HttpSession session)
    {
        return "forward:/video/viewTagCosine/"+videoId;
    }

    @RequestMapping("/toViewTest/{videoId}")
    public String toTest(@PathVariable("videoId")int videoId,HttpSession session)
    {
        return "forward:/video/viewTest/"+videoId;
    }
}
