package com.youngtube.demo.entity;

import lombok.Data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class VideoComment
{
    private int commentId;
    private int userId;
    private int videoId;
    private String commentContent;
    private int commentPraise=0;
    private int commentDislike=0;
    private Date commentDate = new Date();
    private int fatherCommentId=0; //父评论id，0代表一级评论
    private int commentAuditStatus=0;
    private int videoCommentIsTop=0; //1为置顶

}
