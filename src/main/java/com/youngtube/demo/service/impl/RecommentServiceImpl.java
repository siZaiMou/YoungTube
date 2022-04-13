package com.youngtube.demo.service.impl;

import com.youngtube.demo.entity.UserSimiliarity;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoScore;
import com.youngtube.demo.mapper.CommentMapper;
import com.youngtube.demo.mapper.UserSimiliarityMapper;
import com.youngtube.demo.mapper.VideoMapper;
import com.youngtube.demo.mapper.VideoScoreMapper;
import com.youngtube.demo.service.RecommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.DelegatingServerHttpResponse;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RecommentServiceImpl implements RecommentService {
    @Autowired
    VideoScoreMapper videoScoreMapper;

    @Autowired
    UserSimiliarityMapper userSimiliarityMapper;

    @Autowired
    VideoMapper videoMapper;

    @Override
    public List<VideoScore> findAllScore(){
        return videoScoreMapper.findAllScore();
    }

    @Override
    public void insertVideoScore(int userId,  int videoId, int score){
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
    @Override
   public boolean isLike(int userId,int videoId){
        List<Integer> likeVideo = videoMapper.findLikeVideo(userId);
        if(likeVideo.contains(videoId))
            return true;
        else
            return false;
    }

    @Override
    public boolean isDisLike(int userId,int videoId){
        List<Integer> disLikeVideo = videoMapper.findDisikeVideo(userId);
        if(disLikeVideo.contains(videoId))
            return true;
        else
            return false;
    }

    @Override
    public boolean isComment(int userId,int videoId){
        List<Integer> commentVideo = videoMapper.findCommentVideo(userId);

        if(commentVideo.contains(videoId))
            return true;
        else
            return false;
    }

    @Override
    public boolean isCoin(int userId,int videoId){
        List<Integer> coinVideo = videoMapper.findCoinVideo(userId);
        if(coinVideo.contains(videoId))
            return true;
        else
            return false;

    }

    @Override
   public boolean isFav(int userId,int videoId){
        List<Integer> favId = videoMapper.findFavId(userId);
        List<Integer>videoId1=new ArrayList<>();
        for (int i = 0; i <favId.size() ; i++) {
            videoId1.addAll(videoMapper.findFavVideoId(favId.get(i)));

        }
    if(videoId1.contains(videoId))
    return true;
    else
    return false;
    }
}
