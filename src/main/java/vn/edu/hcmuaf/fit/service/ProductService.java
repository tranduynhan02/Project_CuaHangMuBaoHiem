package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class ProductService {

    public static List<Product> getData() {
        List<Product> list = new LinkedList<>();

        return list;
    }

    public static Product getProduct(String idp) throws SQLException {
        Product p = new Product();
        List<String> img = new ArrayList<String>();
        Map<String, List<String>> comment = new HashMap<String, List<String>>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try{
            ResultSet rsImg = statement.executeQuery("select img from image where id = idp");
            while (rsImg.next()){
                img.add(rsImg.getString("img"));
            }
            ResultSet rsIdCus = statement.executeQuery("select idCus from comment where id = idp");
            while (rsIdCus.next()){
                List<String> listComment = new ArrayList<String>();
                comment.put(rsIdCus.getString("idCus"),listComment);
            }
            for(String idc: comment.keySet()){
                ResultSet resultSet = statement.executeQuery("select comment from comment where id = idp and idCus = idc");
                List<String> listCom = comment.get(idc);
                while ((resultSet.next())){
                    listCom.add(resultSet.getString("comment"));
                }
                comment.put(idc, listCom);
            }
            ResultSet rsProduct = statement.executeQuery("select p.id, p.name, p.branch, p.price, p.size,\" +\n" +
                    "                    \" p.color, p.type, p.discount, p.star,\" +\n" +
                    "                    \" p.amount, p.decirspe from product p where id = idp");
            while (rsProduct.next()){
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
                p.setCount(rsProduct.getInt("count"));
               break;
            }
            return p;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Product> findProduct(String para){
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select id from product p where name like '%para%'");
            while(rs.next()){
               list.add(getProduct(rs.getString("id")));
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
        ResultSet rs = null;
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
            while(rs.next()){
                result.add(getProduct(rs.getString("id")));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
}
