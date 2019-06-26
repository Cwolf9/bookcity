/**
 * Copyright (C), 2018-2019, csust
 * FileName: BookimgsDao
 * Author:   Cwolf9
 * Date:     2019/06/26 15:42
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/26           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/26
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/26
 * @since 1.0.0
 */
package com.demo.dao;

import com.demo.model.Book;
import com.demo.model.Bookimgs;
import com.demo.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BookimgsDao {

    public void save(String book, String img) {
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtil.getConnection();
            //准备要执行的sql语句
            String sql = "INSERT INTO b_bookimgs (book, img) VALUES(?,?)";
            //获取sql语句的执行器对象
            pstm = conn.prepareStatement(sql);
            //为sql语句中的问号赋值
            pstm.setString(1, book);
            pstm.setString(2, img);
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
    public Bookimgs findBybook(String book){
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM b_bookimgs where book=?";
        PreparedStatement pstmt = null;
        Bookimgs bk = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, book);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                String book2 = rs.getString(1);
                String img = rs.getString(2);
                bk = new Bookimgs(book2,img);
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
        return bk;
    }
    public List<Bookimgs> findByAllbooks(String book){
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM b_bookimgs where book=?";
        PreparedStatement pstmt = null;
        Bookimgs bk = null;
        List<Bookimgs> bl = new ArrayList<Bookimgs>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, book);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                String book2 = rs.getString(1);
                String img = rs.getString(2);
                bk = new Bookimgs(book2,img);
                bl.add(bk);
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
        return bl;
    }
}
