/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.StartupProjectsDTO;
import dao.StartupProjectsDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserDTO;

/**
 *
 * @author as
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    private StartupProjectsDAO spDAO = new StartupProjectsDAO();
    private static final String LOGIN_PAGE = "login.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public UserDTO getUser(String username) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readById(username);
        return user;
    }

    public boolean isValidLogin(String StrUserName, String StrPassword) {
        UserDTO user = getUser(StrUserName);
        return user != null && user.getPassword().equals(StrPassword);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    String StrUserName = request.getParameter("txtUserName");
                    String StrPassword = request.getParameter("txtPassword");
                    if (isValidLogin(StrUserName, StrPassword)) {
                        url = "search.jsp";
                        UserDTO user = getUser(StrUserName);
                        request.getSession().setAttribute("user", user);
                    } else {
                        request.setAttribute("error", "Incorrect UserName or Password");
                        url = "login.jsp";
                    }
                } else if (action.equals("logout")) {
                    request.getSession().invalidate(); //huy session
                    request.setAttribute("mess", "You have sucessfully logged out!");
                    url = "login.jsp";
                } else if (action.equals("search")) {
                    url = "search.jsp";
                    String searchTerm = request.getParameter("searchTerm");
                    List<StartupProjectsDTO> sp = spDAO.searchByName(searchTerm);
                    request.setAttribute("sp", sp);
            //check error        System.out.println(sp);
                    request.setAttribute("searchTerm", searchTerm);
                    
                }else if (action.equals("delete")) {   
                    String id = request.getParameter("id");
                    spDAO.updateYearEqual2024(id);
                    //search
                    url = "search.jsp";
                    
                    String searchTerm = request.getParameter("searchTerm");
                    List<StartupProjectsDTO> sp = spDAO.searchByName2(searchTerm);
                    request.setAttribute("sp", sp);
            //check error        System.out.println(sp);
                    request.setAttribute("searchTerm", searchTerm);
                    
                }
            }

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
