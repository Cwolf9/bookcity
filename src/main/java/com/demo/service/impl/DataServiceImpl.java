/**
 * Copyright (C), 2018-2019, csust
 * FileName: DataServiceImpl
 * Author:   Cwolf9
 * Date:     2019/06/27 9:39
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
package com.demo.service.impl;

import com.demo.dao.*;
import com.demo.model.*;
import com.demo.service.DataService;

import java.util.List;

public class DataServiceImpl implements DataService {
    private static AddressDao asdao = new AddressDao();
    private static BookDao bdao = new BookDao();
    private static BookimgDao bidao = new BookimgDao();
    private static OrderDao ordao = new OrderDao();
    private static OrderItemDao oidao = new OrderItemDao();
    private static MessageboardDao mdao = new MessageboardDao();
    public void saveBook(String bookname, String bookauthor, String bookinfo, double price, int booknum, String bowner, String book) {
        bdao.save(bookname, bookauthor, bookinfo, price, booknum,bowner,book);
    }

    public void saveBook(String bookname, String bookauthor, String bookinfo, double price, int booknum, String bowner, String book, String tags) {
        bdao.save(bookname, bookauthor, bookinfo, price, booknum,bowner,book,tags);
    }

    public void changeImg(String book) {
        if(bidao.findBybook(book) != null) bdao.modifydfimg(bidao.findBybook(book).getImg(), book);
    }

    public List<Book> findAllBooks() {
        return bdao.findAll();
    }

    public void removeBookById(int id) {
        bdao.removeById(id);
    }

    public void modifyBookInfoById(String BookInfo, int bookid) {
        bdao.modifyBookinfo(BookInfo, bookid);
    }

    public void modifyBookNameById(String BookName, int bookid) {
        bdao.modifyBookName(BookName, bookid);
    }

    public void modifyBookPriById(double price, int bookid) {
        bdao.modifyBookPri(price, bookid);
    }

    public void saveBI(String book, String img) {
        bidao.save(book,img);
    }

    public List<Order> findAllOrders(int ip, String uid) {
        return ordao.findAll(ip, uid);
    }

    public void removeOrderById(String orderid) {
        ordao.removeById(orderid);
    }

    public void modifydzNameById(String name, String orderid) {
        ordao.modifyName(name, orderid);
    }

    public void modifyOrderExpress(String express, String orderid) {
        ordao.modifyOrderExpress(express, orderid);
    }

    public List<OrderItem> findOIByOrderId(String orderid) {
        return oidao.findOIByOrderId(orderid);
    }

    public List<Book> findBooksByInfo(String info) {
        return bdao.findBooksByInfo(info);
    }

    public List<Book> findBooksByTags(String tags) {
        return bdao.findBooksByTags(tags);
    }

    public List<ShoppingCar> findSC(int uid) {
        return bdao.findSC(uid);
    }

    public void removeScByUB(int uid, int bookid) {
        bdao.removeScByUB(uid,bookid);
    }
    public Address findAddressById(int id) {
        return asdao.findAddressById(id);
    }
    public String saveOrder(int uid, int nextInt, double allpri, String name, int allnum) {
        return ordao.saveOrder(uid, nextInt, allpri, name, allnum);
    }

    public void saveOrderItem(String orderid, int bid, int booknum, double price, double allprice) {
        oidao.save(orderid, bid, booknum, price, allprice);
    }
    public void saveOrderItem(String orderid, int bid, int booknum, double price, double allprice,String bookname) {
        oidao.save(orderid, bid, booknum, price, allprice,bookname);
    }
    public void modifyBSByUB(int userid, int bookid, int booknum, double v) {
        bdao.modifyBSByUB(userid, bookid, booknum, v);
    }

    public void addtocart(int userid, int bid, int i, double price) {
        bdao.addtocart(userid, bid, i, price);
    }

    public Book findBooksById(int bid) {
        return bdao.findBooksById(bid);
    }

    public List<String> findBookImgsByBook(String book) {
        return bdao.findBookImgsByBook(book);
    }

    public void saveMess(String a, String b, String c, String d, String e, int f) {
        mdao.save(a, b, c, d, e, f);
    }

    public void removeMesByMid(int mid) {
        mdao.removeByMId(mid);
    }
    public List<Messagebord> findAllMes() {
        return mdao.findAllMes();
    }
    public List<Messagebord> findAllMes(int bid) {
        return mdao.findAllMes(bid);
    }
}
