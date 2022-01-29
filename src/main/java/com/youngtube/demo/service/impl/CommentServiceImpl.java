package com.youngtube.demo.service.impl;

import com.youngtube.demo.entity.Dynamic;
import com.youngtube.demo.entity.DynamicComment;
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
        List<VideoComment> videoComments_hot_father = commentMapper.findFatherVideoCommentByVideoIdWithHot(videoId);//按热度查找这个视频下的父评论
        for(VideoComment singleFatherComment:videoComments_hot_father)
        {
            List<VideoComment> replyCommentList = commentMapper.findReplyVideoCommentByVideoId(videoId,singleFatherComment.getCommentId());//查出属于此父评论的所有子评论
            if(replyCommentList!=null&&replyCommentList.size()>0)
            {
                for(VideoComment singleReplyComment:replyCommentList)
                {
                    singleReplyComment.setReplyUserId(commentMapper.findReplyVideoCommentUserId(singleReplyComment.getReplyCommentId()));//查出直接回复的用户id
                }
            }
            singleFatherComment.setReplyCommentList(replyCommentList);
        }
        return videoComments_hot_father;//返回封装好子评论的父评论
    }

    //得到按时间排好序的评论
    @Override
    public List<VideoComment> findVideoCommentWithNew(int videoId)
    {
        List<VideoComment> videoComments_new = commentMapper.findVideoCommentByVideoIdWithNew(videoId);
        return videoComments_new;
    }

    //得到动态的评论列表
    @Override
    public void packageDynamicComment(List<Dynamic> dynamicList, int userId)
    {
        for(Dynamic dynamic:dynamicList)
        {
            List<DynamicComment> comments = commentMapper.findDynamicCommentByDynamicId(dynamic.getDynamicId());
            dynamic.setDynamicCommentList(comments);
        }
    }

    @Override
    public void saveDynamicComment(DynamicComment dynamicComment)
    {
        commentMapper.insertOneDynamicComment(dynamicComment);
    }
}
