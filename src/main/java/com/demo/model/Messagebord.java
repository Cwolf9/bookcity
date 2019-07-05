/**
 * Copyright (C), 2018-2019, csust
 * FileName: Messagebord
 * Author:   Cwolf9
 * Date:     2019/07/03 11:53
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
package com.demo.model;

public class Messagebord {
    private String username;
    private String title;
    private String context;
    private String time;
    private String ava;
    private int bookid;
    private int m_id;

    public Messagebord() {
        super();
    }
    public Messagebord(String username, String title, String context, String time, String ava, int bookid,int m_id) {
        this.username = username;
        this.title = title;
        this.context = context;
        this.time = time;
        this.ava = ava;
        this.bookid = bookid;
        this.m_id = m_id;
    }
    public Messagebord(String username, String title, String context, String time, String ava, int bookid) {
        this.username = username;
        this.title = title;
        this.context = context;
        this.time = time;
        this.ava = ava;
        this.bookid = bookid;
    }
    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int getBookid() {
        return bookid;
    }

    public int getM_id() {
        return m_id;
    }

    public void setM_id(int m_id) {
        this.m_id = m_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getAva() {
        return ava;
    }

    public void setAva(String ava) {
        this.ava = ava;
    }
}
