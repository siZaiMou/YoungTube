package com.youngtube.demo.service;

import com.youngtube.demo.entity.Dynamic;

import java.util.List;

public interface DynamicService
{
    List<Dynamic> findDynamicsByUserId(int userId);
}
