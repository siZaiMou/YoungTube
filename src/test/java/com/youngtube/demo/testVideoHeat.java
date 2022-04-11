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

       // System.out.println(videoHeatMapper.findTotalHeat(1));
        //videoHeatMapper.insertTotalHeat(2,2,12);
        //System.out.println(videoClickMapper.findDislikeCount(5));
        //System.out.println(commentMapper.findOneVideoCommentCount(1));
        System.out.println();
//        if(commentMapper.findLastComment(100).isEmpty())
//        {
//            System.out.println("哈哈");
//        }
//        HeatUtils heatUtils=new HeatUtils(10,5,1,"2022-01-12 09:03:12",10,0,0,"2022-02-19 09:46:51","2022-04-11 17:02:50");
//        System.out.println(heatUtils.getHeat());

    }
}
