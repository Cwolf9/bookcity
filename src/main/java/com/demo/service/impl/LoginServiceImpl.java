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
package com.demo.service.impl;

import com.demo.dao.AddressDao;
import com.demo.dao.AdminDao;
import com.demo.dao.UserDao;
import com.demo.model.Admin;
import com.demo.model.User;
import com.demo.service.LoginService;
import com.demo.util.CodeUtil;
import com.demo.util.ColorUtil;
import com.demo.util.MD5Util;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class LoginServiceImpl implements LoginService {
    private static AddressDao adrdao = new AddressDao();
    private static UserDao udao = new UserDao();
    private static AdminDao addao = new AdminDao();
    public void save(String account, String pwd, String username, String sex, String phonenumber) {
        udao.save(account, pwd, username, sex, phonenumber);
    }
    public void save(String account, String pwd, String username, String sex) {
        udao.save(account, pwd, username, sex);
    }
    public void saveAdmin(String adminacc, String pwd, String phonenumber){
        addao.saveAdmin(adminacc, pwd, phonenumber);
    }
    public void saveAdmin(String adminacc, String pwd, String phonenumber,String permission) {
        addao.saveAdmin(adminacc, pwd, phonenumber, permission);
    }
    public List<Object> getCode() {
        //画一张图片验证码传给服务器
        List<Object> a = new ArrayList<Object>();
        int WIDTH = 100, HEIGHT = 30;
        BufferedImage img = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics g = img.getGraphics();
        String code = "";g.setColor(Color.BLACK);g.fillRect(0,0,100,30);g.setColor(ColorUtil.getRandomColor());g.setFont(new Font("", Font.BOLD, 30));
        String s = CodeUtil.str();code += s;g.setColor(ColorUtil.getRandomColor());g.drawString(s, 10, 20);s = CodeUtil.str();code += s;g.setColor(ColorUtil.getRandomColor());g.drawString(s, 30, 20);s = CodeUtil.str();code += s;g.setColor(ColorUtil.getRandomColor());g.drawString(s, 60, 20);s = CodeUtil.str();code += s;g.setColor(ColorUtil.getRandomColor());g.drawString(s, 80, 20);
        a.add(code);
        Random ran = new Random();
        // 随机画线
        for (int i = 0; i < 10; i++) {
            g.setColor(ColorUtil.getRandomColor());
            g.drawLine(ran.nextInt(WIDTH), ran.nextInt(HEIGHT), ran.nextInt(WIDTH), ran.nextInt(HEIGHT));
        }
        a.add(img);
        return a;
    }

    public User findByAccountAndPwd(String account, String pwd) {
        return  udao.findByAccountAndPwd(account, pwd);
    }

    public String getSmscode(String phone) {
        //发送手机验证码：网易云短信发送接口
        //String smscode = SendCodeUtil.sendsms(phone);
        String str[] = {
                "{\"obj\":\"443587\"}",
                "{\"obj\":\"384762\"}",
                "{\"obj\":\"983622\"}",
                "{\"obj\":\"456747\"}",
                "{\"obj\":\"129856\"}"
        };
        String smscode = str[new Random().nextInt(str.length)];
        return smscode;
    }

    public User findByPhonenumber(String phonenumber) {
        return udao.findByPhonenumber(phonenumber);
    }

    public User findUserById(int id) {
        return udao.findById(id);
    }

    public List findAllUsers() {
        return udao.findAll();
    }

    public void removeUserById(int id) {
        udao.removeById(id);
    }
    public void modifyAvatar(String newAva, int id) {
        udao.modifyAvatar(newAva, id);
    }

    public void modifyUsername(String username, int userid) {
        udao.modifyUsername(username, userid);
    }

    public void modifyUserSex(String sex, int userid) {
        udao.modifyUserSex(sex, userid);
    }

    public void removeAdminById(int adminid2) {
        addao.removeById(adminid2);
    }

    public List<Admin> findAllAdmin() {
        return addao.findAll();
    }

    public void modifyUserPwd(String pwd1, int userid) {
        udao.modifyPwd(pwd1,userid);
    }

    public User findByAccount(String account) {
        return udao.findByAccount(account);
    }

    public Admin findAdminByAccount(String adminacc) {
        return addao.findAdminByAccount(adminacc);
    }

    public void modifyAdminPer(String newPermission, int adminid) {
        addao.modifyAdminPer(newPermission,adminid);
    }

    public void modifyAdminPwd(String md5Encode, int adminid) {
        addao.modifyAdminPwd(md5Encode,adminid);
    }

    public void modifyPhonenumber(String mobile, int userid) { udao.modifyPhonenumber(mobile,userid); }

    public Admin findAdminByMobile(String phonenumber) { return addao.findAdminByMobile(phonenumber); }

    public void modifyAdminPhonenumber(String mobile, int adminid) { addao.modifyAdminPhonenumber(mobile, adminid); }

    public Admin findAdminByAccountAndPwd(String account, String pwd) {
        return addao.findAdminByAccountAndPwd(account, pwd);
    }

    public void modifyAdminAvatar(String s, int adminid) {
        addao.modifyAdminAvatar(s, adminid);
    }

    public List<User> findMerchant() {
        return udao.findMerchant();
    }

    public void saveAddress(int uid, String dizhi, String isdefault) {
        adrdao.save(dizhi,uid,isdefault);
    }
}
