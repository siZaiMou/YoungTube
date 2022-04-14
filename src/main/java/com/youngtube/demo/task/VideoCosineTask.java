package com.youngtube.demo.task;


import com.youngtube.demo.entity.Video;
import com.youngtube.demo.entity.VideoTag;
import com.youngtube.demo.service.CommentService;
import com.youngtube.demo.service.VideoService;
import com.youngtube.demo.untils.CosineUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.List;

@Component
public class VideoCosineTask {

    @Autowired
    VideoService videoService;
    @Autowired
    CommentService commentService;

    //每隔一天计算一次视频的相似度
    @Scheduled(fixedDelay = 30000)
    public void updateVideoCosine() throws ParseException {

        List<Video> videoss=videoService.findAllVideo();//所有的视频
        List<Video> videos=videoService.findAllVideo();//所有的视频

        for (int i = 0; i <videoss.size() ; i++) {
            int  videoId=videoss.get(i).getVideoId();//当前要计算的视频Id

            //获取当前视频的所有标签
            List<VideoTag> videoTags = videoService.findTagById(videoId);

            //拼接成一个字符串
            String s="你好 ";
            for (int j = 0; j <videoTags.size() ; j++) {
                //System.out.println(videoTags.get(i).getTagName());
                s+=videoTags.get(j).getTagName()+" ";
            }
          //System.out.println("当前视频的标签:"+s);

            for (int j = 0; j <videos.size() ; j++) {//所有的视频
                String ss = "你好 ";
          int videoId2=videos.get(j).getVideoId();//计算当前视频与其他所有视频的相似度

              if(videoId!=videoId2){//不能包括自己和自己计算相似度

                  List<VideoTag> tags = videoService.findTagById(videoId2);

                  for (int k= 0; k < tags.size(); k++) {
                      ss += tags.get(k).getTagName() + " ";
                  }
                  videoService.insertCosine(videoId,videoId2,CosineUtils.getSimilarity(s, ss));
                  //
                  //videoService.insertCosine(1,1, 2);
              }
                //System.out.println("当前视频的标签字符串:"+s+"其他视频的标签字符串"+ss);
               // videoService.insertCosine(videoId,videoId2, CosineUtils.getSimilarity(s, ss));
//                System.out.println("当前视频的id:"+videoId+"其他视频的id"+videoId2+"相似度"+CosineUtils.getSimilarity(s, ss));
//                System.out.println(s+"    "+ss);


            }

        }
    }

}
