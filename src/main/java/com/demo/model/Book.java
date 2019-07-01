/**
 * Copyright (C), 2018-2019, csust
 * FileName: Book
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
package com.demo.model;

import java.util.Date;

public class Book {
    //属性-成员变量
    private int bookid;
    private String bookname;
    private String bookauthor;
    private String bookinfo;
    private Date pubdate;
    private double price;
    private int booknum;
    private String bowner;
    private String book;
    private String defaultimg;
    private int mark;
    private int sallnum;
    private String tags;
    public Book() {super();}
    public Book(int bookid, String bookname, String bookauthor, String bookinfo, Date pubdate, double price, int booknum,String bowner,String book,int mark,int sallnum,String tags) {
        this.bookid = bookid;
        this.bookname = bookname;
        this.bookauthor = bookauthor;
        this.bookinfo = bookinfo;
        this.pubdate = pubdate;
        this.price = price;
        this.booknum = booknum;
        this.bowner = bowner;
        this.book = book;
        this.mark = mark;
        this.sallnum = sallnum;
        this.tags = tags;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getDefaultimg() {
        return defaultimg;
    }

    public void setDefaultimg(String defaultimg) {
        this.defaultimg = defaultimg;
    }

    public String getBook() {
        return book;
    }

    public void setBook(String book) {
        this.book = book;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getBookauthor() {
        return bookauthor;
    }

    public void setBookauthor(String bookauthor) {
        this.bookauthor = bookauthor;
    }

    public String getBookinfo() {
        return bookinfo;
    }

    public void setBookinfo(String bookinfo) {
        this.bookinfo = bookinfo;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getBooknum() {
        return booknum;
    }

    public void setBooknum(int booknum) {
        this.booknum = booknum;
    }
    public String getBowner() {
        return bowner;
    }

    public void setBowner(String bowner) {
        this.bowner = bowner;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    public int getSallnum() {
        return sallnum;
    }

    public void setSallnum(int sallnum) {
        this.sallnum = sallnum;
    }

    @Override
    public String toString() {
        return "bookid:"+bookid+",bookname:"+bookname+",price:"+price;
    }
}
