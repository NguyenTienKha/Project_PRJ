/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
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
}
