package com.youngtube.demo.controller;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.VideoComment;
import com.youngtube.demo.service.CommentService;
import com.youngtube.demo.service.UserService;
import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;


//评论相关组件以Comment开头，考虑视频评论和动态等其它评论的复用
@Controller
@RequestMapping("/comment")
public class CommentController
{
    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @RequestMapping("/sendVideoComment")
    @ResponseBody
    public void sendVideoComment(VideoComment videoComment)
    {
        commentService.saveVideoComment(videoComment);
    }

    @RequestMapping("/getVideoCommentWithHot/{videoId}")
    public String getVideoCommentWithHot(@PathVariable("videoId")int videoId, Model model)
    {
        List<VideoComment> videoComments_hot = commentService.findVideoCommentWithHot(videoId);
        Map<Integer, User> commentUsers_hot= userService.findCommentUsers(videoComments_hot); //为评论加载用户信息
        model.addAttribute("videoComments_hot",videoComments_hot);
        model.addAttribute("commentUsers_hot",commentUsers_hot);
        return "videoPlay::comment_hot";
    }

    @RequestMapping("/getVideoCommentWithNew/{videoId}")
    public String getVideoCommentWithNew(@PathVariable("videoId")int videoId, Model model)
    {
        List<VideoComment> videoComments_new = commentService.findVideoCommentWithNew(videoId);
        Map<Integer,User> commentUsers_new = userService.findCommentUsers(videoComments_new);
        model.addAttribute("videoComments_new",videoComments_new);
        model.addAttribute("commentUsers_new",commentUsers_new);
        return "videoPlay::comment_new";
    }
}
