package com.youngtube.demo.untils.SvmUtils;
import java.io.IOException;

public class test {
    public static void main(String[] args) throws IOException {

        String []arg ={ "D:\\Desktop\\本地测试svm\\train.txt", //存放SVM训练模型用的数据的路径

                "D:\\Desktop\\本地测试svm\\model.txt"};  //存放SVM通过训练数据训练出来的模型的路径



        String []parg={"D:\\Desktop\\本地测试svm\\predict.txt",   //这个是存放测试数据

                "D:\\Desktop\\本地测试svm\\model.txt",  //调用的是训练以后的模型

                "D:\\Desktop\\本地测试svm\\out.txt"};  //生成的结果的文件的路径



        System.out.println("........SVM运行开始..........");

//创建一个训练对象

        svm_train t = new svm_train();

//创建一个预测或者分类的对象

        svm_predict p = new svm_predict();

        //a = p.getAccuracy();

        t.main(arg);   //调用训练对象进行训练

        p.main(parg);  //调用预测分类对象进行预测
    }
}
