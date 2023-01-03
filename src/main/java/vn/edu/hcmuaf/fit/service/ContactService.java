package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.model.Contact;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;

public class ContactService {
    private static ContactService instance;
    private ContactService() {
    }
    public static ContactService getInstance() {
        if (instance == null) {
            instance = new ContactService();
        }
        return instance;
    }
    public void remove(String id)  {
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("delete from contacts where id=?");
            ps.setString(1,id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public void insert(String name, String email, String subject, String content) {
        String id = "ct"+(quantity()+1);
        LocalDate localDate = LocalDate.now();
        int year = localDate.getYear();
        int mont = localDate.getMonthValue();
        int day = localDate.getDayOfMonth();

        String date  = year+"-"+mont+"-"+day;

        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
            try {
                PreparedStatement ps = dbConnect.getConnection().prepareStatement("insert into contacts(id_contact, name, email, subject,content,date) values (?,?,?,?,?,?)");
                ps.setString(1,id);
                ps.setString(2,name);
                ps.setString(3,email);
                ps.setString(4,subject);
                ps.setString(5,content);
                ps.setString(6,date);
                ps.executeUpdate();
            }catch (Exception e) {
            e.printStackTrace();
            }
    }
    public List<Contact> getAll(){
        List<Contact> list = new LinkedList<Contact>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
       Contact contact = new Contact();
        try {
            ResultSet rs = statement.executeQuery("select * from contacts order by date desc");
            while (rs.next()) {
            contact = new Contact(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));

                list.add(contact);
            }

        } catch (SQLException e) {
        }
        return list;
    }
    public int quantity(){
        int count =0;
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select * from contacts");
            while (rs.next()) {
            count++;
            }
        } catch (SQLException e) {
        }
        return count;
    }
    public Contact getContact(String id){
        Contact contact = new Contact();
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select * from contacts where id_contact=?");
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                contact = new Contact(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        return contact;
    }
    public static void main(String[] args) throws SQLException {
        System.out.println();
    }
}
