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
        map1.put("name","�����û�");
        map1.put("value",80);
        ls.add(map1);
        HashMap<String, Object> map2 = new HashMap<>();
        map2.put("name","δ�����û�");
        map2.put("value",20);
        ls.add(map2);
        return ls;
    }
}

