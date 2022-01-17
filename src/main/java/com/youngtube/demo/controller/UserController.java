package com.youngtube.demo.controller;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.service.UserService;
import io.netty.handler.codec.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
}
