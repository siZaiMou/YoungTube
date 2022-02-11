package com.youngtube.demo.entity.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.Map;

@Data
public class VideoViewVO implements Serializable
{
    Map<Integer, Map<String,Long>> viewMap; //键为视频id;值为记录ip和上次更新时间的map,方便将此复杂map存入redis
}
