package com.youngtube.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pages")
public class PageController
{
    @RequestMapping("/toRegist")
    public String toRegist()
    {
        return "regist";
    }

    @RequestMapping("/toLogin")
    public String toLogin()
    {
        return "login";
    }

    @RequestMapping("/toIndex")
    public String toIndex()
    {
        return "index";
    }
}
