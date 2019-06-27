/**
 * Copyright (C), 2018-2019, csust
 * FileName: UploadServiceImpl
 * Author:   Cwolf9
 * Date:     2019/06/27 9:29
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

import com.demo.model.User;
import com.demo.service.UploadService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class UploadServiceImpl implements UploadService {
    public List<FileItem> uploadimg(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //文件上传：
        DiskFileItemFactory dfif = new DiskFileItemFactory();
        ServletFileUpload parser = new ServletFileUpload(dfif);
        List<FileItem> items = null;
        try {
            items = parser.parseRequest(request);
        }catch(Exception e) {
            e.printStackTrace();
        }
        return items;
    }
}
