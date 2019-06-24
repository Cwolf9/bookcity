/**
 * Copyright (C), 2018-2019, csust
 * FileName: WebServlet
 * Author:   Cwolf9
 * Date:     2019/06/21 15:55
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/21           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/21
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/21
 * @since 1.0.0
 */
package com.demo.servlet;

import com.alibaba.fastjson.JSONObject;
import com.demo.dao.UserDao;
import com.demo.model.User;
import com.demo.util.CodeUtil;
import com.demo.util.ColorUtil;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.*;
import java.util.List;
import java.util.Random;

public class WebServlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.service(req, resp);
        req.setCharacterEncoding("utf-8");
        UserDao dao = new UserDao();
        //获取用户地址栏的地址
        String url = req.getServletPath();// *.do
        System.out.println("本次请求的url地址："+url);
        //Servlet保存数据方法：HttpSession
        HttpSession session = req.getSession();
        if("/register.do".equals(url)){//注册
            //account=sss&pwd=admin&username=admin&sex=女&phonenumber=11111
            String account = req.getParameter("account");
            String pwd = req.getParameter("pwd");
            String username = req.getParameter("username");
            String sex = req.getParameter("sex");
            String phonenumber = req.getParameter("phonenumber");
            System.out.println(sex);
            dao.save(account, pwd, username, sex, phonenumber);
            //页面跳转 login.jsp
            req.getRequestDispatcher("page/login.jsp").forward(req, resp);

        }else if("/code.do".equals(url)) {
            //画一张图片验证码传给服务器
            //画布
            int WIDTH = 100, HEIGHT = 30;
            BufferedImage img = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
            //画笔
            Graphics g = img.getGraphics();
            String code = "";
            g.setColor(Color.BLACK);
            g.fillRect(0,0,100,30);
            g.setColor(ColorUtil.getRandomColor());
            g.setFont(new Font("", Font.BOLD, 30));
            String s = CodeUtil.str();
            code += s;
            g.setColor(ColorUtil.getRandomColor());
            g.drawString(s, 10, 20);
            s = CodeUtil.str();
            code += s;
            g.setColor(ColorUtil.getRandomColor());
            g.drawString(s, 30, 20);
            s = CodeUtil.str();
            code += s;
            g.setColor(ColorUtil.getRandomColor());
            g.drawString(s, 60, 20);
            s = CodeUtil.str();
            code += s;
            g.setColor(ColorUtil.getRandomColor());
            g.drawString(s, 80, 20);
            session.setAttribute("code", code);//保存数据
            Random ran = new Random();
            // 随机画线
            for (int i = 0; i < 10; i++) {
                g.setColor(ColorUtil.getRandomColor());
                g.drawLine(ran.nextInt(WIDTH), ran.nextInt(HEIGHT), ran.nextInt(WIDTH), ran.nextInt(HEIGHT));
            }
            //输出流，用来给浏览器传输图片
            OutputStream out = resp.getOutputStream();
            //对图片进行jpeg压缩
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            encoder.encode(img);
            /*//多点绘制折线: 点(50, 100), 点(100, 130), 点(150, 70), 点(200, 100)
            BasicStroke bs1 = new BasicStroke(225);       // 笔画的轮廓（画笔宽度/线宽为5px）
            Graphics2D g2d = (Graphics2D) img.getGraphics();
            g2d.setStroke(bs1);
            g2d.setColor(Color.RED);
            int[] xPoints = new int[] { 10, 40, 80, 95 };
            int[] yPoints = new int[] { 10, 27, 1, 20 };
            g2d.drawPolyline(xPoints, yPoints, 4);
            encoder.encode(img);*/
        }else if("/login.do".equals(url)){
            String account = req.getParameter("account");
            String pwd = req.getParameter("pwd");
            String usercode = req.getParameter("code");
            //判断验证码
            String code = (String) session.getAttribute("code");
            if(usercode.equalsIgnoreCase(code)){
                //继续判断账号和密码
                User u = dao.findByAccountAndPwd(account, pwd);
                System.out.println("账户密码："+account+" "+pwd);
                if(u == null){
                    req.setAttribute("error", "账号或者密码错误!");
                    req.getRequestDispatcher("page/login.jsp").forward(req, resp);
                }else{//登陆成功
                    session.setAttribute("u", u);
                    //重定向
                    resp.sendRedirect(req.getContextPath()+"/page/welcome.jsp");
                    //转发
//                    req.getRequestDispatcher("page/welcome.jsp").forward(req, resp);
                }
            }else{
                //不需要判断账号和密码，回到登陆页面，然后再页面提示错误信息
                req.setAttribute("error", "验证码错误!");
                req.getRequestDispatcher("page/login.jsp").forward(req, resp);
            }
        }else if("/sendsmscode.do".equals(url)) {
            //发送手机验证码：网易云短信发送接口
            String phone = req.getParameter("phonenumber");
//            String smscode = SendCodeUtil.sendsms(phone);
            String str[] = {
                    "{\"obj\":\"123456\"}",
                    "{\"obj\":\"384762\"}",
                    "{\"obj\":\"983622\"}",
                    "{\"obj\":\"456747\"}",
                    "{\"obj\":\"129856\"}"
            };
            String smscode = str[new Random().nextInt(str.length)];
            System.out.println(smscode);
            JSONObject jo = (JSONObject)JSONObject.parse(smscode);
            session.setAttribute("smscode", jo.getString("obj"));//保存数据
            req.setAttribute("myphone", phone);
            req.getRequestDispatcher("page/smslogin.jsp").forward(req, resp);
        }else if("/smslogin.do".equals(url)) {
            String phonenumber = req.getParameter("phonenumber");
            String smscode = req.getParameter("smscode");
            //判断验证码
            String code = (String) session.getAttribute("smscode");
            if(smscode.equalsIgnoreCase(code)){
                //继续判断账号和密码
                User u = dao.findByPhonenumber(phonenumber);
                if(u == null){
                    req.setAttribute("error", "手机号错误!");
                    req.getRequestDispatcher("page/smslogin.jsp").forward(req, resp);
                }else{//登陆成功
                    req.setAttribute("u", u);
                    resp.sendRedirect(req.getContextPath()+"/page/welcome.jsp");
//                    req.getRequestDispatcher("page/welcome.jsp").forward(req, resp);
                }
            }else{
                //不需要判断账号和密码，回到登陆页面，然后再页面提示错误信息
                req.setAttribute("error", "验证码错误!");
                req.getRequestDispatcher("page/login.jsp").forward(req, resp);
            }
        }else if("/person.do".equals(url)) {
            User u = (User) session.getAttribute("u");
            User user = dao.findById(u.getId());
            req.setAttribute("user", user);
            req.getRequestDispatcher("page/person.jsp").forward(req, resp);
        }else if("/findAll.do".equals(url)){//查询所有的数据
            List<User> list = dao.findAll();
            req.setAttribute("list", list);
            req.getRequestDispatcher("page/findAll.jsp").forward(req, resp);
        }else if("/del.do".equals(url)){
            String id = req.getParameter("id");
            System.out.println(id);
            dao.remove(Integer.parseInt(id));
            //删除之后要干嘛？
            List<User> list = dao.findAll();
            req.setAttribute("list", list);
            req.getRequestDispatcher("page/findAll.jsp").forward(req, resp);
        }
    }
}
