package com.youngtube.demo.service.impl;

import com.github.pagehelper.PageHelper;
import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoCategory;
import com.youngtube.demo.mapper.CategoryMapper;
import com.youngtube.demo.mapper.DanmuMapper;
import com.youngtube.demo.mapper.VideoMapper;
import com.youngtube.demo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class VideoServiceImpl implements VideoService
{
    @Autowired
    CategoryMapper categoryMapper;

    @Autowired
    VideoMapper videoMapper;

    @Autowired
    DanmuMapper danmuMapper;

    @Override
    public List<VideoCategory> findAllCategory()
    {
        return categoryMapper.findAllCategory();
    }

    //使用推荐算法查询8个按分区推荐的视频
    @Override
    public List<Video> findVideoToHomePage(int videoCategory)
    {
        return videoMapper.find8ByCategory(videoCategory);
    }

    //使用推荐算法查询6个主页推荐视频
    @Override
    public List<Video> findVideoToRecommend()
    {
        return videoMapper.find6WithRecommend();
    }

    //按分区查询7个分区热榜视频
    @Override
    public List<Video> findVideoToRank(int videoCategory)
    {
        return videoMapper.find7ByCategoryAndRank(videoCategory);
    }

    //播放页,按videoId查询一个视频
    @Override
    public Video findOneByVideoId(int videoId)
    {
        Video video = videoMapper.findOneById(videoId);
        video.setVideoDanmuCount(danmuMapper.findDanmuCountByVideoId(videoId));
        return video;
    }

    //使用相关算法在播放页查询20个与当前播放视频关联视频，此处模拟
    @Override
    public List<Video> findVideoToRelate(int videoId)
    {
        List<Video>videos = videoMapper.find20WithVideoId();//查询参数应由算法计算得出
        int len = videos.size();
        for(int i=0;i<len;i++)
        {
            (videos.get(i)).setVideoDanmuCount(danmuMapper.findDanmuCountByVideoId((videos.get(i)).getVideoId()));
        }
        return videos;
    }

    //视频搜索
    @Override
    public List<Video> searchVideos(int categoryId, String searchTex, int searchMode,int currentPage)
    {
        PageHelper.clearPage();
        PageHelper.startPage(currentPage,6);
        List<Video>videos = videoMapper.findVideosBySearch(categoryId,searchTex,searchMode);
        return videos;
    }

    //查询用户的投稿视频数
    @Override
    public Integer findUserVideoCount(int userId)
    {
        return videoMapper.findVideoCountByUserId(userId);
    }

    //查询用户的所有投稿视频
    @Override
    public List<Video> findVideoByUpId(int userId)
    {
        return videoMapper.findVideoByUserId(userId);
    }

    //通过算法得到五条实时热榜视频
    @Override
    public List<Video> findTimeHotVideos()
    {
        //算法在service层
        return videoMapper.find5WithTimeHot();
    }

    @Override
    public void updateVideoViewCount(Map<Integer, Integer> videoIdAndViewCount)
    {
        Set<Map.Entry<Integer, Integer>> entries = videoIdAndViewCount.entrySet();
        for(Map.Entry<Integer,Integer>entry: entries)
        {
            videoMapper.updateVideoViewCount(entry.getKey(),entry.getValue());
        }
    }
}
