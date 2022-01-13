package com.youngtube.demo.controller;

import com.youngtube.demo.entity.Danmu;
import com.youngtube.demo.service.DanmuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/danmu")
public class DanmuController
{
    @Autowired
    DanmuService danmuService;

    @PostMapping(value="/insertDanmu/v3")
    @ResponseBody
    public Map<String,Object> insertDanmu(@RequestBody Map<String,String> param)
    {
        System.out.println(param);
        Map map = new HashMap();
        if(Integer.parseInt(param.get("author"))<0)
        {
            map.put("code",1);
            return map;
        }
        Danmu danmu = new Danmu();
        danmu.setVideoId(Integer.parseInt(param.get("id")));
        danmu.setUserId(Integer.parseInt(param.get("author")));
        danmu.setDtime(Float.parseFloat(param.get("time")));
        danmu.setDcontent(param.get("text"));
        danmu.setDcolor(param.get("color"));
        danmu.setPosition(Integer.parseInt(param.get("type")));
        int status=0;
        status = danmuService.saveDanmu(danmu);
        map.put("code",status);
        return map;
    }

    @GetMapping("/insertDanmu/v3")
    @ResponseBody
    public String getDanmu(int id)
    {
        String danmus = danmuService.getJsonDanmuByVideoId(id);
        return danmus;
//        return "{\"code\":0, \"data\":[ [20.188,0,16777215,\"小明\",\"好家伙，我直接好家伙\"], [1.188,0,16777215,\"小华\",\"好，我知道\"]]}";


    }

}
