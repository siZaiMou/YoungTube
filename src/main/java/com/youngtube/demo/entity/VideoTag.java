package com.youngtube.demo.entity;

import lombok.Builder;
import lombok.Data;


@Data
public class VideoTag
{
    private int tagId=0;
    private String tagName;
    private int videoId;
}
