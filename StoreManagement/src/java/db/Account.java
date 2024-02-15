/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

/**
 *
 * @author Nguyen Tien Kha
 */
public class Account {

    private int uID;
    private String uEmail;
    private String uName;
    private String password;
    private String roleID;

    public Account() {
    }

    public Account(int uID, String uEmail, String uName, String password, String roleID) {
        this.uID = uID;
        this.uEmail = uEmail;
        this.uName = uName;
        this.password = password;
        this.roleID = roleID;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    
}
