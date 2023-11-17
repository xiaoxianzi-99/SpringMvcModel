package com.util;

import com.domain.User;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 要不还是算了吧
 * @date 2023/11/2 21:00
 * @project aulogin
 */
public class loginUtil {
    //验证账号密码
    public static final HashMap<String,String> userdate=new HashMap<String,String>(){
        {
            put("admin","abc123");
        }
    };
    public static boolean isLoginSuccess(User user){
        for (Map.Entry<String, String> m : userdate.entrySet()) {
            if (m.getKey().equals(user.getLoginName()) && m.getValue().equals(user.getPassWord())) {
                {
                    return true;
                }
            }
        }
        return false;
    }
}
