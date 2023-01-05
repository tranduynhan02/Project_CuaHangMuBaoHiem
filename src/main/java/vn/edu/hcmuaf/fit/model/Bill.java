package vn.edu.hcmuaf.fit.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Bill {
    private String id;
    private Date date;
    private List<String> productList;
    private String status;
    private String id_cus;

    public Bill(String id, Date date, List<String> list, String status, String id_cus) {
        this.id = id;
        this.date = date;
        this.productList = list;
        this.status = status;
        this.id_cus = id_cus;
    }
    public Bill(){

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<String> getProductList() {
        return productList;
    }

    public void setProductList(List<String> productList) {
        this.productList = productList;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getId_cus() {
        return id_cus;
    }

    public void setId_cus(String id_cus) {
        this.id_cus = id_cus;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "id='" + id + '\'' +
                ", date=" + date +
                ", productList=" + productList +
                ", status='" + status + '\'' +
                ", id_cus='" + id_cus + '\'' +
                '}';
    }
}
