package com.youngtube.demo.service;

import com.youngtube.demo.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface VideoService
{
    List<VideoCategory> findAllCategory();

    List<Video> findVideoToHomePage(int videoCategory);

    List<Video> findVideoToRecommend(int userId);

    List<Video> findVideoToRank(int videoCategory);

    Video findOneByVideoId(int videoId);

    List<Video> findVideoToRelate(int videoId);

    List<Video> searchVideos(int categoryId, String searchTex, int searchMode,int currentPage);

    Integer findUserVideoCount(int userId);

    List<Video> findVideoByUpId(int userId);

    List<Video> findTimeHotVideos();

    void updateVideoViewCount(Map<Integer, Integer> videoIdAndViewCount);

    void saveVideo(Video video,VideoTag videoTag);

    List<Video> findViewHistory(int userId);

    List<VideoTag> findTagById(int videoId);

    void insertTag(String tagName,int videoId);

    void findAllTag();

    List<Video> findAllVideo();

    List<VideoCosine> findCosineById(int videoId);

    void insertCosine(int videoId1, int videoId2,double cosine);

    List<VideoCosine> findGreaterCosine(int videoId);

    List<VideoHeat> findTotalHeat(int categoryId);
    void insertTotalHeat( int videoId,int categoryId, double totalHeat);

    int findLikeCount(int videoId);

    int findDislikeCount(int videoId);

    List<Integer> findLikeVideo(int userId);

    List<Integer> findCommentVideo(int userId);

    List<Integer>findCoinVideo(int userId);
}
