package com.youngtube.demo.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

//使用切面和redis统计视频播放量
@Component
@Aspect
@Slf4j
public class VideoViewAspect
{
    @Autowired
    private RedisTemplate redisTemplate;

    @Pointcut("execution(* com.youngtube.demo.controller.VideoController.loadOneWithUp(..))")
    public void loadOneWithUp(){}


}
