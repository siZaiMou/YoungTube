package com.youngtube.demo.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class Dynamic
{
    private int dynamicId=0;
    private int userId;
    private String dynamicContent;
    private int dynamicIsTop=0;//1为置顶
    private Date dynamicDate=new Date();

    private int dynamicPraiseCount=0;//动态点赞量,展示用
    private boolean dynamicIsPraise=false;//当前登录用户是否给这条动态点过赞,展示用
    private List<DynamicComment> dynamicCommentList;//这条动态的评论
}
