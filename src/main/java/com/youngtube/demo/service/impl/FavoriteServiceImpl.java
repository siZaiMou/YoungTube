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

    @Override
    public void packageVideoIsFavorite(List<Favorite> favoriteList,int videoId)
    {
        for(Favorite favorite:favoriteList)
        {
            favorite.setNowVideoIsFavorite(favoriteMapper.findOneFavorite(favorite.getFavoriteId(),videoId)>0?true:false);
        }
    }

    @Override
    public void cancelVideoFavorites(int[] favoriteIds, int videoId)
    {
        for(int favoriteId:favoriteIds)
        {
            favoriteMapper.deleteOneVideoFavorite(favoriteId,videoId);
        }
    }

    @Override
    public void addVideoFavorites(int[] favoriteIds, int videoId)
    {
        for(int favoriteId:favoriteIds)
        {
            favoriteMapper.insertOneVideoFavorite(favoriteId,videoId,new Date());
        }
    }

    //视频收藏数
    @Override
    public int findVideoFavoriteCount(int videoId)
    {
        List<Integer> videoFavoriteIdList = favoriteMapper.findVideoFavoriteIdList(videoId);//查找所有收藏该视频的收藏夹id
        if(videoFavoriteIdList.size()>0)
        {
            List<Integer> favoriteUserIdList = favoriteMapper.findFavoriteUserIdList(videoFavoriteIdList);//查找收藏夹所属用户id
            return favoriteUserIdList.size();
        }
       else
        {
            return 0;
        }
    }
}
