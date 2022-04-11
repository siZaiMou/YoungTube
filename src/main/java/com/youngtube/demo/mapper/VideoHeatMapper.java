package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.VideoHeat;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface VideoHeatMapper {
    List<VideoHeat> findTotalHeat(@Param("categoryId") int categoryId);
    void insertTotalHeat(@Param("videoId") int videoId,@Param("categoryId") int categoryId,@Param("totalHeat") double totalHeat);



}
