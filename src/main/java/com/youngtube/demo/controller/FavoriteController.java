package com.youngtube.demo.controller;

import com.youngtube.demo.entity.Favorite;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/favorite")
public class FavoriteController
{
    @Autowired
    FavoriteService favoriteService;

    @RequestMapping("/createFavorite")
    @ResponseBody
    public void createFavorite(Favorite favorite)
    {
        favoriteService.saveOneFavorite(favorite);
    }

    //加载所有收藏夹
    @RequestMapping("/loadFavoriteList/{userId}")
    public String loadFavoriteList(@PathVariable("userId")int userId, Model model)
    {
        List<Favorite> favoriteList = favoriteService.findFavoriteList(userId);
        model.addAttribute("favoriteList",favoriteList);
        return "videoFavorite";
    }

    @RequestMapping("/loadFavoriteVideoList/{favoriteId}")
    public String loadFavoriteVideoList(@PathVariable("favoriteId")int favoriteId,Model model)
    {
        List<Date> favoriteDateList = favoriteService.findFavoriteDateList(favoriteId);
        List<Video> favoriteVideoList = favoriteService.findFavoriteVideoList(favoriteId);//查询收藏视频并封装收藏时间
        model.addAttribute("favoriteVideoList",favoriteVideoList);
        model.addAttribute("favoriteDateList",favoriteDateList);
        return "videoFavorite::favoriteVideoList";
    }
}
