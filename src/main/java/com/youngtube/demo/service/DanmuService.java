package com.youngtube.demo.service;

import com.youngtube.demo.entity.Danmu;

import java.util.List;

public interface DanmuService
{
    int saveDanmu(Danmu danmu);

    void saveDanmu_MQ_producer(Danmu danmu);

    void saveDanmu_MQ_consumer(Danmu danmu);

    String getJsonDanmuByVideoId(int id);
}
