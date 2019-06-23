/**
 * Copyright (C), 2018-2019, csust
 * FileName: Address
 * Author:   Cwolf9
 * Date:     2019/06/22 19:58
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * Cwolf9           2019/06/22           2018.3
 * <p>
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/22
 * @since 1.0.0
 */
/**
 * 〈可怕的是比你强的人比你还努力〉
 * 〈〉
 *
 * @author Cwolf9
 * @create 2019/06/22
 * @since 1.0.0
 */
package com.demo.model;

public class Address {
    private int id;
    private String name;
    private int uid;
    private String isdefault;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }
    public String getIsdefault() {
        return isdefault;
    }
    public void setIsdefault(String isdefault) {
        this.isdefault = isdefault;
    }
    public Address() {
        super();
    }
    public Address(int id, String name, int uid, String isdefault) {
        super();
        this.id = id;
        this.name = name;
        this.uid = uid;
        this.isdefault = isdefault;
    }
}
