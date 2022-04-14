package com.youngtube.demo.task;

import com.youngtube.demo.service.UserService;
import com.youngtube.demo.service.VideoService;
import com.youngtube.demo.untils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Component
public class ViewHistoryTask
{
    @Autowired
    RedisUtil redisUtil;

    @Autowired
    UserService userService;

    //每五分钟将redis所有历史记录写入mysql
    @Scheduled(fixedDelay = 3000000)
    public void afterDestroy()
    {
        Map<Integer, Map<Integer, Date>>historyViewStatusMap = (Map<Integer, Map<Integer, Date>>) redisUtil.get("HistoryViewStatusMap"); //服务器(缓存)存放所有用户的视频历史(userId,videoId,date)
        if(historyViewStatusMap!=null)
        {
            Set<Map.Entry<Integer, Map<Integer, Date>>> set = historyViewStatusMap.entrySet();
            for(Map.Entry<Integer, Map<Integer, Date>>userIdAndMap:set)
            {
                Object obj = userIdAndMap.getKey(); //接收key(数据类型问题)
                int userId = Integer.parseInt(obj.toString());
//                System.out.println(userId);
                Map<Integer,Date> map = userIdAndMap.getValue();
                userService.saveUserViewHistory(userId,map);
            }
            historyViewStatusMap.clear();
            redisUtil.set("HistoryViewStatusMap",historyViewStatusMap);
        }
    }

}
