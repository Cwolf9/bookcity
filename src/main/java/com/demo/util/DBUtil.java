/**
 * Copyright (C), 2018-2019, csust
 * FileName: DBUtil
 * Author:   Cwolf9
 * Date:     2019/06/20 14:32
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/20           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/20
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/20
 * @since 1.0.0
 */
package com.demo.util;

import com.demo.dao.UserDao;
import com.demo.model.User;
import com.sun.org.apache.xml.internal.serialize.LineSeparator;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class DBUtil {
//    private static Connection conn;
    public static Connection getConnection() {
        Connection conn = null;
//        if(conn == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookcity?useSSL=false&serverTimezone=UTC", "root", "lhroot");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                return conn;
            }
//        }
//        return conn;
    }
    public static void main(String[] args) {
        //getConnection();
        List<User> a = new UserDao().findAll();
        for(User x: a) {
            System.out.println(x);
        }
    }
}
