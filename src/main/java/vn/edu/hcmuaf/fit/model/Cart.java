package vn.edu.hcmuaf.fit.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    Map<String, Integer> cart;

    public Cart() {
        this.cart = new HashMap<>();
    }

    public Map<String, Integer> getCart() {
        return cart;
    }

    public void setCart(Map<String, Integer> cart) {
        this.cart = cart;
    }
}
