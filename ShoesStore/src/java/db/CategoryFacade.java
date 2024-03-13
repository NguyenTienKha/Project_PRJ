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
public class CategoryFacade {
    public List<Category> select() throws SQLException{
        List<Category> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        //Tạo đối tượng statement
        Statement stm = con.createStatement();
        //Thực thi lệnh SELECT
        ResultSet rs = stm.executeQuery("select * from Category");
        list = new ArrayList<>();
        while (rs.next()) {
            Category category = new Category();
            category.setId(rs.getString("id"));
            category.setName(rs.getString("name"));
            list.add(category);
        }
        con.close();
        return list;
    }
}
