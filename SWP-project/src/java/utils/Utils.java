/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Minh Hoàng
 */
public class Utils {
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=BFApartment";
        conn = DriverManager.getConnection(url, "sa", "12345678");
        return conn;
    }
    
    public static String getMd5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    
    public static Date getDate(String msg) {
        boolean check = true;
        Date date = null;
        do {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            sdf.setLenient(false);
            try {
                date = sdf.parse(msg);
                check = false;
            } catch (ParseException ex) {
            }
        } while (check);
        return date;
        
    }
    
    public static boolean getBoolean(String input) {
        boolean check = false;
        try {
            if ("male".equals(input) || "1".equals(input)) {
                check = true;
            }
        } catch (Exception e) {
        }
        return check;
    }
    
    public static boolean isValidDate(String input) {
        boolean check = false;
        Date date = null;
        if (input == null) {
            input = "";
        }
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            sdf.setLenient(false);
            date = sdf.parse(input);
            if (!input.equals(sdf.format(date))) {
                date = null;
            }
            check = true;
            
        } catch (ParseException e) {
        }
        return check;
    }
    
    public static boolean inputPattern(String input, String regex) {
        boolean check = false;
        try {
            input = input.trim();
            check = input.matches(regex);
//            if (check) {
//                throw new Exception("Wrong date format!!");
//            }
        } catch (Exception e) {
        }
        return check;
    }
    
}
