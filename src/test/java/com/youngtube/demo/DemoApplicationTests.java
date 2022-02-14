package com.youngtube.demo;

import com.github.pagehelper.PageHelper;
import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.listener.ListenerHandle;
import com.youngtube.demo.mapper.CategoryMapper;
import com.youngtube.demo.mapper.UserMapper;
import com.youngtube.demo.mapper.VideoMapper;
import com.youngtube.demo.untils.RedisUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@SpringBootTest
class DemoApplicationTests
{

    @Autowired
    DataSource dataSource;
    @Autowired
    UserMapper userMapper;
    @Autowired
    CategoryMapper categoryMapper;
    @Autowired
    VideoMapper videoMapper;
    @Autowired
    RedisTemplate redisTemplate;
    @Autowired
    RedisUtil redisUtil;
    @Autowired
    ListenerHandle listenerHandle;


    @Test
    void contextLoads()
    {
        Date date = new Date();
        System.out.println(date);
    }

    @Test
    void testDataSource() throws SQLException
    {
        for(int i=0;i<=1000;i++)
        {
            User user = userMapper.findOneByUserId(3);
            System.out.println(user.getUserPetName());
        }
    }

   /**
    * 发现pagehelper启动了两次，造成查询结果封装成的pageinfo中数据重复两次
    * 在启动类上加排除注解，启动正常，重复消除，但分页不起作用
    *  排除后导致调用UserMapper的findOneByUserId方法时出现TooManyResultsException异常,出现此异常后会导致系统所有涉及user表的业务崩溃
    * 如果打包到tomcat 会出现在系统中发现了多个分页插件，请检查系统配置
    * 暂时保留两次启动
    */
    @Test
    void pageHelperTest()
    {
        PageHelper.startPage(1,6);
        List<Video> videos = videoMapper.findVideosBySearch(0,"",0);

        System.out.println(videos+"length="+videos.size());
        for(Video video:videos)
        {
            System.out.println(userMapper.findOneByUserId(video.getVideoUpId()));
        }
    }

    @Test
    void redisTest()
    {
        Video video = (Video)redisTemplate.opsForValue().get("video"+1);
        if(video==null)
        {
            video=videoMapper.findOneById(1);
            redisTemplate.opsForValue().set("video"+1,video);
            redisTemplate.expire("video"+1,10, TimeUnit.MINUTES);
        }
        System.out.println(video);
    }

    @Test
    void getRedisKeyByGlob()
    {
        Set set = redisTemplate.keys("videoId_viewCount*");
        for(Object s:set)
        {
            System.out.println(s);
        }
    }

    @Test
    void listenerHandleTest()
    {
        listenerHandle.afterDestroy();
        System.out.println(listenerHandle);
    }
}
