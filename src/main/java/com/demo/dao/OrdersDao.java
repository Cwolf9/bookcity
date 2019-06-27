/**
 * Copyright (C), 2018-2019, csust
 * FileName: OrdersDao
 * Author:   Cwolf9
 * Date:     2019/06/27 10:09
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

import com.demo.model.Book;
import com.demo.model.Orders;
import com.demo.util.CodeUtil;
import com.demo.util.ColorUtil;
import com.demo.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class OrdersDao {
    public static void main(String[] args) {
        for(int i = 1; i <= 5; i+=2) {
            new OrdersDao().saveOrder(i, i+1, new Random().nextInt(1000)*1.0, "长沙理工大学"+i, "1234"+i);
        }
    }
    /**
     * 生成一个订单
     * @param uid
     * @param args
     */
    public void saveOrder(int uid, int sid, double money, String... args){//订单编号系统随机生成
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO b_orders (uid, sid, money, orderid, name, express) " +
                    "VALUES(?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, uid);
            pstm.setInt(2,sid);
            pstm.setDouble(3, money);
            pstm.setString(4, CodeUtil.rand());
            for (int i = 0, j = 5; i < args.length; ++i, ++j) {
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
     * 根据订单编号删除订单
     * @param orderid
     */
    public void removeById(String orderid){
        Connection conn = DBUtil.getConnection();;
        PreparedStatement pstmt = null;
        try {
            String sql = "DELETE FROM b_orders WHERE orderid=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, orderid);
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
     * 根据订单序号删除订单
     * @param orderindex
     */
    public void removeByIndex(int orderindex){
        Connection conn = DBUtil.getConnection();;
        PreparedStatement pstmt = null;
        try {
            String sql = "DELETE FROM b_orders WHERE orderindex=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, orderindex);
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
     * 查询orderid2的全部订单，orderid2为0时输出所有订单
     * @param orderid2
     * @return
     */
    public List<Orders> findAll(String orderid2){
        List<Orders> list = new ArrayList<Orders>();
        Connection conn = DBUtil.getConnection();
        String sql;
        if(orderid2.equals("0")) {
            System.out.println(1);
            sql = "SELECT * FROM b_orders";
        }
        else sql = "SELECT * FROM b_orders where orderid = ?";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            if(!orderid2.equals("0")) pstmt.setString(1, orderid2);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                int orderindex = rs.getInt(1);
                String orderid = rs.getString(2);
                int uid = rs.getInt(3);
                int sid = rs.getInt(4);
                double price = rs.getDouble(5);
                String name = rs.getString(6);
                String express = rs.getString(7);
                Orders ors = new Orders(orderindex,orderid,uid,sid,price,name,express);
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
     * 根据订单编号修改地址
     * @param name
     * @param orderid
     */
    public void modifyName(String name, String orderid){
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        String sql = "UPDATE b_orders SET name = ? WHERE orderid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, orderid);
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
