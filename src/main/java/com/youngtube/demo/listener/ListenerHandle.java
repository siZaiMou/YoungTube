package com.youngtube.demo.listener;

import com.youngtube.demo.mapper.VideoMapper;
import com.youngtube.demo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.*;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
@Scope("singleton")
public class ListenerHandle
{
    @Autowired
    RedisTemplate redisTemplate;

    @Autowired
    VideoService videoService;

    @PostConstruct
    public void init()
    {
        System.out.println("初始化");
    }

    //关闭时将redis播放量写入mysql
    @PreDestroy
    public void afterDestroy()
    {
        Set keys = redisTemplate.keys("videoId_viewCount*");
        Map<Integer,Integer> videoIdAndViewCount = new HashMap<>();
        for(Object s:keys)
        {
            int videoId = Integer.parseInt(s.toString().substring(17));
            int viewCount = (int) redisTemplate.opsForValue().get(s.toString());
            videoIdAndViewCount.put(videoId,viewCount);
        }
        videoService.updateVideoViewCount(videoIdAndViewCount);
    }


}
