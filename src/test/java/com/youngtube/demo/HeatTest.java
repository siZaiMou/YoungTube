package com.youngtube.demo;


import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoClick;
import com.youngtube.demo.mapper.CommentMapper;
import com.youngtube.demo.mapper.VideoClickMapper;
import com.youngtube.demo.mapper.VideoHeatMapper;

import com.youngtube.demo.mapper.VideoMapper;
import com.youngtube.demo.untils.HeatUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@SpringBootTest
public class HeatTest {
    @Autowired
    VideoHeatMapper videoHeatMapper;

    @Autowired
    VideoMapper videoMapper;

    @Autowired
    VideoClickMapper videoClickMapper;


    @Autowired
   CommentMapper commentMapper;
//
//    private int videoViewCount;//视频的播放次数
//    private int videoLikeCount;//视频点赞量
//    private int videoDislikeCount;//视频点踩量
//    private Date videoIssuingTime;//视频的发布时间
//    private int  commentCount ;//视频评论的数量
//    private int commentLikeCount;//视频评论总的点赞数
//    private int commentDislikeCount;//视频评论总的点踩数
//    private Date commentLast;//视频最后一个评论的时间
//    private Date nowTime;//此刻的时间

    @Test
    public void selectTest() throws ParseException {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Video> allVideo = videoMapper.findAllVideo();
        for (int i = 0; i <allVideo.size() ; i++) {
            int videoViewCount=allVideo.get(i).getVideoViewCount();
            int videoLikeCount=videoClickMapper.findLikeCount(allVideo.get(i).getVideoId());
            int videoDislikeCount=videoClickMapper.findDislikeCount(allVideo.get(i).getVideoId());
          String videoIssuingTime=sf.format(allVideo.get(i).getVideoIssuingTime());
           int  commentCount =commentMapper.findOneVideoCommentCount(allVideo.get(i).getVideoId());
            int commentLikeCount=0;
            int commentDislikeCount=0;
            String commentLast="";
            if(commentMapper.findLastComment(allVideo.get(i).getVideoId()).isEmpty())
            {
                commentLast="1970-01-01 00:00:00";
            }
            else{
                commentLast=sf.format((commentMapper.findLastComment(allVideo.get(i).getVideoId()).get(0).getCommentDate()));
            }



           String nowTime=sf.format(new Date());



            HeatUtils heatUtils=new HeatUtils(videoViewCount,videoLikeCount,videoDislikeCount,videoIssuingTime,commentCount,commentLikeCount,commentDislikeCount,commentLast,nowTime);
            //HeatUtils heatUtils= new HeatUtils(10,5,1,"2022-01-12 09:03:12",10,0,0,"2022-02-19 09:46:51","2022-04-11 17:02:50");
            System.out.println(heatUtils.getHeat()+" "+allVideo.get(i).getVideoId());

        }

    }

}
