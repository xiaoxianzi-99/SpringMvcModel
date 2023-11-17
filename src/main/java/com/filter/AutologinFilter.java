package com.filter;

import com.controller.DoLogin;
import com.domain.User;
import com.util.loginUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;


import java.io.IOException;
import java.util.logging.LogRecord;

/**
 * @author 要不还是算了吧
 * @date 2023/11/3 10:45
 * @project aulogin
 */
public class AutologinFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    //进入main.jsp过滤一遍消息
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req =(HttpServletRequest)request;
        Cookie[] cs = ((HttpServletRequest)request).getCookies();
        String userName = getValueByName(cs, "userName");
        String pwd = getValueByName(cs, "pwd");
        System.out.println("ckName:" + userName);
        System.out.println("ckPwd:" + pwd);
        if(req.getSession()!=null){
            chain.doFilter(request, response);
            return;
        }
        //如果存在用户名和密码，帮你自动匹配，否则跳转到登录页面
        if (userName != null && pwd != null) {
            User user=new User();
            user.setLoginName(userName);
            user.setPassWord(pwd);
            if (loginUtil.isLoginSuccess(user)) {
                ((HttpServletRequest)request).getSession().setAttribute("user", user);
                chain.doFilter(request, response);
                return;
            }
            req.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
            return;

        } else {
            req.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
            return;
        }
    }
    public static String getValueByName(Cookie[] cs, String name)
    {
        for (int i = 0; cs != null && i < cs.length; i++) {
            if(cs[i].getName().equals(name))
            {
                return cs[i].getValue();
            }
        }
        return null;
    }
    @Override
    public void destroy() {
    }
}
