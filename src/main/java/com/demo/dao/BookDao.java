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
import com.demo.model.ShoppingCar;
import com.demo.model.User;
import com.demo.util.CodeUtil;
import com.demo.util.ColorUtil;
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
        new BookDao().save("算法进阶", "刘流"
                ,"春天里出版社", CodeUtil.randomDouble(),CodeUtil.randomInt(1,100),CodeUtil.randUser(),CodeUtil.rand());
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
        String sql = "INSERT INTO b_book (bookname, bookauthor, bookinfo, pubdate, price, booknum,bowner,book) " +
                "VALUES(?,?,?,NOW(),?,?,?,?)";
        DBUtil.insert(sql,bookname,bookauthor,bookinfo,price,booknum,bowner,book);
    }
    public void save(String bookname,String bookauthor,String bookinfo,double price,int booknum,String bowner,String book,String tags){
        String sql = "INSERT INTO b_book (bookname, bookauthor, bookinfo, pubdate, price, booknum,bowner,book,tags) " +
                "VALUES(?,?,?,NOW(),?,?,?,?,?)";
        DBUtil.insert(sql,bookname,bookauthor,bookinfo,price,booknum,bowner,book,tags);
    }
    /**
     * 根据bookid删除书籍
     * @param bookid
     */
    public void removeById(int bookid){
        String sql = "DELETE FROM b_book WHERE bookid=?";
        DBUtil.delete(sql,bookid);
    }
    /**
     * 修改书本简介
     * @param bookinfo
     * @param bookid
     */
    public void modifyBookinfo(String bookinfo, int bookid){
        String sql = "UPDATE b_book SET bookinfo=? WHERE bookid=?";
        DBUtil.update(sql,bookinfo,bookid);
    }

    /**
     * 修改单价
     * @param price
     * @param bookid
     */
    public void modifyPrice(double price, int bookid){
        String sql = "UPDATE b_book SET price=? WHERE bookid=?";
        DBUtil.update(sql,price,bookid);
    }

    public void modifydfimg(String defaultimg, String book){
        String sql = "UPDATE b_book SET defaultimg=? WHERE book=?";
        DBUtil.update(sql, defaultimg,book);
    }

    public void modifyBookName(String bookName, int bookid) {
        String sql = "UPDATE b_book SET bookname=? WHERE bookid=?";
        DBUtil.update(sql, bookName,bookid);
    }

    public void modifyBookPri(double price, int bookid) {
        String sql = "UPDATE b_book SET price=? WHERE bookid=?";
        DBUtil.update(sql, price,bookid);
    }

    public List<Book> util1(String sql) {
        List<Book> list = new ArrayList<Book>();
        try {
            ResultSet rs = DBUtil.select(sql);
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
                int mark = rs.getInt(11);
                int sallnum = rs.getInt(12);
                String tags = rs.getString(13);
                Book bk = new Book(bookid,bookname,bookauthor,bookinfo,pubdate,price,booknum,bowner,book,mark,sallnum,tags);
                bk.setDefaultimg(defaultimg);
                list.add(bk);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Book> util1(String sql, Object... args) {
        List<Book> list = new ArrayList<Book>();
        try {
            ResultSet rs = DBUtil.select(sql, args);
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
                int mark = rs.getInt(11);
                int sallnum = rs.getInt(12);
                String tags = rs.getString(13);
                Book bk = new Book(bookid,bookname,bookauthor,bookinfo,pubdate,price,booknum,bowner,book,mark,sallnum,tags);
                bk.setDefaultimg(defaultimg);
                list.add(bk);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    /**查询所有书本数据
     * @return
     */
    public List<Book> findAll(){
        String sql = "SELECT * FROM b_book";
        return util1(sql);
    }
    /**
     * 根据上传者查找书籍
     * @param bowner
     * @return
     */
    public List<Book> findBybowner(String bowner){
        String sql = "SELECT * FROM b_book where bowner=?";
        return util1(sql,bowner);
    }
    public List<Book> findBooksByInfo(String info) {
        String sql = "SELECT * FROM b_book where bookname like ? or bookinfo like ? or tags like ?";
        return util1(sql,info, info, info);
    }
    public List<Book> findBooksByTags(String wenxue) {
        String sql = "SELECT * FROM b_book where tags like ?";
        return util1(sql,wenxue);
    }
    /**
     * 根据id查询一条书本数据
     * @param bookid 要查询的书本的bookid
     * @return 数据库对应bookid的一行数据，封装为java中的一个Book对象
     */
    public Book findById(int bookid){
        String sql = "SELECT * FROM b_book where bookid=?";
        return util1(sql,bookid).get(0);
    }
    /**
     * 根据书名查找书籍
     * @param bookname
     * @return
     */
    public Book findByBookName(String bookname){
        String sql = "SELECT * FROM b_book where bookname=?";
        return util1(sql,bookname).get(0);
    }
    /**
     * 根据时间book查找书籍
     * @param book
     * @return
     */
    public Book findBybook(String book){
        String sql = "SELECT * FROM b_book where book=?";
        return util1(sql,book).get(0);
    }


    public List<ShoppingCar> findSC(int uid) {
        String sql = "SELECT defaultimg,bookname,tags,b_shoppingcart.booknum,price,b_book.bookid" +
                " FROM b_user,b_shoppingcart,b_book where b_user.userid=b_shoppingcart.uid and b_book.bookid = b_shoppingcart.bookid and b_user.userid=?";
        List<ShoppingCar> list = new ArrayList<ShoppingCar>();
        try {
            ResultSet rs = DBUtil.select(sql, uid);
            while(rs.next()){//指标往下移动一行
                String img = rs.getString(1);
                String img1 = rs.getString(2);
                String img2 = rs.getString(3);
                int a = rs.getInt(4);
                double a1 = rs.getDouble(5);
                int bookid = rs.getInt(6);
                double a2 = a1 * a;
                ShoppingCar bk = new ShoppingCar(bookid,img,img1,img2,a,a1,a2);
                list.add(bk);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void removeScByUB(int uid, int bookid) {
        String sql = "DELETE FROM b_shoppingcart WHERE uid=? and bookid=?";
        DBUtil.delete(sql,uid,bookid);
    }

    public void modifyBSByUB(int uid, int bookid, int booknum,double cartmoney) {
        String sql = "update b_shoppingcart set booknum = ? WHERE uid=? and bookid=?";
        DBUtil.update(sql,booknum,uid,bookid);
        sql = "update b_shoppingcart set cartmoney = ? WHERE uid=? and bookid=?";
        DBUtil.update(sql,cartmoney,uid,bookid);
    }

    public void addtocart(int uid, int bookid,int booknum,double price) {
        String sql = "INSERT INTO b_shoppingcart (uid,bookid,booknum,cartmoney) " +
                "VALUES(?,?,?,?)";
        DBUtil.insert(sql,uid,bookid,booknum,price);
    }

    public Book findBooksById(int bid) {
        String sql = "SELECT * FROM b_book where bookid=?";
        return util1(sql,bid).get(0);
    }

    public List<String> findBookImgsByBook(String book) {
        String sql = "SELECT img FROM b_bookimgs where book=?";
        List<String> list = new ArrayList<String>();
        try {
            ResultSet rs = DBUtil.select(sql, book);
            while(rs.next()){
                String img = rs.getString(1);
                list.add(img);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
//TODO: 购物车在BOOKDAO