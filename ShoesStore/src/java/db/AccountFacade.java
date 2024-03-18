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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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

    public List<Account> select() throws SQLException {
        List<Account> list = null;
        //Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        //Tạo đối tượng statement
        Statement stm = con.createStatement();
        //Thực thi lệnh SELECT
        ResultSet rs = stm.executeQuery("select * from Account");
        list = new ArrayList<>();
        while (rs.next()) {
            Account account = new Account();
            account.setId(rs.getInt("id"));
            account.setEmail(rs.getString("email"));
            account.setFullName(rs.getString("fullName"));
            account.setRoleId(rs.getString("roleId"));
            account.setPassword(rs.getString("password"));
            list.add(account);
        }
        con.close();
        return list;
    }

    public Account select(int id) throws SQLException {
        //Tao connection de ket noi vào DBMS
        Connection con = DBContext.getConnection();
        //Tao doi tuong statement
        PreparedStatement stm = con.prepareStatement("select * from Account where id =?");
        //Truyen gia tri cho cac tham so
        stm.setInt(1, id);
        //Thuc thi lenh Select
        ResultSet rs = stm.executeQuery();
        Account account = null;
        if (rs.next()) {
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

    public Account selectCustomer(String id) throws SQLException {
        //Tao connection de ket noi vào DBMS
        Connection con = DBContext.getConnection();
        //Tao doi tuong statement
        PreparedStatement stm = con.prepareStatement("select * from Customer where id =?");
        //Truyen gia tri cho cac tham so
        stm.setString(1, id);
        //Thuc thi lenh Select
        ResultSet rs = stm.executeQuery();
        Account account = null;
        if (rs.next()) {
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

    public boolean exists(String email) throws SQLException {
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("SELECT COUNT(*) FROM Account WHERE email = ?");
        stm.setString(1, email);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            int count = rs.getInt(1);
            return count > 0;
        }

        return false;
    }

    public int create(String email, String fullName, String password, int roleId) throws SQLException {
        if (exists(email)) {
            throw new SQLException("Email already exists in the database");
        }
        int accountId = -1;
        //Tao connection de ket noi vào DBMS
        Connection con = DBContext.getConnection();
        //Tao doi tuong statement
        PreparedStatement stm = con.prepareStatement("insert into Account values(?,?,?,?)");
        //Truyen gia tri cho cac tham so
        stm.setString(1, email);
        stm.setString(2, fullName);
        stm.setString(3, password);
        stm.setInt(4, roleId);
        //Thuc thi lenh INSERT
        int count = stm.executeUpdate();
        if (count > 0) {
            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                accountId = rs.getInt(1);
            }
        }
        con.close();
        return accountId;
    }
}
