package com.youngtube.demo.entity;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Tolerate;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Builder
@Data
public class VideoComment implements Serializable
{
    @Tolerate
    public VideoComment() //rabbitmq需要一个无参的构造方法
    {}

    private int commentId;
    private int userId;
    private int videoId;
    private String commentContent;
    private Date commentDate = new Date();
    private int fatherCommentId=0; //父评论id，0代表一级评论(标识所在楼层)
    private int replyCommentId=0;//直接回复的评论id，父评论为0
    private int commentAuditStatus=0;
    private int videoCommentIsTop=0; //1为置顶

    private int commentPraiseCount=0;//点赞数
    private int commentDislikeCount=0;//点踩数
    private boolean commentIsPraise=false;//是否被当前用户点赞
    private int replyUserId=0;//直接回复的评论发送者id，展示用,父评论为0
    private List<VideoComment> replyCommentList;//该评论为父评论时的评论回复列表
}
