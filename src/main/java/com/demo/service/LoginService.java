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
import com.demo.model.User;
import com.demo.util.MD5Util;
import com.sun.org.apache.xpath.internal.operations.Bool;
import sun.nio.cs.US_ASCII;

import java.util.List;

public interface LoginService {
    void save(String account, String pwd, String username, String sex, String phonenumber);
    List<Object> getCode() ;
    User findByAccountAndPwd(String account, String pwd);
    String getSmscode(String phone);
    User findByPhonenumber(String phonenumber);
    User findById(int id);
    List findAllUsers();
    void removeById(int id);
    void modifyAvatar(String newAva, int id);

    void removeAdminById(int adminid2);

    List<Admin> findAllAdmin();

    void modifyPwd(String pwd1, int userid);
}
