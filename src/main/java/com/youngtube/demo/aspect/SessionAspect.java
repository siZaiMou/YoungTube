package com.youngtube.demo.aspect;

import com.youngtube.demo.entity.User;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

//切面在session中加入userid=-1的user对象，表示未登录。防止空指针异常
@Aspect
@Component
public class SessionAspect
{
    @Pointcut("execution(* com.youngtube.demo.controller.PageController.*(..))")
    public void pointMethod(){}

    @Before(value = "pointMethod()")
    public void beforeMethod(JoinPoint point)
    {
        Object[] args=point.getArgs();
        for(Object arg:args)
        {
            if(arg instanceof HttpSession)
            {
                HttpSession session = (HttpSession) arg;
                if(session.getAttribute("nowUser")==null)
                {
                    User us = new User();
                    us.setUserId(-1);
                    session.setAttribute("nowUser",us);
                }
            }
        }
    }
}
