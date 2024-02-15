/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import db.Product;
import db.ProductFacade;
import java.io.IOException;
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
            case "create":
                create(request, response);
                break;
            case "create_handler":
                create_handler(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "edit_handler":
                edit_handler(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "delete_handler":
                delete_handler(request, response);
                break;
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

    protected void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        try {
            ProductFacade pf = new ProductFacade();
            List<Product> list = pf.select();
            request.setAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Can't read the Product table.");
        }
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void create_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        ProductFacade pf = new ProductFacade();
        try {
            String pName = request.getParameter("pName");
            String pImage = request.getParameter("pImage");
            double pPrice = Double.parseDouble(request.getParameter("pPrice"));
            int bID = Integer.parseInt(request.getParameter("bID"));

            pf.add(pName, pImage, pPrice, bID);

            request.getRequestDispatcher("/product/list.do").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Can't save Product into the db.");
            request.setAttribute("action", "add");
        }
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        int pID = Integer.parseInt(request.getParameter("pID"));
        request.setAttribute("pID", pID);
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void delete_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        ProductFacade pf = new ProductFacade();
        try {
            int pID = Integer.parseInt(request.getParameter("pID"));
            String op = request.getParameter("op");
            switch (op) {
                case "Yes":
                    pf.delete(pID);
                    break;
                case "No":
                    break;
            }
            response.sendRedirect(request.getContextPath() + "/product/list.do");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Can't delete this Product.");
            request.setAttribute("action", "list");
            request.getRequestDispatcher(layout).forward(request, response);
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        ProductFacade pf = new ProductFacade();
        try {
            int pID = Integer.parseInt(request.getParameter("pID"));
            Product product = pf.select(pID);
            request.setAttribute("product", product);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", e.getMessage());
        }
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void edit_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        ProductFacade pf = new ProductFacade();
        try {
            int pID = Integer.parseInt(request.getParameter("pID"));
            String pName = request.getParameter("pName");
            String pImage = request.getParameter("pImage");
            double pPrice = Double.parseDouble(request.getParameter("pPrice"));
            int bID = Integer.parseInt(request.getParameter("bID"));

            Product product = new Product();

            product.setpID(pID);
            product.setpName(pName);
            product.setpImage(pImage);
            product.setpPrice(pPrice);
            product.setbID(bID);

            request.setAttribute("product", product);

            pf.update(product);

            response.sendRedirect(request.getContextPath() + "/product/list.do");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", e.getMessage());
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
