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
import com.demo.model.*;
import com.demo.service.DataService;
import com.demo.service.LoginService;
import com.demo.service.UploadService;
import com.demo.service.impl.DataServiceImpl;
import com.demo.service.impl.LoginServiceImpl;
import com.demo.service.impl.UploadServiceImpl;
import com.demo.util.CodeUtil;
import com.demo.util.ColorUtil;
import com.demo.util.MD5Util;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.sun.org.apache.xpath.internal.operations.Bool;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;

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
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

public class WebServlet extends HttpServlet{
    static LoginService ls = new LoginServiceImpl();
    static UploadService ups = new UploadServiceImpl();
    static DataService dts = new DataServiceImpl();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取用户地址栏的地址
        String url = request.getServletPath();// *.do
        System.out.println("本次请求的url地址："+url);
        System.out.println(request.getPathInfo());
        HttpSession session = request.getSession();
        System.out.println("sessionId:"+session.getId());
        if(session.getAttribute("u") == null && url.equals("/login.do") == false&& url.equals("/smslogin.do") == false&&
                url.equals("/code.do") == false&& url.equals("/sendsmscode.do") == false&& url.equals("/register.do") == false) {
            System.out.println("重新登录!"+request.getContextPath()+"/page/view.jsp");
            response.sendRedirect(request.getContextPath()+"/page/view.jsp");
            return;
        }
        //account=sss&pwd=Admin&username=Admin&sex=女&phonenumber=11111
        String account = request.getParameter("account");
        String pwd = request.getParameter("pwd");
        String username = request.getParameter("username");
        String sex = request.getParameter("sex");
        String phonenumber = request.getParameter("phonenumber");
        //取出浏览器提交过来的数据，然后调用bdao将数据添加到数据库
        String bookid = request.getParameter("bookid");
        String bookname = request.getParameter("bookname");
        String bookauthor = request.getParameter("bookauthor");
        String bookinfo = request.getParameter("bookinfo");
        String orderid = request.getParameter("orderid");
        double price = 0;
        if(request.getParameter("price") != null)price = Double.parseDouble(request.getParameter("price"));
        int booknum = 0;
        if(request.getParameter("booknum")!=null)booknum = Integer.parseInt(request.getParameter("booknum"));
        String bowner = request.getParameter("bowner");
        String book = request.getParameter("book");
        if("/register.do".equals(url)){//注册
            if(haveUserAccount(account) >= 1) {
                request.setAttribute("error", "注册失败，账号重复！");
                request.getRequestDispatcher("page/register.jsp").forward(request, response);
            }else {
                ls.save(account, MD5Util.MD5Encode(pwd,"utf-8"), username, sex);
                request.setAttribute("error", "注册成功，请登录！");
                request.getRequestDispatcher("page/view.jsp").forward(request, response);
            }
        }else if("/code.do".equals(url)) {
            List a = ls.getCode();
            session.setAttribute("code", (String)a.get(0));
            System.out.println(a.get(0));
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
                    response.sendRedirect(request.getContextPath()+"/page/person.jsp");
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
//            request.getRequestDispatcher("page/smslogin.jsp").forward(request, response);
        }else if("/smslogin.do".equals(url)) {
            String smscode = request.getParameter("smscode");
            String code = (String) session.getAttribute("smscode");
            if(smscode.equalsIgnoreCase(code)){
                User u = ls.findByPhonenumber(phonenumber);
                if(u == null){
                    request.setAttribute("error", "手机号错误!");
                    request.getRequestDispatcher("page/smslogin.jsp").forward(request, response);
                }else{//登陆成功
                    session.setAttribute("u", u);
                    response.sendRedirect(request.getContextPath()+"/page/person.jsp");
                }
            }else{
                request.setAttribute("error", "验证码错误!");
                request.getRequestDispatcher("page/smslogin.jsp").forward(request, response);
            }
        }else if("/person.do".equals(url)) {
            User user = ls.findUserById(((User) session.getAttribute("u")).getUserid());
            request.setAttribute("user", user);
            session.setAttribute("u", user);
            request.getRequestDispatcher("page/person.jsp").forward(request, response);
        }else if("/findAll.do".equals(url)){//查询所有的数据
            List<User> list = ls.findAllUsers();
            request.setAttribute("list", list);
            request.getRequestDispatcher("page/findAll.jsp").forward(request, response);
        }else if("/del.do".equals(url)){
            ls.removeUserById(Integer.parseInt(request.getParameter("id")));
            response.sendRedirect(request.getContextPath()+"/findAll.do");
        }else if("/save.do".equals(url)){
            //取出浏览器提交过来的数据，然后调用dao将数据添加到数据库
            ls.save(account, MD5Util.MD5Encode(pwd,"utf-8"), username, sex, phonenumber);
            response.sendRedirect(request.getContextPath()+"/findAll.do");
        }else if("/upload.do".equals(url)){
            response.setContentType("text/html;charset=UTF-8");
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
                            ls.modifyAvatar("upload/"+name, u.getUserid());
                            session.setAttribute("u",ls.findUserById(u.getUserid()));
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
            dts.saveBook(bookname, bookauthor, bookinfo, price, booknum,bowner,book);
            dts.changeImg(book);
            response.sendRedirect(request.getContextPath()+"/findAllbook.do");
        }else if("/findAllbook.do".equals(url)) {
            List<Book> list = dts.findAllBooks();
            request.setAttribute("list", list);
            request.getRequestDispatcher("page/findAllbook.jsp").forward(request, response);
        }else if("/delbook.do".equals(url)) {
            dts.removeBookById(Integer.parseInt(bookid));
            response.sendRedirect(request.getContextPath()+"/findAllbook.do");
        }else if("/uploadbookimgs.do".equals(url)) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            List<FileItem> items = ups.uploadimg(request, response);
            //处理请求内容
            if(items!=null){
                for(FileItem item:items){
                    if(item.isFormField()){
                    }else{
                        String oldName = item.getName();
                        System.out.println("oldName:"+oldName);
                        //确定要上传到服务器的位置
                        String path = request.getServletContext().getRealPath("/upload");
                        String name = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date())+oldName.substring(oldName.lastIndexOf("."));
                        try {
                            item.write(new File(path,name));
                            //跟新用户头像为新的图片路径
                            dts.saveBI(book, "upload/"+name);
                            System.out.println(book+"; upload/"+name);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
            out.write("上传成功！");
        }else if("/deleteall.do".equals(url)) {
            System.out.println("deleteall:");
            int ip = Integer.parseInt(request.getParameter("ip"));
            int userid = 0;
            if(request.getParameter("userid") != null)userid=Integer.parseInt(request.getParameter("userid"));
            int adminid2 = 0;
            if(request.getParameter("adminid2") != null)adminid2=Integer.parseInt(request.getParameter("adminid2"));
            System.out.println("ip="+ip+",userid="+userid);
            int flag = 0;
            for(String tmp:request.getParameter("bookid").split(",")) {
                System.out.println(tmp);
                if(ip == 1) {
                    if(Integer.parseInt(tmp) == userid) flag = 1;
                    else ls.removeUserById(Integer.parseInt(tmp));
                } else if(ip == 2) dts.removeBookById(Integer.parseInt(tmp));
                else if(ip == 3) dts.removeOrderById(tmp);
                else if(ip == 4) {
                    if(Integer.parseInt(tmp) == adminid2) flag = 1;
                    else ls.removeAdminById(Integer.parseInt(tmp));
                }
            }
            String myurl = null;
            if(flag == 1) request.setAttribute("error","不能删除自己!");
            if (ip == 1) {
                myurl = "findAll.do";
            } else if(ip == 2){
                myurl = "findAllbook.do";
            }else if(ip == 3) {
                myurl = "orders.do";
            } else if(ip == 4) {
                myurl = "adminers.do";
            }
            request.getRequestDispatcher(myurl).forward(request,response);
//            response.sendRedirect(request.getContextPath()+myurl);
        }else if("/orders.do".equals(url)) {
            String orderid2 = request.getParameter("single");
            if(orderid2 == null || orderid2 == "") orderid2 = "0";
            List<Orders> list = dts.findAllOrders(Integer.parseInt(orderid2), orderid2);
            request.setAttribute("list", list);
            request.getRequestDispatcher("page/orders.jsp").forward(request, response);
        }else if("/delorder.do".equals(url)) {
            dts.removeOrderById(orderid);
            response.sendRedirect(request.getContextPath()+"/orders.do");
        }else if("/deladmin.do".equals(url)) {
            String adminid2 = request.getParameter("adminid2");
            ls.removeAdminById(Integer.parseInt(adminid2));
            response.sendRedirect(request.getContextPath()+"/adminers.do");
        }else if("/adminers.do".equals(url)) {
            List<Admin> list = ls.findAllAdmin();
            request.setAttribute("list", list);
            request.getRequestDispatcher("page/adminers.jsp").forward(request, response);
            return;
        }else if("/changepwd.do".equals(url)) {
            String pwd0 = request.getParameter("pwd0");
            String pwd1 = request.getParameter("pwd1");
            User user = (User) session.getAttribute("u");
            System.out.println(MD5Util.MD5Encode(pwd0,"utf-8"));
            System.out.println(user.getPwd());
            if(MD5Util.MD5Encode(pwd0,"utf-8").equals(user.getPwd()) ) {
//                session.setAttribute("changepwdAns","修改密码成功！");
                request.setAttribute("changepwdAns","修改密码成功！");
                System.out.println("what?");
                ls.modifyUserPwd(MD5Util.MD5Encode(pwd1,"utf-8"), user.getUserid());
            }else {
//                session.setAttribute("changepwdAns","原密码错误！修改失败！");
                request.setAttribute("changepwdAns","原密码错误！修改失败！");
            }
//            response.sendRedirect(request.getContextPath()+"/page/person.jsp");
            request.getRequestDispatcher("page/person.jsp").forward(request,response);
        }else if("/cgeUser.do".equals(url)) {
            account = request.getParameter("account");
            int userid = ls.findByAccount(account).getUserid();
            pwd = request.getParameter("newPwd");
            username = request.getParameter("newUserName");
            sex = request.getParameter("newSex");
            System.out.println(account+","+pwd+","+username+","+sex);
            if(pwd!=null && pwd!="")ls.modifyUserPwd(MD5Util.MD5Encode(pwd,"utf-8"),userid);
            if(username!=null &&username!="")ls.modifyUsername(username,userid);
            if(sex!=null) ls.modifyUserSex(sex,userid);
            request.getRequestDispatcher("findAll.do").forward(request,response);
            return;
        }else if("/cgeAdmin.do".equals(url)) {
            String adminacc = request.getParameter("adminacc");
            int adminid = ls.findAdminByAccount(adminacc).getAdminid();
            pwd = request.getParameter("newPwd");
            String newPermission = request.getParameter("newPermission");
            System.out.println(adminacc+","+adminid+","+pwd+","+newPermission);
            if(pwd!=null && pwd!="")ls.modifyAdminPwd(MD5Util.MD5Encode(pwd,"utf-8"),adminid);
            if(newPermission!=null) ls.modifyAdminPer(newPermission,adminid);
            request.getRequestDispatcher("adminers.do").forward(request,response);
            return;
        }else if("/cgeBook.do".equals(url)) {
            int _bookid = Integer.parseInt(bookid);
            bookname = request.getParameter("newBkNm");
            bookinfo = request.getParameter("newBkIf");
            String newPrice = request.getParameter("newPrice");
            System.out.println(_bookid+","+booknum+","+bookinfo+","+price);
            if(bookname!=null&&bookname!="") dts.modifyBookNameById(bookname,_bookid);
            if(bookinfo!=null&&bookinfo!="") dts.modifyBookInfoById(bookinfo,_bookid);
            if(newPrice!=null&&newPrice!="") dts.modifyBookPriById(Double.parseDouble(newPrice),_bookid);
            request.getRequestDispatcher("findAllbook.do").forward(request,response);
            return;
        }else if("/cgeOrder.do".equals(url)) {
            String name = request.getParameter("newName");
            System.out.println(name);
            if(name!=null&&name!="") dts.modifydzNameById(name,orderid);
            request.getRequestDispatcher("orders.do").forward(request,response);
            return;
        }else if("/fahuo.do".equals(url)) {
            dts.modifyOrderExpress(CodeUtil.rand(), orderid);
            request.getRequestDispatcher("orders.do").forward(request,response);
            return;
        }else if("/showMoreInfo.do".equals(url)) {
            List<OrderItem> ans = dts.findOIByOrderId(orderid);
            Collections.sort(ans, C);
            request.setAttribute("oitems", ans);
            request.getRequestDispatcher("page/showMoreInfo.jsp").forward(request,response);
            return;
        }else if("/setMobile.do".equals(url)) {
            String Mobile = request.getParameter("Mobile");
            String Msmscode = request.getParameter("Msmscode");
            int userid = Integer.parseInt(request.getParameter("userid"));
            if(haveUserMobile(Mobile) >= 1) {
                request.setAttribute("setMbAns", "手机号重复");
            }else if(Msmscode.equals(session.getAttribute("smscode"))) {
                request.setAttribute("setMbAns", "绑定成功");
                ls.modifyPhonenumber(Mobile, userid);
            }else {
                request.setAttribute("setMbAns", "验证码错误");
            }
            request.getRequestDispatcher("page/person.jsp").forward(request,response);
        }else if("/changeMobile.do".equals(url)){
            String Mobile2 = request.getParameter("Mobile2");
            String smscode1 = request.getParameter("smscode1");
            int userid = Integer.parseInt(request.getParameter("userid"));
            if(haveUserMobile(Mobile2) >= 2) {
                request.setAttribute("changeMbAns", "手机号重复");
            }else if(smscode1.equals(session.getAttribute("smscode"))) {
                request.setAttribute("changeMbAns", "修改手机号成功");
                ls.modifyPhonenumber(Mobile2, userid);
            }else {
                request.setAttribute("changeMbAns", "验证码错误");
            }
            request.getRequestDispatcher("page/person.jsp").forward(request,response);
        }else if("/saveAdmin.do".equals(url)) {
            ls.saveAdmin(account, MD5Util.MD5Encode(pwd,"utf-8"), phonenumber,sex);
            response.sendRedirect(request.getContextPath()+"/adminers.do");
        }

    }


    static Comparator<OrderItem> C = new Comparator() {
        public int compare(Object o1, Object o2) {
            OrderItem x1 = (OrderItem)o1;
            OrderItem x2 = (OrderItem)o2;
            return x1.getBookid()-x2.getBookid();
        }
    };
    public static int haveUserMobile(String m) {
        int cnt = 0;
        List<User> lu = ls.findAllUsers();
        for(User a: lu) {
            if(a.getPhonenumber().equals(m)) ++ cnt;
        }
        return cnt;
    }
    public static int haveUserAccount(String m) {
        int cnt = 0;
        List<User> lu = ls.findAllUsers();
        for(User a: lu) {
            if(a.getAccount().equals(m)) ++ cnt;
        }
        return cnt;
    }
}

/*
 Cookie ck = new Cookie("lastAcceptTime", "");
        ck.setPath("/");// 路径一定要正确，否则可能会删错对象
        ck.setMaxAge(0);
        response.addCookie(ck);
*/
