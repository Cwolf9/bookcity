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
        for(int i = 1; i <= 5; i+=2) {
            new OrdersDao().saveOrder(i, i+1, new Random().nextInt(1000)*1.0, "长沙理工大学"+i, "1234"+i);
        }
    }
    /**
     * 插入admin
     * @param adminid
     * @param args
     */
    public void saveAdmin(int adminid, String... args){
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO b_admin (Adminid, registerdate,adminacc,pwd,avatar,phonenumber,permission) " +
                    "VALUES(?,NOW(),?,?,'imgs/admin0.jpg',?,'是')";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, adminid);
            for (int i = 0, j = 2; i < args.length; ++i, ++j) {
                pstm.setString(j, args[i]);
            }
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
     * 根据id删除admin
     * @param Adminid
     */
    public void removeById(int Adminid){
        Connection conn = DBUtil.getConnection();;
        PreparedStatement pstmt = null;
        try {
            String sql = "DELETE FROM b_admin WHERE adminid=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Adminid);
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

    public List<Admin> findAll(){
        List<Admin> list = new ArrayList<Admin>();
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM b_admin";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
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
     * 修改密码
     * @param pwd
     * @param adminid
     */
    public void modifyPwd(String pwd, int adminid){
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        String sql = "UPDATE b_admin SET pwd = ? WHERE adminid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, pwd);
            pstmt.setInt(2, adminid);
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
     * 修改权限
     * @param permission
     * @param adminid
     */
    public void modifyPer(String permission, int adminid){
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        String sql = "UPDATE b_admin SET name = ? WHERE adminid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, permission);
            pstmt.setInt(2, adminid);
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
