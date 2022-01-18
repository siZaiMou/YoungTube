package com.youngtube.demo.controller;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String toVideoList(@RequestParam(value="categoryId",required = false,defaultValue = "0")String str_categoryId,@RequestParam(value="searchText",required = false,defaultValue = "n.u.l.l.")String searchText,@RequestParam(value="searchMode",required = false,defaultValue = "0")int searchMode,@RequestParam(name="currentPage",required = false,defaultValue = "1")int currentPage)
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
        System.out.println("categoryId"+categoryId);
        String str = "forward:/video/loadVideoList?searchTex="+searchText+"&categoryId="+categoryId+"&searchMode="+searchMode+"&currentPage="+currentPage;
        return str;
    }
}
