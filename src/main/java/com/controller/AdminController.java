package com.controller;

import com.domain.ResignUser;
import com.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 要不还是算了吧
 * @date 2023/11/18 11:09
 * @project aulogin
 */
//管理员页面
@Controller
public class AdminController {
    @Autowired
    private RegisterService registerService;
//展示用户数据
    @RequestMapping("/list")
    public String listUsers(Model model){
        List<ResignUser> resignUsers = registerService.getResignUser();
        model.addAttribute("resignUsersr",resignUsers);
        return "userlist";
    }
}
