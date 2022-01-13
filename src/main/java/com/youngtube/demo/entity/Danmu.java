package com.youngtube.demo.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Danmu
{
    private int danmuId;
    private int videoId;
    private int userId;
    private String dcontent;
    private int dsize;
    private String dcolor;
    private float dtime; //在视频中的时间
    private Date dSendTime=new Date(); //发送日期
    private int position=0;
    private int danmuAuditStatus=0;//审核状态，0为通过

}
