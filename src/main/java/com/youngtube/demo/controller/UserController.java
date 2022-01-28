package com.youngtube.demo.controller;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.service.UserService;
import com.youngtube.demo.service.VideoService;
import io.netty.handler.codec.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class UserController
{
    @Autowired
    UserService userService;

    @Autowired
    VideoService videoService;

    //播放页获取当前用户ip(无论是否登录),以统计播放量
    @RequestMapping("/setNowUserIp")
    @ResponseBody
    public void setNowUserIp(String userIp,HttpSession session)
    {
        User nowUser = (User)session.getAttribute("nowUser");
        nowUser.setUserIp(userIp);
        session.setAttribute("nowUser",nowUser);
    }

    @RequestMapping("/regist")
    public String userRegist(User user)
    {
        userService.regist(user);
        return "login";
    }

    @RequestMapping("/login")
    public String userLogin(User user, @RequestParam(value = "autoLogin", required = false) boolean autoLogin, Model model, HttpSession session, HttpServletResponse response)
    {
        User realUser = userService.login(user);
        if(realUser==null)
        {
            model.addAttribute("loginStatus",false);
            return "login";
        }
        else
        {
            session.setAttribute("nowUser",realUser);
            if(autoLogin)
            {
                Cookie cookie = new Cookie("auto_login_userId",Integer.toString(realUser.getUserId()));
                cookie.setMaxAge(60*60*24*7);
                response.addCookie(cookie);
            }
        }
        return "index";
    }

    @RequestMapping("/toggle")
    public String userToggle(HttpSession session,HttpServletResponse response)
    {
        session.setAttribute("nowUser",null);
        response.addCookie(new Cookie("auto_login_userId",null));
        return "login";
    }

    @RequestMapping("/userIsFollow")
    @ResponseBody
    public boolean userIsFollow(int followUserId,int followedUserId)
    {
        return userService.findUserIsFollow(followUserId,followedUserId);
    }

    @RequestMapping("/sendFollow")
    @ResponseBody
    public void sendFollow(int followUserId,int followedUserId,@RequestParam(value="followMode",required = false,defaultValue = "0")int followMode)
    {
        userService.saveFollow(followUserId,followedUserId,followMode);
    }

    @RequestMapping("/cancelFollow")
    @ResponseBody
    public void cancelFollow(int followUserId,int followedUserId)
    {
        userService.cancelFollow(followUserId,followedUserId);
    }

    @RequestMapping("/loadUserSpace/{userId}")
    public String loadUserSpace(@PathVariable("userId")int userId,Model model)
    {
        User user = userService.findOneByUserId(userId);
        user.setUserFans(userService.findUserFansCount(userId));
        user.setUserFollows(userService.findUserFollowCount(userId));
        user.setUpVideoNum(videoService.findUserVideoCount(userId));
        model.addAttribute("space_user",user);
        return "userSpace";
    }
}
