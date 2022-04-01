package com.youngtube.demo.entity.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

public class UserHistoryVO implements Serializable
{
    Map<Integer, Map<Integer, Date>>historyMap; //用户id-视频id-观看时间
}
