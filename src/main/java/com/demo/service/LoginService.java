/**
 * Copyright (C), 2018-2019, csust
 * FileName: LoginServiceImpl
 * Author:   Cwolf9
 * Date:     2019/06/27 8:33
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
package com.demo.service;

import com.demo.model.Admin;
import com.demo.model.Book;
import com.demo.model.User;
import com.demo.util.MD5Util;
import com.sun.org.apache.xpath.internal.operations.Bool;
import sun.nio.cs.US_ASCII;

import java.util.List;

public interface LoginService {
    void save(String account, String pwd, String username, String sex, String phonenumber);
    void save(String account, String pwd, String username, String sex);
    List<Object> getCode() ;
    User findByAccountAndPwd(String account, String pwd);
    String getSmscode(String phone);
    User findByPhonenumber(String phonenumber);
    User findUserById(int id);
    List findAllUsers();
    void removeUserById(int id);
    void modifyAvatar(String newAva, int id);
    public void saveAdmin(String adminacc, String pwd, String phonenumber);
    public void saveAdmin(String adminacc, String pwd, String phonenumber,String permission);
    void removeAdminById(int adminid2);

    List<Admin> findAllAdmin();

    void modifyUserPwd(String pwd1, int userid);

    User findByAccount(String account);

    void modifyUsername(String username, int userid);

    void modifyUserSex(String sex, int userid);

    Admin findAdminByAccount(String adminacc);

    void modifyAdminPwd(String md5Encode, int adminid);

    void modifyAdminPer(String newPermission, int adminid);

    void modifyPhonenumber(String mobile, int userid);


    Admin findAdminByMobile(String phonenumber);
    void modifyAdminPhonenumber(String mobile, int adminid);

    Admin findAdminByAccountAndPwd(String account, String pwd);

    void modifyAdminAvatar(String s, int adminid);
    List<User> findMerchant();
}
