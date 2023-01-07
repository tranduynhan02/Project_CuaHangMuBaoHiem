package vn.edu.hcmuaf.fit.service;

import org.apache.commons.codec.digest.DigestUtils;
import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.model.Product;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.regex.Pattern;

public class CustomerService {
    public static List<Customer> getData() {
        List<Customer> list = new LinkedList<>();

        return list;
    }
    public static String toMD5(String password) {
        return DigestUtils.md5Hex(password).toLowerCase();
    }
    public static String GetKey() {
        StringBuilder sb = new StringBuilder("ct_");
        sb.append(LocalDateTime.now());
        return sb.toString();
    }

    public static void addCustomer(String username, String password, String name, String email) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
//        String sql = "insert into customer values ('" + GetKey() + "'," + "'" + name + "'," + "'" + email + "', null," + "null,'" + username + "'," + "'" + password + "',0,1," + "'" + LocalDateTime.now() + "')";
        String sql = "insert into customer values ('" + GetKey() + "','" + name + "','" + email + "', null,null,'" + username + "','" + password + "',0,1,'" + LocalDateTime.now() + "')";
        dbConnect.get().executeUpdate(sql);
    }

    public static boolean checkLogin(String username, String password) throws SQLException {
        boolean isLogin = false;
        DBConnect dbConnect = DBConnect.getInstance();
        String sql = "select * from customer where username = ? and password = ?";
        PreparedStatement pre = dbConnect.getConnection().prepareStatement(sql);
        pre.setString(1, username);
        pre.setString(2, password);
        ResultSet rs = pre.executeQuery();
        if (rs.next()) {
            isLogin = true;
        }
        return isLogin;
    }

    public static boolean checkUsername(String username) throws SQLException {
        boolean isUsername = false;
        DBConnect dbConnect = DBConnect.getInstance();
        String sql = "select * from customer where username = ?";
        PreparedStatement pre = dbConnect.getConnection().prepareStatement(sql);
        pre.setString(1, username);
        ResultSet rs = pre.executeQuery();
        if (rs.next()) {
            isUsername = true;
        }
        return isUsername;
    }

    public static boolean checkEmail(String email) throws SQLException {
        boolean isEmail = false;
        DBConnect dbConnect = DBConnect.getInstance();
        String sql = "select * from customer where email = ?";
        PreparedStatement pre = dbConnect.getConnection().prepareStatement(sql);
        pre.setString(1, email);
        ResultSet rs = pre.executeQuery();
        if (rs.next()) {
            isEmail = true;
        }
        return isEmail;
    }

    public static boolean emailValidate(String email) {
        String regexPattern = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@" + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
        return Pattern.compile(regexPattern).matcher(email).matches();
    }

    public static boolean pwValidate(String password, String confirm_pw) {
        boolean isPassword = false;
        if (password.equals(confirm_pw)) {
            isPassword = true;
        }
        return isPassword;
    }

    public static void main(String[] args) throws SQLException, NoSuchAlgorithmException {
//        System.out.println(emailValidate("@tran.duyn.han@gm.ail.com"));
//        System.out.println(pwValidate("nhandz", "nhandz"));
//        addCustomer("nhandz", "123123", "iam", "123@gmail.com");
//        System.out.println(toMD5("1"));
    }
}
