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

import com.demo.model.*;
import com.demo.service.DataService;
import com.demo.service.LoginService;
import com.demo.service.UploadService;
import com.demo.service.impl.DataServiceImpl;
import com.demo.service.impl.LoginServiceImpl;
import com.demo.service.impl.UploadServiceImpl;
import com.demo.util.MD5Util;
import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

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
                    resp.sendRedirect(req.getContextPath()+"/index.action");
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
            resp.sendRedirect(req.getContextPath()+"/index.action");
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
        }else if("/index.action".equals(url)) {
            List<Book> allbooks = dts.findAllBooks();
            Collections.sort(allbooks, sallnum);
            List<Book> sbook = new ArrayList<Book>();
            List<Book> hotbook = new ArrayList<Book>();
            List<Book> latestbook = new ArrayList<Book>();
            List<Book> markbook = new ArrayList<Book>();
            List<Book> wenxue = new ArrayList<Book>();
            List<Book> keji = new ArrayList<Book>();
            List<Book> lishi = new ArrayList<Book>();
            for(int i = 0; i < 9; ++i) sbook.add(allbooks.get(i));
            for(int i = 0; i < 8; ++i) hotbook.add(allbooks.get(i));
            Book maxhotbook = allbooks.get(0);
            Collections.sort(allbooks, timenum);
            for(int i = 0; i < 8; ++i) latestbook.add(allbooks.get(i));
            Collections.sort(allbooks, marknum);
            for(int i = 0; i < 8; ++i) markbook.add(allbooks.get(i));
            allbooks = dts.findBooksByTags("%文学%");
            Collections.sort(allbooks, marknum);
            for(int i = 0; i < 9; ++i) wenxue.add(allbooks.get(i));
            allbooks = dts.findBooksByTags("%科技%");
            Collections.sort(allbooks, marknum);
            for(int i = 0; i < 9; ++i) keji.add(allbooks.get(i));
            allbooks = dts.findBooksByTags("%历史%");
            Collections.sort(allbooks, marknum);
            for(int i = 0; i < 9; ++i) lishi.add(allbooks.get(i));
            req.setAttribute("maxhotbook", maxhotbook);
            req.setAttribute("lammuyd", sbook);
            req.setAttribute("hotbook", hotbook);
            req.setAttribute("latestbook", latestbook);
            req.setAttribute("markbook", markbook);
            req.setAttribute("wenxue", wenxue);
            req.setAttribute("keji", keji);
            req.setAttribute("lishi", lishi);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }else if("/list.action".equals(url)) {
            int nowpage = Integer.parseInt(req.getParameter("nowpage"));
            String sort = req.getParameter("sort");
            if(sort == null || sort.equals("")) sort = "1";
            System.out.println("sort:"+sort);
            String mtype = req.getParameter("mtype");
            List<Book> allbooks = dts.findAllBooks();
            List<Book> sbook = new ArrayList<Book>();
            for(int i = 0; i < 9; ++i) sbook.add(allbooks.get(i));
            req.setAttribute("lammuyd", sbook);
            req.setAttribute("mtype", mtype);
            req.setAttribute("nowpage", nowpage);
            req.setAttribute("sort", sort);
            List<Book> tags = new ArrayList<Book>();
            if(mtype.equals("畅销")) {
                allbooks = dts.findAllBooks();
                Collections.sort(allbooks, sallnum);
            }else if(mtype.equals("好评")) {
                allbooks = dts.findAllBooks();
                Collections.sort(allbooks, marknum);
            }else {
                allbooks = dts.findBooksByTags("%" + mtype + "%");
                if(sort.equals("1")) Collections.sort(allbooks, marknum);
                else if(sort.equals("2")) Collections.sort(allbooks, sallnum);
                else if(sort.equals("3")) Collections.sort(allbooks, priceSma);
                else Collections.sort(allbooks, priceBig);
            }
            for (int i = (nowpage - 1) * 8; i < nowpage * 8 && i < allbooks.size(); ++i) tags.add(allbooks.get(i));
            req.setAttribute("tags", tags);
            if (allbooks.size() % 8 > 0) req.setAttribute("allpage", allbooks.size() / 8 + 1);
            else req.setAttribute("allpage", allbooks.size() / 8);
            req.getRequestDispatcher("list.jsp").forward(req, resp);
        }else if("/SearchBook.action".equals(url)) {
            String info = req.getParameter("mtype");
            System.out.println(info);
            List<Book> allbooks = dts.findAllBooks();
            List<Book> cai = new ArrayList<Book>();
            for(int i = 0; i < 9; ++i) cai.add(allbooks.get(i));
            req.setAttribute("lammuyd", cai);
            List<Book> sbook = new ArrayList<Book>();
            allbooks = dts.findBooksByInfo("%"+info+"%");
            for(int i = 0; i < 8 && i < allbooks.size(); ++i) sbook.add(allbooks.get(i));
            req.setAttribute("nowpage", 1);
            req.setAttribute("tags", sbook);
            req.setAttribute("mtype", info);
            if(allbooks.size()%8 > 0) req.setAttribute("allpage", allbooks.size()/8+1);
            else req.setAttribute("allpage", allbooks.size()/8);
            req.getRequestDispatcher("list.jsp").forward(req, resp);
        }else if("/user.action".equals(url)) {
            int uid = ((User) session.getAttribute("ptu")).getUserid();
            Address mrdz = dts.findAddressById(uid);
            req.setAttribute("mrdz", mrdz.getName());
            List<ShoppingCar> usc = dts.findSC(uid);
            req.setAttribute("usc", usc);
            List<Orders> list = dts.findAllOrders(1, String.valueOf(uid));
            req.setAttribute("list", list);
            req.getRequestDispatcher("user.jsp").forward(req, resp);
        }else if("/ulogin.action".equals(url)) {
            String usercode = req.getParameter("code");
            String code = (String) session.getAttribute("code");
            System.out.println(account+","+pwd+","+usercode+","+code);
            if(usercode.equalsIgnoreCase(code)){
                User u = ls.findByAccountAndPwd(account, MD5Util.MD5Encode(pwd,"utf-8") );
                if(u == null){
                    req.setAttribute("error", "账号或者密码错误!");
                    req.getRequestDispatcher("index.action").forward(req, resp);
                }else{//登陆成功
                    session.setAttribute("ptu", u);
                    session.setAttribute("ptuname", u.getAccount());
                    Cookie cookie_acc = new Cookie("useraccount",account);
                    Cookie cookie_pwd = new Cookie("userpwd",pwd);
                    cookie_acc.setMaxAge(5*60);
                    cookie_pwd.setMaxAge(5*60);
//                    cookie_acc.setPath("/");
                    resp.addCookie(cookie_acc);
                    resp.addCookie(cookie_pwd);
                    resp.setContentType("text/html;charset=UTF-8");
                    //重定向
                    resp.sendRedirect(req.getContextPath()+"/index.action");
                    //转发
//                    request.getRequestDispatcher("page/welcome.jsp").forward(request, response);
                }
            }else{
                //不需要判断账号和密码，回到登陆页面，然后再页面提示错误信息
                req.setAttribute("error", "验证码错误!");
                req.getRequestDispatcher("index.action").forward(req, resp);
            }
        }else if("/delsc.action".equals(url)) {
            int bookid = Integer.parseInt(req.getParameter("bookid"));
            int uid = Integer.parseInt(req.getParameter("uid"));
            dts.removeScByUB(uid, bookid);
            resp.sendRedirect(req.getContextPath()+"/user.action");
        }else if("/subsc.action".equals(url)) {//TODO: 改变库存
            int uid = Integer.parseInt(req.getParameter("uid"));
            Address mrdz = dts.findAddressById(uid);
            int allnum = Integer.parseInt(req.getParameter("allnum"));
            double allpri = Double.parseDouble(req.getParameter("allpri"));
            String orderid = dts.saveOrder(uid,new Random().nextInt(100),allpri,mrdz.getName(),allnum);
            List<ShoppingCar> usc = dts.findSC(uid);
            for(String tmp:req.getParameter("scbookid").split(",")) {
                System.out.println(Integer.parseInt(tmp));
                int bid = Integer.parseInt(tmp);
                for(ShoppingCar x: usc) {
                    if(x.getBookid() == bid) {
                        dts.saveOrderItem(orderid,bid,x.getBooknum(),x.getPrice(),x.getAllprice());
                    }
                }
                dts.removeScByUB(uid, bid);
            }
            System.out.println(allnum +" "+allpri);
            resp.sendRedirect(req.getContextPath()+"/user.action");
        }else if("/changepwd.action".equals(url)) {
            String pwd0 = req.getParameter("pwd0");
            String pwd1 = req.getParameter("pwd1");
            User user = (User) session.getAttribute("ptu");
            System.out.println("pwd0 "+MD5Util.MD5Encode(pwd0,"utf-8"));
            System.out.println("pwd "+user.getPwd());
            if(MD5Util.MD5Encode(pwd0,"utf-8").equals(user.getPwd()) ) {
                req.setAttribute("changepwdAns","修改密码成功！");
                System.out.println("what?");
                ls.modifyUserPwd(MD5Util.MD5Encode(pwd1,"utf-8"), user.getUserid());
            }else {
                req.setAttribute("changepwdAns","原密码错误！修改失败！");
            }
            int uid = ((User) session.getAttribute("ptu")).getUserid();
            Address mrdz = dts.findAddressById(uid);
            req.setAttribute("mrdz", mrdz.getName());
            List<ShoppingCar> usc = dts.findSC(uid);
            req.setAttribute("usc", usc);
            List<Orders> list = dts.findAllOrders(1, String.valueOf(uid));
            req.setAttribute("list", list);
            req.getRequestDispatcher("user.jsp").forward(req,resp);
            return;
        }else if("/showMoreInfo.action".equals(url)) {
            String orderid = req.getParameter("orderid");
            List<OrderItem> ans = dts.findOIByOrderId(orderid);
            req.setAttribute("oitems", ans);
            req.getRequestDispatcher("page/showMoreInfo.jsp").forward(req,resp);
            return;
        }else if("/adddizhi.action".equals(url)) {
            int uid = 0;
            if(req.getParameter("uid")!= null) uid = Integer.parseInt(req.getParameter("uid"));
            String dizhi = req.getParameter("dizhi");
            String isdefault = req.getParameter("isdefault");
            ls.saveAddress(uid,dizhi,isdefault);
            req.getRequestDispatcher("user.action").forward(req,resp);
        }else if("/changeBSNum.action".equals(url)) {
            User u = (User) session.getAttribute("ptu");
            int bookid = Integer.parseInt(req.getParameter("bookid"));
            int booknum = Integer.parseInt(req.getParameter("booknum"));
            double price = Double.parseDouble(req.getParameter("price"));
            if(u != null)dts.modifyBSByUB(u.getUserid(),bookid,booknum,price*bookid);
            req.getRequestDispatcher("user.action").forward(req,resp);
        }else if("/addtocart.action".equals(url)) {
            int bid = Integer.parseInt(req.getParameter("bookid"));
            User u = (User) session.getAttribute("ptu");
            int flag = 0;
            double price = 0;
            if(req.getParameter("price") != null) price = Double.parseDouble(req.getParameter("price"));
            else flag = 1;
            if(u != null) dts.addtocart(u.getUserid(),bid,1,price);
            else flag = 1;
            if(flag == 1) req.getRequestDispatcher("index.action").forward(req,resp);
            else req.getRequestDispatcher("user.action").forward(req,resp);
        }else if("/bookinfo.action".equals(url)) {
            List<Book> allbooks = dts.findAllBooks();
            List<Book> cai = new ArrayList<Book>();
            for(int i = 0; i < 9; ++i) cai.add(allbooks.get(i));
            req.setAttribute("lammuyd", cai);
            int bid = Integer.parseInt(req.getParameter("bookid"));
            System.out.println("bookid:" + bid);
            Book book = dts.findBooksById(bid);
            req.setAttribute("Book", book);
            List<Book> relebook = new ArrayList<Book>();
            String tags = book.getTags();
            int tim = 0;
            for(String tmp:tags.split("，")) {
                List<Book> a = dts.findBooksByTags(tmp);
                System.out.println(tmp);
                for(Book b: a) {
                    relebook.add(b);
                    tim ++;
                    if(tim == 4) break;
                }
                if(tim == 4) break;
            }
            System.out.println("tim = "+tim);
            req.setAttribute("relebook", relebook);
            List<String> bookimgs = dts.findBookImgsByBook(book.getBook());
            req.setAttribute("bookimgs", bookimgs);
            req.getRequestDispatcher("bookinfo.jsp").forward(req,resp);
        }else if("/cart.action".equals(url)) {
            req.getRequestDispatcher("index.action").forward(req,resp);
        }else if("/savebook.action".equals(url)) {
            String bookid = req.getParameter("bookid");
            String bookname = req.getParameter("bookname");
            String bookauthor = req.getParameter("bookauthor");
            String bookinfo = req.getParameter("bookinfo");
            double price = 0;
            if(req.getParameter("price") != null)price = Double.parseDouble(req.getParameter("price"));
            int booknum = 0;
            if(req.getParameter("booknum")!=null)booknum = Integer.parseInt(req.getParameter("booknum"));
            String bowner = req.getParameter("bowner");
            String book = req.getParameter("book");
            dts.saveBook(bookname, bookauthor, bookinfo, price, booknum,bowner,book);
            dts.changeImg(book);
            resp.sendRedirect(req.getContextPath()+"/user.action");
        }

    }
    static Comparator<Book> sallnum = new Comparator() {
        public int compare(Object o1, Object o2) {//畅销
            Book x1 = (Book)o1;
            Book x2 = (Book)o2;
            return x2.getSallnum()-x1.getSallnum();
        }
    };
    static Comparator<Book> timenum = new Comparator() {
        public int compare(Object o1, Object o2) {//日期
            Book x1 = (Book)o1;
            Book x2 = (Book)o2;
            return x2.getPubdate().compareTo(x1.getPubdate());
        }
    };
    static Comparator<Book> marknum = new Comparator() {
        public int compare(Object o1, Object o2) {//好评
            Book x1 = (Book)o1;
            Book x2 = (Book)o2;
            return x2.getMark()-x1.getMark();
        }
    };
    static Comparator<Book> priceBig = new Comparator() {
        public int compare(Object o1, Object o2) {
            Book x1 = (Book)o1;
            Book x2 = (Book)o2;
            return new BigDecimal(x2.getPrice()).compareTo(new BigDecimal(x1.getPrice()));
        }
    };
    static Comparator<Book> priceSma = new Comparator() {
        public int compare(Object o1, Object o2) {
            Book x1 = (Book)o1;
            Book x2 = (Book)o2;
            return new BigDecimal(x1.getPrice()).compareTo(new BigDecimal(x2.getPrice()));
        }
    };
}
