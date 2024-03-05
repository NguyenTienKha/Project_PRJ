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
        //Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        //Tạo đối tượng statement
        Statement stm = con.createStatement();
        //Thực thi lệnh SELECT
        ResultSet rs = stm.executeQuery("SELECT p.*, ps.Size FROM Product p INNER JOIN Product_Size ps ON p.Id = ps.ProductId");
        list = new ArrayList<>();
        Product currentProduct = null;
        while (rs.next()) {
            int productId = rs.getInt("Id");
            if (currentProduct == null || currentProduct.getId() != productId) {
                currentProduct = new Product();
                currentProduct.setId(productId);
                currentProduct.setName(rs.getString("Name"));
                currentProduct.setGender(rs.getString("Gender"));
                currentProduct.setPrice(rs.getDouble("Price"));
                currentProduct.setDiscount(rs.getDouble("Discount"));
                currentProduct.setCategoryId(rs.getInt("CategoryId"));
                currentProduct.setSizes(new ArrayList<>());
                //Them product vao list
                list.add(currentProduct);
            }
            currentProduct.getSizes().add(rs.getString("Size"));
        }
        con.close();
        return list;
    }

    public List<Product> search(String name) throws SQLException {
        List<Product> list = null;
        // Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        // Tạo đối tượng PreparedStatement để sử dụng truy vấn có tham số
        PreparedStatement stm = con.prepareStatement("select p.*, c.Name as CategoryName, ps.Size "
                + "FROM Product p "
                + "inner join Product_Size ps on ps.ProductId = p.Id "
                + "INNER JOIN Category c ON p.CategoryId = c.Id "
                + "WHERE p.Name LIKE ? OR c.Name = ? OR p.Gender = ?");
        stm.setString(1, "%" + name + "%");
        stm.setString(2, name);
        stm.setString(3, name);
        ResultSet rs = stm.executeQuery();
        list = new ArrayList<>();
        Product p = null;
        while (rs.next()) {
            int productId = rs.getInt("Id");
            if (p == null || p.getId() != productId) {
                p = new Product();
                p.setId(productId);
                p.setName(rs.getString("Name"));
                p.setGender(rs.getString("Gender"));
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setCategoryId(rs.getInt("CategoryId"));
                p.setSizes(new ArrayList<>());
                // Thêm sản phẩm vào danh sách
                list.add(p);
            }
            p.getSizes().add(rs.getString("Size"));
        }
        // Đóng kết nối
        con.close();
        return list;
    }

}
