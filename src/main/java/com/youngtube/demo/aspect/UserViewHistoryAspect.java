package com.youngtube.demo.aspect;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.service.UserService;
import com.youngtube.demo.untils.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

//切面实现用户观看历史,双重哈希判重,最新优先
@Component
@Aspect
@Slf4j
public class UserViewHistoryAspect
{
    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    UserService userService;


    @Pointcut("execution(* com.youngtube.demo.controller.VideoController.loadOneWithUp(..))")
    public void loadOneWithUp(){}

    @AfterReturning(value = "loadOneWithUp()")
    public void afterMethod(JoinPoint point)//切面更新用户观看历史
    {
        Object[] args = point.getArgs();
        int videoId = (int)args[0];
        User nowUser = (User) ((HttpSession) args[2]).getAttribute("nowUser");
        if(nowUser!=null&&nowUser.getUserId()>0&&videoId>0)
        {
            int userId = nowUser.getUserId();
            Map<Integer, Map<Integer, Date>>historyViewStatusMap; //服务器(缓存)存放所有用户的视频历史(userId,videoId,date)
            Map<Integer,Date>nowUserHistoryMap; //当前用户的视频历史
            Date viewDate = new Date();
            historyViewStatusMap = (Map<Integer, Map<Integer, Date>>) redisUtil.get("HistoryViewStatusMap");
            if(historyViewStatusMap == null)
            {
                historyViewStatusMap = new HashMap<>();
            }
            String uid = String.valueOf(userId); //redis将Integer类型的key反序列化为String
            nowUserHistoryMap = historyViewStatusMap.get(uid);
            if(nowUserHistoryMap==null)
            {
                nowUserHistoryMap = new HashMap<>();
            }
            nowUserHistoryMap.put(videoId,viewDate); //更新当前用户的视频历史
            historyViewStatusMap.put(userId,nowUserHistoryMap);
            redisUtil.set("HistoryViewStatusMap",historyViewStatusMap);
            if(historyViewStatusMap!=null&&historyViewStatusMap.containsKey(uid)&&historyViewStatusMap.get(uid).size()>50) //缓存中同一用户历史超过五十条,写入数据库
            {
                userService.saveUserViewHistory(userId,historyViewStatusMap.get(userId));
                historyViewStatusMap.remove(uid); //清空缓存内容,防止重复写入
                redisUtil.set("HistoryViewStatusMap",historyViewStatusMap);
            }
        }
    }
}
