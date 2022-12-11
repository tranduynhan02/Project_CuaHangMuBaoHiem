package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.controller.ListProduct;
import vn.edu.hcmuaf.fit.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class ProductService {
    public static List<Product> getData() {
        List<Product> list = new LinkedList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        Product p = new Product();
        try {
            ResultSet rs = statement.executeQuery("select * from products");
            while (rs.next()) {
              p = new Product(rs.getInt(1), rs.getString(2), rs.getLong(3),
                        rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7),
                        rs.getLong(8), rs.getInt(9), rs.getInt(10), rs.getString(11));
              p.addImg(rs.getString(12));
                list.add(p);

            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static Product getProductById(String idp) {
        Product p = new Product();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        String res = "select * from products where id =" + idp;
        try {
            ResultSet rs = statement.executeQuery(res);
            if (rs.next()) {
                p = new Product(rs.getInt(1), rs.getString(2), rs.getLong(3),
                        rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7),
                        rs.getLong(8), rs.getInt(9), rs.getInt(10), rs.getString(11));

                p.addImg(rs.getString(12));
            }
            res = "select * from image where id =" + idp;
            rs = statement.executeQuery(res);
            while(rs.next()){
            p.addImg(rs.getString(2));
            }
        } catch (SQLException e) {
        }
        return p;
    }

    public static void main(String[] args) {
        System.out.println(getProductById("2").getImg().get(0));
        System.out.println(getProductById("2").getImg().get(1));
        System.out.println(getProductById("2").getImg().get(2));
        System.out.println(getProductById("2").getImg().get(3));

    }
}
