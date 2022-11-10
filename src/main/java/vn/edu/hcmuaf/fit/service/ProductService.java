package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.controller.ListProduct;
import vn.edu.hcmuaf.fit.model.Product;

import java.util.LinkedList;
import java.util.List;

public class ProductService {
    public static List<Product> getData() {
        List<Product> list = new LinkedList<>();
        list.add(new Product(1, "Canon EDS 550D", "http://localhost:8080/TestProject_war/img/poc-evo-ong-po-nho-trang-bong-5.png", 24800000));
        list.add(new Product(1, "Canon EDS 550D", "http://localhost:8080/TestProject_war/img/poc-evo-ong-po-nho-trang-bong-5.png", 24800000));
        list.add(new Product(1, "Canon EDS 550D", "http://localhost:8080/TestProject_war/img/poc-evo-ong-po-nho-trang-bong-5.png", 24800000));
        list.add(new Product(1, "Canon EDS 550D", "http://localhost:8080/TestProject_war/img/poc-evo-ong-po-nho-trang-bong-5.png", 24800000));
        list.add(new Product(1, "Canon EDS 550D", "http://localhost:8080/TestProject_war/img/poc-evo-ong-po-nho-trang-bong-5.png", 24800000));
        list.add(new Product(1, "Canon EDS 550D", "http://localhost:8080/TestProject_war/img/poc-evo-ong-po-nho-trang-bong-5.png", 24800000));
        list.add(new Product(1, "Canon EDS 550D", "http://localhost:8080/TestProject_war/img/poc-evo-ong-po-nho-trang-bong-5.png", 24800000));
        list.add(new Product(1, "Canon EDS 550D", "http://localhost:8080/TestProject_war/img/poc-evo-ong-po-nho-trang-bong-5.png", 24800000));
        return list;
    }
}
