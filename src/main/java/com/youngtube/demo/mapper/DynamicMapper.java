package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.Dynamic;
import com.youngtube.demo.entity.VideoCategory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DynamicMapper
{
    List<Dynamic> findDynamicsByUserId(@Param("userId")int userId);

    void insertOneDynamic(Dynamic dynamic);

    List<Dynamic> findFollowedDynamics(List<Integer> followedUserIdList);
}
