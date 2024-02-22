/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import db.Account;
import db.AccountFacade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PHT
 */
@WebServlet(name = "AccountController", urlPatterns = {"/account"})
public class AccountController extends HttpServlet {

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
            case "login":
                //hien form login
                login(request, response);
                break;
            case "login_handler":
                //xu ly form login
                login_handler(request, response);
                break;
            case "logout":
                //xu ly logout
                logout(request, response);
                break;
        }
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Doc email & password tu cookies
        Cookie ckEmail = null;
        Cookie ckPassword = null;
        Cookie cks[] = request.getCookies();
        for (Cookie ck : cks) {
            if (ck.getName().equals("email")) {
                ckEmail = ck;
            } else if (ck.getName().equals("password")) {
                ckPassword = ck;
            }
        }
        //Luu cac cookies vao request
        request.setAttribute("email", ckEmail);
        request.setAttribute("password", ckPassword);
        //Cho hien form login
        String layout = (String) request.getAttribute("layout");
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void login_handler(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String layout = (String) request.getAttribute("layout");
        try {
            //lay thong tin tu client
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            boolean remember = request.getParameter("remember") != null;
            System.out.println("Remember: " + remember);
            //kiem tra thong tin login
            AccountFacade af = new AccountFacade();
            Account account = af.login(email, password);
            //lay tham chieu cua session
            HttpSession session = request.getSession();
            //neu login thanh cong
            if (account != null) {
                //luu email & password vao cookies
                int maxAge = remember? 7 * 24 * 60 * 60: 0;//1 week
                Cookie ckEmail = new Cookie("email", email);
                //Neu khong setMaxAge() thi ckEmail chi la cookie tam thoi
                //chi ton trong 1 session
                ckEmail.setMaxAge(maxAge);
                response.addCookie(ckEmail);
                Cookie ckPassword = new Cookie("password", password);
                ckPassword.setMaxAge(maxAge);
                response.addCookie(ckPassword);
                //luu account vao session
                session.setAttribute("account", account);
                //chuyen den trang home
                request.getRequestDispatcher("/").forward(request, response);
                //request.getRequestDispatcher("/home/index.do").forward(request, response);
            } else {
                //gan thong bao loi
                request.setAttribute("errorMsg", "Please check your email and password.");
                //quay ve trang login
                request.getRequestDispatcher("/account/login.do").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher(layout).forward(request, response);
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //lay tham chieu cua session
        HttpSession session = request.getSession();
        //huy session
        session.invalidate();
        //quay ve trang home
        request.getRequestDispatcher("/").forward(request, response);
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
