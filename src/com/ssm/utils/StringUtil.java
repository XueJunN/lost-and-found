package com.ssm.utils;

import java.util.UUID;

public class StringUtil {
    /**
     *获取到fileName的后缀名并返回
     * @param fileName
     * @return
     */
    public static String getSuffixName(String fileName){
        return fileName.substring(fileName.lastIndexOf("."));

    }
    public static String getRandomFileName(){
        /**
         * 生成32位随机字符序列
         * @return
         */
        return UUID.randomUUID().toString().replace("-","");
    }
}
