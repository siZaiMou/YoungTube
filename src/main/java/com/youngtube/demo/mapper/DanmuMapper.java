package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.Danmu;
import com.youngtube.demo.entity.Video;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DanmuMapper
{
    void insertOne(Danmu danmu);

    List<Danmu> findDanmuByVideoId(@Param("videoId")int id);

    Integer findDanmuCountByVideoId(@Param("videoId")int id);
}
