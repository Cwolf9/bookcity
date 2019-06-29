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

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

public class UserDao {
    public static void main(String[] args) {
        UserDao dao = new UserDao();
        System.out.println(dao.findByAccountAndPwd("hhh",MD5Util.MD5Encode("hhh","utf-8")));
        //new UserDao().save("Admin", "pwd","管理员","男","123111");
        System.out.println(dao.findByPhonenumber("15172425261"));
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
            String sql = "INSERT INTO b_user (account,pwd,username,sex,avatar,phonenumber,registerdate,grade,ismerchant) " +
                    "VALUES(?,?,?,?,'imgs/tx0.jpg',?,NOW(),60.0,'否')";
            DBUtil.insert(sql,account,pwd,username,sex,phonenumber);
    }
    public void save(String account, String pwd, String username, String sex) {
        String sql = "INSERT INTO b_user (account,pwd,username,sex,avatar,registerdate,grade,ismerchant) " +
                "VALUES(?,?,?,?,'imgs/tx0.jpg',NOW(),60.0,'否')";
        DBUtil.insert(sql,account,pwd,username,sex);
    }
    /**
     * 插入数据
     * @param user user实例
     */
    public void save(User user) {
        String sql = "INSERT INTO b_user (account,pwd,username,sex,avatar,phonenumber,registerdate,grade,ismerchant) " +
                "VALUES(?,?,?,?,'imgs/tx0.jpg',?,NOW(),60.0,'否')";
        DBUtil.insert(sql,user.getAccount(),user.getPwd(),user.getUsername(),user.getSex(),user.getPhonenumber());
    }

    /**
     * 根据id删除b_user中的一条数据
     * @param id 要删除的数据的id
     */
    public void removeById(int id){
        String sql = "DELETE FROM b_user WHERE userid=?";
        DBUtil.delete(sql,id);
    }
    /**
     * 根据account删除b_user中的一条数据
     * @param account 账号
     */
    public void removeByAcc(String  account) {
        String sql = "DELETE FROM b_user WHERE account=?";
        DBUtil.delete(sql,account);
    }

    /**
     * 查询所有数据
     * @return
     */
    public List<User> findAll(){
        List<User> list = new ArrayList<User>();
        String sql = "SELECT * FROM b_user";
        ResultSet rs = DBUtil.select(sql);
        try {
            while (rs.next()) {//指标往下移动一行
                int id2 = rs.getInt(1);
                String account = rs.getString(2);
                String pwd = rs.getString(3);
                String username = rs.getString(4);
                String sex = rs.getString(5);
                String avatar = rs.getString(6);
                String phonenumber = rs.getString(7);
                Date registerdate = rs.getDate(8);
                double grade = rs.getDouble(9);
                String ismerchant = rs.getString(10);
                User u = new User(id2, account, pwd, username, sex, avatar, phonenumber, registerdate, grade, ismerchant);
                list.add(u);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    /**
     * 根据id查询一条数据
     * @param id 要查询的数据的id
     * @return 数据库对应id的一行数据，封装为java中的一个User对象
     */
    public User findById(int id){
        String sql = "SELECT * FROM b_user where userid=?";
        ResultSet rs = DBUtil.select(sql,id);
        try {
            while (rs.next()) {//指标往下移动一行
                int id2 = rs.getInt(1);
                String account = rs.getString(2);
                String pwd = rs.getString(3);
                String username = rs.getString(4);
                String sex = rs.getString(5);
                String avatar = rs.getString(6);
                String phonenumber = rs.getString(7);
                Date registerdate = rs.getDate(8);
                double grade = rs.getDouble(9);
                String ismerchant = rs.getString(10);
                User u = new User(id2, account, pwd, username, sex, avatar, phonenumber, registerdate, grade, ismerchant);
                return u;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public User findByAccount(String account2) {
        String sql = "SELECT * FROM b_user where account=?";
        ResultSet rs = DBUtil.select(sql,account2);
        try {
            while (rs.next()) {//指标往下移动一行
                int id2 = rs.getInt(1);
                String account = rs.getString(2);
                String pwd = rs.getString(3);
                String username = rs.getString(4);
                String sex = rs.getString(5);
                String avatar = rs.getString(6);
                String phonenumber = rs.getString(7);
                Date registerdate = rs.getDate(8);
                double grade = rs.getDouble(9);
                String ismerchant = rs.getString(10);
                User u = new User(id2, account, pwd, username, sex, avatar, phonenumber, registerdate, grade, ismerchant);
                return u;
            }
        }catch (SQLException e) {
            e.printStackTrace();
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
        ResultSet rs = DBUtil.select(sql,account2,pwd2);
        try {
            while (rs.next()) {//指标往下移动一行
                int id2 = rs.getInt(1);
                String account = rs.getString(2);
                String pwd = rs.getString(3);
                String username = rs.getString(4);
                String sex = rs.getString(5);
                String avatar = rs.getString(6);
                String phonenumber = rs.getString(7);
                Date registerdate = rs.getDate(8);
                double grade = rs.getDouble(9);
                String ismerchant = rs.getString(10);
                User u = new User(id2, account, pwd, username, sex, avatar, phonenumber, registerdate, grade, ismerchant);
                return u;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过phonenumber找用户
     * @param phonenumber2
     * @return
     */
    public User findByPhonenumber(String phonenumber2) {
        String sql = "SELECT * FROM b_user where phonenumber=?";
        ResultSet rs = DBUtil.select(sql,phonenumber2);
        try {
            while (rs.next()) {//指标往下移动一行
                int id2 = rs.getInt(1);
                String account = rs.getString(2);
                String pwd = rs.getString(3);
                String username = rs.getString(4);
                String sex = rs.getString(5);
                String avatar = rs.getString(6);
                String phonenumber = rs.getString(7);
                Date registerdate = rs.getDate(8);
                double grade = rs.getDouble(9);
                String ismerchant = rs.getString(10);
                User u = new User(id2, account, pwd, username, sex, avatar, phonenumber, registerdate, grade, ismerchant);
                return u;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<User> findMerchant(){
        List<User> list = new ArrayList<User>();
        String sql = "SELECT * FROM b_user where ismerchant like '是' ";
        ResultSet rs = DBUtil.select(sql);
        try {
            while (rs.next()) {//指标往下移动一行
                int id2 = rs.getInt(1);
                String account = rs.getString(2);
                String pwd = rs.getString(3);
                String username = rs.getString(4);
                String sex = rs.getString(5);
                String avatar = rs.getString(6);
                String phonenumber = rs.getString(7);
                Date registerdate = rs.getDate(8);
                double grade = rs.getDouble(9);
                String ismerchant = rs.getString(10);
                User u = new User(id2, account, pwd, username, sex, avatar, phonenumber, registerdate, grade, ismerchant);
                list.add(u);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    /**
     * 根据id修改b_user表的密码数据
     * @param newPwd 要更改的新密码
     * @param id 要更改的用户的id
     */
    public void modifyPwd(String newPwd, int id){
        String sql = "UPDATE b_user SET pwd=? WHERE userid=?";
        DBUtil.update(sql,newPwd, id);
    }

    /**
     * 根据id修改b_user表的头像
     * @param newAva 新的头像地址
     * @param id
     */
    public void modifyAvatar(String newAva, int id) {
        String sql = "UPDATE b_user SET avatar=? WHERE userid=?";
        DBUtil.update(sql,newAva, id);
    }

    /**
     * 根据id改变信誉积分
     * @param grade2
     * @param id
     */
    public void modifyGrade(double grade2, int id) {
        String sql = "UPDATE b_user SET grade = ? WHERE userid=?";
        DBUtil.update(sql,grade2, id);
    }

    /**
     * 根据id修改是否为商家
     * @param ism
     * @param id
     */
    public void modifyIsm(String ism, int id) {
        String sql = "UPDATE b_user SET ismerchant =? WHERE userid=?";
        DBUtil.update(sql,ism, id);
    }


    public void modifyUsername(String username, int userid) {
        String sql = "UPDATE b_user SET username =? WHERE userid=?";
        DBUtil.update(sql,username, userid);
    }

    public void modifyUserSex(String sex, int userid) {
        String sql = "UPDATE b_user SET sex =? WHERE userid=?";
        DBUtil.update(sql,sex, userid);
    }

    public void modifyPhonenumber(String mobile, int userid) {
        String sql = "UPDATE b_user SET phonenumber =? WHERE userid=?";
        DBUtil.update(sql,mobile, userid);
    }


}
