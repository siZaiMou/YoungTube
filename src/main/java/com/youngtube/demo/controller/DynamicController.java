package com.youngtube.demo.controller;

import com.sun.org.apache.bcel.internal.generic.LUSHR;
import com.youngtube.demo.entity.Dynamic;
import com.youngtube.demo.entity.User;
import com.youngtube.demo.service.DynamicService;
import com.youngtube.demo.service.InteractionService;
import com.youngtube.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
        List<Dynamic>dynamicList = dynamicService.findDynamicsWithFollow(userId);
        interactionService.makeInteractionCount(dynamicList);//封装互动数据
        Map<Integer,User>dynamicUserList = userService.findDynamicUsers(dynamicList);
        model.addAttribute("dynamicList",dynamicList);
        model.addAttribute("dynamicUserList",dynamicUserList);
        return "dynamicList";
    }
}
