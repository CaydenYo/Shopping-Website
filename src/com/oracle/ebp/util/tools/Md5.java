
package com.oracle.ebp.util.tools;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5类
 * @author jikai
 * @since 2014-6-6
 */
public class Md5 {
    
    // 全局数组
    private final static String[] strDigits = { "0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

    public Md5() {
    }

    /**
     * 处理字节型数据
     * @author jikai
     * @since 2014-6-6
     * @param bByte 字节
     * @return 数字跟字符串
     */
    private static String byteToArrayString(byte bByte) {
        int iRet = bByte;
        	//System.out.println("iRet="+iRet);
        if (iRet < 0) {
            iRet += 256;
        }
        int iD1 = iRet / 16;
        int iD2 = iRet % 16;
        return strDigits[iD1] + strDigits[iD2];
    }


    /**
     * 转换字节数组为16进制字串
     * @author jikai
     * @since 2014-6-6
     * @param bByte 字节数组
     * @return 16进制字串
     */
    private static String byteToString(byte[] bByte) {
        StringBuffer sBuffer = new StringBuffer();
        for (int i = 0; i < bByte.length; i++) {
            sBuffer.append(byteToArrayString(bByte[i]));
        }
        return sBuffer.toString();
    }

    /**
     * md5加密
     * @author jikai
     * @since 2014-6-6
     * @param strObj 字符串
     * @return md5码
     */
    public static String GetMD5Code(String strObj) {
        String resultString = null;
        try {
            resultString = new String(strObj);
            MessageDigest md = MessageDigest.getInstance("MD5");
            // md.digest() 该函数返回值为存放哈希值结果的byte数组
            resultString = byteToString(md.digest(strObj.getBytes()));
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        return resultString;
    }
}
