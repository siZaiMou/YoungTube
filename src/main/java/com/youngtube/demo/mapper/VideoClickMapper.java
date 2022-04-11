package com.youngtube.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface VideoClickMapper {
    int findLikeCount(@Param("videoId")int videoId);
    int findDislikeCount(@Param("videoId")int videoId);
}
