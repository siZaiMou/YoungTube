package com.youngtube.demo.entity;

import lombok.Data;

@Data
public class Favorite
{
    private int favoriteId=0;
    private String favoriteName;
    private int userId;
    //以下字段用于显示
    private boolean nowVideoIsFavorite=false;//当前播放的视频是否被该收藏夹收藏(展示用)
}
