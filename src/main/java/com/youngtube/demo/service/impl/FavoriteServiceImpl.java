package com.youngtube.demo.service.impl;

import com.youngtube.demo.entity.Favorite;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.mapper.FavoriteMapper;
import com.youngtube.demo.mapper.VideoMapper;
import com.youngtube.demo.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class FavoriteServiceImpl implements FavoriteService
{
    @Autowired
    FavoriteMapper favoriteMapper;

    @Autowired
    VideoMapper videoMapper;

    @Override
    public void saveOneFavorite(Favorite favorite)
    {
        favoriteMapper.insertOneFavorite(favorite);
    }

    //查询用户的收藏夹
    @Override
    public List<Favorite> findFavoriteList(int userId)
    {
        return favoriteMapper.findFavoriteListByUserId(userId);
    }

    //查询收藏夹中的视频
    @Override
    public List<Video> findFavoriteVideoList(int favoriteId)
    {
        List<Integer>videoIdList = favoriteMapper.findFavoriteVideoIdList(favoriteId);
        List<Video> favoriteVideoList;
        if(videoIdList.size()>0)
        {
            favoriteVideoList = videoMapper.findVideosByVideoIds(videoIdList);
        }
        else
        {
            favoriteVideoList = new ArrayList<>();
        }
        return favoriteVideoList;
    }

    @Override
    public List<Date> findFavoriteDateList(int favoriteId)
    {
        return favoriteMapper.findFavoriteDateList(favoriteId);
    }
}
