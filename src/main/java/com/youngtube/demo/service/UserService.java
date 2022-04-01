package com.youngtube.demo.service;

import com.youngtube.demo.entity.Dynamic;
import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoComment;
import org.apache.catalina.mapper.Mapper;

import java.util.Date;
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

    int findUserFansCount(int userId);

    boolean findUserIsFollow(int followUserId, int followedUserId);

    void saveFollow(int followUserId, int followedUserId,int followMode);

    void cancelFollow(int followUserId, int followedUserId);

    Map<Integer, String> findVideosUpNames(List<Video> videoList);

    Integer findUserFollowCount(int userId);

    Map<Integer, User> findDynamicUsers(List<Dynamic> dynamicList);

    void findDynamicCommentUsers(Map<Integer, User> dynamicUserList, List<Dynamic> dynamicList);

    void saveUserViewHistory(int userId, Map<Integer, Date> integerDateMap);
}
