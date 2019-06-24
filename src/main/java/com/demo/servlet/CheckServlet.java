/**
 * Copyright (C), 2018-2019, csust
 * FileName: CheckServlet
 * Author:   Cwolf9
 * Date:     2019/06/24 16:38
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/24           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/24
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/24
 * @since 1.0.0
 */
package com.demo.servlet;

import com.demo.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CheckServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.service(req, resp);
        HttpServletRequest request = req;
        HttpServletResponse response = resp;
        req.setCharacterEncoding("utf-8");
        UserDao dao = new UserDao();
        //获取用户地址栏的地址
        String url = req.getServletPath();// *.do
        System.out.println("本次请求的url地址："+url);
        //Servlet保存数据方法：HttpSession
        HttpSession session = req.getSession();
        if("/welcome.jsp".equals(url)){

        }

    }
}
