/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import hashing.Hasher;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

/**
 *
 * @author PHT
 */
public class AccountFacade {

    public Account login(String email, String password) throws SQLException, NoSuchAlgorithmException {
        //Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        //Tạo đối tượng PreparedStatement
        PreparedStatement stm = con.prepareStatement("select * from Account where email=? and password=?");
        //Cung cấp giá trị cho các tham số
        stm.setString(1, email);
        stm.setString(2, Hasher.hash(password));
        //Thực thi lệnh SELECT
        ResultSet rs = stm.executeQuery();
        Account account = null;
        if (rs.next()) {
            account = new Account();
            //Doc mau tin hien hanh de vao doi tuong toy            
            account.setId(rs.getInt("id"));
            account.setEmail(rs.getString("email"));
            account.setFullName(rs.getString("fullName"));
            account.setRoleId(rs.getString("roleId"));
            account.setPassword(rs.getString("password"));
        }
        con.close();
        return account;
    }

    public Account select(String id) throws SQLException {
        //Tao connection de ket noi vào DBMS
        Connection con = DBContext.getConnection();
        //Tao doi tuong statement
        PreparedStatement stm = con.prepareStatement("select * from Toy where id =?");
        //Truyen gia tri cho cac tham so
        stm.setString(1, id);

        //Thuc thi lenh Select
        ResultSet rs = stm.executeQuery();
        Account account = null;
        if (rs.next()) {
            //Doc mau tin hien hanh de vao doi tuong toy
            account = new Account();
            account.setId(rs.getInt("id"));
            account.setEmail(rs.getString("email"));
            account.setFullName(rs.getString("fullName"));
            account.setRoleId(rs.getString("roleId"));
            account.setPassword(rs.getString("password"));
        }
        con.close();
        return account;
    }

    public void create(Account account) throws SQLException {
        //Tao connection de ket noi vào DBMS
        Connection con = DBContext.getConnection();
        //Tao doi tuong statement
        PreparedStatement stm = con.prepareStatement("insert into Accout values(?,?,?,?,?)");
        //Truyen gia tri cho cac tham so
        stm.setInt(1, account.getId());
        stm.setString(2, account.getEmail());
        stm.setString(3, account.getFullName());
        stm.setString(4, account.getRoleId());
        stm.setString(5, account.getPassword());
        //Thuc thi lenh INSERT
        int count = stm.executeUpdate();
        con.close();

    }
}
