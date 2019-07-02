/**
 * Copyright (C), 2018-2019, csust
 * FileName: AddressDao
 * Author:   Cwolf9
 * Date:     2019/06/22 21:40
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/22           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/22
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/22
 * @since 1.0.0
 */
package com.demo.dao;

import com.demo.model.Address;
import com.demo.model.User;
import com.demo.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class AddressDao {
    public static void main(String[] args) {
        new AddressDao().save("长沙理工大学", 1, "是");
    }
    /**
     * 插入数据
     * @param name 地址信息
     * @param uid 用户编号
     * @param isdefault 是否默认地址
     */
    public void save(String name, int uid, String isdefault) {
        String sql = "insert into b_address (name, uid, isdefault) values (?, ?, ?)";
        DBUtil.insert(sql,name,uid,isdefault);
    }
    /**
     * 删除数据
     * @param id 地址编号
     */
    public void remove(int  id) {
        String sql = "delete from b_address where id = ?";
        DBUtil.delete(sql, id);
    }
    public Address findAddressById(int id){
        String sql = "SELECT * FROM b_address where uid = ? and isdefault = '是'";
        ResultSet rs = DBUtil.select(sql,id);
        Address u = null;
        try {
            while (rs.next()) {//指标往下移动一行
                int id2 = rs.getInt(1);
                String name = rs.getString(2);
                int uid = rs.getInt(3);
                String isdefault = rs.getString(4);
                 u = new Address(id2, name, uid, isdefault);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }
}
