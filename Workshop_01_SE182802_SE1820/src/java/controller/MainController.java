/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.StartupProjectsDAO;
import dao.UserDAO;
import dto.StartupProjectsDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AuthUtils;

/**
 *
 * @author tungi
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private StartupProjectsDAO spDAO = new StartupProjectsDAO();

    private static final String LOGIN_PAGE = "login.jsp";

    private String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        String strUserID = request.getParameter("txtUserID");
        String strPassword = request.getParameter("txtPassword");
        if (AuthUtils.isValidLogin(strUserID, strPassword)) {
            url = "search.jsp";
            UserDTO user = AuthUtils.getUser(strUserID);
            request.getSession().setAttribute("user", user);

            // search
            processSearch(request, response);
        } else {
            request.setAttribute("error", "Incorrect UserID or Password");
            url = "login.jsp";
        }
        return url;
    }

    private String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            request.getSession().invalidate(); // Hủy bỏ session
            url = "login.jsp";
        }
        return url;
    }

    public String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            // search
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm == null) {
                searchTerm = "";
            }
            List<StartupProjectsDTO> sp = spDAO.searchByName2(searchTerm);
            request.setAttribute("sp", sp);
            request.setAttribute("searchTerm", searchTerm);
        }
        return url;
    }

    public String processDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isFounders(session)) {
            String id = request.getParameter("id");
            spDAO.updateYearLessThan2025(id);
            // search
            processSearch(request, response);
            url = "search.jsp";
        }
        return url;
    }

    public String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isFounders(session)) {
            try {
                boolean checkError = false;
                int project_id = Integer.parseInt(request.getParameter("txtProject_id"));
                String project_name = request.getParameter("txtProject_name");
                String description = request.getParameter("txtDescription");
                String status = request.getParameter("txtStatus");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date estimated_launch = sdf.parse(request.getParameter("txtEstimatedLaunch"));

                String pID = request.getParameter("txtProject_id");
                project_id = 0;
                if (pID != null && !pID.trim().isEmpty()) {
                    project_id = Integer.parseInt(pID);
                } else {
                    checkError = true;
                    request.setAttribute("txtProject_id_error", "Project ID cannot be empty.");
                }

                SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
                int year = Integer.parseInt(yyyy.format(estimated_launch));
                if (year < 2025) {
                    checkError = true;
                    request.setAttribute("txtEstimated_launch_error", "Year of estimated launch must be at least 2025.");
                }

                StartupProjectsDTO sp = new StartupProjectsDTO(project_id, project_name, description, status, estimated_launch);

                if (!checkError) {
                    spDAO.create(sp);
                    // search
                    url = processSearch(request, response);
                } else {
                    url = "StartupProjectsForm.jsp";
                    request.setAttribute("sp", sp);
                }
            } catch (Exception e) {
            }
        }
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            System.out.println("action: " + action);
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    url = processLogin(request, response);
                } else if (action.equals("logout")) {
                    url = processLogout(request, response);
                } else if (action.equals("search")) {
                    url = processSearch(request, response);
                } else if (action.equals("delete")) {
                    url = processDelete(request, response);
                } else if (action.equals("add")) {
                    url = processAdd(request, response);
                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
