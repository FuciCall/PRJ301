/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.controllers;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.tblUsers;

/**
 *
 * @author as
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        //get ve cac thong tin
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        
        tblUsers user = new UserDAO().findByTkMk(userId,password);
        
        //TH1: khong tim thay
        if (user == null) {
            request.setAttribute("error", "Incorrect UserID or Password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            //TH2: tim thay
        } else {
            //chuyen sang trang can thiet
            response.sendRedirect("skibiki_bye_bye");
        }
    }

}
