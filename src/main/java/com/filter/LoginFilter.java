package com.filter;



import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * @author 要不还是算了吧
 * @date 2023/11/3 10:58
 * @project aulogin
 */
public class LoginFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        Object attr = session.getAttribute("user");
        String str  = req.getRequestURI();

        if(!str.equals("/jsp/loadcode") && !str.equals("/jsp/DoLogin") && !str.equals("/js/address.js")&&!str.equals("/jsp/main.jsp")&& !str.equals("/jsp/useradd")&& !str.equals("/jsp/register")&&attr == null  )
        {
            System.out.println("url===" + str);
            chain.doFilter(request, response);
            req.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
        }
        else {
            chain.doFilter(request,response);
        }
        return;
    }

    @Override
    public void destroy() {
    }
}
