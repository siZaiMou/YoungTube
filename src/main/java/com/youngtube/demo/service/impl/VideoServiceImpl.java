package com.youngtube.demo.service.impl;

import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoCategory;
import com.youngtube.demo.mapper.CategoryMapper;
import com.youngtube.demo.mapper.VideoMapper;
import com.youngtube.demo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoServiceImpl implements VideoService
{
    @Autowired
    CategoryMapper categoryMapper;

    @Autowired
    VideoMapper videoMapper;

    @Override
    public List<VideoCategory> findAllCategory()
    {
        return categoryMapper.findAllCategory();
    }

    //使用推荐算法查询8个按分区推荐的视频
    @Override
    public List<Video> findVideoToHomePage(int videoCategory)
    {
        return videoMapper.find8ByCategory(videoCategory);
    }

    //使用推荐算法查询6个主页推荐视频
    @Override
    public List<Video> findVideoToRecommend()
    {
        return videoMapper.findWithRecommend();
    }

    //按分区查询7个分区热榜视频
    @Override
    public List<Video> findVideoToRank(int videoCategory)
    {
        return videoMapper.find7ByCategoryAndRank(videoCategory);
    }

    //播放页,按videoId查询一个视频
    @Override
    public Video findOneByVideoId(int videoId)
    {
        return videoMapper.findOneById(videoId);
    }
}
