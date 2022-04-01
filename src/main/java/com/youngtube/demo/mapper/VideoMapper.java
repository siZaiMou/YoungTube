package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.Video;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Mapper
@Repository
public interface VideoMapper
{

    //查询8条推荐视频(分区)
    List<Video> find8ByCategory(int videoCategory);

    //查询6条推荐视频(不分区)
    List<Video> find6WithRecommend();

    //查询7条分区热榜视频
    List<Video> find7ByCategoryAndRank(int videoCategory);

    Video findOneById(@Param("videoId") int videoId);

    //查询20条相关视频,参数应根据service层算法给出
    List<Video> find20WithVideoId();

    List<Video> findVideosBySearch(@Param("categoryId") int categoryId, @Param("searchTex") String searchTex, @Param("searchMode") int searchMode);

    //用户投稿视频数
    Integer findVideoCountByUserId(@Param("userId") int userId);

    //用户投稿视频
    List<Video> findVideoByUserId(@Param("userId")int userId);

    //查询5条实时热榜视频
    List<Video> find5WithTimeHot();

    //根据id列表查询视频列表
    List<Video> findVideosByVideoIds(List<Integer> videoIdList);

    //redis播放量更新到mysql中
    void updateVideoViewCount(@Param("videoId")Integer videoId, @Param("videoViewCount")Integer videoViewCount);

    void insertOneVideo(Video video);

    List<Integer> findHistoryVideoIds(@Param("userId") int userId);

    List<Date> findHistoryDates(@Param("userId") int userId);
}
