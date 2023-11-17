package com.util;

import java.awt.*;

/**
 * @author 要不还是算了吧
 * @date 2023/11/2 20:06
 * @project aulogin
 */
public class ImageUtil {
    public static final int W = 100;
    public static final int H = 30;
    public static int getRandomNum(int max)
    {
        return (int)(Math.random()*max);
    }

    public static String icodeBuilder(Graphics g, int num)
    {
        String rs = "";
        String codes = "0123456789abcdefghijklmnopqrstuvwxyz";
        int p = 10;
        for (int i = 0; i < num; i++) {
            char c = codes.charAt(getRandomNum(codes.length()));
            Color color = new Color(getRandomNum(256), getRandomNum(256), getRandomNum(256));
            g.setColor(color);
            g.setFont(new Font("宋体", Font.BOLD, 20));
            g.drawString(c+"", p, 20);
            p += 20;
            rs = rs + c;
        }

        return rs;
    }

    public static void drawLines(Graphics g, int num)
    {
        for (int i = 0; i < num; i++) {
            int x1 = getRandomNum(W);
            int y1 = getRandomNum(H);
            int x2 = getRandomNum(W);
            int y2 = getRandomNum(H);
            Color color = new Color(getRandomNum(256), getRandomNum(256), getRandomNum(256));
            g.setColor(color);
            g.drawLine(x1, y1, x2, y2);
        }
    }
}
