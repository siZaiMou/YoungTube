package com.youngtube.demo.service.impl;

import com.youngtube.demo.entity.Danmu;
import com.youngtube.demo.mapper.DanmuMapper;
import com.youngtube.demo.mapper.UserMapper;
import com.youngtube.demo.service.DanmuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DanmuServiceImpl implements DanmuService
{
    @Autowired
    DanmuMapper danmuMapper;

    @Autowired
    UserMapper userMapper;
    //写入弹幕，高并发场景下应使用消息队列,此处模拟
    @Override
    public int saveDanmu(Danmu danmu)
    {
        try
        {
            danmuMapper.insertOne(danmu);
        }
        catch (Exception e)
        {
            return 1;
        }
        return 0;
    }

    @Override
    public String getJsonDanmuByVideoId(int id)
    {
        String pre="{\"code\":0,\"data\":[";
        String danmus="";
        List<Danmu> danmuList = danmuMapper.findDanmuByVideoId(id);
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
