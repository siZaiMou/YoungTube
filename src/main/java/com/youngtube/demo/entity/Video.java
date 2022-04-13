package com.youngtube.demo.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class Video implements Serializable
{
    private int videoId;
    private String videoName;
    private String videoIntroduction;
    private int videoCategory;
    private String videoFrontSrc; //视频封面路径
    private String videoSrc;
    private Date videoIssuingTime = new Date();
    private int videoAuditStatus = 0; //视频审核状态 0为通过
    private int videoUpId; //发布者id
    private int videoTeenagerMode = 0; //青少年模式下是否显示(1显示)

    //    以下字段用于显示，承载视图功能
    private int videoViewCount = 0;
    private int videoPraiseCount = 0;
    private int videoDisPraiseCount = 0;
    private int videoFavoriteCount = 0;
    private int videoCoinCount = 0;
    private int videoTransmitCount = 0;
    private int videoDanmuCount = 0;
    private String videoDuring;//时长(显示用)
    private Date videoViewDate; //历史视频观看时间(显示用)
    private List<VideoTag> videoTags;
}
