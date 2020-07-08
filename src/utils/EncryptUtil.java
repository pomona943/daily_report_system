package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.xml.bind.DatatypeConverter;

public class EncryptUtil {
    public static String getPasswordEncrypt(String plain_p, String salt) {
        // getPasswordEncryptメソッドで、引数に受け取った文字列にsalt文字を連結したものをSHA256で暗号化。
        // この暗号化した文字列をDBに登録。パスワードの文字列をそのまま暗号化するよりも安全。
        String ret = "";

        if(plain_p != null && !plain_p.equals("")) {
            byte[] bytes;
            String password = plain_p + salt;
            try {
                bytes = MessageDigest.getInstance("SHA-256").digest(password.getBytes());
                ret = DatatypeConverter.printHexBinary(bytes);
            } catch(NoSuchAlgorithmException ex) {}
        }

        return ret;
    }
}