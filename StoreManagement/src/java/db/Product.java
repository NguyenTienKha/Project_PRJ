/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

/**
 *
 * @author Nguyen Tien Kha
 */
public class Product {

    private int pID;
    private String pName;
    private String pImage;
    private Double pPrice;
    private int bID;

    public Product() {
    }

    public Product(int pID, String pName, String pImage, Double pPrice, int bID) {
        this.pID = pID;
        this.pName = pName;
        this.pImage = pImage;
        this.pPrice = pPrice;
        this.bID = bID;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public Double getpPrice() {
        return pPrice;
    }

    public void setpPrice(Double pPrice) {
        this.pPrice = pPrice;
    }

    public int getbID() {
        return bID;
    }

    public void setbID(int bID) {
        this.bID = bID;
    }

}
