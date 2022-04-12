package com.youngtube.demo.entity;


import lombok.Data;

@Data
public class VideoScore {
    private int userId;
    private int videoId;
    private double score;
}
