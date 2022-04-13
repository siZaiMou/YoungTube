package com.youngtube.demo;


import com.youngtube.demo.service.impl.VideoServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;

@SpringBootTest
public class recomedTest {


    @Autowired
    VideoServiceImpl videoService;

    @Test
    public void selectTest() throws ParseException {
        System.out.println(videoService.findVideoToRecommendLogin(9));

    }


}
