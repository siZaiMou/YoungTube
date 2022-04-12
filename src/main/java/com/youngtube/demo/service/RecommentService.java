package com.youngtube.demo.service;

import com.youngtube.demo.entity.UserSimiliarity;
import com.youngtube.demo.entity.VideoScore;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecommentService {
    List<VideoScore> findAllScore();

    void insertVideoScore(int userId,  int videoId, double score);

    List<UserSimiliarity>findAllUserSimiliarity();

    void  insertUserSimiliarity( int userId1,  int userId2,double similiarity);

    List<UserSimiliarity> findAppropriateUser(int userId1);
}
