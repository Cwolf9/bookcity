/**
 * Copyright (C), 2018-2019, csust
 * FileName: ShoppingCar
 * Author:   Cwolf9
 * Date:     2019/07/01 22:52
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/07/01           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/07/01
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/07/01
 * @since 1.0.0
 */
package com.demo.model;

public class ShoppingCar {
    private int bookid;
    private String imgs;
    private String bookname;
    private String tags;
    private int booknum;
    private double price;
    private double allprice;

    public ShoppingCar() {
    }

    public ShoppingCar(int bookid,String imgs, String bookname, String tags, int booknum, double price, double allprice) {
        this.bookid = bookid;
        this.imgs = imgs;
        this.bookname = bookname;
        this.tags = tags;
        this.booknum = booknum;
        this.price = price;
        this.allprice = allprice;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getImgs() {
        return imgs;
    }

    public void setImgs(String imgs) {
        this.imgs = imgs;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public int getBooknum() {
        return booknum;
    }

    public void setBooknum(int booknum) {
        this.booknum = booknum;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getAllprice() {
        return allprice;
    }

    public void setAllprice(double allprice) {
        this.allprice = allprice;
    }
}
