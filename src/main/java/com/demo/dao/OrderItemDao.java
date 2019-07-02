/**
 * Copyright (C), 2018-2019, csust
 * FileName: OrderItemDao
 * Author:   Cwolf9
 * Date:     2019/06/28 15:40
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/28           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/28
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/28
 * @since 1.0.0
 */
package com.demo.dao;

import com.demo.model.OrderItem;
import com.demo.model.Orders;
import com.demo.model.User;
import com.demo.util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderItemDao {
    public static void main(String[] args) {
        OrderItemDao a = new OrderItemDao();
        List<Orders> b = new OrdersDao().findAll(0, "0");
        for(Orders x: b) {
//            a.save(x.getOrderid(),1,5,1.0,5);
        }
        a.hh();
    }
    /**
     * 插入一个orderitem
     * @param orderid
     * @param bookid
     * @param booknum
     * @param singleprice
     * @param allmoney
     */
    public void save(String orderid,int bookid,int booknum,double singleprice,double allmoney) {
        String sql = "insert into b_orderitem (orderid,bookid,booknum,singleprice,allmoney) values"+
                "(?,?,?,?,?)";
        DBUtil.insert(sql, orderid,bookid,booknum,singleprice,allmoney);
    }
    public void hh() {
        String sql = "update b_orderitem set allmoney = 3.0 where booknum = ?";
        DBUtil.update(sql, 3);
    }
    /**
     * 按照orderid查找所有购买的item
     * @param orderid
     * @return
     */
    public List<OrderItem> findOIByOrderId(String orderid) {
        String sql = "SELECT * FROM b_orderitem where orderid=?";
        List<OrderItem> ans = new ArrayList<OrderItem>();
        try {
            ResultSet rs = DBUtil.select(sql,orderid);
            while (rs.next()) {//指标往下移动一行
                String orderid2 = rs.getString(1);
                int bookid = rs.getInt(2);
                int booknum = rs.getInt(3);
                double singleprice = rs.getDouble(4);
                double allmoney = rs.getDouble(5);
                String bookname = rs.getString(6);
                OrderItem oi = new OrderItem(orderid2,bookid,booknum,singleprice,allmoney,bookname);
                ans.add(oi);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return ans;
    }
    public List<OrderItem> findAllOI() {
        String sql = "SELECT * FROM b_orderitem";
        List<OrderItem> ans = new ArrayList<OrderItem>();
        try {
            ResultSet rs = DBUtil.select(sql);
            while (rs.next()) {//指标往下移动一行
                String orderid2 = rs.getString(1);
                int bookid = rs.getInt(2);
                int booknum = rs.getInt(3);
                double singleprice = rs.getDouble(4);
                double allmoney = rs.getDouble(5);
                String bookname = rs.getString(6);
                OrderItem oi = new OrderItem(orderid2,bookid,booknum,singleprice,allmoney,bookname);
                ans.add(oi);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return ans;
    }
}
