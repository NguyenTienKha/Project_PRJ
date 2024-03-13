/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.util.List;

/**
 *
 * @author Nguyen Tien Kha
 */
public class Product {

    private int id;
    private String name;
    private String gender;
    private double price;
    private double discount;
    private String category;
    private List<String> sizes;

    public Product() {
    }

    public Product(int id, String name, String gender, double price, double discount, String category, List<String> sizes) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.price = price;
        this.discount = discount;
        this.category = category;
        this.sizes = sizes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public List<String> getSizes() {
        return sizes;
    }

    public void setSizes(List<String> sizes) {
        this.sizes = sizes;
    }
    public double getTotal() {
        return price*(1-discount);
    }
}
