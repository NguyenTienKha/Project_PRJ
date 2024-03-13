/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import db.CategoryFacade;
import db.Category;
import db.Product;
import db.ProductFacade;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nguyen Tien Kha
 */
@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String controller = (String) request.getAttribute("controller");
        String action = (String) request.getAttribute("action");
        switch (action) {
            case "list":
                list(request, response);
                break;
            case "search":
                search(request, response);
                break;
            case "manage":
                manage(request, response);
                break;
            case "create":
                create(request, response);
                break;
            case "create_handler":
                create_handler(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "delete_handler":
                delete_handler(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
//            case "edit_handler":
//                edit_handler(request, response);
//                break;
        }
    }

    protected void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        ProductFacade pf = new ProductFacade();
        try {
            List<Product> list = pf.select();
            request.setAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", e.toString());
        }
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        ProductFacade pf = new ProductFacade();
        String order = request.getParameter("order");
        String name = request.getParameter("search");
        try {
            List<Product> list = pf.search(name);
            if (order != null) {
                if (order.equals("asc")) {
                    Collections.sort(list, Comparator.comparing(Product::getTotal));
                } else if (order.equals("desc")) {
                    Collections.sort(list, Comparator.comparing(Product::getTotal).reversed());
                }
            }
            request.setAttribute("list", list);
            request.setAttribute("search", name);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", e.toString());
        }
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void manage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        ProductFacade pf = new ProductFacade();
        try {
            List<Product> list = pf.select();
            request.setAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", e.toString());
        }
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        try {
            CategoryFacade cf = new CategoryFacade();
            List<Category> list = cf.select();
            //Truyền list cho view để tạo combobox
            request.setAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Can't read the Category table.");
        }
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void create_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        ProductFacade pf = new ProductFacade();
        try {
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            double price = Double.parseDouble(request.getParameter("price"));
            double discount = Double.parseDouble(request.getParameter("discount"));
            String category = request.getParameter("category");
            CategoryFacade cf = new CategoryFacade();
            List<Category> list = cf.select();
            //Truyền list cho view để tạo combobox
            request.setAttribute("list", list);

            List<String> listSize = new ArrayList<String>();
            listSize.add("38");
            listSize.add("39");
            listSize.add("40");
            listSize.add("41");
            listSize.add("42");
            listSize.add("43");

            int id = pf.create(name, gender, price, discount, category);

            for (String size : listSize) {
                pf.createProductSize(id, size);
            }
            request.getRequestDispatcher("/product/list.do").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Can't save Product into the db.");
            request.setAttribute("action", "create");
            request.getRequestDispatcher(layout).forward(request, response);
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        String id = request.getParameter("id");
        request.setAttribute("id", id);
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void delete_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        ProductFacade pf = new ProductFacade();
        try {
            String id = request.getParameter("id");
            String op = request.getParameter("op");
            switch (op) {
                case "Yes":
                    pf.deleteSize(id);
                    pf.delete(id);
                    break;
                case "No":
                    break;
            }
            response.sendRedirect(request.getContextPath() + "/product/manage.do");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Can't delete this product.");
            request.setAttribute("action", "list");
            request.getRequestDispatcher(layout).forward(request, response);
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        ProductFacade pf = new ProductFacade();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = pf.select(id);
            request.setAttribute("product", product);

            CategoryFacade cf = new CategoryFacade();
            List<Category> list = cf.select();
            //Truyền list cho view để tạo combobox
            request.setAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Can't read this Product from the db.");
        }
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void edit_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        ProductFacade pf = new ProductFacade();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            double price = Double.parseDouble(request.getParameter("price"));
            double discount = Double.parseDouble(request.getParameter("discount"));
            String category = request.getParameter("category");

            //Truyền list cho view để tạo combobox
            CategoryFacade cf = new CategoryFacade();
            List<Category> list = cf.select();
            request.setAttribute("list", list);
            //Tạo đối tượng product
            Product product = new Product();
            product.setId(id);
            product.setName(name);
            product.setGender(gender);
            product.setPrice(price);
            product.setDiscount(discount);
            product.setCategory(category);
            //Lưu product vào request để khi bị ngoại lệ thì hiện lại thông tin đã nhập
            request.setAttribute("product", product);
            //update product vào db
            pf.update(product);
            //Quay vể trang product/manage.do
            response.sendRedirect(request.getContextPath() + "/product/manage.do");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Can't save product into the db.");
            request.setAttribute("action", "edit");
            request.getRequestDispatcher(layout).forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
