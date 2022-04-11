package com.youngtube.demo.service;

import com.youngtube.demo.entity.Dynamic;

import java.util.Date;
import java.util.List;

public interface InteractionService
{
    void insertVideoPraise(int videoId, int userId);

    void insertVideoPraise_MQ_producer(int videoId, int userId);

    void insertVideoPraise_MQ_consumer(String message);

    void deleteVideoPraise(int videoId, int userId);

    Integer getVideoPraiseCount(int videoId);

    boolean videoIsPraiseByUserId(int videoId, int userId);

    void insertVideoDisPraise(int videoId, int userId);

    void deleteVideoDisPraise(int videoId, int userId);

    Integer getVideoDisPraiseCount(int videoId);

    boolean videoIsDisPraiseByUserId(int videoId, int userId);

    void insertVideoCoin(int videoId, int userId,int coinCount);

    boolean videoIsCoinByUserId(int videoId, int userId);

    Integer getVideoCoinCount(int videoId);

    void makeInteractionCount(List<Dynamic> dynamicList,int userId);

    void insertDynamicPraise(int userId, int dynamicId, Date praiseDate);

    void deleteDynamicPraise(int userId, int dynamicId);
}
