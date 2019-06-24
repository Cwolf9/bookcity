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
import com.demo.util.SendCodeUtil;

public class test {
    public static void main(String[] args) {
        new UserDao().save("zj","zj","张杰","男","1362873");
        // SendCodeUtil.sendsms("15172425261");
    }
}
