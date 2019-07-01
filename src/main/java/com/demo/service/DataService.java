package com.demo.service;

import com.demo.model.Book;
import com.demo.model.OrderItem;
import com.demo.model.Orders;

import java.util.List;

public interface DataService {
    void saveBook(String bookname, String bookauthor, String bookinfo, double price, int booknum,String bowner,String book);
    void changeImg(String book);
    List<Book> findAllBooks();
    void removeBookById(int id);
    void modifyBookNameById(String BookName, int bookid);
    void modifyBookInfoById(String BookInfo, int bookid);
    void modifyBookPriById(double price, int bookid);

    void saveBI(String book, String img);

    List<Orders> findAllOrders(int ip,String orderid2);
    void removeOrderById(String orderid);

    void modifydzNameById(String name, String orderid);

    void modifyOrderExpress(String rand, String orderid);
    List<OrderItem> findOIByOrderId(String orderid);

    List<Book> findBooksByInfo(String info);

    List<Book> findBooksByTags(String 文学);
}
