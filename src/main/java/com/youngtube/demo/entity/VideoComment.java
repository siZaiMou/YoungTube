package com.youngtube.demo.entity;

import lombok.Data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Data
public class VideoComment
{
    private int commentId;
    private int userId;
    private int videoId;
    private String commentContent;
    private int commentPraiseCount=0;
    private boolean commentIsPraise=false;
    private Date commentDate = new Date();
    private int fatherCommentId=0; //父评论id，0代表一级评论(标识所在楼层)
    private int replyCommentId=0;//直接回复的评论id，父评论为0
    private int commentAuditStatus=0;
    private int videoCommentIsTop=0; //1为置顶

    private int replyUserId=0;//直接回复的评论发送者id，展示用,父评论为0
    private List<VideoComment> replyCommentList;//该评论为父评论时的评论回复列表
}
