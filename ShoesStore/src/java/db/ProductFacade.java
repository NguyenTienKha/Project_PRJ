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
    
    public List<Product> select() throws SQLException{
        List<Product> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        //Tạo đối tượng statement
        Statement stm = con.createStatement();
        //Thực thi lệnh SELECT
        ResultSet rs = stm.executeQuery("select * from Product");
        list = new ArrayList<>();
        while (rs.next()) {
            //Doc mau tin hien hanh de vao doi tuong product
            Product product = new Product();
            product.setId(rs.getInt("Id"));
            product.setName(rs.getString("Name"));
            product.setPrice(rs.getDouble("Price"));
            product.setDiscount(rs.getDouble("Discount"));
            product.setCategoryId(rs.getInt("CategoryId"));
            //Them product vao list
            list.add(product);
        }
        con.close();
        return list;
    }
}
