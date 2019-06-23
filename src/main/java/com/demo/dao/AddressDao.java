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

import com.demo.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
        Connection conn = DBUtil.getConnection();
        String sql = "insert into b_address (name, uid, isdefault) values (?, ?, ?)";
        PreparedStatement pstm = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setInt(2, uid);
            pstm.setString(3, isdefault);
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
     * 删除数据
     * @param id 地址编号
     */
    public void remove(int  id) {
        Connection conn = DBUtil.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from b_address where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
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
    }
}
