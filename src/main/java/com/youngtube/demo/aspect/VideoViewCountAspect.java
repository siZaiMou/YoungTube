package com.youngtube.demo.aspect;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.vo.VideoViewVO;
import com.youngtube.demo.untils.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

//使用切面ip获取和redis统计视频播放量,六小时内同ip只计算一次
@Component
@Aspect
@Slf4j
public class VideoViewCountAspect
{
    @Autowired
    private RedisUtil redisUtil;

    private int updateVideoId;//在before方法中确定被更新播放量的videoId,无更新则为-1

    @Pointcut("execution(* com.youngtube.demo.controller.VideoController.loadOneWithUp(..))")
    public void loadOneWithUp(){}

    @Before(value = "loadOneWithUp()")
    public void beforeMethod(JoinPoint point)//确定某个视频播放量更新情况
    {
        updateVideoId=-1;
        Object[] args = point.getArgs();
        int videoId=-1;
        videoId = (int)args[0];
        HttpSession session = (HttpSession) args[2];
        Map<Integer,Map<String,Long>> viewMap; //键为视频id;值为记录ip和上次更新时间的map
        VideoViewVO videoViewVO; //封装viewMap的vo对象，redis对此vo对象进行操作
        videoViewVO = (VideoViewVO) redisUtil.get("videoViewStatusMap");
        if(videoViewVO==null)
        {
            viewMap = new HashMap<>();//map记录ip及上次更新时间，如果距离上次时间不足6小时则不更新播放量
            videoViewVO = new VideoViewVO();
            videoViewVO.setViewMap(viewMap);
            redisUtil.set("videoViewStatusMap",videoViewVO,24*60*60);
        }
        if(session.getAttribute("nowUser")!=null)
        {
            viewMap = videoViewVO.getViewMap();
            Map<String,Long> ipAndView; //暂时存放viewMap的值
            String ip = ((User)session.getAttribute("nowUser")).getUserIp();
            if(ip==null)
            {
                return;
            }
            Long now = new Date().getTime();
            if(viewMap.containsKey(videoId))//记录过当前视频的播放量情况
            {
                ipAndView = viewMap.get(videoId);
                if(ipAndView.containsKey(ip))//记录过当前ip用户的播放情况
                {
                    if(now-ipAndView.get(ip)>=6*60*60*1000)//超过六小时更新
                    {
                        ipAndView.put(ip,now);
                        viewMap.put(videoId,ipAndView);
                        videoViewVO.setViewMap(viewMap);
                        redisUtil.set("videoViewStatusMap",videoViewVO,24*60*60);
                        this.updateVideoId = videoId;
                    }
                }
                else//未记录过当前ip用户的对该videoId视频的播放情况，添加相应记录
                {
                    ipAndView = new HashMap<>();
                    ipAndView.put(ip,now);
                    viewMap.put(videoId,ipAndView);
                    this.updateVideoId = videoId;
                    videoViewVO.setViewMap(viewMap);
                    redisUtil.set("videoViewStatusMap",videoViewVO,24*60*60);
                }
            }
            else //未记录过当前视频的播放情况
            {
                ipAndView = new HashMap<>();
                ipAndView.put(ip,now);
                viewMap.put(videoId,ipAndView);
                this.updateVideoId = videoId;
                videoViewVO.setViewMap(viewMap);
                redisUtil.set("videoViewStatusMap",videoViewVO,24*60*60);
            }
        }
    }

    //更新视频播放量,包括redis与mysql中数据的更新，考虑到并发情况下的数据一致性，需要对redis的自增操作加锁
    @AfterReturning(value = "loadOneWithUp()")
    public void afterMethod(JoinPoint point)
    {
        if(updateVideoId>0)
        {
            if(redisUtil.hasKey("videoId_viewCount"+this.updateVideoId))//播放量一定已在controller的方法中被存入redis
            {
                redisUtil.incr("videoId_viewCount"+this.updateVideoId,1); //redis执行原子操作，不会出现并发导致的数据错误
            }
        }

    }
}