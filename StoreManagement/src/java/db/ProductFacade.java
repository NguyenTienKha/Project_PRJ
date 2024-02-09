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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setBrand("brand");
            product.setPrice(rs.getDouble("point"));
            list.add(product);
        };
        con.close();
        return list;
    }

    public Product select(int id) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from Product where id = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        Product product = null;
        if (rs.next()) {
            product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setBrand(rs.getString("brand"));
            product.setPrice(rs.getDouble("price"));

        };
        con.close();
        return product;
    }

    public void add(String name, String brand, double price) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("insert into Product values(?,?,?)");

        stm.setString(1, name);
        stm.setString(2, brand);
        stm.setDouble(3, price);
        int count = stm.executeUpdate();

        con.close();
    }

    public void delete(int id) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("delete from Product where id = ?");
        stm.setInt(1, id);
        int count = stm.executeUpdate();
        con.close();
    }

    public void update(Product product) throws SQLException {

        Connection con = DBContext.getConnection();

        PreparedStatement stm = con.prepareStatement("update Product set name=?, brand=?, price=? where id=?");

        stm.setString(1, product.getName());
        stm.setString(2, product.getBrand());
        stm.setDouble(3, product.getPrice());
        stm.setInt(4, product.getId());

        int count = stm.executeUpdate();

        con.close();
    }

}
