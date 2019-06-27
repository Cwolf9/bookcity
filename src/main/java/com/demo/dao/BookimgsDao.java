/**
 * Copyright (C), 2018-2019, csust
 * FileName: BookimgsDao
 * Author:   Cwolf9
 * Date:     2019/06/26 15:42
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/26           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/26
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/26
 * @since 1.0.0
 */
package com.demo.dao;

import com.demo.model.Bookimgs;
import com.demo.util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookimgsDao {

    public void save(String book, String img) {
        String sql = "INSERT INTO b_bookimgs (book, img) VALUES(?,?)";
        DBUtil.insert(sql,book,img);
    }
    public Bookimgs findBybook(String book){
        String sql = "SELECT * FROM b_bookimgs where book=?";
        Bookimgs bk = null;
        try {
            ResultSet rs = DBUtil.select(sql,book);
            while(rs.next()){//指标往下移动一行
                String book2 = rs.getString(1);
                String img = rs.getString(2);
                bk = new Bookimgs(book2,img);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bk;
    }
    public List<Bookimgs> findByAllbooks(String book){
        String sql = "SELECT * FROM b_bookimgs where book=?";
        Bookimgs bk = null;
        List<Bookimgs> bl = new ArrayList<Bookimgs>();
        try {
            ResultSet rs = DBUtil.select(sql,book);
            while(rs.next()){//指标往下移动一行
                String book2 = rs.getString(1);
                String img = rs.getString(2);
                bk = new Bookimgs(book2,img);
                bl.add(bk);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bl;
    }
}
