/**
 * Copyright (C), 2018-2019, csust
 * FileName: OrderItem
 * Author:   Cwolf9
 * Date:     2019/06/28 15:40
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/28           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/28
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/28
 * @since 1.0.0
 */
package com.demo.model;

public class OrderItem {
    private String orderid;
    private int bookid;
    private int booknum;
    private double singleprice;
    private double allmoney;

    public OrderItem() {
        super();
    }

    public OrderItem(String orderid, int bookid, int booknum, double singleprice, double allmoney) {
        this.orderid = orderid;
        this.bookid = bookid;
        this.booknum = booknum;
        this.singleprice = singleprice;
        this.allmoney = allmoney;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int getBooknum() {
        return booknum;
    }

    public void setBooknum(int booknum) {
        this.booknum = booknum;
    }

    public double getSingleprice() {
        return singleprice;
    }

    public void setSingleprice(double singleprice) {
        this.singleprice = singleprice;
    }

    public double getAllmoney() {
        return allmoney;
    }

    public void setAllmoney(double allmoney) {
        this.allmoney = allmoney;
    }

    @Override
    public String toString() {
        return "bookid:"+bookid+",booknum:"+booknum+",allmoney:"+allmoney;
    }
}
