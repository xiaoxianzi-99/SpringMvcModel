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
    @Override
    public boolean addUser(ResignUser resignUser) {
        return false;
    }

    @Override
    public ArrayList<User> getResignUser() {
        return null;
    }
}
