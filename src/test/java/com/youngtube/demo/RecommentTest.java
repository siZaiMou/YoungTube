package com.youngtube.demo;

import com.youngtube.demo.mapper.VideoHeatMapper;
import com.youngtube.demo.mapper.VideoScoreMapper;
import com.youngtube.demo.service.RecommentService;
import com.youngtube.demo.service.VideoService;
import com.youngtube.demo.service.impl.RecommentServiceImpl;
import com.youngtube.demo.service.impl.VideoServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class RecommentTest {
    @Autowired
    VideoScoreMapper videoScoreMapper;

    @Autowired
    VideoServiceImpl videoService;

    @Autowired
    RecommentServiceImpl recommentService;
    @Test
    public void test()
    {
//       recommentService.insertVideoScore(4,5,6);
//        System.out.println(recommentService.findAllScore());
//        recommentService.insertUserSimiliarity(1,2,3);
//        System.out.println(recommentService.findAllUserSimiliarity());
        //System.out.println(recommentService.findAppropriateUser(7));
        System.out.println(videoService.findVideoToRecommendLogin(7));
    }
}
