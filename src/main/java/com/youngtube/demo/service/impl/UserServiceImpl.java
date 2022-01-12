package com.youngtube.demo.service.impl;

import com.youngtube.demo.entity.User;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.mapper.UserMapper;
import com.youngtube.demo.service.UserService;
import com.youngtube.demo.untils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
}
