package vn.edu.hcmuaf.fit.model;

import vn.edu.hcmuaf.fit.model.Bill;
import vn.edu.hcmuaf.fit.model.Cart;

import java.util.ArrayList;
import java.util.List;

public class Customer {
    private String id;
    private String name;
    private int phone;
    private String address;
    private String userName;
    private String password;
    private boolean isLogin;
    private int permission;
    private Cart cart;
    private List<Bill> listBill;

    private String email;

    public Customer() {
    }

    public Customer(String id, String name, int phone, String address, String userName, String password, int permission, String email) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.userName = userName;
        this.password = password;
        this.permission = permission;
        this.cart = new Cart();
        this.listBill = new ArrayList<Bill>();
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isLogin() {
        return isLogin;
    }

    public void setLogin(boolean login) {
        isLogin = login;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public List<Bill> getListBill() {
        return listBill;
    }

    public void setListBill(List<Bill> listBill) {
        this.listBill = listBill;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
