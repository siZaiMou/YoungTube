package com.youngtube.demo.entity;

import lombok.Data;

@Data
public class VideoUpEntity
{
    private String fileName;// 文件名字

    private long fileSize;// 文件总大小

    private long fileSY;// 文件上传 剩余的

    private int tag=0;//如果大于0就是上传完成

    private int percent=0;//百分比
}
