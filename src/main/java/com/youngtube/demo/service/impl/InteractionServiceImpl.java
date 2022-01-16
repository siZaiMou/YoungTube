package com.youngtube.demo.service.impl;

import com.youngtube.demo.mapper.InteractionMapper;
import com.youngtube.demo.service.InteractionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

//视频、动态的点赞、投币、转发等互动动作的service层
@Service
public class InteractionServiceImpl implements InteractionService
{
    @Autowired
    InteractionMapper interactionMapper;

    @Override
    public void insertVideoPraise(int videoId, int userId)
    {
        interactionMapper.insertOneVideoPraise(videoId,userId,new Date());
    }

    @Override
    public void deleteVideoPraise(int videoId, int userId)
    {
        interactionMapper.deleteOneVideoPraise(videoId,userId);
    }

    @Override
    public Integer getVideoPraiseCount(int videoId)
    {
        return interactionMapper.findVideoPraiseCount(videoId);
    }

    //视频是否已被用户点赞
    @Override
    public boolean videoIsPraiseByUserId(int videoId, int userId)
    {
        Integer cnt = interactionMapper.findVideoPraiseByVideoIdAndUserId(videoId,userId);
        if(cnt>0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    @Override
    public void insertVideoCoin(int videoId, int userId,int coinCount)
    {
        interactionMapper.insertOneVideoCoin(videoId,userId,coinCount,new Date());
    }

    @Override
    public boolean videoIsCoinByUserId(int videoId, int userId)
    {
        int cnt = interactionMapper.findVideoCoinByVideoIdAndUserId(videoId,userId);
        return cnt>0?true:false;
    }

    @Override
    public Integer getVideoCoinCount(int videoId)
    {
        int cnt=0;
        cnt =  interactionMapper.findVideoCoinCount(videoId);
        return cnt;
    }
}
