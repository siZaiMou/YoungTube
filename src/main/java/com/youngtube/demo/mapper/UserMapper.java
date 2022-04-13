package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Mapper
@Repository
public interface UserMapper
{
    void insertOne(User user);

    User findByUserPetName(@Param("userPetName")String userPetName, @Param("userPassword") String userPassword);

    User findOneByUserId(@Param("userId") int videoUpId);

    void updateUserCoinByUserId(@Param("userId")int userId, @Param("coinCount")int coinCount);

    Integer findUserFansCount(@Param("userId")int userId);

    Integer findOneUserFollow(@Param("followUserId")int followUserId,@Param("followedUserId")int followedUserId);

    void insertOneUserFollow(@Param("followUserId")int followUserId, @Param("followedUserId")int followedUserId, @Param("followDate")Date followDate,@Param("followMode")int mode);

    void deleteOneUserFollow(@Param("followUserId")int followUserId,@Param("followedUserId")int followedUserId);

    Integer findUserFollowCount(@Param("userId")int userId);

    List<Integer> findFollowedUserIds(@Param("userId") int userId);

    void saveORUpdateViewHistory(@Param("userId") int userId, @Param("contentType") int contentType, @Param("contentId") Integer contentId,@Param("viewDate") Date viewDate);

    List<User> findAllUser();
}
