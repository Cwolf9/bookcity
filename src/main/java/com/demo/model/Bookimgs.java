/**
 * Copyright (C), 2018-2019, csust
 * FileName: Bookimgs
 * Author:   Cwolf9
 * Date:     2019/06/26 15:40
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
package com.demo.model;

public class Bookimgs {
    private String book;
    private String img;

    public Bookimgs() {
        super();
    }

    public Bookimgs(String book, String img) {
        this.book = book;
        this.img = img;
    }

    public String getBook() {
        return book;
    }

    public void setBook(String book) {
        this.book = book;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
