package com.youngtube.demo.entity;

import lombok.Data;

@Data
public class Favorite
{
    private int favoriteId=0;
    private String favoriteName;
    private int userId;
}
