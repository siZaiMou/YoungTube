package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.VideoCategory;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Locale;

@Mapper
@Repository
public interface CategoryMapper
{
    List<VideoCategory> findAllCategory();
}
