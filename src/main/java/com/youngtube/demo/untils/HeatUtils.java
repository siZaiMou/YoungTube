package com.youngtube.demo.untils;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HeatUtils {
    private int videoViewCount;//视频的播放次数
    private int videoLikeCount;//视频点赞量
    private int videoDislikeCount;//视频点踩量
    private String videoIssuingTime=null;//视频的发布时间
    private int  commentCount ;//视频评论的数量
    private int commentLikeCount;//视频评论总的点赞数
    private int commentDislikeCount;//视频评论总的点踩数
    private String commentLast=null;//视频最后一个评论的时间
    private String nowTime=null;//此刻的时间



    public HeatUtils(int videoViewCount, int videoLikeCount, int videoDislikeCount, String videoIssuingTime, int  commentCount , int commentLikeCount, int commentDislikeCount, String commentLast, String nowTime) throws ParseException {
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
    public double getHeat() throws ParseException {
    double x1=(videoViewCount)*4;//播放量
    double x2=(videoLikeCount-videoDislikeCount)*commentCount;//点赞了和点踩量之差
    double x3=(double) (commentLikeCount-commentDislikeCount);//视频评论的点赞了和点踩量之差越高，代表回复的质量越高

    double y1=calLastedTime(videoIssuingTime,nowTime)+1;//当这个视频发表的时间越早，这个值越大
   double y2=(calLastedTime(commentLast,nowTime)/2) ;//这个视频的最后一条评论发表的时间越早
//System.out.println(commentLast+" "+nowTime+" "+videoIssuingTime+" "+y1+"  "+y2);

       double y3=Math.pow((y1-y2),1.5);
       if(Double.isNaN(y3))
           y3=10000;
       //System.out.println(x1+" "+x2+" "+y3);
    double heat=(x1+x2)/y3;
    if(Double.isNaN(heat))
    return -1;
     else
     return heat;
    }





    public static int calLastedTime(String startDate, String endDate) throws ParseException {//计算后面的date于前面date之间的秒数差
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date startDate1=sf.parse(startDate);
        Date endDate1=sf.parse(endDate);
        long a = endDate1.getTime();
        long b = startDate1.getTime();
//        System.out.println(a);
//        System.out.println(b);
        int c = (int) ((a - b) / 86400000);
        return c;
    }


//    public static void main(String[] args) throws ParseException {
//        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//
//
//    System.out.println(calLastedTime(sf.parse("2022-04-01 12:43:56"),sf.parse("2022-04-03 14:29:28")));
//    }


    public static void main(String[] args) throws ParseException {
        /*HeatUtils heatUtils=new HeatUtils(10,5,1,"2022-01-12 09:03:12",10,0,0,"2022-02-19 09:46:51","2022-04-11 17:02:50");
        System.out.println(heatUtils.getHeat());*/
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //System.out.println(calLastedTime(("2022-01-12 09:03:12"),("2022-01-15 09:03:12")));


        HeatUtils heatUtils= new HeatUtils(10,5,1,"2022-01-12 09:03:12",10,0,0,"2022-02-19 09:46:51","2022-04-11 17:02:50");
       System.out.println(heatUtils.getHeat());
    }
}
//Stack Overflow热点问题的排名，与参与度（Qviews和Qanswers）和质量（Qscore和Ascores）成正比，与时间（Qage和Qupdated）成反比。