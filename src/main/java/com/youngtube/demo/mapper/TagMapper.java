package com.youngtube.demo.mapper;


import com.youngtube.demo.entity.VideoCategory;
import com.youngtube.demo.entity.VideoTag;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TagMapper {
    List<VideoTag> findTagById(@Param("videoId") int videoId);

    void insertTag(@Param("tagName")String tagName,@Param("videoId") int videoId);
}
