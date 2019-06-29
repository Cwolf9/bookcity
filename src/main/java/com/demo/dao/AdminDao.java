/**
 * Copyright (C), 2018-2019, csust
 * FileName: AdminDao
 * Author:   Cwolf9
 * Date:     2019/06/27 11:55
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/27           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/27
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/27
 * @since 1.0.0
 */
package com.demo.dao;

import com.demo.model.Admin;
import com.demo.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class AdminDao {
    public static void main(String[] args) {
        for(int i = 1; i <= 5; ++i) {
            new AdminDao().saveAdmin("admin"+i,"pwd"+i,"1239"+i);
        }
    }

    /**
     *
     * @param adminacc
     * @param pwd
     * @param phonenumber
     */
    public void saveAdmin(String adminacc, String pwd, String phonenumber){
            String sql = "INSERT INTO b_admin (registerdate,adminacc,pwd,avatar,phonenumber,permission) " +
                    "VALUES(NOW(),?,?,'imgs/admin0.jpg',?,'是')";
            DBUtil.insert(sql,adminacc,pwd,phonenumber);
    }
    public void saveAdmin(String adminacc, String pwd, String phonenumber,String permission){
        String sql = "INSERT INTO b_admin (registerdate,adminacc,pwd,avatar,phonenumber,permission) " +
                "VALUES(NOW(),?,?,'imgs/admin0.jpg',?,?)";
        DBUtil.insert(sql,adminacc,pwd,phonenumber,permission);
    }
    /**
     * 根据id删除admin
     * @param Adminid
     */
    public void removeById(int Adminid){
        String sql = "DELETE FROM b_admin WHERE adminid=?";
        DBUtil.delete(sql, Adminid);
    }
    public List<Admin> findAll(){
        List<Admin> list = new ArrayList<Admin>();
        String sql = "SELECT * FROM b_admin";
        try {
            ResultSet rs = DBUtil.select(sql);
            while(rs.next()){//指标往下移动一行
                int adminid = rs.getInt(1);
                String adminacc = rs.getString(2);
                String pwd = rs.getString(3);
                String avatar = rs.getString(4);
                String phonenumber = rs.getString(5);
                Date registerdate = rs.getDate(6);
                String permission = rs.getString(7);
                Admin ors = new Admin(adminid,adminacc,pwd,avatar,phonenumber,registerdate,permission);
                list.add(ors);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Admin findAdminByAccount(String adminacc) {
        String sql = "SELECT * FROM b_admin where adminacc=?";
        try {
            ResultSet rs = DBUtil.select(sql,adminacc);
            while(rs.next()){//指标往下移动一行
                int adminid = rs.getInt(1);
                String adminacc2 = rs.getString(2);
                String pwd = rs.getString(3);
                String avatar = rs.getString(4);
                String phonenumber = rs.getString(5);
                Date registerdate = rs.getDate(6);
                String permission = rs.getString(7);
                Admin ors = new Admin(adminid,adminacc2,pwd,avatar,phonenumber,registerdate,permission);
                return ors;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 修改密码
     * @param pwd
     * @param adminid
     */
    public void modifyPwd(String pwd, int adminid){
        String sql = "UPDATE b_admin SET pwd = ? WHERE adminid=?";
        DBUtil.update(sql,pwd,adminid);
    }

    public void modifyAdminPer(String newPermission, int adminid) {
        String sql = "UPDATE b_admin SET permission = ? WHERE adminid=?";
        DBUtil.update(sql,newPermission,adminid);
    }
    public void modifyAdminPwd(String md5Encode, int adminid) {
        String sql = "UPDATE b_admin SET pwd = ? WHERE adminid=?";
        DBUtil.update(sql,md5Encode,adminid);
    }

    public Admin findAdminByMobile(String phonenumber) {
        String sql = "SELECT * FROM b_admin where phonenumber=?";
        try {
            ResultSet rs = DBUtil.select(sql,phonenumber);
            while(rs.next()){//指标往下移动一行
                int adminid = rs.getInt(1);
                String adminacc2 = rs.getString(2);
                String pwd = rs.getString(3);
                String avatar = rs.getString(4);
                String phonenumber2 = rs.getString(5);
                Date registerdate = rs.getDate(6);
                String permission = rs.getString(7);
                Admin ors = new Admin(adminid,adminacc2,pwd,avatar,phonenumber2,registerdate,permission);
                return ors;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void modifyAdminPhonenumber(String phonenumber, int adminid) {
        String sql = "UPDATE b_admin SET phonenumber = ? WHERE adminid=?";
        DBUtil.update(sql,phonenumber,adminid);
    }

    public Admin findAdminByAccountAndPwd(String account, String pwd) {
        String sql = "SELECT * FROM b_admin where adminacc=? and pwd=?";
        try {
            ResultSet rs = DBUtil.select(sql,account, pwd);
            while(rs.next()){//指标往下移动一行
                int adminid = rs.getInt(1);
                String adminacc2 = rs.getString(2);
                String pwd2 = rs.getString(3);
                String avatar = rs.getString(4);
                String phonenumber2 = rs.getString(5);
                Date registerdate = rs.getDate(6);
                String permission = rs.getString(7);
                Admin ors = new Admin(adminid,adminacc2,pwd2,avatar,phonenumber2,registerdate,permission);
                return ors;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void modifyAdminAvatar(String s, int adminid) {
        String sql = "UPDATE b_admin SET avatar = ? WHERE adminid=?";
        DBUtil.update(sql,s,adminid);
    }
}
