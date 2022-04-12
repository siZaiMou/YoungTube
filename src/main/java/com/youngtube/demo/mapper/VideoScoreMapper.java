package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.VideoScore;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface VideoScoreMapper {

    List<VideoScore> findAllScore();

    void insertVideoScore(@Param("userId") int userId,@Param("videoId") int videoId,@Param("score") double score);
}
