package com.demo.service;

import com.demo.model.*;

import java.util.List;

public interface DataService {
    void saveBook(String bookname, String bookauthor, String bookinfo, double price, int booknum,String bowner,String book);
    void saveBook(String bookname, String bookauthor, String bookinfo, double price, int booknum,String bowner,String book,String tags);
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

    List<Book> findBooksByTags(String tags);

    List<ShoppingCar> findSC(int uid);

    void removeScByUB(int uid, int bookid);
    public Address findAddressById(int id);

    String saveOrder(int uid, int nextInt, double allpri, String name, int allnum);

    void saveOrderItem(String orderid, int bid, int booknum, double price, double allprice);

    void modifyBSByUB(int userid, int bookid, int booknum, double v);

    void addtocart(int userid, int bid, int i, double price);

    Book findBooksById(int bid);

    List<String> findBookImgsByBook(String book);
}
