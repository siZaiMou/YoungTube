package com.youngtube.demo.entity;

import lombok.Data;

import java.util.Date;

@Data
public class DynamicComment
{
    private int commentId;
    private int userId;
    private int dynamicId;
    private String commentContent;
    private int commentPraise=0;
    private int commentDislike=0;
    private Date commentDate = new Date();
    private int fatherCommentId=0; //父评论id，0代表一级评论
    private int commentAuditStatus=0;
    private int dynamicCommentIsTop=0; //1为置顶
    //以下字段用于显示
    private boolean isPraise=false; //当前用户是否点赞
}
