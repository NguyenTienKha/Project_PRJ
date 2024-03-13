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
                currentProduct.setCategory(rs.getString("Category"));
                currentProduct.setSizes(new ArrayList<>());
                //Them product vao list
                list.add(currentProduct);
            }
            currentProduct.getSizes().add(rs.getString("Size"));
        }
        con.close();
        return list;
    }

    public List<Product> search(String name) throws SQLException {
        List<Product> list = null;
        // Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        // Tạo đối tượng PreparedStatement để sử dụng truy vấn có tham số
        PreparedStatement stm = con.prepareStatement("select p.*, c.Name as CategoryName, ps.Size "
                + "FROM Product p "
                + "inner join Product_Size ps on ps.ProductId = p.Id "
                + "INNER JOIN Category c ON p.Category = c.Id "
                + "WHERE p.Name LIKE ? OR c.Name = ? OR p.Gender = ?");
        stm.setString(1, "%" + name + "%");
        stm.setString(2, name);
        stm.setString(3, name);
        ResultSet rs = stm.executeQuery();
        list = new ArrayList<>();
        Product p = null;
        while (rs.next()) {
            int productId = rs.getInt("Id");
            if (p == null || p.getId() != productId) {
                p = new Product();
                p.setId(productId);
                p.setName(rs.getString("Name"));
                p.setGender(rs.getString("Gender"));
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setCategory(rs.getString("Category"));
                p.setSizes(new ArrayList<>());
                // Thêm sản phẩm vào danh sách
                list.add(p);
            }
            p.getSizes().add(rs.getString("Size"));
        }
        // Đóng kết nối
        con.close();
        return list;
    }

    public Product select(int productId, String size) throws SQLException {
        Product product = null;
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("SELECT p.*, ps.Size FROM Product p INNER JOIN Product_Size ps ON p.Id = ps.ProductId WHERE p.Id = ?");
        stm.setInt(1, productId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            product = new Product();
            product.setId(rs.getInt("Id"));
            product.setName(rs.getString("Name"));
            product.setGender(rs.getString("Gender"));
            product.setPrice(rs.getDouble("Price"));
            product.setDiscount(rs.getDouble("Discount"));
            product.setCategory(rs.getString("Category"));

            List<String> sizes = new ArrayList<>();
            sizes.add(size);
            product.setSizes(sizes);
        }
        con.close();
        return product;
    }

    public Product select(int id) throws SQLException {
        Product product = null;
        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("select * from Product where id = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            product = new Product();
            product.setId(rs.getInt("Id"));
            product.setName(rs.getString("Name"));
            product.setGender(rs.getString("Gender"));
            product.setPrice(rs.getDouble("Price"));
            product.setDiscount(rs.getDouble("Discount"));
            product.setCategory(rs.getString("Category"));

        }
        con.close();
        return product;
    }


    public int create(String name, String gender, double price, double discount, String category) throws SQLException {

        Connection con = DBContext.getConnection();
        PreparedStatement stm = con.prepareStatement("insert into Product values(?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

        int productId = -1;
        //Truyền giá trị cho các tham số
        stm.setString(1, name);
        stm.setString(2, gender);
        stm.setDouble(3, price);
        stm.setDouble(4, discount);
        stm.setString(5, category);
        int count = stm.executeUpdate();
        if (count > 0) {
            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                productId = rs.getInt(1);
            }
        }
        con.close();
        return productId;
    }

    public void delete(String id) throws SQLException {
        //Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        //Tạo đối tượng statement
        PreparedStatement stm = con.prepareStatement("delete from Product where id = ?");
        //Truyền giá trị cho các tham số
        stm.setString(1, id);
        //Thực thi lệnh DELETE
        int count = stm.executeUpdate();
        con.close();
    }

    public void deleteSize(String ProductId) throws SQLException {
        //Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        //Tạo đối tượng statement
        PreparedStatement stm = con.prepareStatement("delete from Product_Size where ProductId = ?");
        //Truyền giá trị cho các tham số
        stm.setString(1, ProductId);
        //Thực thi lệnh DELETE
        int count = stm.executeUpdate();
        con.close();
    }

    public void update(Product product) throws SQLException {
        //Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        //Tạo đối tượng statement
        PreparedStatement stm = con.prepareStatement("update Product set name=?, gender=?, price=?, discount=?,category=? where id=?");
        //Truyền giá trị cho các tham số        
        stm.setString(1, product.getName());
        stm.setString(2, product.getGender());
        stm.setDouble(3, product.getPrice());
        stm.setDouble(4, product.getDiscount());
        stm.setString(5, product.getCategory());
        stm.setInt(6, product.getId());
        //Thực thi lệnh UPDATE
        int count = stm.executeUpdate();
        con.close();
    }

    public void createProductSize(int productId, String size) throws SQLException {
        //Tạo connection để kết nối vào DBMS
        Connection con = DBContext.getConnection();
        //Tạo đối tượng statement
        PreparedStatement stm = con.prepareStatement("insert into Product_Size values(?, ?)");
        //Truyền giá trị cho các tham số
        stm.setInt(1, productId);
        stm.setString(2, size);
        //Thực thi lệnh INSERT
        int count = stm.executeUpdate();
        con.close();
    }
}
