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

import com.demo.dao.BookDao;
import com.demo.dao.BookimgsDao;
import com.demo.dao.OrderItemDao;
import com.demo.dao.OrdersDao;
import com.demo.model.Book;
import com.demo.model.OrderItem;
import com.demo.model.Orders;
import com.demo.service.DataService;

import java.util.List;

public class DataServiceImpl implements DataService {
    private static BookDao bdao = new BookDao();
    private static BookimgsDao bidao = new BookimgsDao();
    private static OrdersDao ordao = new OrdersDao();
    private static OrderItemDao oidao = new OrderItemDao();
    public void saveBook(String bookname, String bookauthor, String bookinfo, double price, int booknum, String bowner, String book) {
        bdao.save(bookname, bookauthor, bookinfo, price, booknum,bowner,book);
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

    public List<Orders> findAllOrders(int ip, String orderid2) {
        return ordao.findAll(ip, orderid2);
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
}
