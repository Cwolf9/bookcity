/**
 * Copyright (C), 2018-2019, csust
 * FileName: MessageboardDao
 * Author:   Cwolf9
 * Date:     2019/07/03 11:55
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/07/03           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/07/03
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/07/03
 * @since 1.0.0
 */
package com.demo.dao;

import com.demo.model.Book;
import com.demo.model.Messagebord;
import com.demo.util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MessageboardDao {
    public void save(String a, String b, String c,String d, String e,int f) {
        String sql = "insert into messageboard (username, title, context,time,ava,bookid) values (?, ?, ?,?,?,?)";
        DBUtil.insert(sql,a,b,c,d,e,f);
    }
    public void removeByMId(int mid) {
        String sql = "delete from messageboard where mid = ?";
        DBUtil.delete(sql,mid);
    }

    public List<Messagebord> findAllMes() {
        List<Messagebord> list = new ArrayList<Messagebord>();
        String sql = "select * from messageboard";
        try {
            ResultSet rs = DBUtil.select(sql);
            while(rs.next()){//指标往下移动一行
                String username = rs.getString(1);
                String title = rs.getString(2);
                String context = rs.getString(3);
                String time = rs.getString(4);
                int bid = rs.getInt(5);
                String ava = rs.getString(6);
                int mid = rs.getInt(7);
                Messagebord bk = new Messagebord(username,title,context,time,ava,bid,mid);
                list.add(bk);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Messagebord> findAllMes(int bid) {
        List<Messagebord> list = new ArrayList<Messagebord>();
        String sql = "select * from messageboard where bookid = ?";
        try {
            ResultSet rs = DBUtil.select(sql,bid);
            while(rs.next()){//指标往下移动一行
                String username = rs.getString(1);
                String title = rs.getString(2);
                String context = rs.getString(3);
                String time = rs.getString(4);
                int bid2 = rs.getInt(5);
                String ava = rs.getString(6);
                int mid = rs.getInt(7);
                Messagebord bk = new Messagebord(username,title,context,time,ava,bid2,mid);
                list.add(bk);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
