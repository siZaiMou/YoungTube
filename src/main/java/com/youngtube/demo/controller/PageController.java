package com.youngtube.demo.controller;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/pages")
public class PageController
{
    @Autowired
    VideoService videoService;


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
    public String toIndex(HttpSession session)
    {
        if(session.getAttribute("nowUser")==null)
        {
            User us = new User();
            us.setUserId(-1);
            session.setAttribute("nowUser",us);
        }

        return "index";
    }

    @RequestMapping("/toVideoPlay/{videoId}")
    public String toVideoPlay(@PathVariable("videoId")int videoId,HttpSession session)
    {

        if(session.getAttribute("nowUser")==null)
        {
            User us = new User();
            us.setUserId(-1);
            session.setAttribute("nowUser",us);
        }
        return "forward:/video/loadOneWithUp/"+videoId;
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
