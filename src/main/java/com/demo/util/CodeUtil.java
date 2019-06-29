/**
 * Copyright (C), 2018-2019, csust
 * FileName: CodeUtil
 * Author:   Cwolf9
 * Date:     2019/06/21 16:15
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/21           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/21
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/21
 * @since 1.0.0
 */
package com.demo.util;

import com.demo.dao.UserDao;
import com.demo.model.User;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Random;

public class CodeUtil {
    public static String str() {
        String str = "ABCDEFGHJKLMNPQRSTUVWXY3456789";
        return str.charAt(new Random().nextInt(str.length()))+"";
    }
    public static String rand() {
        String str = "1234567890";
        StringBuilder ans = new StringBuilder();
        for(int i = 0; i < 15; ++i) {
            ans.append(str.charAt(new Random().nextInt(str.length()))+"");
        }
        return ans.toString();
    }
    public static int randomInt(int start,int end){
        int rtnn = new Long(start + (long) (Math.random() * (end - start))).intValue();
        if (rtnn == start || rtnn == end) {
            return randomInt(start, end);
        }
        return rtnn;
    }
    public static double randomDouble(){
        double start=1;double end=1000;int decimal = 10;
        DecimalFormat df=new DecimalFormat("0.00");
        double rtnn = start + Math.random() * (end - start);
        if (rtnn == start || rtnn == end) {
            return randomDouble();
        }
        return new Double(df.format(rtnn).toString());
    }
    public static String randUser() {
        List<User> tmp = new UserDao().findMerchant();
        return tmp.get(new Random().nextInt(tmp.size())).getUsername();
    }
    public static void main(String[] args) {
        //System.out.println(new CodeUtil().str());
        List<User> tmp = new UserDao().findMerchant();
        for(User x: tmp) {
            System.out.println(x);
        }
    }
}
