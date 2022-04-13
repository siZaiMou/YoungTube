package com.youngtube.demo.task;


import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.mapper.UserMapper;
import com.youngtube.demo.mapper.VideoScoreMapper;
import com.youngtube.demo.service.CommentService;
import com.youngtube.demo.service.RecommentService;
import com.youngtube.demo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.List;

@Component
public class UserSimiliarityTask {

    @Autowired
    VideoService videoService;
    @Autowired
    CommentService commentService;

    @Autowired
    UserMapper userMapper;

    @Autowired
    RecommentService recommentService;

    @Autowired
    VideoScoreMapper videoScoreMapper;

    //每隔一天计算用户-视频-得分
    @Scheduled(fixedDelay = 86400000)
    public void updateHeat() throws ParseException {

        List<Video> allVideo = videoService.findAllVideo();
        List<User> allUser = userMapper.findAllUser();

        for (User user : allUser
        ) {


            for (Video video : allVideo
            ) {
                int a = 0, b = 0, c = 0, d = 0, e = 0;//依次为点赞，评论，收藏，投币,点踩
                if (recommentService.isLike(user.getUserId(), video.getVideoId()))
                    a = 1;
                if (recommentService.isComment(user.getUserId(), video.getVideoId()))
                    b = 1;
                if (recommentService.isFav(user.getUserId(), video.getVideoId()))
                    c = 1;
                if (recommentService.isCoin(user.getUserId(), video.getVideoId()))
                    d = 1;
                if (recommentService.isDisLike(user.getUserId(), video.getVideoId()))
                    e = 1;
                int score = a * 1 + b * 2 + c * 3 + d * 4 + e * (-1);
                videoScoreMapper.insertVideoScore(user.getUserId(), video.getVideoId(), score);
            }

        }


    }


}

