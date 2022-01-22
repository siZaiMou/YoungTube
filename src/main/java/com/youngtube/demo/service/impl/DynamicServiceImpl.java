package com.youngtube.demo.service.impl;

import com.youngtube.demo.entity.Dynamic;
import com.youngtube.demo.mapper.DynamicMapper;
import com.youngtube.demo.mapper.UserMapper;
import com.youngtube.demo.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DynamicServiceImpl implements DynamicService
{
    @Autowired
    DynamicMapper dynamicMapper;

    @Autowired
    UserMapper userMapper;

    @Override
    public List<Dynamic> findDynamicsByUserId(int userId)
    {
        return dynamicMapper.findDynamicsByUserId(userId);
    }

    @Override
    public void saveDynamic(Dynamic dynamic)
    {
        dynamicMapper.insertOneDynamic(dynamic);
    }

    @Override
    public List<Dynamic> findDynamicsWithFollow(int userId)
    {
        List<Integer>followedUserIdList = userMapper.findFollowedUserIds(userId);
        followedUserIdList.add(userId);
        List<Dynamic>followedDynamicList = dynamicMapper.findFollowedDynamics(followedUserIdList);
        return followedDynamicList;
    }
}
