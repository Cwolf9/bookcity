/**
 * Copyright (C), 2018-2019, csust
 * FileName: Admin
 * Author:   Cwolf9
 * Date:     2019/06/27 11:50
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

import java.util.Date;

public class Admin {
    private int adminid;
    private String adminacc;
    private String pwd;
    private String avatar;
    private String phonenumber;
    private Date registerdate;
    private String permission;
    private String log;
    public Admin() {
        super();
    }

    public Admin(int adminid, String adminacc, String pwd, String avatar, String phonenumber, Date registerdate, String permission,String log) {
        this.adminid = adminid;
        this.adminacc = adminacc;
        this.pwd = pwd;
        this.avatar = avatar;
        this.phonenumber = phonenumber;
        this.registerdate = registerdate;
        this.permission = permission;
        this.log = log;
    }

    public String getLog() {
        return log;
    }

    public void setLog(String log) {
        this.log = log;
    }

    public int getAdminid() {
        return adminid;
    }

    public void setAdminid(int adminid) {
        this.adminid = adminid;
    }

    public String getAdminacc() {
        return adminacc;
    }

    public void setAdminacc(String adminacc) {
        this.adminacc = adminacc;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
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

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        return "adminid:"+adminid+",permission:"+permission;
    }
}
