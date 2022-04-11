package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.Danmu;
import com.youngtube.demo.entity.DynamicComment;
import com.youngtube.demo.entity.VideoComment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Mapper
@Repository
public interface CommentMapper
{
    void insertOneVideoComment(VideoComment videoComment);

    List<VideoComment> findVideoCommentByVideoIdWithHot(@Param("videoId")int videoId);

    List<VideoComment> findVideoCommentByVideoIdWithNew(@Param("videoId")int videoId);

    List<DynamicComment> findDynamicCommentByDynamicId(@Param("dynamicId") int dynamicId);

    void insertOneDynamicComment(DynamicComment dynamicComment);

    List<VideoComment> findFatherVideoCommentByVideoIdWithHot(@Param("videoId") int videoId);

    List<VideoComment> findReplyVideoCommentByVideoId(@Param("videoId") int videoId, @Param("fatherCommentId") int fatherCommentId);

    Integer findReplyVideoCommentUserId(@Param("commentId")int replyCommentId);

    Integer findCommentPraiseCount(@Param("commentId") int commentId);

    Integer findOneCommentPraise(@Param("userId") int userId, @Param("commentId") int commentId);

    void insertOneVideoCommentPraise(@Param("userId") int userId, @Param("commentId") int commentId, @Param("clickDate")Date date, @Param("clickMode") int clickMode);

    void deleteOneVideoCommentPraise(@Param("userId") int userId, @Param("commentId") int commentId);

    int findOneVideoCommentCount(@Param("videoId") int videoId);

    List<VideoComment>findLastComment(@Param("videoId") int videoId);
}
