/**
 * Copyright (C), 2018-2019, csust
 * FileName: UserDao
 * Author:   Cwolf9
 * Date:     2019/06/20 14:31
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
package com.demo.dao;

import com.demo.model.User;
import com.demo.util.DBUtil;
import com.demo.util.MD5Util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

public class UserDao {
    public static void main(String[] args) {
        new UserDao().save("Admin", "pwd","管理员","男","123");
    }
    /**
     * 在b_user表新增数据
     * @param account 账号
     * @param pwd 密码
     * @param username 用户名
     * @param sex 性别
     * @param phonenumber 手机号码
     */
    public void save(String account,String pwd,String username,String sex,String phonenumber){
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtil.getConnection();
            //准备要执行的sql语句
            String sql = "INSERT INTO b_user (account,pwd,username,sex,avatar,phonenumber,registerdate,grade,ismerchant) " +
                    "VALUES(?,?,?,?,'imgs/tx0.jpg',?,NOW(),60.0,'否')";
            //获取sql语句的执行器对象
            pstm = conn.prepareStatement(sql);
            //为sql语句中的问号赋值
            pstm.setString(1, account);
            pstm.setString(2, MD5Util.MD5Encode(pwd,"utf-8"));
            pstm.setString(3, username);
            pstm.setString(4, sex);
            pstm.setString(5, phonenumber);
            //执行sql语句
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
     * 插入数据
     * @param user user实例
     */
    public void save(User user) {
        Connection conn = DBUtil.getConnection();
        String sql = "INSERT INTO b_user (account,pwd,username,sex,avatar,phonenumber,registerdate,grade,ismerchant) " +
                "VALUES(?,?,?,?,'imgs/tx0.jpg',?,NOW(),60.0,'否')";
        PreparedStatement pstm = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, user.getAccount());
            pstm.setString(2, MD5Util.MD5Encode(user.getPwd(),"utf-8"));
            pstm.setString(3, user.getUsername());
            pstm.setString(4, user.getSex());
            pstm.setString(5, user.getPhonenumber());
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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
     * 根据id删除b_user中的一条数据
     * @param id 要删除的数据的id
     */
    public void removeById(int id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            //准备sql语句
            String sql = "DELETE FROM b_user WHERE userid=?";
            //获取sql语句执行器对象
            pstmt = conn.prepareStatement(sql);
            //为？赋值
            pstmt.setInt(1, id);
            //执行sql语句
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            //关闭资源，比如Connection对象
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
    /**
     * 根据account删除b_user中的一条数据
     * @param account 账号
     */
    public void removeByAcc(String  account) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            //准备sql语句
            String sql = "DELETE FROM b_user WHERE account=?";
            //获取sql语句执行器对象
            pstmt = conn.prepareStatement(sql);
            //为？赋值
            pstmt.setString(1, account);
            //执行sql语句
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            //关闭资源，比如Connection对象
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

    /**
     * 查询所有数据
     * @return
     */
    public List<User> findAll(){
        List<User> list = new ArrayList<User>();
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM b_user";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                int id2 = rs.getInt(1);
                String account = rs.getString(2);
                String pwd = rs.getString(3);
                String username = rs.getString(4);
                String sex = rs.getString(5);
                String avatar  = rs.getString(6);
                String phonenumber = rs.getString(7);
                Date registerdate = rs.getDate(8);
                double grade = rs.getDouble(9);
                String ismerchant = rs.getString(10);
                User u = new User(id2,account,pwd,username,sex,avatar,phonenumber,registerdate,grade,ismerchant);
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }catch (NullPointerException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    /**
     * 根据id查询一条数据
     * @param id 要查询的数据的id
     * @return 数据库对应id的一行数据，封装为java中的一个User对象
     */
    public User findById(int id){
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM b_user where userid=?";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                int id2 = rs.getInt(1);
                String account = rs.getString(2);
                String pwd = rs.getString(3);
                String username = rs.getString(4);
                String sex = rs.getString(5);
                String avatar  = rs.getString(6);
                String phonenumber = rs.getString(7);
                Date registerdate = rs.getDate(8);
                double grade = rs.getDouble(9);
                String ismerchant = rs.getString(10);
                User u = new User(id2,account,pwd,username,sex,avatar,phonenumber,registerdate,grade,ismerchant);
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }catch (NullPointerException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 通过account和pwd找用户
     * @param account2
     * @param pwd2
     * @return
     */
    public User findByAccountAndPwd(String account2, String pwd2) {
        String sql = "SELECT * FROM b_user where account=? and pwd=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, account2);
            pstmt.setString(2, pwd2);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                int id2 = rs.getInt(1);
                String account = rs.getString(2);
                String pwd = rs.getString(3);
                String username = rs.getString(4);
                String sex = rs.getString(5);
                String avatar  = rs.getString(6);
                String phonenumber = rs.getString(7);
                Date registerdate = rs.getDate(8);
                double grade = rs.getDouble(9);
                String ismerchant = rs.getString(10);
                User u = new User(id2,account,pwd,username,sex,avatar,phonenumber,registerdate,grade,ismerchant);
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NullPointerException e) {
            e.printStackTrace();
        }finally {
            try {
                conn.close();
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }catch (NullPointerException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    /**
     * 通过phonenumber找用户
     * @param phonenumber
     * @return
     */
    public User findByPhonenumber(String phonenumber) {
        String sql = "SELECT * FROM b_user where phonenumber=?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, phonenumber);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                int id2 = rs.getInt(1);
                String account = rs.getString(2);
                String pwd = rs.getString(3);
                String username = rs.getString(4);
                String sex = rs.getString(5);
                String avatar  = rs.getString(6);
                String _phonenumber = rs.getString(7);
                Date registerdate = rs.getDate(8);
                double grade = rs.getDouble(9);
                String ismerchant = rs.getString(10);
                User u = new User(id2,account,pwd,username,sex,avatar,phonenumber,registerdate,grade,ismerchant);
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NullPointerException e) {
            e.printStackTrace();
        }finally {
            try {
                conn.close();
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }catch (NullPointerException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    /**
     * 根据id修改b_user表的密码数据
     * @param newPwd 要更改的新密码
     * @param id 要更改的用户的id
     */
    public void modifyPwd(String newPwd, int id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = DBUtil.getConnection();
        String sql = "UPDATE b_user SET pwd=? WHERE userid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPwd);
            pstmt.setInt(2, id);
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

    /**
     * 根据id修改b_user表的头像
     * @param newAva 新的头像地址
     * @param id
     */
    public void modifyAvatar(String newAva, int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = DBUtil.getConnection();
        String sql = "UPDATE b_user SET avatar=? WHERE userid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newAva);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 根据id增加信誉积分
     * @param grade2 +=grade2
     * @param id
     */
    public void modifyGrade(double grade2, int id) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        String sql = "UPDATE b_user SET grade = grade + ? WHERE userid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setDouble(1, grade2);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 根据id修改是否为商家
     * @param ism
     * @param id
     */
    public void modifyIsm(String ism, int id) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        String sql = "UPDATE b_user SET ismerchant =? WHERE userid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ism);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
