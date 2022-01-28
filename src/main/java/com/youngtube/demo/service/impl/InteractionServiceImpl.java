package com.youngtube.demo.service.impl;

import com.youngtube.demo.entity.Dynamic;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.mapper.InteractionMapper;
import com.youngtube.demo.service.InteractionService;
import com.youngtube.demo.untils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

//视频、动态的点赞、投币、转发等互动动作的service层
@Service
public class InteractionServiceImpl implements InteractionService
{
    @Autowired
    InteractionMapper interactionMapper;

    @Autowired
    RedisUtil redisUtil;

    @Override
    public void insertVideoPraise(int videoId, int userId)
    {
        interactionMapper.insertOneVideoPraise(videoId,userId,new Date());
        if(redisUtil.hasKey("videoId"+videoId)) //点赞后保持redis中数据一致性
        {
            Video video=(Video)redisUtil.get("videoId"+videoId);
            video.setVideoPraiseCount(video.getVideoPraiseCount()+1);
            redisUtil.set("videoId"+videoId,video,24*60*60);
        }
    }

    @Override
    public void deleteVideoPraise(int videoId, int userId)
    {
        interactionMapper.deleteOneVideoPraise(videoId,userId);
        if(redisUtil.hasKey("videoId"+videoId)) //取消点赞后保持redis中数据一致性
        {
            Video video=(Video)redisUtil.get("videoId"+videoId);
            video.setVideoPraiseCount(video.getVideoPraiseCount()-1);
            redisUtil.set("videoId"+videoId,video,24*60*60);
        }
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
        if(redisUtil.hasKey("videoId"+videoId)) //投币后保持redis中数据一致性
        {
            Video video=(Video)redisUtil.get("videoId"+videoId);
            video.setVideoCoinCount(video.getVideoCoinCount()+1);
            redisUtil.set("videoId"+videoId,video,24*60*60);
        }
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

    //为动态列表封装点赞量等互动数据
    @Override
    public void makeInteractionCount(List<Dynamic> dynamicList,int userId)
    {
        for(Dynamic dynamic:dynamicList)
        {
            dynamic.setDynamicPraiseCount(interactionMapper.findDynamicPraiseCount(dynamic.getDynamicId())); //封装这条动态的点赞量
            boolean isPraise=interactionMapper.findDynamicPraiseByDynamicIdAndUserId(dynamic.getDynamicId(),userId)>0?true:false;
            dynamic.setDynamicIsPraise(isPraise); //封装当前登录用户是否给这条动态点过赞
        }
    }

    //动态点赞
    @Override
    public void insertDynamicPraise(int userId, int dynamicId, Date praiseDate)
    {
        interactionMapper.insertOneDynamicPraise(userId,dynamicId,praiseDate);
    }

    @Override
    public void deleteDynamicPraise(int userId, int dynamicId)
    {
        interactionMapper.deleteOneDynamicPraise(userId,dynamicId);
    }
}
