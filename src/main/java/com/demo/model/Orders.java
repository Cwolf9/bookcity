/**
 * Copyright (C), 2018-2019, csust
 * FileName: Orders
 * Author:   Cwolf9
 * Date:     2019/06/27 10:07
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
package com.demo.model;

public class Orders {
    private int orderindex;
    private String orderid;
    private int uid;
    private int sid;
    private double money;
    private String name;
    private String express;

    public Orders() {
        super();
    }

    public Orders(int orderindex, String orderid, int uid, int sid, double money, String name, String express) {
        this.orderindex = orderindex;
        this.orderid = orderid;
        this.uid = uid;
        this.sid = sid;
        this.money = money;
        this.name = name;
        this.express = express;
    }

    public int getOrderindex() {
        return orderindex;
    }

    public void setOrderindex(int orderindex) {
        this.orderindex = orderindex;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getExpress() {
        return express;
    }

    public void setExpress(String express) {
        this.express = express;
    }

    @Override
    public String toString() {
        return "orderindex:"+orderindex+",orderid:"+orderid+",uid:"+uid+",sid:"+sid;
    }
}
