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

import java.util.Random;

public class CodeUtil {
    public static String str() {
        String str = "ABCDEFGHJKLMNPQRSTUVWXY3456789";
        return str.charAt(new Random().nextInt(str.length()))+"";
    }
    public static void main(String[] args) {
        //System.out.println(new CodeUtil().str());
    }
}
