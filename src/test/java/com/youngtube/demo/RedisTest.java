package com.youngtube.demo;

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
}
