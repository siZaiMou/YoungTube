package com.youngtube.demo.service.impl;

import com.youngtube.demo.config.RabbitMQConfig_producer;
import com.youngtube.demo.entity.Dynamic;
import com.youngtube.demo.entity.DynamicComment;
import com.youngtube.demo.entity.VideoComment;
import com.youngtube.demo.mapper.CommentMapper;
import com.youngtube.demo.service.CommentService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService
{
    @Autowired
    CommentMapper commentMapper;

    @Autowired
    RabbitTemplate rabbitTemplate;

    //直接写入评论
    @Override
    public void saveVideoComment(VideoComment videoComment)
    {
        commentMapper.insertOneVideoComment(videoComment);
    }


    @Override
    public void saveVideoComment_MQ_producer(VideoComment videoComment) //发送VideoComment对象到rabbitmq的videoComment队列
    {
        rabbitTemplate.convertAndSend(RabbitMQConfig_producer.EXCHANGE_NAME,"videoComment",videoComment);
    }

    @Override
    @RabbitListener(queues = "videoComment",concurrency = "5-10",containerFactory = "mqConsumerlistenerContainer")
    public void saveVideoComment_MQ_consumer(VideoComment videoComment) //监听videoComment队列,定量接收视频评论对象,实现数据限流
    {
        //System.out.println(videoComment);
        commentMapper.insertOneVideoComment(videoComment);
    }

    //算法得到按热度排好序的评论，性能待优化(Redis)
    @Override
    public List<VideoComment> findVideoCommentWithHot(int videoId,int userId)
    {
        List<VideoComment> videoComments_hot_father = commentMapper.findFatherVideoCommentByVideoIdWithHot(videoId);//按热度查找这个视频下的父评论
        for(VideoComment singleFatherComment:videoComments_hot_father)
        {
            singleFatherComment.setCommentPraiseCount(commentMapper.findCommentPraiseCount(singleFatherComment.getCommentId()));
            singleFatherComment.setCommentIsPraise(commentMapper.findOneCommentPraise(userId,singleFatherComment.getCommentId())>0?true:false); //封装点赞数据
            List<VideoComment> replyCommentList = commentMapper.findReplyVideoCommentByVideoId(videoId,singleFatherComment.getCommentId());//查出属于此父评论的所有子评论
            if(replyCommentList!=null&&replyCommentList.size()>0)
            {
                for(VideoComment singleReplyComment:replyCommentList)
                {
                    singleReplyComment.setReplyUserId(commentMapper.findReplyVideoCommentUserId(singleReplyComment.getReplyCommentId()));//查出直接回复的用户id
                    singleReplyComment.setCommentPraiseCount(commentMapper.findCommentPraiseCount(singleReplyComment.getCommentId()));
                    singleReplyComment.setCommentIsPraise(commentMapper.findOneCommentPraise(userId,singleReplyComment.getCommentId())>0?true:false);
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

    @Override
    public void saveVideoCommentPraise(int userId, int commentId, Date date)
    {
        commentMapper.insertOneVideoCommentPraise(userId,commentId,date,0);
    }

    @Override
    public void cancelVideoCommentPraise(int userId, int commentId)
    {
        commentMapper.deleteOneVideoCommentPraise(userId,commentId);
    }
}
