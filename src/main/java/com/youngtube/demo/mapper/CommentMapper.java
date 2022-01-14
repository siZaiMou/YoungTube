package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.Danmu;
import com.youngtube.demo.entity.VideoComment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CommentMapper
{
    void insertOneVideoComment(VideoComment videoComment);

    List<VideoComment> findVideoCommentByVideoIdWithHot(@Param("videoId")int videoId);

    List<VideoComment> findVideoCommentByVideoIdWithNew(@Param("videoId")int videoId);
}
