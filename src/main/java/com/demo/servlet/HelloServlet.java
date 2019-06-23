/**
 * Copyright (C), 2018-2019, csust
 * FileName: HttpServlet
 * Author:   Cwolf9
 * Date:     2019/06/18 16:06
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/18           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/18
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/18
 * @since 1.0.0
 */
package com.demo.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class HelloServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            String userId = request.getParameter("account");
            String pwd = request.getParameter("pwd");
            if("lh".equals(userId) && "handsome".equals(pwd)){
                out.println("success1");
            }else{
                out.println("fail1");
            }
            out.println("<br/>");
            String servletPath = this.getServletContext().getRealPath("/");
            out.println(servletPath);
            out.close();
        } catch (Exception e) {
            // TODO: handle exception
        }
    }
}