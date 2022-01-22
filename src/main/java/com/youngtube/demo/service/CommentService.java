package com.youngtube.demo.service;

import com.youngtube.demo.entity.Dynamic;
import com.youngtube.demo.entity.DynamicComment;
import com.youngtube.demo.entity.VideoComment;

import java.util.List;

public interface CommentService
{
    void saveVideoComment(VideoComment videoComment);

    List<VideoComment> findVideoCommentWithHot(int videoId);

    List<VideoComment> findVideoCommentWithNew(int videoId);

    void packageDynamicComment(List<Dynamic> dynamicList, int userId);

    void saveDynamicComment(DynamicComment dynamicComment);
}
