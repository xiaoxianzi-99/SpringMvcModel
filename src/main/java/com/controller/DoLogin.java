package com.controller;

import com.domain.ResignUser;
import com.domain.User;
import com.util.ImageUtil;
import com.util.loginUtil;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 要不还是算了吧
 * @date 2023/11/1 23:20
 * @project aulogin
 */
@Controller
@RequestMapping("/jsp")
public class DoLogin {
    //登录
    @RequestMapping("/DoLogin")
    public String login(User user, HttpSession session, HttpServletResponse response, HttpServletRequest request, @RequestParam("icode") String icode) throws IOException {
        String realCode = (String) session.getAttribute("code");
        String autoLogin =request.getParameter("autoLogin");


        response.setHeader("Content-Type", "text/html;charset=UTF-8");
        //判断验证码
        if(icode.equals(realCode)){
            //判断账号密码
            if(loginUtil.isLoginSuccess(user)){
                session.setAttribute("user", user);
                //判断是否勾选自动登录
                if( autoLogin!= null){
                    //勾选了自动登录就将账号密码写入cookie
                    Cookie ckName = new Cookie("userName", user.getLoginName());
                    Cookie ckPwd = new Cookie("pwd", user.getPassWord());
                    //设置存活周期，为24h
                    ckName.setMaxAge(24 * 60 * 60);
                    ckPwd.setMaxAge(24 * 60 * 60);
                    ckName.setPath("/jsp/main.jsp");
                    ckPwd.setPath("/jsp/main.jsp");
                    response.addCookie(ckName);
                    response.addCookie(ckPwd);
                }
                return "main";
            }else{
                PrintWriter writer = response.getWriter();
                writer.print("<script type='text/javascript'>" + "alert('账号或密码错误!');history.go(-1)" + "</script>");
                writer.flush();
                writer.close();
                return "login";
            }
        }else{
        PrintWriter writer = response.getWriter();
        writer.print("<script type='text/javascript'>" + "alert('验证码错误!');history.go(-1)" + "</script>");
        writer.flush();
        writer.close();
        return "login";
        }
    }



    @ResponseBody
    @RequestMapping("/loadcode")
    public void loadcode(HttpServletRequest request, HttpServletResponse response)throws Exception {
        final int W = 100;
        final int H = 30;
        response.setContentType("image/jpeg");
        ServletOutputStream out = response.getOutputStream();
        BufferedImage img = new BufferedImage(W, H, BufferedImage.TYPE_INT_RGB);
        Graphics g = img.getGraphics();
        g.setColor(Color.YELLOW);
        g.fillRect(0, 0, W, H);
        g.setColor(Color.BLUE);
        g.drawRect(1, 1, W-2, H-2);
        String icode = ImageUtil.icodeBuilder(g,4);
        request.getSession().setAttribute("code", icode);
        System.out.println("realCode:" + icode);
        ImageUtil.drawLines(g, 10);
        ImageIO.write(img, "jpg", out);
    }

    @RequestMapping("/relogin")
    public String relogin(){
        return "login";
    }


}
