package com.youngtube.demo.service;

import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoCategory;

import java.util.List;
import java.util.Locale;

public interface VideoService
{
    List<VideoCategory> findAllCategory();

    List<Video> findVideoToHomePage(int videoCategory);

    List<Video> findVideoToRecommend();

    List<Video> findVideoToRank(int videoCategory);

    Video findOneByVideoId(int videoId);

    List<Video> findVideoToRelate(int videoId);

    List<Video> searchVideos(int categoryId, String searchTex, int searchMode);
}
