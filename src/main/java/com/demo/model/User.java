/**
 * Copyright (C), 2018-2019, csust
 * FileName: User
 * Author:   Cwolf9
 * Date:     2019/06/22 13:37
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/22           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/22
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/22
 * @since 1.0.0
 */
package com.demo.model;

import java.util.Date;

public class User {
    //属性-成员变量
    private int id;
    private String account;
    private String pwd;
    private String username;
    private String sex;
    private String avatar;
    private String phonenumber;
    private Date registerdate;
    //无参数的构造器

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getAccount() {
        return account;
    }
    public void setAccount(String account) {
        this.account = account;
    }
    public String getPwd() {
        return pwd;
    }
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getAvatar() {
        return avatar;
    }
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    public String getPhonenumber() {
        return phonenumber;
    }
    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }
    public Date getRegisterdate() {
        return registerdate;
    }
    public void setRegisterdate(Date registerdate) {
        this.registerdate = registerdate;
    }

    public User() {
        super();
    }

    public User(int id, String account, String pwd, String username, String sex, String avatar, String phonenumber,
                Date registerdate) {
        super();
        this.id = id;
        this.account = account;
        this.pwd = pwd;
        this.username = username;
        this.sex = sex;
        this.avatar = avatar;
        this.phonenumber = phonenumber;
        this.registerdate = registerdate;
    }

    @Override
    public String toString() {
        //return super.toString();
        return "id:"+id+",account:"+account+",username:"+username;
    }
}
