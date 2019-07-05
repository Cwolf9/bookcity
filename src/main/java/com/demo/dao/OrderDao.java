/**
 * Copyright (C), 2018-2019, csust
 * FileName: OrderDao
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

import com.demo.model.Order;
import com.demo.util.CodeUtil;
import com.demo.util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class OrderDao {
    public static void main(String[] args) {
        for(int i = 200; i <= 220; i+=2) {
            new OrderDao().saveOrder(i, i+1, new Random().nextInt(1000)*1.0, "长沙理工大学"+i,10);
        }
    }

    /**
     * 生成一个订单
     * @param uid
     * @param sid
     * @param money
     * @param name
     */
    public String saveOrder(int uid, int sid, double money,String name,int allnum){//订单编号系统随机生成
        String sql = "INSERT INTO `order` (uid, sid, money, orderid, name,allnum) " +
                "VALUES(?,?,?,?,?,?)";
        String tmp = CodeUtil.rand();
        DBUtil.insert(sql,uid,sid,money,tmp,name,allnum);
        return tmp;
    }

    /**
     * 根据订单编号删除订单
     * @param orderid
     */
    public void removeById(String orderid){
        String sql = "DELETE FROM `order` WHERE orderid=?";
        DBUtil.delete(sql, orderid);
    }

    /**
     * 根据订单序号删除订单
     * @param orderindex
     */
    public void removeByIndex(int orderindex){
        String sql = "DELETE FROM `order` WHERE orderindex=?";
        DBUtil.delete(sql, orderindex);
    }
    /**
     * 查询orderid2的全部订单，orderid2为0时输出所有订单
     * @param uid
     * @return
     */
    public List<Order> findAll(int ip, String uid){
        List<Order> list = new ArrayList<Order>();
        String sql = null;
        if(ip == 0) sql = "SELECT * FROM `order`";
        else if(ip == 1) sql = "SELECT * FROM `order` where uid = ?";
        else sql = "SELECT * FROM `order` where sid = ?";
        try {
            ResultSet rs = null;
            if(ip == 0) rs = DBUtil.select(sql);
            else rs = DBUtil.select(sql, Integer.parseInt(uid));
            while(rs.next()){//指标往下移动一行
                int orderindex = rs.getInt(1);
                String orderid = rs.getString(2);
                int uid2 = rs.getInt(3);
                int sid = rs.getInt(4);
                double price = rs.getDouble(5);
                String name = rs.getString(6);
                String express = rs.getString(7);
                int allnum = rs.getInt(8);
                Order ors = new Order(orderindex,orderid,uid2,sid,price,name,express,allnum);
                list.add(ors);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 根据订单编号修改地址
     * @param name
     * @param orderid
     */
    public void modifyName(String name, String orderid){
        String sql = "UPDATE `order` SET name = ? WHERE orderid=?";
        DBUtil.update(sql,name,orderid);
    }

    public void modifyOrderExpress(String express, String orderid) {
        String sql = "UPDATE `order` SET express = ? WHERE orderid=?";
        DBUtil.update(sql,express,orderid);
    }
}
