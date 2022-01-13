package com.youngtube.demo.service;

import com.youngtube.demo.entity.Danmu;

import java.util.List;

public interface DanmuService
{
    int saveDanmu(Danmu danmu);

    String getJsonDanmuByVideoId(int id);
}
