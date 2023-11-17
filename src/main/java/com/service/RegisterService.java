package com.service;

import com.domain.ResignUser;
import com.domain.User;

import java.util.ArrayList;

/**
 * @author 要不还是算了吧
 * @date 2023/11/17 14:53
 * @project aulogin
 */
public interface RegisterService {
    boolean addUser(ResignUser resignUser);
    ArrayList<User> getResignUser();

}
