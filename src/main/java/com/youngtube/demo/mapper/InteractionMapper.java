package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

//视频、动态的点赞、投币、转发等互动动作的dao层
@Mapper
@Repository
public interface InteractionMapper
{

    void insertOneVideoPraise(@Param("videoId") int videoId, @Param("userId") int userId, @Param("clickDate") Date date);

    void deleteOneVideoPraise(@Param("videoId") int videoId, @Param("userId") int userId);

    Integer findVideoPraiseCount(@Param("videoId") int videoId);

    Integer findVideoPraiseByVideoIdAndUserId(@Param("videoId") int videoId, @Param("userId") int userId);

    //数据库中clickType=1为点踩,clickType=0为点赞
    void insertOneVideoDisPraise(@Param("videoId") int videoId, @Param("userId") int userId, @Param("clickDate") Date date);

    void deleteOneVideoDisPraise(@Param("videoId") int videoId, @Param("userId") int userId);

    Integer findVideoDisPraiseCount(@Param("videoId") int videoId);

    Integer findVideoDisPraiseByVideoIdAndUserId(@Param("videoId") int videoId, @Param("userId") int userId);

    void insertOneVideoCoin(@Param("videoId") int videoId, @Param("userId") int userId, @Param("coinCount") int coinCount, @Param("coinDate") Date date);

    Integer findVideoCoinByVideoIdAndUserId(@Param("videoId") int videoId, @Param("userId") int userId);

    Integer findVideoCoinCount(@Param("videoId") int videoId);

    Integer findDynamicPraiseCount(@Param("dynamicId") int dynamicId);

    void insertOneDynamicPraise(@Param("userId") int userId, @Param("dynamicId") int dynamicId, @Param("praiseDate") Date praiseDate);

    void deleteOneDynamicPraise(@Param("userId") int userId, @Param("dynamicId") int dynamicId);

    Integer findDynamicPraiseByDynamicIdAndUserId(@Param("dynamicId") int dynamicId, @Param("userId") int userId);


}
