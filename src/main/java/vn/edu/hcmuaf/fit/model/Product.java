package vn.edu.hcmuaf.fit.model;

import java.util.*;

public class Product{
    private String id;
    private String name;
    private String brand;
    private long price;
    private String size;
    private String color;
    private String type;
    private double discount;
    private List<String> img;
    private double star;
    private int amount;
    private Map<String, List<String>> comment;

    private String decrispe;
    private Date release;
    private int count;

    public Product() {
    }

    public Product(String id, String name, long price, String brand, String size, String color, String type, double discount, double star, int amount, String decrispe, Date release, int count) {
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
        this.comment = new HashMap<String, List<String>>();
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

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
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

    public Map<String, List<String>> getComment() {
        return comment;
    }

    public void setComment(Map<String,List<String>> comment) {
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

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", brand='" + brand + '\'' +
                ", price=" + price +
                ", size='" + size + '\'' +
                ", color='" + color + '\'' +
                ", type='" + type + '\'' +
                ", discount=" + discount +
                ", img=" + img +
                ", star=" + star +
                ", amount=" + amount +
                ", comment=" + comment +
                ", decrispe='" + decrispe + '\'' +
                ", release=" + release +
                ", count=" + count +
                '}';
    }
}
