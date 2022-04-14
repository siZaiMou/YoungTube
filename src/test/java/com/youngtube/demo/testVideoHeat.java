package com.youngtube.demo;


import com.youngtube.demo.entity.VideoClick;
import com.youngtube.demo.entity.VideoComment;
import com.youngtube.demo.entity.VideoHeat;
import com.youngtube.demo.mapper.CommentMapper;
import com.youngtube.demo.mapper.VideoClickMapper;
import com.youngtube.demo.mapper.VideoHeatMapper;
import com.youngtube.demo.mapper.VideoMapper;
import com.youngtube.demo.untils.HeatUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;
import java.util.List;

@SpringBootTest
public class testVideoHeat {

    @Autowired

    VideoMapper videoMapper;
    @Autowired
    CommentMapper commentMapper;

    @Test
    public void selectTest() throws ParseException {

        System.out.println(videoMapper.find8ByCategory(2));

    }
}
