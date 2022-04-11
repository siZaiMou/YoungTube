package com.youngtube.demo;

import com.youngtube.demo.entity.Video;
import com.youngtube.demo.untils.RedisUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;

@SpringBootTest
public class RedisTest
{
    @Autowired
    RedisUtil redisUtil;

    @Autowired
    RedisTemplate redisTemplate;

    @Test
    public void connectTest()
    {
        System.out.println(redisUtil.hasKey("ttt"));
        
    }

    @Test
    public void objectUpdateTest()
    {
        if(redisUtil.hasKey("videoId"+10)) //点赞后保持redis中数据一致性
        {
            Video video=(Video)redisUtil.get("videoId"+10);
            System.out.println(video);
            int disp = video.getVideoDisPraiseCount();
            System.out.println(disp);
            video.setVideoDisPraiseCount(10+disp);
            System.out.println(video);
            redisUtil.set("videoId"+10,video,24*60*60);
        }
    }
}
