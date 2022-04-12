package com.youngtube.demo.service.impl;

import com.youngtube.demo.entity.UserSimiliarity;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoScore;
import com.youngtube.demo.mapper.CommentMapper;
import com.youngtube.demo.mapper.UserSimiliarityMapper;
import com.youngtube.demo.mapper.VideoScoreMapper;
import com.youngtube.demo.service.RecommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecommentServiceImpl implements RecommentService {
    @Autowired
    VideoScoreMapper videoScoreMapper;

    @Autowired
    UserSimiliarityMapper userSimiliarityMapper;


    @Override
    public List<VideoScore> findAllScore(){
        return videoScoreMapper.findAllScore();
    }

    @Override
    public void insertVideoScore(int userId,  int videoId, double score){
        videoScoreMapper.insertVideoScore(userId, videoId, score);
    }
    @Override
    public List<UserSimiliarity> findAllUserSimiliarity(){
        return userSimiliarityMapper.findAllUserSimiliarity();
    }

    @Override
    public void  insertUserSimiliarity( int userId1,  int userId2,double similiarity){
        userSimiliarityMapper.insertUserSimiliarity(userId1,userId2,similiarity);
    }

    @Override
   public List<UserSimiliarity> findAppropriateUser(int userId1){
        return userSimiliarityMapper.findAppropriateUser(userId1);
    }

}
