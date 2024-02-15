/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen Tien Kha
 */
public class ProductFacade {

    public List<Product> select() throws SQLException {
        List<Product> list = null;
        Connection con = DBContext.getConnection();
        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery("select * from Product");
        list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setpID(rs.getInt("pID"));
            product.setpName(rs.getString("pName"));
            product.setpImage(rs.getString("pImage"));
            product.setpPrice(rs.getDouble("pPrice"));
            product.setbID(rs.getInt("bID"));
            list.add(product);
        };
        con.close();
        return list;
    }

    public Product select(int id) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from Product where pID = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        Product product = null;
        if (rs.next()) {
            product = new Product();
            product.setpID(rs.getInt("pID"));
            product.setpName(rs.getString("pName"));
            product.setpImage(rs.getString("pImage"));
            product.setpPrice(rs.getDouble("pPrice"));
            product.setbID(rs.getInt("bID"));
        };
        con.close();
        return product;
    }

    public void add(String pName, String pImage, double pPrice, int bID) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("insert into Product values(?,?,?,?)");

        stm.setString(1, pName);
        stm.setString(2, pImage);
        stm.setDouble(3, pPrice);
        stm.setInt(4, bID);
        int count = stm.executeUpdate();

        con.close();
    }

    public void delete(int pID) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("delete from Product where pID = ?");
        stm.setInt(1, pID);
        int count = stm.executeUpdate();
        con.close();
    }

    public void update(Product product) throws SQLException {

        Connection con = DBContext.getConnection();

        PreparedStatement stm = con.prepareStatement("update Product set pName=?, pImage=?, pPrice=?, bID=? where pID=?");

        stm.setString(1, product.getpName());
        stm.setString(2, product.getpImage());
        stm.setDouble(3, product.getpPrice());
        stm.setDouble(4, product.getbID());
        stm.setInt(4, product.getpID());

        int count = stm.executeUpdate();

        con.close();
    }

}
