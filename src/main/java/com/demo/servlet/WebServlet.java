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
import com.demo.service.LoginService;
import com.demo.service.UploadService;
import com.demo.service.impl.LoginServiceImpl;
import com.demo.service.impl.UploadServiceImpl;
import com.demo.util.CodeUtil;
import com.demo.util.ColorUtil;
import com.demo.util.MD5Util;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.sun.org.apache.xpath.internal.operations.Bool;
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
        if(session.getAttribute("u") == null && url.equals("/login.do") == false&& url.equals("/smslogin.do") == false&&
                url.equals("/code.do") == false&& url.equals("/sendsmscode.do") == false&& url.equals("/register.do") == false) {
            System.out.println("重新登录!"+request.getContextPath()+"/page/view.jsp");
            response.sendRedirect(request.getContextPath()+"/page/view.jsp");
            return;
        }
        //account=sss&pwd=admin&username=admin&sex=女&phonenumber=11111
        String account = request.getParameter("account");
        String pwd = request.getParameter("pwd");
        String username = request.getParameter("username");
        String sex = request.getParameter("sex");
        String phonenumber = request.getParameter("phonenumber");
        LoginService ls = new LoginServiceImpl();
        UploadService ups = new UploadServiceImpl();
        if("/register.do".equals(url)){//注册
            ls.save(account, pwd, username, sex, phonenumber);
            request.setAttribute("error", "注册成功，请登录！");
            request.getRequestDispatcher("page/view.jsp").forward(request, response);
        }else if("/code.do".equals(url)) {
            List a = ls.getCode();
            session.setAttribute("code", (String)a.get(0));
            BufferedImage img = (BufferedImage) a.get(1);
            //输出流，用来给浏览器传输图片
            OutputStream out = response.getOutputStream();
            //对图片进行jpeg压缩
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            encoder.encode(img);
        }else if("/login.do".equals(url)){
            String usercode = request.getParameter("code");
            String code = (String) session.getAttribute("code");
            if(usercode.equalsIgnoreCase(code)){
                User u = ls.findByAccountAndPwd(account, MD5Util.MD5Encode(pwd,"utf-8") );
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
                    //重定向
                    response.sendRedirect(request.getContextPath()+"/page/welcome.jsp");
                    //转发
//                    request.getRequestDispatcher("page/welcome.jsp").forward(request, response);
                }
            }else{
                //不需要判断账号和密码，回到登陆页面，然后再页面提示错误信息
                request.setAttribute("error", "验证码错误!");
                request.getRequestDispatcher("page/view.jsp").forward(request, response);
            }
        }else if("/sendsmscode.do".equals(url)) {
            String smscode = ls.getSmscode(phonenumber);
            System.out.println("smscode:"+smscode);
            JSONObject jo = (JSONObject)JSONObject.parse(smscode);
            session.setAttribute("smscode", jo.getString("obj"));
            request.setAttribute("myphone", phonenumber);
            request.getRequestDispatcher("page/smslogin.jsp").forward(request, response);
        }else if("/smslogin.do".equals(url)) {
            String smscode = request.getParameter("smscode");
            String code = (String) session.getAttribute("smscode");
            if(smscode.equalsIgnoreCase(code)){
                User u = ls.findByPhonenumber(phonenumber);
                if(u == null){
                    request.setAttribute("error", "手机号错误!");
                    request.getRequestDispatcher("page/smslogin.jsp").forward(request, response);
                }else{//登陆成功
                    request.setAttribute("u", u);
                    session.setAttribute("u", u);
                    response.sendRedirect(request.getContextPath()+"/page/welcome.jsp");
                }
            }else{
                request.setAttribute("error", "验证码错误!");
                request.getRequestDispatcher("page/smslogin.jsp").forward(request, response);
            }
        }else if("/person.do".equals(url)) {
            User user = ls.findById(((User) session.getAttribute("u")).getUserid());
            request.setAttribute("user", user);
            request.getRequestDispatcher("page/person.jsp").forward(request, response);
        }else if("/findAll.do".equals(url)){//查询所有的数据
            List<User> list = ls.findAllUsers();
            request.setAttribute("list", list);
            request.getRequestDispatcher("page/findAll.jsp").forward(request, response);
        }else if("/del.do".equals(url)){
            ls.removeById(Integer.parseInt(request.getParameter("id")));
            List<User> list = ls.findAllUsers();
            request.setAttribute("list", list);
            request.getRequestDispatcher("page/findAll.jsp").forward(request, response);
        }else if("/save.do".equals(url)){
            //取出浏览器提交过来的数据，然后调用dao将数据添加到数据库
            ls.save(account, pwd, username, sex, phonenumber);
            List<User> list = ls.findAllUsers();
            request.setAttribute("list", list);
//            request.getRequestDispatcher("page/findAll.jsp").forward(request, response);
            response.sendRedirect(request.getContextPath()+"/findAll.do");
        }else if("/upload.do".equals(url)){
            PrintWriter out = response.getWriter();
            List<FileItem> items = ups.uploadimg(request, response);
            if(items!=null){//处理请求内容
                for(FileItem item:items){
                    if(item.isFormField()){
                    }else{
                        String oldName = item.getName();
                        System.out.println("oldName:"+oldName);
                        //确定要上传到服务器的位置
                        String path = request.getServletContext().getRealPath("/upload");
                        User u = (User) session.getAttribute("u");
                        String name = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date())+u.getAccount()+oldName.substring(oldName.lastIndexOf("."));
                        try {
                            item.write(new File(path,name));
                            //跟新用户头像为新的图片路径
                            dao.modifyAvatar("upload/"+name,u.getUserid());
                            session.setAttribute("u",dao.findById(u.getUserid()));
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
            try {
                bdao.modifydfimg(bidao.findBybook(book).getImg(), book);
            }catch (NullPointerException e) {
                e.printStackTrace();
            }
            List<Book> list = bdao.findAll();
            request.setAttribute("list", list);
            request.getRequestDispatcher("page/findAllbook.jsp").forward(request, response);
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
            int ip = Integer.parseInt(request.getParameter("ip"));
            int userid = Integer.parseInt(request.getParameter("userid"));
            System.out.println("ip="+ip+",userid="+userid);
            int flag = 0;
            for(String tmp:request.getParameter("bookid").split(",")) {
                if(ip == 1) {
                    if(Integer.parseInt(tmp) == userid) flag = 1;
                    else dao.removeById(Integer.parseInt(tmp));
                } else if(ip == 2) bdao.removeById(Integer.parseInt(tmp));
                System.out.println(Integer.parseInt(tmp));
            }
            String myurl = null;
            if(flag == 1) {
                request.setAttribute("error","\"不能删除自己\"");
                List<User> list = dao.findAll();
                request.setAttribute("list", list);
                myurl = "page/findAll.jsp";
            }else if (ip == 1) {
                List<User> list = dao.findAll();
                request.setAttribute("list", list);
                myurl = "page/findAll.jsp";
            } else {
                List<Book> list = bdao.findAll();
                request.setAttribute("list", list);
                myurl = "page/findAllbook.jsp";
            }
            System.out.println(myurl);
            List<User> list = dao.findAll();
            request.setAttribute("list", list);
            request.getRequestDispatcher(myurl).forward(request, response);
        }

    }

}
/*
 Cookie ck = new Cookie("lastAcceptTime", "");
        ck.setPath("/");// 路径一定要正确，否则可能会删错对象
        ck.setMaxAge(0);
        response.addCookie(ck);
*/
