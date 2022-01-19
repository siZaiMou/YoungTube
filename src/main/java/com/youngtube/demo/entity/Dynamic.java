package com.youngtube.demo.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Dynamic
{
    private int dynamicId;
    private int userId;
    private String dynamicContent;
    private int dynamicIsTop=0;//1为置顶
    private Date dynamicDate=new Date();
}
