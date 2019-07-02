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

import com.demo.dao.AdminDao;
import com.demo.dao.UserDao;
import com.demo.model.Admin;
import com.demo.model.User;
import java.sql.ResultSet;
import com.sun.org.apache.xml.internal.serialize.LineSeparator;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DBUtil {
    private static Connection conn = null;
    public static void main(String[] args) {
        //getConnection();
        List<User> a = new UserDao().findAll();
        for(User x: a) {
            System.out.println(x);
        }
        List<Admin> b = new AdminDao().findAll();
        for(Admin x: b) {
            System.out.println(x.getAdminid());
        }
    }
    public static Connection getConnection() {
//        if(conn == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookcity?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true", "root", "lhroot");
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

    /**
     *
     * @param sql
     * @param args
     */
    public static void insert(String sql, Object... args) {
        Connection conn =  DBUtil.getConnection();
        PreparedStatement pstm = null;
        try {
            pstm = conn.prepareStatement(sql);
            for(int i = 0; i < args.length; ++i) pstm.setObject(i+1, args[i]);
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            try {
                pstm.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }catch (NullPointerException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     *
     * @param sql
     * @param args
     */
    public static void delete(String sql, Object... args) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstm = null;
        try {
            pstm = conn.prepareStatement(sql);
            for(int i = 0; i < args.length; ++i) pstm.setObject(i+1, args[i]);
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            try {
                pstm.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }catch (NullPointerException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     *
     * @param sql
     * @param args
     * @return
     */
    public static ResultSet select(String sql, Object... args) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            for(int i = 0; i < args.length; ++i) pstmt.setObject(i+1, args[i]);
            rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NullPointerException e) {
            e.printStackTrace();
        }finally {
//            try {
//                conn.close();
//                pstmt.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }catch (NullPointerException e) {
//                e.printStackTrace();
//            }
        }
        return rs;
    }

    /**
     *
     * @param sql
     * @return
     */
    public static ResultSet select(String sql) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NullPointerException e) {
            e.printStackTrace();
        }finally {
//            try {
//                conn.close();
//                pstmt.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }catch (NullPointerException e) {
//                e.printStackTrace();
//            }
        }
        return rs;
    }
    /**
     *
     * @param sql
     * @param args
     */
    public static void update(String sql, Object... args) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            for(int i = 0; i < args.length; ++i) pstmt.setObject(i+1,args[i]);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }catch (NullPointerException e) {
                e.printStackTrace();
            }
        }
    }
}
