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
import com.demo.model.Book;
import com.demo.model.User;
import com.demo.service.DataService;
import com.demo.service.impl.DataServiceImpl;
import com.demo.util.MD5Util;
import com.demo.util.SendCodeUtil;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.regex.Pattern;

public class test {
    static DataService dts = new DataServiceImpl();
    public static void main(String[] args) {
        List<Book> allbooks = dts.findAllBooks();
        Collections.sort(allbooks, sallnum);
        List<Book> sbook = new ArrayList<Book>();
        List<Book> hotbook = new ArrayList<Book>();
        List<Book> latestbook = new ArrayList<Book>();
        List<Book> markbook = new ArrayList<Book>();
        for(int i = 0; i < 9; ++i) sbook.add(allbooks.get(i));
        for(int i = 0; i < 8; ++i) hotbook.add(allbooks.get(i));
        Collections.sort(allbooks, timenum);
        for(int i = 0; i < 8; ++i) latestbook.add(allbooks.get(i));
        Collections.sort(allbooks, marknum);
        for(Book b: allbooks) {
            System.out.println(b.getBookname()+" "+b.getMark());
        }
        for(int i = 0; i < 8; ++i) {
            markbook.add(allbooks.get(i));
            System.out.println(allbooks.get(i).getBookname()+" "+allbooks.get(i).getMark());
        }
    }
    public static String getMd5(String a) {
        return MD5Util.MD5Encode(a, "utf-8");
    }
    static Comparator<Book> sallnum = new Comparator() {
        public int compare(Object o1, Object o2) {
            Book x1 = (Book)o1;
            Book x2 = (Book)o2;
            return x2.getSallnum()-x1.getSallnum();
        }
    };
    static Comparator<Book> timenum = new Comparator() {
        public int compare(Object o1, Object o2) {
            Book x1 = (Book)o1;
            Book x2 = (Book)o2;
            return x2.getPubdate().compareTo(x1.getPubdate());
        }
    };
    static Comparator<Book> marknum = new Comparator() {
        public int compare(Object o1, Object o2) {
            Book x1 = (Book)o1;
            Book x2 = (Book)o2;
            return x2.getMark()-x1.getMark();
        }
    };
}