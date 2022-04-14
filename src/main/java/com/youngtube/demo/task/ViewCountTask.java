package com.youngtube.demo.task;

import com.youngtube.demo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Component
public class ViewCountTask
{
    @Autowired
    RedisTemplate redisTemplate;

    @Autowired
    VideoService videoService;

    //每五分钟将redis播放量写入mysql
    @Scheduled(fixedDelay = 300000)
    public void afterDestroy()
    {
        Set keys = redisTemplate.keys("videoId_viewCount*");
        if(keys!=null)
        {
            Map<Integer,Integer> videoIdAndViewCount = new HashMap<>();
            for(Object s:keys)
            {
                int videoId = Integer.parseInt(s.toString().substring(17));
                int viewCount = (int) redisTemplate.opsForValue().get(s.toString());
                videoIdAndViewCount.put(videoId,viewCount);
            }
//            System.out.println("vac"+videoIdAndViewCount);
            videoService.updateVideoViewCount(videoIdAndViewCount);
        }
    }

}
