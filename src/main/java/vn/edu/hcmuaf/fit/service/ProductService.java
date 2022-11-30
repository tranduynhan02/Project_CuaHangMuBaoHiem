package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.controller.ListProduct;
import vn.edu.hcmuaf.fit.model.Product;

import java.util.LinkedList;
import java.util.List;

public class ProductService {
    public static List<Product> getData() {
        List<Product> list = new LinkedList<>();
        list.add(new Product(1, "Nón POC EVO ống pô nhỏ", "http://localhost:8080/WebProject_war/img/product1.png", 24800000));
        list.add(new Product(2, "Nón 1/2 đầu GRS 102k ", "http://localhost:8080/WebProject_war/img/product2.jpg", 24800000));
        list.add(new Product(3, "Nón GRS 966-1", "http://localhost:8080/WebProject_war/img/product3.jpg", 24800000));
        list.add(new Product(4, "POC 05 tai mèo xám", "http://localhost:8080/WebProject_war/img/product4.png", 24800000));
        list.add(new Product(5, "GRS A760k nửa đầu", "http://localhost:8080/WebProject_war/img/product5.jpg", 24800000));
        list.add(new Product(6, "Nón GRS 922", "http://localhost:8080/WebProject_war/img/product6.png", 24800000));
        list.add(new Product(7, "GRS 760 kính to", "http://localhost:8080/WebProject_war/img/product7.png", 24800000));
        list.add(new Product(8, "Zeus 613B nón 3/4", "http://localhost:8080/WebProject_war/img/product8.png", 24800000));
        return list;
    }
}
