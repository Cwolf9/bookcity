/**
 * Copyright (C), 2018-2019, csust
 * FileName: test
 * Author:   Cwolf9
 * Date:     2019/06/23 15:22
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/23           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/23
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/23
 * @since 1.0.0
 */
package com.demo.test;

import com.demo.dao.UserDao;
import com.demo.model.User;
import com.demo.util.MD5Util;
import com.demo.util.SendCodeUtil;

import java.util.List;

public class test {
    public static void main(String[] args) {
        //new UserDao().save("zj","zj","张杰","男","1362873");
        // SendCodeUtil.sendsms("15172425261");
//        List<User> users = new UserDao().findAll();
//        for(User user: users) {
//            new UserDao().modifyPwd(MD5Util.MD5Encode(user.getPwd(),"utf-8"), user.getUserid());
//        }
        System.out.println(MD5Util.MD5Encode("123dafd-*/@#$%+...kjgjkhgjh","utf-8"));
    }
}