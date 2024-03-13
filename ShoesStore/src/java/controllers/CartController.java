/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import db.Account;
import db.Customer;
import db.CustomerFacade;
import db.Product;
import db.ProductFacade;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;

/**
 *
 * @author Nguyen Tien Kha
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

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
            case "index":
                index(request, response);
                break;
            case "add":
                add(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "empty":
                empty(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "checkout":
                checkout(request, response);
                break;
            case "thanks":
                thanks(request, response);
                break;
        }
    }

    protected void index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String size = request.getParameter("size");
            //doc thong tin product tu db
            ProductFacade pf = new ProductFacade();
            Product product = pf.select(id, size);
            //lay tham chieu cua session
            HttpSession session = request.getSession();
            //lay cart tu session
            Cart cart = (Cart) session.getAttribute("cart");
            //neu trong session chua co cart
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            //them item vao cart
            Item item = new Item(id, product, 1, size);
            cart.add(item);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("errorMsg", "Error when loading product data.");
        }
        request.getRequestDispatcher("/product/list.do").forward(request, response);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        //Lay cart tu session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        //xoa item tuong ung voi id trong cart
        cart.remove(id);
        //quay ve trang cart/index.do
        request.getRequestDispatcher("/cart/index.do").forward(request, response);
    }

    protected void empty(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Lay cart tu session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        cart.empty();
        //quay ve trang cart/index.do
        request.getRequestDispatcher("/cart/index.do").forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        //Lay cart tu session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        //update item tuong ung voi id trong cart
        cart.update(id, quantity);
        //quay ve trang cart/index.do
        request.getRequestDispatcher("/cart/index.do").forward(request, response);
    }

    protected void checkout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //kiem tra user co login chua?
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            //chuyen den trang login 
            request.getRequestDispatcher("/account/login.do").forward(request, response);
        } else {
            try {
                //thuc hien thanh toan
                CustomerFacade cf = new CustomerFacade();
                Customer customer = cf.select(account.getId());
                //xoa sach gio hang 
                Cart cart = (Cart) session.getAttribute("cart");
                List<Item> cartItems = new ArrayList<>(cart.getItems());
                double totalCost = cart.getTotalCost();
                if (totalCost > customer.getMoney()) {
                    request.setAttribute("errorMsg", "Insufficient funds.");
                    request.getRequestDispatcher("/cart/index.do").forward(request, response);
                } else {
                    int id = customer.getId();
                    double money = customer.getMoney() - totalCost;
                    int accountId = customer.getAccountId();
                    Customer newCustomer = new Customer(id, money, accountId);
                    cf.update(newCustomer);
                    session.setAttribute("customer", newCustomer);
                    cart.empty();
                }
                //chuyen user den trang invoice
                request.setAttribute("cartItems", cartItems);
                request.setAttribute("totalCost", totalCost);
                request.getRequestDispatcher("/cart/thanks.do").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMsg", "Error when loading product data.");
            }

        }
    }

    protected void thanks(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        request.getRequestDispatcher(layout).forward(request, response);
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
