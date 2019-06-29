/**
 * Copyright (C), 2018-2019, csust
 * FileName: AServlet
 * Author:   Cwolf9
 * Date:     2019/06/29 19:33
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/29           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/29
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/29
 * @since 1.0.0
 */
package com.demo.servlet;

import com.demo.model.Book;
import com.demo.model.OrderItem;
import com.demo.model.User;
import com.demo.service.DataService;
import com.demo.service.LoginService;
import com.demo.service.UploadService;
import com.demo.service.impl.DataServiceImpl;
import com.demo.service.impl.LoginServiceImpl;
import com.demo.service.impl.UploadServiceImpl;
import com.demo.util.MD5Util;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class AServlet extends HttpServlet {
    static LoginService ls = new LoginServiceImpl();
    static UploadService ups = new UploadServiceImpl();
    static DataService dts = new DataServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        //获取用户地址栏的地址
        String url = req.getServletPath();// *.action
        System.out.println("本次请求的url地址："+url);
        HttpSession session = req.getSession();
        System.out.println("sessionId:"+session.getId());
        String account = req.getParameter("account");
        String pwd = req.getParameter("pwd");
        String username = req.getParameter("username");
        String sex = req.getParameter("sex");
        String phonenumber = req.getParameter("phonenumber");
        if("/login.action".equals(url)) {
            String usercode = req.getParameter("code");
            String code = (String) session.getAttribute("code");
            System.out.println(account+","+pwd+","+usercode+","+code);
            if(usercode.equalsIgnoreCase(code)){
                User u = ls.findByAccountAndPwd(account, MD5Util.MD5Encode(pwd,"utf-8") );
                if(u == null){
                    req.setAttribute("error", "账号或者密码错误!");
                    req.getRequestDispatcher("page/view.jsp").forward(req, resp);
                }else{//登陆成功
                    session.setAttribute("ptu", u);
                    Cookie cookie_acc = new Cookie("useraccount",account);
                    Cookie cookie_pwd = new Cookie("userpwd",pwd);
                    cookie_acc.setMaxAge(5*60);
                    cookie_pwd.setMaxAge(5*60);
//                    cookie_acc.setPath("/");
                    resp.addCookie(cookie_acc);
                    resp.addCookie(cookie_pwd);
                    resp.setContentType("text/html;charset=UTF-8");
                    //重定向
                    resp.sendRedirect(req.getContextPath()+"/page/index.jsp");
                    //转发
//                    request.getRequestDispatcher("page/welcome.jsp").forward(request, response);
                }
            }else{
                //不需要判断账号和密码，回到登陆页面，然后再页面提示错误信息
                req.setAttribute("error", "验证码错误!");
                req.getRequestDispatcher("page/view.jsp").forward(req, resp);
            }
        }else if("/userlogout.action".equals(url)){
            session.removeAttribute("ptu");
            req.setAttribute("error", "您已成功退出!");
            req.getRequestDispatcher("page/view.jsp").forward(req, resp);
        }else if("/searchBook.action".equals(url)) {
            String info = req.getParameter("searchbar");
            System.out.println(info);
            List<Book> allbooks = dts.findBooksByInfo("%"+info+"%");
            List<Book> sbook = new ArrayList<Book>();
            for(int i = 0; i < 3 && i < allbooks.size(); ++i) sbook.add(allbooks.get(i));
            req.setAttribute("nowpage", 1);
            req.setAttribute("booklist", sbook);
            req.setAttribute("searchbar", info);
            req.setAttribute("queryBooksSum", allbooks.size());
            req.getRequestDispatcher("page/menu.jsp").forward(req, resp);
        }else if("/changepaper.action".equals(url)) {
            int nowpage = Integer.parseInt(req.getParameter("nowpage"));
            String info = req.getParameter("searchbar");
            System.out.println(info+","+nowpage);
            List<Book> allbooks = dts.findBooksByInfo("%"+info+"%");
            List<Book> sbook = new ArrayList<Book>();
            for(int i = (nowpage-1)*3; i < nowpage*3 && i < allbooks.size(); ++i) {
                sbook.add(allbooks.get(i));
            }
            req.setAttribute("nowpage", nowpage);
            req.setAttribute("booklist", sbook);
            req.setAttribute("searchbar", info);
            req.setAttribute("queryBooksSum", allbooks.size());
            req.getRequestDispatcher("page/menu.jsp").forward(req, resp);
        }else if("/submitBlog.action".equals(url)) {
            String blogContent = req.getParameter("blogContent");
            req.setAttribute("blogContent", blogContent);
            req.getRequestDispatcher("page/showBlog.jsp").forward(req, resp);
        }

    }
    static Comparator<Book> C = new Comparator() {
        public int compare(Object o1, Object o2) {
            Book x1 = (Book)o1;
            Book x2 = (Book)o2;
            return x1.getBookid()-x2.getBookid();
        }
    };
}
