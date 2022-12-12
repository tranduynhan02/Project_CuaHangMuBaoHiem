package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.model.Comment;
import vn.edu.hcmuaf.fit.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ProductService {

    public static List<Product> getData() {
        List<Product> list = new LinkedList<>();

        return list;
    }

    public static List<Product> findProduct(String para){
        List<Product> list = new ArrayList<Product>();
        List<String> img = new ArrayList<String>();
        List<Comment> comment = new ArrayList<Comment>();
        String idp;
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select p.id, p.name, p.branch, p.price, p.size," +
                    " p.color, p.type, p.discount, p.star," +
                    " p.amount, p.decirspe from product p where name like '%para%'");
            while(rs.next()){
               idp = rs.getString("id") ;
               break;
            }
            rs.first();
            ResultSet i = statement.executeQuery("setlet img from img where id = idp");
            while(i.next()){
                img.add(rs.getString("img"));
            }
            ResultSet c = statement.executeQuery("setlet img from comment where idPro = idp");
            while(c.next()){
                comment.add(new Comment(c.getString("idPro"),c.getString("idCus"),
                        c.getString("comment")));
            }
            while (rs.next()){
                list.add(new Product(rs.getString("id"),rs.getString("name"),rs.getLong("price"),
                        rs.getString("brand"),rs.getInt("size"),rs.getString("color"),
                        rs.getString("type"),rs.getDouble("discount"),rs.getDouble("star"),
                        rs.getInt("amount"),rs.getString("decrispe"),rs.getDate("release"),rs.getInt("count")));
            }
            for(Product p :list){
                p.setImg(img);
                p.setComment(comment);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static List<Product> filterProduct(String filter){
        List<Product> result = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        ResultSet rs;
        try{
            switch (filter){
                case "price-all": rs = statement.executeQuery("select id from product");
                case "price-1" : rs = statement.executeQuery("select id from product where price between 0 and 100");
                case "price-2" : rs = statement.executeQuery("select id from product where price between 100 and 200");
                case "price-3" : rs = statement.executeQuery("select id from product where price between 200 and 300");
                case "price-4" : rs = statement.executeQuery("select id from product where price between 300 and 400");
                case "price-5" : rs = statement.executeQuery("select id from product where price between 400 and 500");
                case "star-all": rs = statement.executeQuery("select id from product");
                case "star-1" : rs = statement.executeQuery("select id from product where star between 0 and 1");
                case "star-2" : rs = statement.executeQuery("select id from product where star between 1 and 2");
                case "star-3" : rs = statement.executeQuery("select id from product where star between 2 and 3");
                case "star-4" : rs = statement.executeQuery("select id from product where star between 3 and 4");
                case "star-5" : rs = statement.executeQuery("select id from product where star between 4 and 5");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
}
