package com.youngtube.demo.service;

import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoCategory;

import java.util.List;
import java.util.Locale;
import java.util.Map;

public interface VideoService
{
    List<VideoCategory> findAllCategory();

    List<Video> findVideoToHomePage(int videoCategory);

    List<Video> findVideoToRecommend();

    List<Video> findVideoToRank(int videoCategory);

    Video findOneByVideoId(int videoId);

    List<Video> findVideoToRelate(int videoId);

    List<Video> searchVideos(int categoryId, String searchTex, int searchMode,int currentPage);

    Integer findUserVideoCount(int userId);

    List<Video> findVideoByUpId(int userId);

    List<Video> findTimeHotVideos();

    void updateVideoViewCount(Map<Integer, Integer> videoIdAndViewCount);

    void saveVideo(Video video);

    List<Video> findViewHistory(int userId);
}
