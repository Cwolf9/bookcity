/**
 * Copyright (C), 2018-2019, csust
 * FileName: ColorUtil
 * Author:   Cwolf9
 * Date:     2019/06/23 16:00
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
package com.demo.util;

import java.awt.*;
import java.util.Random;

public class ColorUtil {
    public static Color getRandomColor() {
        Random ran = new Random();
        Color color = new Color(ran.nextInt(256),
                ran.nextInt(256), ran.nextInt(256));
        return color;
    }
}
