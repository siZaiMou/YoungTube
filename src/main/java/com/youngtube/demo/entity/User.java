package com.youngtube.demo.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class User
{
    private int userId;
    private String userPetName;//用户昵称
    private String userSignature="这个人很神秘，什么都没有写";
    private String userPassword;
    private String userHeadSrc = "/common/pictures/user/userhead/defaulthead.png";
    private String userName;//用户真实姓名
    private String userLicense;
    private String userSex;
    private String userAddress;
    private String userIp;
    private String userPhone;
    private String userEmail;
    private int vipGrade = 0;
    private int userReputation = 100;
    private int userIsUp = 0;
    private Date registTime=new Date();
    private int userCoin = 0;
}
