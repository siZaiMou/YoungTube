package com.youngtube.demo.task;


import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoScore;
import com.youngtube.demo.mapper.UserMapper;
import com.youngtube.demo.mapper.UserSimiliarityMapper;
import com.youngtube.demo.mapper.VideoScoreMapper;
import com.youngtube.demo.service.CommentService;
import com.youngtube.demo.service.RecommentService;
import com.youngtube.demo.service.VideoService;
import com.youngtube.demo.untils.PearsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@Component
public class UserSimiliarityTask {

    @Autowired
    VideoService videoService;
    @Autowired
    CommentService commentService;

    @Autowired
    UserSimiliarityMapper userSimiliarityMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    RecommentService recommentService;

    @Autowired
    VideoScoreMapper videoScoreMapper;

    //每隔一天计算用户-视频-得分
    //86400000
    @Scheduled(fixedDelay = 30000)
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
                //System.out.println(user.getUserId());
            }

        }


    }

    //每隔一天计算用户-视频-得分
    @Scheduled(fixedDelay = 30000)
    public void updateUserSimiliarity() throws ParseException {


        List<User> allUser = userMapper.findAllUser();
        List<VideoScore> allScore = videoScoreMapper.findAllScore();



        for (User user1:allUser
        ) {
            List<Integer> vector1=new ArrayList<>();//按照顺序为第一个用户对每个视频的打分

            vector1.addAll(videoScoreMapper.getOneScore(user1.getUserId()));

            for (User user2:allUser
            ) {
                List<Integer> vector2=new ArrayList<>();//按照顺序为第二个用户对每个视频的打分
                if(user1.getUserId()==user2.getUserId())
                    continue;
                vector2.addAll(videoScoreMapper.getOneScore(user2.getUserId()));

                List<Double> vector11=new ArrayList<>();//按照顺序为第一个用户对每个视频的打分
                List<Double> vector22=new ArrayList<>();//按照顺序为第二个用户对每个视频的打分

                for (Integer vector:vector1
                ) {
                    vector11.add(Double.valueOf(vector.toString()));
                }

                for (Integer vector:vector2
                ) {
                    vector22.add(Double.valueOf(vector.toString()));
                }

                // System.out.println("第一个用户的打分:"+vector11+"第二个用户的打分:"+ vector22+ PearsonUtils.getPearsonBydim(vector11,vector22));
                boolean flag=true;
                for (Double d:vector11
                     ) {
                    if(d!=0){
                        flag=false;
                        break;
                    }
                }
                boolean flag1=true;
                for (Double d:vector22
                ) {
                    if(d!=0){
                        flag1=false;
                        break;
                    }
                }
                //flag为true表示都为0，flag为false表示有一个不为0
                if(flag||flag1)//都为0并且相似度为0
                    userSimiliarityMapper.insertUserSimiliarity(user1.getUserId(),user2.getUserId(),0);
                else
                {
                   // System.out.println(user1.getUserId()+" "+user2.getUserId()+" "+PearsonUtils.getPearsonBydim(vector11,vector22)+"vector1"+vector11+"vector2"+vector22);
                    userSimiliarityMapper.insertUserSimiliarity(user1.getUserId(),user2.getUserId(), PearsonUtils.getPearsonBydim(vector11,vector22));
                }

            }

        }

    }

}

