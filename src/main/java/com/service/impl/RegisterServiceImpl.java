package com.service.impl;

import com.domain.ResignUser;
import com.domain.User;
import com.service.RegisterService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * @author 要不还是算了吧
 * @date 2023/11/17 14:52
 * @project aulogin
 */
@Service
public class RegisterServiceImpl implements RegisterService {
    //模拟数据库
    private static ArrayList<ResignUser> resignUsers =new ArrayList<ResignUser>();
    // 静态块，在类加载时执行
//    static {
//        // 在这里添加初始元素到 resignUsers
//        resignUsers.add(new ResignUser(/* 初始化参数 */));
//        resignUsers.add(new ResignUser(/* 初始化参数 */));
//        // 可以根据需要添加更多的元素
//    }


    @Override
   //判断用户名是否已经存在
    public boolean addUser(ResignUser resignUser) {
        for (ResignUser resignuser : resignUsers) {
            if (resignuser.getUsername().equals(resignUser.getUsername())) {
                return true;
            }
        }
        return false;
    }

    @Override
    //展示所有用户信息
    public ArrayList<ResignUser> getResignUser() {
        return resignUsers;
    }
}
