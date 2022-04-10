package com.youngtube.demo;


import com.youngtube.demo.entity.VideoCosine;
import com.youngtube.demo.mapper.VideoMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class testInsertCosine {
    @Autowired
    VideoMapper videoMapper;

    @Test
    public void insertTest()
    {
        videoMapper.insertCosine(13,22,0.22);
    }

}
