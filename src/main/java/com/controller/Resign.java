package com.controller;

import com.domain.ResignUser;
import com.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLOutput;
import java.util.HashMap;

/**
 * @author 要不还是算了吧
 * @date 2023/11/13 19:44
 * @project aulogin
 */
@Controller
@RequestMapping("/jsp")
public class Resign {
    @Autowired
    private RegisterService registerService;
    @RequestMapping("/register")
    public String resign(Model model){
        model.addAttribute("ResignUser",new ResignUser());
        HashMap<String,String> hobbys=new HashMap<>();
        hobbys.put("购物","购物");
        hobbys.put("影视","影视");
        hobbys.put("餐饮","餐饮");
        model.addAttribute("hobbys",hobbys);
        return "register";
    }
    @RequestMapping("/useradd")
    public String adduser(@ModelAttribute ResignUser resignUser,Model model){

        System.out.println("123");
        System.out.println(resignUser.getUsername());
        if(registerService.addUser(resignUser)){
            //账号已存在则数据回填
            HashMap<String,String> hobbys=new HashMap<>();
            hobbys.put("购物","购物");
            hobbys.put("影视","影视");
            hobbys.put("餐饮","餐饮");
            model.addAttribute("hobbys",hobbys);
            return "register";
        }else{
            return "login";
        }

    }
}
