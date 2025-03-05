package controller;

import dao.ProjectDAO;
import dao.UserDAO;
import dto.ProjectDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private ProjectDAO projectDAO = new ProjectDAO();
    private static final String LOGIN_PAGE = "login.jsp";

    public UserDTO getUser (String strUserID) {
        UserDAO udao = new UserDAO(); 
        return udao.readById(strUserID);
    }

    public boolean isValidLogin(String strUserID, String strPassword) {
        UserDTO user = getUser (strUserID);
        return user != null && user.getPassword().equals(strPassword);
    }

    public void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {
            searchTerm = "";
        }
        List<ProjectDTO> projects = projectDAO.searchByTitle2(searchTerm);
        request.setAttribute("projects", projects);
        request.setAttribute("searchTerm", searchTerm);
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
                    String strUserID = request.getParameter("txtUserID");
                    String strPassword = request.getParameter("txtPassword");
                    if (isValidLogin(strUserID, strPassword)) {
                        url = "search.jsp";
                        UserDTO user = getUser (strUserID);
                        request.getSession().setAttribute("user", user);
                        search(request, response);
                    } else {
                        request.setAttribute("message", "Incorrect UserID or Password");
                        url = "login.jsp";
                    }
                } else if (action.equals("logout")) {
                    request.getSession().invalidate();
                    url = "login.jsp";
                } else if (action.equals("search")) {
                    search(request, response);
                    url = "search.jsp";
                } else if (action.equals("delete")) {
                    String id = request.getParameter("id");
                    projectDAO.updateQuantityToZero(id);
                    search(request, response);
                    url = "search.jsp";
                } else if (action.equals("add")) {
                    try {
                        boolean checkError = false;
                        int project_id = Integer.parseInt(request.getParameter("txtproject_id"));
                        String project_name = request.getParameter("txtproject_name");
                        String description = request.getParameter("txtDescription");
                        String status = request.getParameter("txtStatus");
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Date estimated_launch = sdf.parse(request.getParameter("txtestimated_launch"));

                        ProjectDTO project = new ProjectDTO(project_id, project_name, description, status, estimated_launch);
                        if (!checkError) {
                            projectDAO.create(project);
                            search(request, response);
                            url = "search.jsp";
                        } else {
                            url = "projectForm.jsp";
                            request.setAttribute("project", project);
                        }
                    } catch (Exception e) {
                        // Xử lý lỗi
                    }
                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}