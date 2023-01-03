package vn.edu.hcmuaf.fit.model;

import java.io.Serializable;

public class User implements Serializable {
    private String id_customer;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String user;
    private String password;
    private int role;

    public User() {
    }

    public User(String fullName, String email, String phone, String address, String user, String password, int role) {
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.user = user;
        this.password = password;
        this.role = role;
    }

    public String getId_customer() {
        return id_customer;
    }

    public void setId_customer(String id_customer) {
        this.id_customer = id_customer;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id_customer +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", user='" + user + '\'' +
                ", password='" + password + '\'' +
                ", role=" + role +
                '}';
    }
}

