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

    @RequestMapping("/pie")//Ĭ������ʽΪget
    public String pie1(){
        return "pie";
    }
    @RequestMapping(value = "/pie",method = RequestMethod.POST)//�����첽����
    @ResponseBody
    public List<Map<String,Object>> pie2(){
        List<Map<String,Object>> ls= new ArrayList<>();
        //ÿһ������---һ��Map����

        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("name","�����ѧԺ");
        map1.put("value",17);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name","��ѧԺ");
        map2.put("value",13);
        ls.add(map2);
        HashMap<String, Object> map3 = new HashMap<>();
        map3.put("name","��ʷ�Ļ�ѧԺ");
        map3.put("value",10);
        ls.add(map3);
        HashMap<String, Object> map4 = new HashMap<>();
        map4.put("name","����ѧԺ");
        map4.put("value",6);
        ls.add(map4);
        HashMap<String, Object> map5 = new HashMap<>();
        map5.put("name","����ѧԺ");
        map5.put("value",5);
        ls.add(map5);
        HashMap<String, Object> map6 = new HashMap<>();
        map6.put("name","���˼����ѧԺ");
        map6.put("value",3);
        ls.add(map6);
        HashMap<String, Object> map7 = new HashMap<>();
        map7.put("name","��ѧѧԺ");
        map7.put("value",1);
        ls.add(map7);
        HashMap<String, Object> map8 = new HashMap<>();
        map8.put("name","��ᷢչ�빫������");
        map8.put("value",4);
        ls.add(map8);
        HashMap<String, Object> map9 = new HashMap<>();
        map9.put("name","��ѧԺ");
        map9.put("value",3);
        ls.add(map9);
        HashMap<String, Object> map10 = new HashMap<>();
        map10.put("name","����ѧԺ");
        map10.put("value",5);
        ls.add(map10);
        HashMap<String, Object> map11 = new HashMap<>();
        map11.put("name","��ѧԺ");
        map11.put("value",2);
        ls.add(map11);
        HashMap<String, Object> map12 = new HashMap<>();
        map12.put("name","����ѧԺ");
        map12.put("value",3);
        ls.add(map12);
        HashMap<String, Object> map13 = new HashMap<>();
        map13.put("name","�����ѧԺ");
        map13.put("value",5);
        ls.add(map13);
        
        return ls;
    }
}


