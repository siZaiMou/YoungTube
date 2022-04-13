package com.youngtube.demo.untils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PearsonUtils {
    public static void main(String[] args) {

        List<Double>l1=new ArrayList<>();
        List<Double>l2=new ArrayList<>();
        double []b1=new double[]{1,0,0,0,2};
        double []b2=new double[]{1,0,0,1,2};
        for(int i=0;i<b1.length;i++)
        {
         l1.add(b1[i]);
         l2.add(b2[i]);
        }
System.out.println(getPearsonBydim(l1,l2));



    }


    ////
    public static Double getPearsonBydim(List<Double> ratingOne, List<Double> ratingTwo) {
        if(ratingOne.size() != ratingTwo.size()) {//两个变量的观测值是成对的，每对观测值之间相互独立。
            return null;
        }
        double sim = 0D;//最后的皮尔逊相关度系数
        double commonItemsLen = ratingOne.size();//操作数的个数
        double oneSum = 0D;//第一个相关数的和
        double twoSum = 0D;//第二个相关数的和
        for(int i=0; i<commonItemsLen; i++) {
            oneSum += ratingOne.get(i);
            twoSum += ratingTwo.get(i);
        }
        double oneAvg = oneSum/commonItemsLen;//第一个相关数的平均值
        double twoAvg = twoSum/commonItemsLen;//第二个相关数的平均值
        double sonSum = 0D;
        double tempOne = 0D;
        double tempTwo = 0D;
        for(int i=0; i<commonItemsLen; i++) {
            sonSum += (ratingOne.get(i)-oneAvg)*(ratingTwo.get(i)-twoAvg);
            tempOne += Math.pow((ratingOne.get(i)-oneAvg), 2);
            tempTwo += Math.pow((ratingTwo.get(i)-twoAvg), 2);
        }
        double fatherSum = Math.sqrt(tempOne * tempTwo);
        sim = (fatherSum == 0) ? 1 : sonSum / fatherSum;
        return sim;
    }


}
