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
public class AccountFacade {

    public Account login(String email, String password) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from Account where email = ? and password= ? ");
        stm.setString(1, email);
        stm.setString(2, password);

        ResultSet rs = stm.executeQuery();
        Account account = null;
        if (rs.next()) {
            account = new Account();
            account.setId(rs.getInt("id"));
            account.setEmail(rs.getString("email"));
            account.setName(rs.getString("name"));
            account.setRoleId(rs.getString("roleId"));
            account.setPassword(rs.getString("password"));
        };
        con.close();
        return account;
    }
}
