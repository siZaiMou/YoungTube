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

    void insertOneVideoPraise(@Param("videoId")int videoId, @Param("userId")int userId, @Param("praiseDate")Date date);

    void deleteOneVideoPraise(@Param("videoId")int videoId, @Param("userId")int userId);

    Integer findVideoPraiseCount(@Param("videoId")int videoId);

    Integer findVideoPraiseByVideoIdAndUserId(@Param("videoId")int videoId, @Param("userId")int userId);

    void insertOneVideoCoin(@Param("videoId")int videoId, @Param("userId")int userId, @Param("coinCount") int coinCount, @Param("coinDate") Date date);

    Integer findVideoCoinByVideoIdAndUserId(@Param("videoId")int videoId, @Param("userId")int userId);

    Integer findVideoCoinCount(@Param("videoId")int videoId);
}
