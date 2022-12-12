package vn.edu.hcmuaf.fit.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Product{
    private String id;
    private String name;
    private String brand;
    private long price;
    private int size;
    private String color;
    private String type;
    private double discount;
    private List<String> img;
    private double star;
    private int amount;
    private List<Comment> comment;

    private String decrispe;
    private Date release;
    private int count;

    public Product() {
    }

    public Product(String id, String name, long price, String brand, int size, String color, String type, double discount, double star, int amount, String decrispe, Date release, int count) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.brand = brand;
        this. size = size;
        this.color = color;
        this.type = type;
        this.discount = discount;
        this.img = new ArrayList<String>();
        this.star = star;
        this.amount = amount;
        this.comment = new ArrayList<Comment>();
        this.decrispe =decrispe;
        this.release = release;
        this.count = count;
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

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public List<String> getImg() {
        return img;
    }

    public void setImg(List<String> img) {
        this.img = img;
    }

    public double getStar() {
        return star;
    }

    public void setStar(double star) {
        this.star = star;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public List<Comment> getComment() {
        return comment;
    }

    public void setComment(List<Comment> comment) {
        this.comment = comment;
    }

    public String getDecrispe() {
        return decrispe;
    }

    public void setDecrispe(String decrispe) {
        this.decrispe = decrispe;
    }

    public Date getRelease() {
        return release;
    }

    public void setRelease(Date release) {
        this.release = release;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
