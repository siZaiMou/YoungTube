package com.youngtube.demo.controller;

import com.youngtube.demo.entity.Favorite;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        model.addAttribute("favoriteUserId",userId);
        return "videoFavorite";
    }

    //在收藏视频时异步加载所有收藏夹
    @RequestMapping("/loadFavoriteListAsyn")
    public String loadFavoriteListAsyn(int userId,int videoId, Model model)
    {
        List<Favorite> favoriteList = favoriteService.findFavoriteList(userId);
        favoriteService.packageVideoIsFavorite(favoriteList,videoId);
        model.addAttribute("favoriteList",favoriteList);
        return "videoPlay::favoriteList";
    }

    //收藏的视频
    @RequestMapping("/loadFavoriteVideoList/{favoriteId}")
    public String loadFavoriteVideoList(@PathVariable("favoriteId")int favoriteId,Model model)
    {
        List<Date> favoriteDateList = favoriteService.findFavoriteDateList(favoriteId);
        List<Video> favoriteVideoList = favoriteService.findFavoriteVideoList(favoriteId);//查询收藏视频并封装收藏时间
        model.addAttribute("favoriteVideoList",favoriteVideoList);
        model.addAttribute("favoriteDateList",favoriteDateList);
        return "videoFavorite::favoriteVideoList";
    }

    //取消收藏
    @RequestMapping("cancelVideoFavorites")
    @ResponseBody
    public void cancelVideoFavorites(@RequestParam(value = "favoriteIds[]",defaultValue = "")int[] favoriteIds,int videoId)
    {
        favoriteService.cancelVideoFavorites(favoriteIds,videoId);
    }

    //添加收藏
    @RequestMapping("addVideoFavorites")
    @ResponseBody
    public void addVideoFavorites(@RequestParam(value = "favoriteIds[]",defaultValue = "") int[] favoriteIds, int videoId)
    {
        favoriteService.addVideoFavorites(favoriteIds,videoId);
    }
}
