/**
 * Copyright (C), 2018-2019, csust
 * FileName: BookDao
 * Author:   Cwolf9
 * Date:     2019/06/26 11:17
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
import com.demo.model.User;
import com.demo.util.DBUtil;
import com.demo.util.MD5Util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BookDao {
    public static void main(String[] args) {
        new BookDao().save("契科夫小说全集", "契科夫","讽刺小说",50.0,30,"我","book");
    }
    /**
     * 在b_book中插入新书
     * @param bookname 书名
     * @param bookauthor 作者
     * @param bookinfo 简介
     * @param price 单价
     * @param booknum 数量
     */
    public void save(String bookname,String bookauthor,String bookinfo,double price,int booknum,String bowner,String book){
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtil.getConnection();
            //准备要执行的sql语句
            String sql = "INSERT INTO b_book (bookname, bookauthor, bookinfo, pubdate, price, booknum,bowner,book) " +
                    "VALUES(?,?,?,NOW(),?,?,?,?)";
            //获取sql语句的执行器对象
            pstm = conn.prepareStatement(sql);
            //为sql语句中的问号赋值
            pstm.setString(1, bookname);
            pstm.setString(2, bookauthor);
            pstm.setString(3, bookinfo);
            pstm.setDouble(4, price);
            pstm.setInt(5, booknum);
            pstm.setString(6, bowner);
            pstm.setString(7, book);
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
     * 根据bookid删除书籍
     * @param bookid
     */
    public void removeById(int bookid){
        Connection conn = conn = DBUtil.getConnection();;
        PreparedStatement pstmt = null;
        try {
            //准备sql语句
            String sql = "DELETE FROM b_book WHERE bookid=?";
            //获取sql语句执行器对象
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bookid);
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

    /**查询所有书本数据
     * @return
     */
    public List<Book> findAll(){
        List<Book> list = new ArrayList<Book>();
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM b_book";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                int bookid = rs.getInt(1);
                String bookname = rs.getString(2);
                String bookauthor = rs.getString(3);
                String bookinfo = rs.getString(4);
                Date pubdate = rs.getDate(5);
                double price = rs.getDouble(6);
                int booknum = rs.getInt(7);
                String bowner = rs.getString(8);
                String book = rs.getString(9);
                String defaultimg = rs.getString(10);
                Book bk = new Book(bookid,bookname,bookauthor,bookinfo,pubdate,price,booknum,bowner,book);
                bk.setDefaultimg(defaultimg);
                list.add(bk);
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
     * 根据id查询一条书本数据
     * @param bookid 要查询的书本的bookid
     * @return 数据库对应bookid的一行数据，封装为java中的一个Book对象
     */
    public Book findById(int bookid){
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM b_book where bookid=?";
        PreparedStatement pstmt = null;
        Book bk = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bookid);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                int bookid2 = rs.getInt(1);
                String bookname = rs.getString(2);
                String bookauthor = rs.getString(3);
                String bookinfo = rs.getString(4);
                Date pubdate = rs.getDate(5);
                double price = rs.getDouble(6);
                int booknum = rs.getInt(7);
                String bowner = rs.getString(8);
                String book = rs.getString(9);
                bk = new Book(bookid2,bookname,bookauthor,bookinfo,pubdate,price,booknum,bowner,book);
                String defaultimg = rs.getString(10);
                bk.setDefaultimg(defaultimg);
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

    /**
     * 根据书名查找书籍
     * @param bookname
     * @return
     */
    public Book findByBookName(String bookname){
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM b_book where bookname=?";
        PreparedStatement pstmt = null;
        Book bk = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bookname);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                int bookid = rs.getInt(1);
                String bookname2 = rs.getString(2);
                String bookauthor = rs.getString(3);
                String bookinfo = rs.getString(4);
                Date pubdate = rs.getDate(5);
                double price = rs.getDouble(6);
                int booknum = rs.getInt(7);
                String bowner = rs.getString(8);
                String book = rs.getString(9);
                bk = new Book(bookid,bookname2,bookauthor,bookinfo,pubdate,price,booknum,bowner,book);
                String defaultimg = rs.getString(10);
                bk.setDefaultimg(defaultimg);
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

    /**
     * 根据时间book查找书籍
     * @param book
     * @return
     */
    public Book findBybook(String book){
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM b_book where book=?";
        PreparedStatement pstmt = null;
        Book bk = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, book);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                int bookid = rs.getInt(1);
                String bookname2 = rs.getString(2);
                String bookauthor = rs.getString(3);
                String bookinfo = rs.getString(4);
                Date pubdate = rs.getDate(5);
                double price = rs.getDouble(6);
                int booknum = rs.getInt(7);
                String bowner = rs.getString(8);
                String book2 = rs.getString(9);
                bk = new Book(bookid,bookname2,bookauthor,bookinfo,pubdate,price,booknum,bowner,book2);
                String defaultimg = rs.getString(10);
                bk.setDefaultimg(defaultimg);
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

    /**
     * 根据上传者查找书籍
     * @param bowner
     * @return
     */
    public List<Book> findBybowner(String bowner){
        List<Book> list = new ArrayList<Book>();
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM b_book where bowner=?";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();//查询数据，将结果保存在ResultSet结果集
            while(rs.next()){//指标往下移动一行
                int bookid = rs.getInt(1);
                String bookname = rs.getString(2);
                String bookauthor = rs.getString(3);
                String bookinfo = rs.getString(4);
                Date pubdate = rs.getDate(5);
                double price = rs.getDouble(6);
                int booknum = rs.getInt(7);
                String bowner2 = rs.getString(8);
                String book = rs.getString(9);
                Book bk = new Book(bookid,bookname,bookauthor,bookinfo,pubdate,price,booknum,bowner2,book);
                String defaultimg = rs.getString(10);
                bk.setDefaultimg(defaultimg);
                list.add(bk);
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
     * 修改书本简介
     * @param bookinfo
     * @param bookid
     */
    public void modifyBookinfo(String bookinfo, int bookid){
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = DBUtil.getConnection();
        String sql = "UPDATE b_book SET bookinfo=? WHERE bookid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bookinfo);
            pstmt.setInt(2, bookid);
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
     * 修改单价
     * @param price
     * @param bookid
     */
    public void modifyPrice(double price, int bookid){
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = DBUtil.getConnection();
        String sql = "UPDATE b_book SET price=? WHERE bookid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setDouble(1, price);
            pstmt.setInt(2, bookid);
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

    public void modifydfimg(String defaultimg, String book){
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = DBUtil.getConnection();
        String sql = "UPDATE b_book SET defaultimg=? WHERE book=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, defaultimg);
            pstmt.setString(2, book);
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
