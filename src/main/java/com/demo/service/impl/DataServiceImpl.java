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
import com.demo.dao.OrdersDao;
import com.demo.model.Book;
import com.demo.model.Orders;
import com.demo.service.DataService;

import java.util.List;

public class DataServiceImpl implements DataService {
    private static BookDao bdao = new BookDao();
    private static BookimgsDao bidao = new BookimgsDao();
    private static OrdersDao ordao = new OrdersDao();
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

    public void saveBI(String book, String img) {
        bidao.save(book,img);
    }

    public List<Orders> findAllOrders(String orderid2) {
        return ordao.findAll(orderid2);
    }
}
