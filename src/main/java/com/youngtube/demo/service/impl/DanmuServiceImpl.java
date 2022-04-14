package com.youngtube.demo.service.impl;

import com.youngtube.demo.config.RabbitMQConfig_producer;
import com.youngtube.demo.entity.Danmu;
import com.youngtube.demo.mapper.DanmuMapper;
import com.youngtube.demo.mapper.UserMapper;
import com.youngtube.demo.service.DanmuService;
import com.youngtube.demo.untils.RedisUtil;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DanmuServiceImpl implements DanmuService
{
    @Autowired
    DanmuMapper danmuMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    RedisUtil redisUtil;

    @Autowired
    RabbitTemplate rabbitTemplate;

    //写入弹幕，高并发场景下应使用消息队列,此处模拟
    @Override
    public int saveDanmu(Danmu danmu)
    {
        try
        {
            this.saveDanmu_MQ_producer(danmu);
            if(redisUtil.hasKey("danmu_videoId"+danmu.getVideoId()))
            {
                List<Danmu> danmuList = (List<Danmu>) redisUtil.get("danmu_videoId"+danmu.getVideoId());
                danmuList.add(danmu);
                redisUtil.set("danmu_videoId"+danmu.getVideoId(),danmuList,24*60*60); //更新redis中弹幕
            }
        }
        catch (Exception e)
        {
            return 1;
        }
        return 0;
    }

    @Override
    public int saveDanmu_MQ_producer(Danmu danmu)
    {
        try
        {
            rabbitTemplate.convertAndSend(RabbitMQConfig_producer.EXCHANGE_NAME,"videoComment",danmu);
            if(redisUtil.hasKey("danmu_videoId"+danmu.getVideoId()))
            {
                List<Danmu> danmuList = (List<Danmu>) redisUtil.get("danmu_videoId"+danmu.getVideoId());
                danmuList.add(danmu);
                redisUtil.set("danmu_videoId"+danmu.getVideoId(),danmuList,24*60*60); //更新redis中弹幕
            }
        }
        catch (Exception e)
        {
            return 1;
        }
        return 0;
    }

    @Override
    @RabbitListener(queues = "danmu",concurrency = "5-10",containerFactory = "mqConsumerlistenerContainer")
    public void saveDanmu_MQ_consumer(Danmu danmu)
    {
        danmuMapper.insertOne(danmu);
    }


    //将查询到的弹幕转化为dplayer要求的json格式
    @Override
    public String getJsonDanmuByVideoId(int id)
    {
        List<Danmu> danmuList;
        if(!redisUtil.hasKey("danmu_videoId"+id))
        {
            danmuList = danmuMapper.findDanmuByVideoId(id); //热点视频的弹幕列表存储在redis中
            redisUtil.set("danmu_videoId"+id,danmuList,24*60*60);
        }
        else
        {
            danmuList = (List<Danmu>) redisUtil.get("danmu_videoId"+id);
        }
        String pre="{\"code\":0,\"data\":[";
        String danmus="";
        if(danmuList.size()<=0)
        {
            return "{\"code\":0,\"data\":[]}";
        }
        int len = danmuList.size();
        danmus = danmus + "[" + "" + danmuList.get(0).getDtime() + "," + danmuList.get(0).getPosition() + "," + danmuList.get(0).getDcolor() + ","+"\""+(userMapper.findOneByUserId(danmuList.get(0).getUserId())).getUserPetName()+"\""+","+"\""+danmuList.get(0).getDcontent() +"\"]";
        for(int i=1;i<len;i++)
        {
            Danmu dm = danmuList.get(i);
            danmus = danmus + ",[" + "" + dm.getDtime() + "," + dm.getPosition() + "," + dm.getDcolor() + ","+"\""+(userMapper.findOneByUserId(dm.getUserId())).getUserPetName()+"\""+","+"\""+dm.getDcontent() +"\"]";

        }
        danmus=pre+danmus+"]}";
        return danmus;
    }
}
