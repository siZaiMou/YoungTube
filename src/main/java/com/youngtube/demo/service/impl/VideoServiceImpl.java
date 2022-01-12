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

    @Override
    public List<Video> findVideoToHomePage(int videoCategory)
    {
        return videoMapper.find8ByCategory(videoCategory);
    }

    @Override
    public List<Video> findVideoToRecommend()
    {
        return videoMapper.findWithRecommend();
    }
}
