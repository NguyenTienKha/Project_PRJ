package model;

import db.Product;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author PHT
 */
public class Item {

    private int id;
    private Product product;
    private int quantity;
    private String size;

    public Item() {
        this.id = 0;
        this.product = null;
        this.quantity = 0;
        this.size="";
    }

    public Item(int id, Product product, int quantity,String size) {
        this.id = id;
        this.product = product;
        this.quantity = quantity;
        this.size= size;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
    

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getNewPrice() {
        return (1 -this.product.getDiscount()) * this.product.getPrice();
    }

    public double getCost() {
        return quantity * (1 - product.getDiscount())*product.getPrice();
    }
}
