package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
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
        while(rs.next()){

            detail.add(new DetailProduct(rs.getString("id_dp"),rs.getString("size"),rs.getString("color"), rs.getInt("quantity")));
        }
        return detail;
    }
    public static List<ImageProduct> getimg (String id) throws SQLException {
        List<ImageProduct> img = new ArrayList<ImageProduct>();
        ImageProduct imgP = new ImageProduct();
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select id_img,id_product ,link_image, allow from image where id_product=? and allow=?");
        prs.setString(1,id);
        prs.setString(2,"1");
        ResultSet rs = prs.executeQuery();
        while(rs.next()){
            imgP = new ImageProduct(rs.getString("id_img"),rs.getString("id_product"),rs.getString("link_image"),rs.getString("allow"));
            img.add(imgP);
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
                    ResultSet rs = dbConnect.get().executeQuery("select p.id_product from product p order by p.release desc ");
                    while (rs.next()){
                        result.add(getProduct(rs.getString("id_product")));
                    }
                    break;
                }
                case "popular":{
                    ResultSet rs = dbConnect.get().executeQuery("select dp.id_product, count(dp.id_product) from bill b join detail_bill db on b.id = db.id_bill join detail_product dp on db.id_dp = dp.id_dp group by dp.id_product order by count(dp.id_product) desc");
                    while (rs.next()){
                        result.add(getProduct(rs.getString("id_product")));
                    }
                    break;
                }
                case "rating":{
                    ResultSet rs = dbConnect.get().executeQuery("select p.id_product from product p join star_vote s on p.id_product = s.id_product order by s.star desc");
                    while (rs.next()){
                        result.add(getProduct(rs.getString("id_product")));
                    }
                    break;
                }
                default:
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    public static Product getDetailProduct(String idp) throws SQLException {
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
        p.setDetail(getfirst(idp));
        return p;
    }
    public static List<DetailProduct> getfirst(String id) throws SQLException {
        List<DetailProduct> detail = new ArrayList<DetailProduct>();
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select id_dp, size, color, quantity from detail_product where id_product=? and quantity>0");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        while(rs.next()){

            detail.add(new DetailProduct(rs.getString("id_dp"),rs.getString("size"),rs.getString("color"), rs.getInt("quantity")));
        break;
        }
        return detail;
    }
    public static Product getDetailProduct(String idp,String size,String color) throws SQLException {
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
        p.setDetail(getDetail(idp, size, color));
        return p;
    }
    public static List<DetailProduct> getDetail(String id,String size,String color) throws SQLException {
        List<DetailProduct> detail = new ArrayList<DetailProduct>();
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select id_dp, size, color, quantity from detail_product where id_product=? and size =? and color = ?");
        prs.setString(1, id);
        prs.setString(2, size);
        prs.setString(3, color);
        ResultSet rs = prs.executeQuery();
        while (rs.next()) {
            detail.add(new DetailProduct(rs.getString("id_dp"), rs.getString("size"), rs.getString("color"), rs.getInt("quantity")));
        }
        return detail;
    }
    public static List<Bill> sales(int month, int year){
        List<Bill> result = new ArrayList<Bill>();
        try{
            DBConnect dbConnect = DBConnect.getInstance();
            PreparedStatement prs = dbConnect.getConnection().prepareStatement("select b.id from bill b where month(b.date)=? and year(b.date)=?");
            prs.setInt(1,month);
            prs.setInt(2,year);
            ResultSet rs = prs.executeQuery();
            while(rs.next()){
                result.add(getBill(rs.getString("id")));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    public static Bill getBill(String id) throws SQLException {
        PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select id_dp from detail_bill where id_bill=?");
        prs.setString(1,id);
        List<String> list_product = new ArrayList<String>();
        ResultSet rs = prs.executeQuery();
        while(rs.next()){
            list_product.add(rs.getString("id_dp"));
        }
        PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select id_customer, date, status from bill where id=?");
        ps.setString(1,id);
        ResultSet resultSet = ps.executeQuery();
        if(resultSet.next()){
            return new Bill(id,resultSet.getDate("date"),list_product, resultSet.getString("status"),resultSet.getString("id_customer"));
        }
        return null;
    }
    public static List<Customer> findCustomer(String para) {
        List<Customer> list = new ArrayList<Customer>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select id_customer from customer where name like '%"+para+"%'");
            while (rs.next()) {
                list.add(getCustomer(rs.getString("id_customer")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static Customer getCustomer(String idc) throws SQLException {
        Customer c = new Customer();
        PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select name,email,phone,address,username,password,permission from customer where id_customer=?");
        ps.setString(1,idc);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            c.setId(idc);
            c.setName(rs.getString("name"));
            c.setEmail(rs.getString("email"));
            c.setPhone(rs.getString("phone"));
            c.setAddress(rs.getString("address"));
            c.setUserName(rs.getString("username"));
            c.setPassword(rs.getString("password"));
            c.setPermission(rs.getString("permission"));
        }
        return c;
    }
    public static void addBill(String id,String id_Customer,String status, List<String> id_dp){
        try {

            Date date = new Date();
            ResultSet resultSet = DBConnect.getInstance().get().executeQuery("select curdate()");
            if(resultSet.next()){
                date = resultSet.getDate(1);
            }
//            if(!checkbill(id_Customer,status,date,id_dp))return;
            PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("INSERT into bill values(?,?,?,?)");
            prs.setString(1, id);
            prs.setString(2,id_Customer);
            prs.setDate(3, (java.sql.Date) date);
            prs.setString(4,status);
            prs.executeUpdate();
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("INSERT into detail_bill values(?,?)");
            for (String i:id_dp){
                ps.setString(1,id);
                ps.setString(2,i);
                ps.executeUpdate();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public static boolean checkbill(String id_Customer,String status,Date date,List<String> id_dp) throws SQLException {
        String id = "";
        PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select id from bill where id_customer=? and status=? and date=? ");
        ps.setString(1,id_Customer);
        ps.setString(2,status);
        ps.setDate(3, (java.sql.Date) date);
        ResultSet rs = ps.executeQuery();
        if (rs.next()){
            id += rs.getString("id");
        }else {
            return false;
        }
        PreparedStatement preparedStatement = DBConnect.getInstance().getConnection().prepareStatement("select id_dp from detail_bill where id_bill=?");
        List<String> list = new ArrayList<String>();
        preparedStatement.setString(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            if(!id_dp.contains(resultSet.getString("id_dp")))return false;
        }
        return true;
    }
    public static void cancel_bill(String id_bill){
        try{
            String status = "Đã hủy";
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("UPDATE bill set status = ? where id =?");
            ps.setString(1,status);
            ps.setString(2,id_bill);
            ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static List<Product> listFullFace(){
    List<Product> list = new ArrayList<Product>();

        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from product where type =?");
            ps.setString(1,"FULLFACE");
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                list.add(getProduct(rs.getString("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static List<Product> list3_4(){
        List<Product> list = new ArrayList<Product>();

        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from product where type =? ");
            ps.setString(1,"3/4");
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                list.add(getProduct(rs.getString("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static List<Product> listNuaDau(){
        List<Product> list = new ArrayList<Product>();

        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from product where type =? ");
            ps.setString(1,"NUADAU");
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                list.add(getProduct(rs.getString("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static List<Product> listChildren(){
        List<Product> list = new ArrayList<Product>();

        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from product where type =? ");
            ps.setString(1,"CHILDREN");
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                list.add(getProduct(rs.getString("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static int countProduct(){
        int count =0;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select * from product");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
        }
        return count;
    }
    public static int countDetailProduct(){
        int count =0;
        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select * from detail_product");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
        }
        return count;
    }
    public static String insertProduct(String name, String price, String brand, String type, String discount, String decrispe){
        String typeDB = type;
        if(type.equals("3_4")){
        typeDB = "3/4";
        }
        int priceDB = Integer.parseInt(price);
        double discounta = Double.parseDouble(discount);
        double discountDB = discounta/100;
        String id = "pdhm"+(countProduct()+1);
        LocalDate localDate = LocalDate.now();
        int year = localDate.getYear();
        int mont = localDate.getMonthValue();
        int day = localDate.getDayOfMonth();

        String date  = year+"-"+mont+"-"+day;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("insert into product values (?,?,?,?,?,?,?,?)");
            ps.setString(1,id);
            ps.setString(2,name);
            ps.setInt(3,priceDB);

            ps.setString(4,brand);
            ps.setString(5,typeDB);
            ps.setDouble(6,discountDB);
            ps.setString(7,decrispe);
            ps.setString(8,date);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id;
    }
    public static void insertDetailProduct(String id, String size, String color, String quantity){
        int quantityDB = Integer.parseInt(quantity);
        String iddt = "dtpd"+(countDetailProduct()+1);
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("insert into detail_product values (?,?,?,?,?)");
            ps.setString(1,iddt);
            ps.setString(2,id);
            ps.setString(3,size.toUpperCase());

            ps.setString(4,color.toLowerCase());
            ps.setInt(5,quantityDB);

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static boolean checkDBContainSizeColor(String id, String size, String color){
        boolean result = false;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select size, color from detail_product where id_product=?");
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if(rs.getString(1).equalsIgnoreCase(size) && rs.getString(2).equalsIgnoreCase(color)){
                    return true;
                }
            }
        } catch (SQLException e) {
        }
        return result;
    }
    public static String getIdDetailProductByCS(String id, String size, String color){
        String result = null;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_dp, size, color from detail_product where id_product=?");
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if(rs.getString(2).equalsIgnoreCase(size) && rs.getString(3).equalsIgnoreCase(color)){
                    return rs.getString(1);
                }
            }
        } catch (SQLException e) {
        }
        return result;
    }
    public static void updateSizeColorById(String id, String quantity){
        int quantityDB = Integer.parseInt(quantity);
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("update detail_product set quantity = quantity+? where id_dp=?");
            ps.setInt(1,quantityDB);
            ps.setString(2,id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("errp");
        }
    }
    public static int countImg(){
        int count =0;
        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select * from image");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
        }
        return count;
    }
    public static void insertImg(String id,String img){
        String id_img = "img"+(countImg()+1);
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("insert into image values (?,?,?,?)");

            ps.setString(1,id_img);
            ps.setString(2,id);
            ps.setString(3,img);
            ps.setString(4,"1");
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static void updateProduct(String id,String name, String price, String brand, String type, String discount, String decrispe){
        String typeDB = type;
        if(type.equals("3_4")){
            typeDB = "3/4";
        }
        int priceDB = Integer.parseInt(price);
        double discounta = Double.parseDouble(discount);
        double discountDB = discounta/100;

        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("update product set name=?, price=?,brand=?,type=?,discount=?,decrispe=? where id_product=?");

            ps.setString(1,name);
            ps.setInt(2,priceDB);

            ps.setString(3,brand);
            ps.setString(4,typeDB);
            ps.setDouble(5,discountDB);
            ps.setString(6,decrispe);
            ps.setString(7,id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static void removeProduct(String id){
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("delete from product where id_product=?");
            ps.setString(1,id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public static void removeImage(String id){
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("delete from image where id_img=?");
            ps.setString(1,id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public static void updateImage(String id, String allow){
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("update image set allow = ? where id_img= ?");

            ps.setString(1,allow);

            ps.setString(2,id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static Product getProductFullImage(String idp) throws SQLException {
        Product p = new Product();
        p.setId(idp);
        p.setName(getname(idp));
        p.setPrice(getprice(idp));
        p.setBrand(getbrand(idp));
        p.setType(gettype(idp));
        p.setDiscount(getdiscount(idp));
        p.setImg(getimgAll(idp));
        p.setStar(getstar(idp));
        p.setAmount(getamount(idp));
        p.setComment(getcomment(idp));
        p.setRelease(getrelease(idp));
        p.setDecrispe(getdecrispe(idp));
        p.setDetail(getdetail(idp));
        return p;
    }
    public static List<ImageProduct> getimgAll (String id) throws SQLException {
        List<ImageProduct> img = new ArrayList<ImageProduct>();
        ImageProduct imgP = new ImageProduct();
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select id_img,id_product ,link_image, allow from image where id_product=?");
        prs.setString(1,id);
        ResultSet rs = prs.executeQuery();
        while(rs.next()){
            imgP = new ImageProduct(rs.getString("id_img"),rs.getString("id_product"),rs.getString("link_image"),rs.getString("allow"));
            img.add(imgP);
        }
        return img;
    }
    public static void removeDetailProduct(String id){
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("delete from detail_product where id_dp=?");
            ps.setString(1,id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public static void updateDetailPQuantity(String id, String quantity){
        int quantityDB = Integer.parseInt(quantity);
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("update detail_product set quantity = ? where id_dp=?");
            ps.setInt(1,quantityDB);
            ps.setString(2,id);

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("errp");
        }
    }
    public static List<Product> getData(int a, int b) {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from product limit ?,?");
            ps.setInt(1,a);
            ps.setInt(2,b);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(getProduct(rs.getString("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public List<Product> pagination(int a, int b,List<Product> list){
        List<Product> result = new ArrayList<Product>();
        for(int i = a; i<b+a;i++){
            if(i<list.size()) {
                result.add(list.get(i));
            }
        }

        return result;
    }
    public static List<Product> listDiscount(String discount){
        List<Product> list = new ArrayList<Product>();
        double discountDB = Double.parseDouble(discount);
        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from product where discount =?");
            ps.setDouble(1,discountDB);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(getProduct(rs.getString("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static void main(String[] args) throws SQLException {
        ProductService p = new ProductService();
        for(Product x : listDiscount("0.15")){
            System.out.println(x);
        }

    }
}
