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
        String strUserName = request.getParameter("txtUserName");
        String strPassword = request.getParameter("txtPassword");
        if (AuthUtils.isValidLogin(strUserName, strPassword)) {
            url = "search.jsp";
            UserDTO user = AuthUtils.getUser(strUserName);
            request.getSession().setAttribute("user", user);
            // search
            processSearch(request, response);
        } else {
            request.setAttribute("error", "Incorrect UserName or Password");
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
            request.setAttribute("mess", "You have loggout successfully!");
        }
        return url;
    }

    public void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {
            searchTerm = "";
        }
        List<StartupProjectsDTO> sp = spDAO.searchByName2(searchTerm);
        request.setAttribute("sp", sp);
        request.setAttribute("searchTerm", searchTerm);
    }

    public String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "search.jsp";
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
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

    public String processUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "search.jsp";
        HttpSession session = request.getSession();
        if (AuthUtils.isFounders(session)) {
            try {
                String project_id = request.getParameter("project_id");
                String status = request.getParameter("Status");
                /// check
                System.out.println("DEBUG: project_id = " + project_id);
                System.out.println("DEBUG: status = " + status);
                ///
                if (project_id != null && !project_id.trim().isEmpty() && status != null) {
                    StartupProjectsDTO project = spDAO.readById(project_id);
                    if (project != null) {
                        project.setStatus(status);
                        boolean updated = spDAO.update(project);
                        if (updated) {
                            request.setAttribute("message", "Project updated successfully!");
                        } else {
                            request.setAttribute("message", "Update failed!");
                        }
                    }
                }
                url = processSearch(request, response);
            } catch (Exception e) {
                log("Error at processUpdate: " + e.toString());
            }
        }
        return url;
    }

    public String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "spForm.jsp";
        HttpSession session = request.getSession();

        if (AuthUtils.isFounders(session)) {
            try {
                boolean checkError = false;
                String project_name = request.getParameter("txtProject_name").trim();
                String description = request.getParameter("txtDescription").trim();
                String status = request.getParameter("txtStatus").trim();
                String estimatedLaunchStr = request.getParameter("txtEstimatedLaunch").trim();

                // Validate dữ liệu
                if (!ProjectValidator.isValidName(project_name)) {
                    checkError = true;
                    request.setAttribute("txtProject_name_error", "Invalid Project Name.");
                }
                if (!ProjectValidator.isValidDescription(description)) {
                    checkError = true;
                    request.setAttribute("txtDescription_error", "Invalid Description.");
                }
                if (!ProjectValidator.isValidStatus(status)) {
                    checkError = true;
                    request.setAttribute("txtStatus_error", "Invalid Status.");
                }
                if (!ProjectValidator.isValidDate(estimatedLaunchStr)) {
                    checkError = true;
                    request.setAttribute("txtEstimatedLaunch_error", "Invalid Launch Date.");
                }

                // Nếu hợp lệ, thêm vào database
                if (!checkError) {
                    StartupProjectsDAO spDAO = new StartupProjectsDAO();
                    int project_id = spDAO.getNextProjectId();
                    Date estimatedLaunch = new SimpleDateFormat("yyyy-MM-dd").parse(estimatedLaunchStr);

                    StartupProjectsDTO project = new StartupProjectsDTO(project_id, project_name, description, status, estimatedLaunch);
                    spDAO.create(project);

                    url = processSearch(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
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
                } else if (action.equals("update")) {
                    url = processUpdate(request, response);
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
