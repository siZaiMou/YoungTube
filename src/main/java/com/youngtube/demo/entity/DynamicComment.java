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

//    数据库设计存在问题，无法反映点赞情况，暂不考虑动态评论的点赞
    private boolean isPraise=false; //当前用户是否点赞
}
