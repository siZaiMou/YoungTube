package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper
{
    void insertOne(User user);

    User findByUserPetName(@Param("userPetName")String userPetName, @Param("userPassword") String userPassword);

    User findOneByUserId(@Param("userId") int videoUpId);

    void updateUserCoinByUserId(@Param("userId")int userId, @Param("coinCount")int coinCount);
}
