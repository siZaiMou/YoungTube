package com.youngtube.demo.task;

import com.youngtube.demo.entity.Video;
import com.youngtube.demo.service.CommentService;
import com.youngtube.demo.service.VideoService;
import com.youngtube.demo.untils.HeatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Component
public class HeatTask {
    @Autowired
    VideoService videoService;
    @Autowired
    CommentService commentService;

    //每隔一天计算一次热度
    @Scheduled(fixedDelay = 86400000)
    public void updateHeat() throws ParseException {

        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Video> allVideo = videoService.findAllVideo();
        for (int i = 0; i < allVideo.size(); i++) {
            int videoViewCount = allVideo.get(i).getVideoViewCount();
            int videoLikeCount = videoService.findLikeCount(allVideo.get(i).getVideoId());
            int videoDislikeCount = videoService.findDislikeCount(allVideo.get(i).getVideoId());
            String videoIssuingTime = sf.format(allVideo.get(i).getVideoIssuingTime());
            int commentCount = commentService.findOneVideoCommentCount(allVideo.get(i).getVideoId());
            int commentLikeCount = 0;
            int commentDislikeCount = 0;
            String commentLast = "";
            if (commentService.findLastComment(allVideo.get(i).getVideoId()).isEmpty()) {
                commentLast = "1970-01-01 00:00:00";
            } else {
                commentLast = sf.format((commentService.findLastComment(allVideo.get(i).getVideoId()).get(0).getCommentDate()));
            }


            String nowTime = sf.format(new Date());


            HeatUtils heatUtils = new HeatUtils(videoViewCount, videoLikeCount, videoDislikeCount, videoIssuingTime, commentCount, commentLikeCount, commentDislikeCount, commentLast, nowTime);

            videoService.insertTotalHeat(allVideo.get(i).getVideoId(),allVideo.get(i).getVideoCategory(),heatUtils.getHeat());
        }

    }
}
