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

    List<Video> find8ByCategory(int videoCategory);

    List<Video> findWithRecommend();
}
