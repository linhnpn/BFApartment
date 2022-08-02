/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ResidentDAO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nhat Linh
 */
@WebServlet(name = "RejectRequestController", urlPatterns = {"/RejectRequestController"})
public class RejectRequestController extends HttpServlet {

    private static final String ERROR_US = "MainController?action=ViewRequest";
    private static final String ERROR_EM = "MainController?action=befResidentRequest";
    private static final String SUCCESS_US = "MainController?action=ViewRequest";
    private static final String SUCCESS_EM = "MainController?action=befResidentRequest";
    private static final String EM = "EM";
    private static final String US = "US";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String requestId = request.getParameter("requestId");
            ResidentDAO dao = new ResidentDAO();
            boolean check = dao.updateRequest(requestId);
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String curUser = loginUser.getRoleID();
            if (US.equals(curUser)) {
                url = ERROR_US;
            } else if (EM.equals(curUser)) {
                url = ERROR_EM;
            }
            if (check) {
                if (EM.equals(curUser)) {
                    url = SUCCESS_EM;
                } else if (US.equals(curUser)) {
                    url = SUCCESS_US;
                }
            }

        } catch (SQLException e) {
            log("Error at RejectRequestController: " + e.toString());
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
