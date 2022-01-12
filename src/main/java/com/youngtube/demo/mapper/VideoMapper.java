package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoCategory;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface VideoMapper
{

    //查询8条推荐视频(分区)
    List<Video> find8ByCategory(int videoCategory);

    //查询6条推荐视频(不分区)
    List<Video> findWithRecommend();

    //查询7条分区热榜视频
    List<Video> find7ByCategoryAndRank(int videoCategory);
}
