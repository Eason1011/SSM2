package com.nwnu.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EchartsController {

    @RequestMapping("/pie")//默认请求方式为get
    public String pie1(){
        return "pie";
    }
    @RequestMapping(value = "/pie",method = RequestMethod.POST)//处理异步请求
    @ResponseBody
    public List<Map<String,Object>> pie2(){
        List<Map<String,Object>> ls= new ArrayList<>();
        //每一组数据---一个Map对象

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name","计算机学院");
        map1.put("value",17);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name","文学院");
        map2.put("value",13);
        ls.add(map2);
        HashMap<String, Object> map3 = new HashMap<>();
        map3.put("name","历史文化学院");
        map3.put("value",10);
        ls.add(map3);
        HashMap<String, Object> map4 = new HashMap<>();
        map4.put("name","教育学院");
        map4.put("value",6);
        ls.add(map4);
        HashMap<String, Object> map5 = new HashMap<>();
        map5.put("name","心理学院");
        map5.put("value",5);
        ls.add(map5);
        HashMap<String, Object> map6 = new HashMap<>();
        map6.put("name","马克思主义学院");
        map6.put("value",3);
        ls.add(map6);
        HashMap<String, Object> map7 = new HashMap<>();
        map7.put("name","哲学学院");
        map7.put("value",1);
        ls.add(map7);
        HashMap<String, Object> map8 = new HashMap<>();
        map8.put("name","社会发展与公共管理");
        map8.put("value",4);
        ls.add(map8);
        HashMap<String, Object> map9 = new HashMap<>();
        map9.put("name","法学院");
        map9.put("value",3);
        ls.add(map9);
        HashMap<String, Object> map10 = new HashMap<>();
        map10.put("name","经济学院");
        map10.put("value",5);
        ls.add(map10);
        HashMap<String, Object> map11 = new HashMap<>();
        map11.put("name","商学院");
        map11.put("value",2);
        ls.add(map11);
        HashMap<String, Object> map12 = new HashMap<>();
        map12.put("name","音乐学院");
        map12.put("value",3);
        ls.add(map12);
        HashMap<String, Object> map13 = new HashMap<>();
        map13.put("name","外国语学院");
        map13.put("value",5);
        ls.add(map13);
        
        return ls;
    }
}


