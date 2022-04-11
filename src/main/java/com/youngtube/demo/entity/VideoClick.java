package com.youngtube.demo.entity;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
public class VideoClick {
    private int userId;
    private int videoId;
    private Date clickDate=new Date();
    private int clickType;

}
