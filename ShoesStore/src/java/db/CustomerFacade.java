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

/**
 *
 * @author Nguyen Tien Kha
 */
public class CustomerFacade {

    public Customer select(int id) throws SQLException {
        Customer customer = null;
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from Customer where id = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            customer = new Customer();
            customer.setId(rs.getInt("Id"));
            customer.setMoney(rs.getDouble("Money"));
            customer.setAccountId(rs.getInt("AccountId"));
        }
        con.close();
        return customer;
    }

    public void update(Customer customer) throws SQLException {
        //Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        //Tạo đối tượng statement
        PreparedStatement stm = con.prepareStatement("update Customer set  money=?, AccountId=? where id=?");
        //Truyền giá trị cho các tham số        
        stm.setDouble(1, customer.getMoney());
        stm.setInt(2, customer.getAccountId());
        stm.setInt(3, customer.getId());
        //Thực thi lệnh UPDATE
        int count = stm.executeUpdate();
        con.close();
    }

}
