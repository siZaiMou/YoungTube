package com.youngtube.demo.controller;

import com.google.gson.Gson;
import com.youngtube.demo.entity.VideoUploadEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

@Controller
@RequestMapping("/check")
public class CheckController
{
    @GetMapping("/imgCheck*")
    public void imgCheckCode(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        //服务器通知浏览器不要缓存
        response.setHeader("pragma","no-cache");
        response.setHeader("cache-control","no-cache");
        response.setHeader("expires","0");

        //在内存中创建一个长80，宽30的图片，默认黑色背景
        //参数一：长
        //参数二：宽
        //参数三：颜色
        int width = 80;
        int height = 30;
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);

        //获取画笔
        Graphics g = image.getGraphics();
        //设置画笔颜色为灰色
        g.setColor(Color.GRAY);
        //填充图片
        g.fillRect(0,0, width,height);

        //产生4个随机验证码，12Ey
        String base = "0123456789ABCDEFGabcdefg";
        int size = base.length();
        Random r = new Random();
        StringBuffer sb = new StringBuffer();
        for(int i=1;i<=4;i++){
            //产生0到size-1的随机值
            int index = r.nextInt(size);
            //在base字符串中获取下标为index的字符
            char c = base.charAt(index);
            //将c放入到StringBuffer中去
            sb.append(c);
        }
        String checkCode = sb.toString();

        //将验证码放入HttpSession中
        request.getSession().setAttribute("CHECKCODE_SERVER",checkCode);

        //设置画笔颜色为黄色
        g.setColor(Color.YELLOW);
        //设置字体的小大
        g.setFont(new Font("黑体",Font.BOLD,24));
        //向图片上写入验证码
        g.drawString(checkCode,15,25);
        ImageIO.write(image,"PNG",response.getOutputStream());
    }

    //视频上传
    @RequestMapping(value = "/percentAJAX", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public @ResponseBody void percentAJAX(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        if (request.getSession().getAttribute("videoFile") == null) {
            // new 出一个实体
            VideoUploadEntity video = new VideoUploadEntity();
            video.setPercent(0);
            video.setFileName("请稍后..");
            video.setFileSize(0);
            video.setFileSY(0);
            video.setTag(0);
            // 放入session中
            request.getSession().setAttribute("videoFile", video);// 放入到session中

            // - -想不到办法....就先让线程休息3秒在往下跑吧
            /*
             * try { Thread.sleep(3000); } catch (InterruptedException e) {
             * System.out.println("线程休息出错"); e.printStackTrace(); }
             */
        } else {
            VideoUploadEntity video = (VideoUploadEntity) request.getSession().getAttribute("videoFile");
            // 设置编码
            response.setCharacterEncoding("UTF-8");
            request.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            String sbb = gson.toJson(video);
            out.write(sbb);
        }

    }

}
