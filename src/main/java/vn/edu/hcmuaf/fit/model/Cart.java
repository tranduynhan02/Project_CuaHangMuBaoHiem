package vn.edu.hcmuaf.fit.model;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<String, Product> cart;
    private Customer customer;
    private long total;
    private int quantity;

    public Cart() {
        this.cart = new HashMap<String,Product>();
        this.customer = new Customer();
        this.total = 0;
        this.quantity = 0;
    }
    public void put(Product p){
        if(cart.containsKey(p.getKey())){
            Product p1 = cart.get(p.getKey());
            p1.setQuantity(p1.getQuantity()+1);
            cart.put(p.getKey(),p1);
        }else{
            cart.put(p.getKey(), p);
        }
        total+=p.getPrice();
        quantity++;
    }
    public void updateTotalMoneyQuantity(){
        total =0;
        quantity = 0;
        for(Product p : cart.values()){
            total += p.getQuantity()* p.getPrice();
            quantity += p.getQuantity();
        }
    }
    public Collection<Product> getListProduct() {
        Collection<Product> list = cart.values();
        return list;
    }
    public int getQuanlity(){
        return this.quantity;
    }
    public long getTotal(){
        return this.total;
    }
    public void remove(String key){
        cart.remove(key);
        updateTotalMoneyQuantity();
    }
    public void update(Product p){
        if(cart.containsKey(p.getKey())){
            cart.put(p.getKey(), p);
        }
        updateTotalMoneyQuantity();
    }
    public void minus(String id){
        Product p1 = this.cart.get(id);
        if(p1.getQuantity()==1){
            remove(id);
        }else {
            p1.setQuantity(p1.getQuantity() - 1);
            cart.put(id, p1);
        }
        updateTotalMoneyQuantity();
    }

    public Map<String, Product> getCart() {
        return cart;
    }

    public void setCart(Map<String, Product> cart) {
        this.cart = cart;
    }
}
