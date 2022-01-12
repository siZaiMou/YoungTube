package com.youngtube.demo.controller;

import com.youngtube.demo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pages")
public class PageController
{
    @Autowired
    VideoService videoService;

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
    public String toIndex()
    {
        return "index";
    }

    @RequestMapping("/getCategory1")
    public String loadCategory1(Model model)
    {
        model.addAttribute("categorys1",videoService.findAllCategory());
        return "index::top_bar_ul";
    }

    @RequestMapping("/getCategory2")
    public String loadCategory2(Model model)
    {
        model.addAttribute("categorys2",videoService.findAllCategory());
        return "index::right_bar_ul";
    }
}
