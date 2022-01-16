package com.youngtube.demo.service;

public interface InteractionService
{
    void insertVideoPraise(int videoId, int userId);

    void deleteVideoPraise(int videoId, int userId);

    Integer getVideoPraiseCount(int videoId);

    boolean videoIsPraiseByUserId(int videoId, int userId);

    void insertVideoCoin(int videoId, int userId,int coinCount);

    boolean videoIsCoinByUserId(int videoId, int userId);

    Integer getVideoCoinCount(int videoId);
}
