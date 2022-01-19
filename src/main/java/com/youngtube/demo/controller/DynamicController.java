package com.youngtube.demo.controller;

import com.youngtube.demo.entity.Dynamic;
import com.youngtube.demo.entity.User;
import com.youngtube.demo.service.DynamicService;
import com.youngtube.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dynamic")
public class DynamicController
{
    @Autowired
    UserService userService;

    @Autowired
    DynamicService dynamicService;

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
}
