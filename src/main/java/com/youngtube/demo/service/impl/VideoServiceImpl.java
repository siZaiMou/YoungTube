package com.youngtube.demo.service.impl;

import com.github.pagehelper.PageHelper;
import com.youngtube.demo.entity.*;
import com.youngtube.demo.mapper.*;
import com.youngtube.demo.service.VideoService;
import com.youngtube.demo.untils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class VideoServiceImpl implements VideoService
{
    @Autowired
    CategoryMapper categoryMapper;

    @Autowired
    VideoMapper videoMapper;

    @Autowired
    DanmuMapper danmuMapper;

    @Autowired
    RedisUtil redisUtil;

    @Autowired
    TagMapper tagMapper;

    @Autowired
    VideoHeatMapper videoHeatMapper ;

    @Autowired
    VideoClickMapper videoClickMapper ;

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
        List<Video>videos = new ArrayList<>();
        List<VideoCosine> greaterCosine = this.findGreaterCosine(videoId);
        for(VideoCosine vc:greaterCosine)
        {
            int vid = vc.getVideoId2();
            videos.add(videoMapper.findOneById(vid));
        }
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

    @Override
    public void saveVideo(Video video,VideoTag videoTag)
    {
        videoMapper.insertOneVideo(video);
        int videoId = video.getVideoId();
        String[] tags = videoTag.getTagName().split(" ");
        for(int i = 0;i<tags.length;i++)
        {
            tagMapper.insertTag(tags[i],videoId);
        }
    }

    @Override
    public List<Video> findViewHistory(int userId)
    {
        List<Integer> videoIds = videoMapper.findHistoryVideoIds(userId);
        List<Video> historyVideos = videoMapper.findVideosByVideoIds(videoIds);
        List<Date> viewDate = videoMapper.findHistoryDates(userId);
        int len = historyVideos.size();
        for(int i=0;i<len;i++)
        {
            historyVideos.get(i).setVideoViewDate(viewDate.get(i));
        }
        //与redis中数据保持一致
        Map<Integer,Map<Integer,Date>> historyViewStatusMap = (Map<Integer, Map<Integer, Date>>) redisUtil.get("HistoryViewStatusMap");
        String uid = String.valueOf(userId); //redis会把Integer的key反序列化为String类型
        if(historyViewStatusMap!=null&&historyViewStatusMap.get(uid)!=null)
        {
            Map<Integer,Date> idAndDate = historyViewStatusMap.get(uid);
            for(Map.Entry<Integer,Date> entry:idAndDate.entrySet())
            {
               Object obj = entry.getKey();
               int vid = Integer.parseInt(obj.toString());
               if(!videoIds.contains(vid))//防止缓存和数据库中数据重复
               {
                   Video vd = videoMapper.findOneById(vid);
                   vd.setVideoViewDate(entry.getValue());
                   historyVideos.add(vd);
               }

            }
            //将redis数据加入list后需要重新排队
            Collections.sort(historyVideos, new Comparator<Video>()
            {
                @Override
                public int compare(Video o1, Video o2)
                {
                    return (int) (o2.getVideoViewDate().getTime()-o1.getVideoViewDate().getTime());
                }
            });
        }
        return historyVideos;
    }

    @Override
    public List<VideoTag> findTagById(int videoId)
    {
        return tagMapper.findTagById(videoId);

    }

    @Override
    public void insertTag(String tagName,int videoId)
    {

        tagMapper.insertTag(tagName,videoId);
    }

    @Override
    public void findAllTag() {

    }

    @Override
    public List<Video> findAllVideo()
    {
        return videoMapper.findAllVideo();
    }

    @Override
    public List<VideoCosine> findCosineById(int videoId)
    {
        return videoMapper.findCosineById(videoId);
    }

    @Override
    public void insertCosine(int videoId1, int videoId2,double cosine)
    {
       // System.out.println(videoId1+" "+videoId2+" "+cosine);
        videoMapper.insertCosine(videoId1,videoId2,cosine);
        //videoMapper.insertCosine(videoId1,videoId2,cosine);
    }

    @Override
   public List<VideoCosine> findGreaterCosine(int videoId){
      return videoMapper.findGreaterCosine(videoId);
    }


    @Override
    public List<VideoHeat>  findTotalHeat(int categoryId)
    {
        return videoHeatMapper.findTotalHeat(categoryId);
    }


    @Override
    public void insertTotalHeat( int videoId,int categoryId, double totalHeat){
        videoHeatMapper.insertTotalHeat(videoId,categoryId,totalHeat);
    }

    @Override
    public int findLikeCount(int videoId){
        return videoClickMapper.findLikeCount(videoId);
    }

    @Override
    public int findDislikeCount(int videoId){
        return videoClickMapper.findDislikeCount(videoId);
    }


 }
