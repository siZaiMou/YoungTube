package com.youngtube.demo.controller;

import com.sun.org.apache.bcel.internal.generic.LUSHR;
import com.youngtube.demo.entity.Dynamic;
import com.youngtube.demo.entity.User;
import com.youngtube.demo.service.CommentService;
import com.youngtube.demo.service.DynamicService;
import com.youngtube.demo.service.InteractionService;
import com.youngtube.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/dynamic")
public class DynamicController
{
    @Autowired
    UserService userService;

    @Autowired
    DynamicService dynamicService;

    @Autowired
    InteractionService interactionService;

    @Autowired
    CommentService commentService;

    //加载个人空间的动态(只有自己)
    @RequestMapping("/loadDynamicsByUserId/{userId}")
    public String loadDynamicsByUserId(@PathVariable("userId")int userId, Model model)
    {
        User user = userService.findOneByUserId(userId);
        List<Dynamic> dynamics = dynamicService.findDynamicsByUserId(userId);
        model.addAttribute("space_user",user); //在userSpace.html中，space_dynamics碎片(th:fragment)无法获得外部model
        model.addAttribute("space_dynamics",dynamics);
        return "userSpace::space_dynamics";
    }

    @RequestMapping("/sendDynamic")
    @ResponseBody
    public void sendDynamic(Dynamic dynamic)
    {
        dynamicService.saveDynamic(dynamic);
    }

    //加载自己和关注的人的动态
    @RequestMapping("/loadDynamicList/{userId}")
    public String loadDynamicList(@PathVariable("userId")int userId,Model model)
    {
        List<Dynamic>dynamicList = dynamicService.findDynamicsWithFollow(userId);//查出动态
        interactionService.makeInteractionCount(dynamicList,userId);//封装互动数据
        commentService.packageDynamicComment(dynamicList,userId);//封装动态的评论
        Map<Integer,User>dynamicUserList = userService.findDynamicUsers(dynamicList);
        userService.findDynamicCommentUsers(dynamicUserList,dynamicList);//加入评论用户id和user的映射
        model.addAttribute("dynamicList",dynamicList);
        model.addAttribute("dynamicUserList",dynamicUserList);
        return "dynamicList";
    }

    @RequestMapping("/sendDynamicPraise")
    @ResponseBody
    public void sendDynamicPraise(int userId,int dynamicId)
    {
        interactionService.insertDynamicPraise(userId,dynamicId,new Date());
    }

    @RequestMapping("/cancelDynamicPraise")
    @ResponseBody
    public void cancelDynamicPraise(int userId,int dynamicId)
    {
        interactionService.deleteDynamicPraise(userId,dynamicId);
    }
}
