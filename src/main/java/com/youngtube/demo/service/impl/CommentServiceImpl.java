package com.youngtube.demo.service.impl;

import com.youngtube.demo.entity.VideoComment;
import com.youngtube.demo.mapper.CommentMapper;
import com.youngtube.demo.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService
{
    @Autowired
    CommentMapper commentMapper;

    //写评论，性能待优化(RabbitMQ)
    @Override
    public void saveVideoComment(VideoComment videoComment)
    {
        commentMapper.insertOneVideoComment(videoComment);
    }

    //算法得到按热度排好序的评论，性能待优化(Redis)
    @Override
    public List<VideoComment> findVideoCommentWithHot(int videoId)
    {
        List<VideoComment> videoComments_hot = commentMapper.findVideoCommentByVideoIdWithHot(videoId);
        return videoComments_hot;
    }

    //得到按时间排好序的评论
    @Override
    public List<VideoComment> findVideoCommentWithNew(int videoId)
    {
        List<VideoComment> videoComments_new = commentMapper.findVideoCommentByVideoIdWithNew(videoId);
        return videoComments_new;
    }
}
