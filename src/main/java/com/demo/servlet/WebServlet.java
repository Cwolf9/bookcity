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
import com.demo.dao.BookDao;
import com.demo.dao.BookimgsDao;
import com.demo.dao.UserDao;
import com.demo.model.Book;
import com.demo.model.User;
import com.demo.util.CodeUtil;
import com.demo.util.ColorUtil;
import com.demo.util.MD5Util;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.*;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

public class WebServlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //super.service(req, resp);
        request.setCharacterEncoding("utf-8");
        UserDao dao = new UserDao();
        BookDao bdao = new BookDao();
        BookimgsDao bidao = new BookimgsDao();
        //获取用户地址栏的地址
        String url = request.getServletPath();// *.do
        System.out.println("本次请求的url地址："+url);
        System.out.println(request.getPathInfo());
        //Servlet保存数据方法：HttpSession
        HttpSession session = request.getSession();
        System.out.println("sessionId:"+session.getId());
        if(session.getAttribute("u") == null && url.equals("/login.do") == false&& url.equals("/smslogin.do") == false&& url.equals("/code.do") == false&& url.equals("/smscode.do") == false) {
            System.out.println("重新登录!+request.getContextPath()+\"/page/view.jsp\"");
            response.sendRedirect(request.getContextPath()+"/page/view.jsp");
            return;
        }
        if("/register.do".equals(url)){//注册
            //account=sss&pwd=admin&username=admin&sex=女&phonenumber=11111
            String account = request.getParameter("account");
            String pwd = request.getParameter("pwd");
            String username = request.getParameter("username");
            String sex = request.getParameter("sex");
            String phonenumber = request.getParameter("phonenumber");
            dao.save(account, pwd, username, sex, phonenumber);
            //页面跳转
            request.getRequestDispatcher("page/view.jsp").forward(request, response);
        }else if("/code.do".equals(url)) {
            //画一张图片验证码传给服务器
            int WIDTH = 100, HEIGHT = 30;
            BufferedImage img = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
            Graphics g = img.getGraphics();
            String code = "";g.setColor(Color.BLACK);g.fillRect(0,0,100,30);g.setColor(ColorUtil.getRandomColor());g.setFont(new Font("", Font.BOLD, 30));
            String s = CodeUtil.str();code += s;g.setColor(ColorUtil.getRandomColor());g.drawString(s, 10, 20);s = CodeUtil.str();code += s;g.setColor(ColorUtil.getRandomColor());g.drawString(s, 30, 20);s = CodeUtil.str();code += s;g.setColor(ColorUtil.getRandomColor());g.drawString(s, 60, 20);s = CodeUtil.str();code += s;g.setColor(ColorUtil.getRandomColor());g.drawString(s, 80, 20);
            session.setAttribute("code", code);//保存数据
            Random ran = new Random();
            // 随机画线
            for (int i = 0; i < 10; i++) {
                g.setColor(ColorUtil.getRandomColor());
                g.drawLine(ran.nextInt(WIDTH), ran.nextInt(HEIGHT), ran.nextInt(WIDTH), ran.nextInt(HEIGHT));
            }
            //输出流，用来给浏览器传输图片
            OutputStream out = response.getOutputStream();
            //对图片进行jpeg压缩
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            encoder.encode(img);
        }else if("/login.do".equals(url)){
            String account = request.getParameter("account");
            String pwd = request.getParameter("pwd");
            String usercode = request.getParameter("code");
            //判断验证码
            String code = (String) session.getAttribute("code");
            if(usercode.equalsIgnoreCase(code)){
                //继续判断账号和密码
                User u = dao.findByAccountAndPwd(account, MD5Util.MD5Encode(pwd,"utf-8") );
                System.out.println("账户密码："+account+" "+pwd);
                if(u == null){
                    request.setAttribute("error", "账号或者密码错误!");
                    request.getRequestDispatcher("page/view.jsp").forward(request, response);
                }else{//登陆成功
                    session.setAttribute("u", u);
                    Cookie cookie_acc = new Cookie("account",account);
                    Cookie cookie_pwd = new Cookie("pwd",pwd);
                    cookie_acc.setMaxAge(5*60);
                    cookie_pwd.setMaxAge(5*60);
//                    cookie_acc.setPath("/");

                    response.addCookie(cookie_acc);
                    response.addCookie(cookie_pwd);
                    response.setContentType("text/html;charset=UTF-8");
                    System.out.println("cookie_acc:"+request.getParameter("account"));
                    //转发
                    request.getRequestDispatcher("page/welcome.jsp").forward(request, response);
                    //重定向
                    //resp.sendRedirect(req.getContextPath()+"/page/welcome.jsp");
                }
            }else{
                //不需要判断账号和密码，回到登陆页面，然后再页面提示错误信息
                request.setAttribute("error", "验证码错误!");
                request.getRequestDispatcher("page/view.jsp").forward(request, response);
            }
        }else if("/sendsmscode.do".equals(url)) {
            //发送手机验证码：网易云短信发送接口
            String phone = request.getParameter("phonenumber");
//            String smscode = SendCodeUtil.sendsms(phone);
            String str[] = {
                    "{\"obj\":\"123456\"}",
                    "{\"obj\":\"384762\"}",
                    "{\"obj\":\"983622\"}",
                    "{\"obj\":\"456747\"}",
                    "{\"obj\":\"129856\"}"
            };
            String smscode = str[new Random().nextInt(str.length)];
            System.out.println("smscode:"+smscode);
            JSONObject jo = (JSONObject)JSONObject.parse(smscode);
            session.setAttribute("smscode", jo.getString("obj"));//保存数据
            request.setAttribute("myphone", phone);
            request.getRequestDispatcher("page/smslogin.jsp").forward(request, response);
        }else if("/smslogin.do".equals(url)) {
            String phonenumber = request.getParameter("phonenumber");
            String smscode = request.getParameter("smscode");
            //判断验证码
            String code = (String) session.getAttribute("smscode");
            if(smscode.equalsIgnoreCase(code)){
                //继续判断账号和密码
                User u = dao.findByPhonenumber(phonenumber);
                if(u == null){
                    request.setAttribute("error", "手机号错误!");
                    request.getRequestDispatcher("page/smslogin.jsp").forward(request, response);
                }else{//登陆成功
                    request.setAttribute("u", u);
                    session.setAttribute("u", u);
//                    resp.sendRedirect(req.getContextPath()+"/page/welcome.jsp");
                    request.getRequestDispatcher("page/welcome.jsp").forward(request, response);
                }
            }else{
                //不需要判断账号和密码，回到登陆页面，然后再页面提示错误信息
                request.setAttribute("error", "验证码错误!");
                request.getRequestDispatcher("page/smslogin.jsp").forward(request, response);
            }
        }else if("/person.do".equals(url)) {
            User u = (User) session.getAttribute("u");
            User user = dao.findById(u.getId());
            request.setAttribute("user", user);
            request.getRequestDispatcher("page/person.jsp").forward(request, response);
        }else if("/findAll.do".equals(url)){//查询所有的数据
            List<User> list = dao.findAll();
            request.setAttribute("list", list);
            request.getRequestDispatcher("page/findAll.jsp").forward(request, response);
        }else if("/del.do".equals(url)){
            String id = request.getParameter("id");
            dao.removeById(Integer.parseInt(id));
            //删除之后要干嘛？
            List<User> list = dao.findAll();
            request.setAttribute("list", list);
            request.getRequestDispatcher("page/findAll.jsp").forward(request, response);
        }else if("/save.do".equals(url)){
            //取出浏览器提交过来的数据，然后调用dao将数据添加到数据库
            String account = request.getParameter("account");
            String pwd = request.getParameter("pwd");
            String username = request.getParameter("username");
            String sex = request.getParameter("sex");
            String phonenumber = request.getParameter("phonenumber");
            dao.save(account, pwd, username, sex, phonenumber);
            List<User> list = dao.findAll();
            request.setAttribute("list", list);
//            request.getRequestDispatcher("page/findAll.jsp").forward(request, response);
            response.sendRedirect(request.getContextPath()+"/findAll.do");
        }else if("/upload.do".equals(url)){
            //文件上传：
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            DiskFileItemFactory dfif = new DiskFileItemFactory();
            ServletFileUpload parser = new ServletFileUpload(dfif);
            List<FileItem> items = null;
            try {
                items = parser.parseRequest(request);
            }catch(Exception e) {
                e.printStackTrace();
            }
            //处理请求内容
            if(items!=null){
                for(FileItem item:items){
                    if(item.isFormField()){
                    }else{
                        String oldName = item.getName();
                        System.out.println("oldName:"+oldName);
                        //确定要上传到服务器的位置
                        String path = request.getServletContext().getRealPath("/upload");
                        //文件名
                        User u = (User) session.getAttribute("u");
                        String name = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date())+u.getAccount()+oldName.substring(oldName.lastIndexOf("."));
                        try {
                            item.write(new File(path,name));
                            //跟新用户头像为新的图片路径
                            dao.modifyAvatar("upload/"+name,u.getId());
                            session.setAttribute("u",dao.findById(u.getId()));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
            out.write("上传成功！");
        }else if("/adminlogout.do".equals(url)) {
            session.removeAttribute("u");
            request.setAttribute("error", "您已成功退出!");
            request.getRequestDispatcher("page/view.jsp").forward(request, response);
        }else if("/savebook.do".equals(url)) {
            //取出浏览器提交过来的数据，然后调用bdao将数据添加到数据库
            String bookname = request.getParameter("bookname");
            String bookauthor = request.getParameter("bookauthor");
            String bookinfo = request.getParameter("bookinfo");
            double price = Double.parseDouble(request.getParameter("price"));
            int booknum = Integer.parseInt(request.getParameter("booknum"));
            String bowner = request.getParameter("bowner");
            String book = request.getParameter("book");
            bdao.save(bookname, bookauthor, bookinfo, price, booknum,bowner,book);
            bdao.modifydfimg(bidao.findBybook(book).getImg(),book);
            List<Book> list = bdao.findAll();
            request.setAttribute("list", list);
            response.sendRedirect(request.getContextPath()+"/findAllbook.do");
        }else if("/findAllbook.do".equals(url)) {
            List<Book> list = bdao.findAll();
            request.setAttribute("list", list);
            request.getRequestDispatcher("page/findAllbook.jsp").forward(request, response);
        }else if("/delbook.do".equals(url)) {
            String bookid = request.getParameter("bookid");
            bdao.removeById(Integer.parseInt(bookid));
            List<Book> list = bdao.findAll();
            request.setAttribute("list", list);
            request.getRequestDispatcher("page/findAllbook.jsp").forward(request, response);
        }else if("/uploadbookimgs.do".equals(url)) {
            //文件上传：
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            DiskFileItemFactory dfif = new DiskFileItemFactory();
            ServletFileUpload parser = new ServletFileUpload(dfif);
            List<FileItem> items = null;
            try {
                items = parser.parseRequest(request);
            }catch(Exception e) {
                e.printStackTrace();
            }
            //处理请求内容
            if(items!=null){
                for(FileItem item:items){
                    if(item.isFormField()){
                    }else{
                        String oldName = item.getName();
                        System.out.println("oldName:"+oldName);
                        //确定要上传到服务器的位置
                        String path = request.getServletContext().getRealPath("/upload");
                        //文件名
                        String book = request.getParameter("book");
                        String name = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date())+oldName.substring(oldName.lastIndexOf("."));
                        try {
                            item.write(new File(path,name));
                            //跟新用户头像为新的图片路径
                            bidao.save(book,"upload/"+name);
                            System.out.println(book+"; upload/"+name);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
            out.write("上传成功！");
        }else if("/deletaall.do".equals(url)) {
            System.out.println("deleteall:");
            System.out.println(request.getAttribute("bookid"));
            System.out.println(request.getParameter("bookid"));
        }

    }
}
/*
 Cookie ck = new Cookie("lastAcceptTime", "");
        ck.setPath("/");// 路径一定要正确，否则可能会删错对象
        ck.setMaxAge(0);
        response.addCookie(ck);
*/
