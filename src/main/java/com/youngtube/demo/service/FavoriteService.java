package com.youngtube.demo.service;

import com.youngtube.demo.entity.Favorite;
import com.youngtube.demo.entity.Video;

import java.util.Date;
import java.util.List;

public interface FavoriteService
{
    void saveOneFavorite(Favorite favorite);

    List<Favorite> findFavoriteList(int userId);

    List<Video> findFavoriteVideoList(int favoriteId);

    List<Date> findFavoriteDateList(int favoriteId);

    void packageVideoIsFavorite(List<Favorite> favoriteList,int videoId);

    void cancelVideoFavorites(int[] favoriteIds, int videoId);

    void addVideoFavorites(int[] favoriteIds, int videoId);
}
