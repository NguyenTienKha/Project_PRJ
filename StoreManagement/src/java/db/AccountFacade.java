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

    public Account login(String uEmail, String password) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from Account where uEmail = ? and password= ? ");
        stm.setString(1, uEmail);
        stm.setString(2, password);

        ResultSet rs = stm.executeQuery();
        Account account = null;
        if (rs.next()) {
            account = new Account();
            account.setuID(rs.getInt("uID"));
            account.setuEmail(rs.getString("uEmail"));
            account.setuName(rs.getString("uName"));
            account.setRoleID(rs.getString("roleID"));
            account.setPassword(rs.getString("password"));
        };
        con.close();
        return account;
    }
}
