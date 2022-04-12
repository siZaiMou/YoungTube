package com.youngtube.demo.entity;


import lombok.Data;

@Data
public class UserSimiliarity {

    private int userId1;
    private int userId2;
    private double similiarity;
}
