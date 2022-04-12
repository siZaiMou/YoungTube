package com.youngtube.demo.mapper;


import com.youngtube.demo.entity.UserSimiliarity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserSimiliarityMapper {

    List<UserSimiliarity>findAllUserSimiliarity();

    void  insertUserSimiliarity(@Param("userId1") int userId1, @Param("userId2") int userId2, @Param("similiarity") double similiarity);

    List<UserSimiliarity> findAppropriateUser(@Param("userId1") int userId1);
}
