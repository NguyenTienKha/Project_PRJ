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
public class BrandFacade {

    public List<Brand> select() throws SQLException {
        List<Brand> list = null;
        //Tao connection de ket noi vào DBMS
        Connection con = DBContext.getConnection();
        //Tao doi tuong statement
        Statement stm = con.createStatement();
        //Thuc thi lenh SELECT
        ResultSet rs = stm.executeQuery("select * from brand");
        list = new ArrayList<>();
        while (rs.next()) {
            //Doc mau tin hien hanh de vao doi tuong toy
            Brand brand = new Brand();
            brand.setId(rs.getString("id"));
            brand.setName(rs.getString("name"));
            //Them toy vao list
            list.add(brand);
        }
        con.close();
        return list;
    }
}
