package com.youngtube.demo.service;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoComment;
import org.apache.catalina.mapper.Mapper;

import java.util.List;
import java.util.Map;

public interface UserService
{
    void regist(User user);

    User login(User user);

    Map<Integer, String> findUserNames(List<Video> videos);

    User findOneByUserId(int videoUpId);

    Map<Integer,User> findCommentUsers(List<VideoComment> videos_hot);

    void changeUserCoin(int userId, int coinCount);
}
