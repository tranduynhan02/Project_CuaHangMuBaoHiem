package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.controller.ListProduct;
import vn.edu.hcmuaf.fit.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class ProductService {
    public static List<Product> getData() {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select id_product from product");
            while (rs.next()){
                list.add(getProduct(rs.getString("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static Product getProduct(String idp) throws SQLException {
        Product p = new Product();
        List<String> img = new ArrayList<String>();
        Map<String, List<String>> comment = new HashMap<String, List<String>>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rsImg = statement.executeQuery("select link_image from image where id_product = "+ idp);
            while (rsImg.next()) {
                img.add(rsImg.getString("link_image"));
            }
            ResultSet rsIdCus = statement.executeQuery("select id_customer from comment where id_product = "+ idp);
            while (rsIdCus.next()) {
                List<String> listComment = new ArrayList<String>();
                comment.put(rsIdCus.getString("id_customer"), listComment);
            }
            for (String idc : comment.keySet()) {
                ResultSet resultSet = statement.executeQuery("select comment from comment where id_product ="+ idp+" and id_customer = "+ idc);
                List<String> listCom = comment.get(idc);
                while ((resultSet.next())) {
                    listCom.add(resultSet.getString("comment"));
                }
                comment.put(idc, listCom);
            }
            ResultSet rsProduct = statement.executeQuery("select p.name, p.brand, p.price, p.type, dp.size, dp.color, p.discount, p.decrispe, p.release, dp.quantity, s.star, s.amount from product p join detail_product dp on p.id_product = dp.id_product join star_vote s on s.id_product = p.id_product where p.id_product = "+ idp);
            while (rsProduct.next()) {
                p.setId(idp);
                p.setName(rsProduct.getString("name"));
                p.setBrand(rsProduct.getString("brand"));
                p.setPrice(rsProduct.getLong("price"));
                p.setSize(rsProduct.getString("size"));
                p.setColor(rsProduct.getString("color"));
                p.setType(rsProduct.getString("type"));
                p.setDiscount(rsProduct.getDouble("discount"));
                p.setImg(img);
                p.setStar(rsProduct.getDouble("star"));
                p.setAmount(rsProduct.getInt("amount"));
                p.setComment(comment);
                p.setDecrispe(rsProduct.getString("decrispe"));
                p.setRelease(rsProduct.getDate("release"));
                p.setCount(rsProduct.getInt("quantity"));
                break;
            }
            return p;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static List<Product> findProduct(String para) {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select id_product from product where name like '%"+para+"%'");
            while (rs.next()) {
                list.add(getProduct(rs.getString("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }


    public static List<Product> filterProduct(String[] price, String[] star) {
        List<Product> result = new ArrayList<Product>();
        List<String> priceProduct = new ArrayList<String>();
        List<String> starProduct = new ArrayList<String>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        if(price == null){
            try {
                ResultSet rs = statement.executeQuery("select id_product from product");
                while (rs.next()) {
                    priceProduct.add(rs.getString("id_product"));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else{
            for(String key:price){
                switch (key){
                    case "price-1":{
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from product where price>=0 and price<=100000");
                            while (rs.next()) {
                                priceProduct.add(rs.getString("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "price-2":{
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from product where price>=100000 and price<=200000");
                            while (rs.next()) {
                                priceProduct.add(rs.getString("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "price-3":{
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from product where price>=200000 and price<=300000");
                            while (rs.next()) {
                                priceProduct.add(rs.getString("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "price-4":{
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from product where price>=300000 and price<=400000");
                            while (rs.next()) {
                                priceProduct.add(rs.getString("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "price-5":{
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from product where price>=400000 and price<=500000");
                            while (rs.next()) {
                                priceProduct.add(rs.getString("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    default:
                }
            }
        }
        if(star == null){
            try {
                ResultSet rs = statement.executeQuery("select id_product from product");
                while (rs.next()) {
                    starProduct.add(rs.getString("id_product"));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else{
            for(String key:star){
                switch (key){
                    case "star-1":{
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from star_vote where star>=0 and star<=100000");
                            while (rs.next()) {
                                starProduct.add(rs.getString("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "star-2":{
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from star_vote where star>=1 and star<=2");
                            while (rs.next()) {
                                starProduct.add(rs.getString("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "star-3":{
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from star_vote where star>=2 and star<=3");
                            while (rs.next()) {
                                starProduct.add(rs.getString("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "star-4":{
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from star_vote where star>=3 and star<=4");
                            while (rs.next()) {
                                starProduct.add(rs.getString("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "star-5":{
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from star_vote where star>=4 and star<=5");
                            while (rs.next()) {
                                starProduct.add(rs.getString("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    default:
                }
            }
        }
        for(String st:priceProduct){
            if (starProduct.contains(st)){
                try {
                    result.add(getProduct(st));
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(getData());
    }
}
