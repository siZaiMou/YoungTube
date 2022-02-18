package com.youngtube.demo.service;

import com.youngtube.demo.entity.Dynamic;
import com.youngtube.demo.entity.DynamicComment;
import com.youngtube.demo.entity.VideoComment;

import java.util.Date;
import java.util.List;

public interface CommentService
{
    void saveVideoComment(VideoComment videoComment);

    void saveVideoComment_MQ_producer(VideoComment videoComment);

    void saveVideoComment_MQ_consumer(VideoComment videoComment);

    List<VideoComment> findVideoCommentWithHot(int videoId,int userId);

    List<VideoComment> findVideoCommentWithNew(int videoId);

    void packageDynamicComment(List<Dynamic> dynamicList, int userId);

    void saveDynamicComment(DynamicComment dynamicComment);

    void saveVideoCommentPraise(int userId, int commentId, Date date);

    void cancelVideoCommentPraise(int userId, int commentId);
}
