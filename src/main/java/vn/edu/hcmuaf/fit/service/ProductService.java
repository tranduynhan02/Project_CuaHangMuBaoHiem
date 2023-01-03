package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.model.DetailProduct;
import vn.edu.hcmuaf.fit.model.Product;

import java.sql.PreparedStatement;
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

    public static Product getProduct(String idp) throws SQLException {
        Product p = new Product();
        p.setId(idp);
        p.setName(getname(idp));
        p.setPrice(getprice(idp));
        p.setBrand(getbrand(idp));
        p.setType(gettype(idp));
        p.setDiscount(getdiscount(idp));
        p.setImg(getimg(idp));
        p.setStar(getstar(idp));
        p.setAmount(getamount(idp));
        p.setComment(getcomment(idp));
        p.setRelease(getrelease(idp));
        p.setDecrispe(getdecrispe(idp));
        p.setDetail(getdetail(idp));
        return p;
    }

    public static Map<String, List<String>> getcomment(String id) throws SQLException {
        Map<String,List<String>> comment = new HashMap<String,List<String>>();
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select id_customer, comment from comment where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        while (rs.next()){
            String id_cus = rs.getString("id_customer");
            String com = rs.getString("comment");
            if(comment.containsKey(id_cus)){
                comment.get(id_cus).add(com);
                comment.put(id_cus,comment.get(id_cus));
            }else{
                List<String> comm = new ArrayList<String>();
                comm.add(com);
                comment.put(id_cus,comm);
            }
        }
        return comment;
    }
    public static List<DetailProduct> getdetail (String id) throws SQLException {
        List<DetailProduct> detail = new ArrayList<DetailProduct>();
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select id_dp, size, color, quantity from detail_product where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        if(rs.next()){
            detail.add(new DetailProduct(rs.getString("id_dp"),rs.getString("size"),rs.getString("color"), rs.getInt("quantity")));
        }
        return detail;
    }
    public static List<String> getimg (String id) throws SQLException {
        List<String> img = new ArrayList<String>();
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select link_image from image where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        while(rs.next()){
            img.add(rs.getString("link_image"));
        }
        return img;
    }

    public static String getname (String id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select name from product where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        if(rs.next()){
            return rs.getString("name");
        }
        return null;
    }
    public static long getprice (String id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select price from product where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        if(rs.next()){
            return rs.getLong("price");
        }
        return 0;
    }
    public static String getbrand (String id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select brand from product where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        if(rs.next()){
            return rs.getString("brand");
        }
        return null;
    }
    public static String gettype (String id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select type from product where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        if(rs.next()){
            return rs.getString("type");
        }
        return null;
    }
    public static double getdiscount (String id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select discount from product where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        if(rs.next()){
            return rs.getDouble("discount");
        }
        return 0;
    }
    public static Double getstar (String id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select star from star_vote where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        if(rs.next()){
             return rs.getDouble("star");
        }
        return 0.0;
    }
    public static int getamount (String id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select amount from star_vote where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        if(rs.next()){
            return rs.getInt("amount");
        }
        return 0;
    }
    public static String getdecrispe (String id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select decrispe from product where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        if(rs.next()){
            return rs.getString("decrispe");
        }
        return null;
    }
    public static Date getrelease (String id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select p.release from product p where p.id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        if(rs.next()){
            return rs.getDate("release");
        }
        return null;
    }
    public static void addComment(String id_Cus, String id_Pro, String mess, int star) {
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement prs = dbConnect.getConnection().prepareStatement("insert into comment values (?,?,?)");
            prs.setString(1,id_Cus);
            prs.setString(2,id_Pro);
            prs.setString(3,mess);
            prs.executeUpdate();
            Product p = getProduct(id_Pro);
            int newAmount = p.getAmount()+1;
            double newStar = (p.getStar()*p.getAmount()+star)/newAmount;
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("update star_vote set amount =?, star =?  where id_product=?");
            ps.setString(3,id_Pro);
            ps.setInt(1,newAmount);
            ps.setDouble(2,newStar);
            ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static List<Product> sort(String s){
        List<Product> result = new ArrayList<Product>();
        try {
            DBConnect dbConnect = DBConnect.getInstance();
            switch (s){
                case "new":{
                    ResultSet rs = dbConnect.get().executeQuery("select id_product from product order by release desc ");
                    while (rs.next()){
                        result.add(getProduct(rs.getString("id_product")));
                    }
                }
                case "popular":{
                    ResultSet rs = dbConnect.get().executeQuery("(select dp.id_product, count())b1");
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    public static void main(String[] args) throws SQLException {
        addComment("1","ac","expensive",2);
    }
}
