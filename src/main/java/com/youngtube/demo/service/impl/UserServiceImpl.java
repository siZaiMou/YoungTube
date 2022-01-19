package com.youngtube.demo.service.impl;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoComment;
import com.youngtube.demo.mapper.UserMapper;
import com.youngtube.demo.service.UserService;
import com.youngtube.demo.untils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserServiceImpl implements UserService
{
    @Autowired
    UserMapper userMapper;

    @Override
    public void regist(User user)
    {
        try
        {
            user.setUserPassword(Md5Util.encodeByMd5(user.getUserPassword()));
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        userMapper.insertOne(user);
    }

    @Override
    public User login(User user)
    {
        try
        {
            String psw = Md5Util.encodeByMd5(user.getUserPassword());
            user.setUserPassword(psw);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return userMapper.findByUserPetName(user.getUserPetName(),user.getUserPassword());
    }

    //查询视频up主的用户名
    @Override
    public Map<Integer, String> findUserNames(List<Video> videos)
    {
        Map<Integer,String>userName = new HashMap<>();
        int len = videos.size();
        for(int i=0;i<len;i++)
        {
            userName.put(i,(userMapper.findOneByUserId((videos.get(i)).getVideoUpId())).getUserPetName());
        }

        return userName;
    }

    @Override
    public User findOneByUserId(int videoUpId)
    {
        return userMapper.findOneByUserId(videoUpId);
    }

    //查询每条评论的用户信息，性能待使用redis优化
    @Override
    public Map<Integer, User> findCommentUsers(List<VideoComment> videoComments_hot)
    {
        Map<Integer,User> commentUsers = new HashMap<>();
        int len = videoComments_hot.size();
        for(int i=0;i<len;i++)
        {
            VideoComment comment = videoComments_hot.get(i);
            commentUsers.put(i,userMapper.findOneByUserId(comment.getUserId()));
        }
        return commentUsers;
    }

    //修改硬币量(投币)
    @Override
    public void changeUserCoin(int userId, int coinCount)
    {
        userMapper.updateUserCoinByUserId(userId,coinCount);
    }

    //查询用户的粉丝数
    @Override
    public int findUserFansCount(int userId)
    {
        return userMapper.findUserFansCount(userId);
    }

    //查看用户是否关注该UP主
    @Override
    public boolean findUserIsFollow(int followUserId, int followedUserId)
    {
        return userMapper.findOneUserFollow(followUserId,followedUserId)>0?true:false;
    }

    @Override
    public void saveFollow(int followUserId, int followedUserId,int followMode)
    {
        userMapper.insertOneUserFollow(followUserId,followedUserId,new Date(),followMode);
    }

    @Override
    public void cancelFollow(int followUserId, int followedUserId)
    {
        userMapper.deleteOneUserFollow(followUserId,followedUserId);
    }

    //查询视频返回结果的up主信息
    @Override
    public Map<Integer, User> findVideosUps(List<Video> videoList)
    {
        Map<Integer,User> ups = new HashMap<>();
        int len = videoList.size();
        for(int i=1;i<len;i++) //pagehelper会改变List<Video>的结构
        {
            if(((Object)videoList.get(i)) instanceof Video)
            {
                Video vd = videoList.get(i);
                ups.put(i-1,userMapper.findOneByUserId(vd.getVideoUpId()));
            }
            else
            {
                break;
            }
        }
        return ups;
    }

    //查询用户关注的up数
    @Override
    public Integer findUserFollowCount(int userId)
    {
        return userMapper.findUserFollowCount(userId);
    }


}
