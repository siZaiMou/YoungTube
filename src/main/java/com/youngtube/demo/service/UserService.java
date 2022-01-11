package com.youngtube.demo.service;

import com.youngtube.demo.entity.User;

public interface UserService
{
    void regist(User user);

    User login(User user);
}
