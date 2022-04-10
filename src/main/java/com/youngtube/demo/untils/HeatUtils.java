package com.youngtube.demo.untils;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HeatUtils {
    private int videoViewCount;//视频的播放次数
    private int videoLikeCount;//视频点赞量
    private int videoDislikeCount;//视频点踩量
    private Date videoIssuingTime;//视频的发布时间
    private int  commentCount ;//视频评论的数量
    private Date commentLikeCount;//视频评论总的点赞数
    private Date commentDislikeCount;//视频评论总的点踩数
    private Date commentLast;//视频最后一个评论的时间
    private Date nowTime;//此刻的时间

    public HeatUtils(int videoViewCount, int videoLikeCount, int videoDislikeCount, Date videoIssuingTime, int  commentCount , Date commentLikeCount, Date commentDislikeCount, Date commentLast, Date nowTime){
    this.videoViewCount=videoViewCount;
    this.videoLikeCount=videoLikeCount;
    this.videoDislikeCount=videoDislikeCount;
    this.videoIssuingTime=videoIssuingTime;
    this.commentCount=commentCount;
    this.commentLikeCount=commentLikeCount;
    this.commentDislikeCount=commentDislikeCount;
    this.commentLast=commentLast;
    this.nowTime=nowTime;
    }



    //返回热度值
    public double getHeat(int videoViewCount,int videoLikeCount,int videoDislikeCount,Date videoIssuingTime,int  commentCount ,Date commentLikeCount,Date commentDislikeCount, Date commentLast){
    double x1=Math.log10(videoViewCount)*4;//播放量
    double x2=(videoLikeCount-videoDislikeCount)*commentCount/5;//点赞了和点踩量之差
    //double x3=

    double y1=calLastedTime(videoIssuingTime,nowTime)+1;//当这个视频发表的时间越早，这个值越大
    double y2=Math.pow(calLastedTime(commentLast,nowTime)/2,1.5) ;//这个视频的最后一条评论发表的时间越早

    double heat=(x1+x2)/(y1-y2);

     return heat;
    }





    public static int calLastedTime(Date startDate, Date endDate) {//计算后面的date于前面date之间的秒数差
        long a = endDate.getTime();
        long b = startDate.getTime();
        System.out.println(a);
        System.out.println(b);
        int c = (int) ((a - b) / 86400000);
        return c;
    }


//    public static void main(String[] args) throws ParseException {
//        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//
//
//    System.out.println(calLastedTime(sf.parse("2022-04-01 12:43:56"),sf.parse("2022-04-03 14:29:28")));
//    }
}
//Stack Overflow热点问题的排名，与参与度（Qviews和Qanswers）和质量（Qscore和Ascores）成正比，与时间（Qage和Qupdated）成反比。