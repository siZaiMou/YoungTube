package com.youngtube.demo.service;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;

import java.util.List;
import java.util.Map;

public interface UserService
{
    void regist(User user);

    User login(User user);

    Map<Integer, String> findUserNames(List<Video> videos);

    User findOneByUserId(int videoUpId);
}
