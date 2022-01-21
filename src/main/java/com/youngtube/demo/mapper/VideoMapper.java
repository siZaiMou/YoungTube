package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoCategory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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

    List<Video> find20WithVideoId();

    List<Video> findVideosBySearch(@Param("categoryId") int categoryId, @Param("searchTex") String searchTex, @Param("searchMode") int searchMode);

    Integer findVideoCountByUserId(@Param("userId") int userId);

    List<Video> findVideoByUserId(@Param("userId")int userId);

    List<Video> find5WithTimeHot();
}
