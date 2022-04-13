package com.youngtube.demo;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoScore;
import com.youngtube.demo.mapper.*;
import com.youngtube.demo.service.RecommentService;
import com.youngtube.demo.service.VideoService;
import com.youngtube.demo.service.impl.RecommentServiceImpl;
import com.youngtube.demo.service.impl.UserServiceImpl;
import com.youngtube.demo.service.impl.VideoServiceImpl;
import com.youngtube.demo.untils.PearsonUtils;
import org.junit.jupiter.api.Test;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest
public class RecommentTest {
    @Autowired
    VideoScoreMapper videoScoreMapper;
    @Autowired
    UserServiceImpl userService;

    @Autowired
    VideoMapper videoMapper;

    @Autowired
    UserSimiliarityMapper userSimiliarityMapper;

    @Autowired
    UserMapper userMapper;

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
       //System.out.println(videoService.findVideoToRecommendLogin(7));
        //System.out.println(recommentService.isLike(6,11));
       // System.out.println(recommentService.isComment(7,10));
        //System.out.println(recommentService.isCoin(4,10));
        //System.out.println(videoMapper.findFavId(3));
      //  System.out.println(recommentService.isFav(3,10));



        //System.out.println(recommentService.isDisLike(3,10));

//        List<Video> allVideo = videoService.findAllVideo();
//        List<User> allUser = userMapper.findAllUser();
//
//        for (User user:allUser
//             ) {
//
//
//
//
//            for (Video video:allVideo
//                 ) {
//                int a=0,b=0,c=0,d=0,e=0;//依次为点赞，评论，收藏，投币,点踩
//                if(recommentService.isLike(user.getUserId(),video.getVideoId()))
//                    a=1;
//                if(recommentService.isComment(user.getUserId(),video.getVideoId()))
//                    b=1;
//                if(recommentService.isFav(user.getUserId(),video.getVideoId()))
//                    c=1;
//                if(recommentService.isCoin(user.getUserId(),video.getVideoId()))
//                    d=1;
//                if(recommentService.isDisLike(user.getUserId(),video.getVideoId()))
//                    e=1;
//                int score=a*1+b*2+c*3+d*4+e*(-1);
//                videoScoreMapper.insertVideoScore(user.getUserId(),video.getVideoId(),score);
//            }
   //     }


       // System.out.println(recommentService);

//System.out.println(videoService.findVideoToRecommend(7));
       // System.out.println(videoService.findVideoToRecommendLogin(7));
      //  System.out.println(recommentService.findAppropriateUser(7));
        //System.out.println(videoScoreMapper.getOneScore(3,4));
System.out.println(videoScoreMapper.findAllScore());

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

            userSimiliarityMapper.insertUserSimiliarity(user1.getUserId(),user2.getUserId(),PearsonUtils.getPearsonBydim(vector11,vector22));
            }

            }



    }
}
