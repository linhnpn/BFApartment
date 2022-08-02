/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ResidentDAO;
import dao.UserDAO;
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
@WebServlet(name = "DeleteResidentController", urlPatterns = {"/DeleteResidentController"})
public class DeleteResidentController extends HttpServlet {

    private static final String SUCCESS = "user.jsp";
    private static final String ERROR = "deleteResident.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String[] residentId = request.getParameterValues("delete");
            ResidentDAO daoRes = new ResidentDAO();
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            UserDAO dao = new UserDAO();
            String ownerId = dao.getOwnerId(loginUser.getUserID());
            String requestId = "REQ";
            int indexReq = daoRes.getIndexRequest() + 1;
            if (indexReq > 99) {
                requestId += String.valueOf(indexReq);
            } else if (indexReq >= 10 && indexReq <= 99) {
                requestId += "0" + String.valueOf(indexReq);
            } else {
                requestId += "00" + String.valueOf(indexReq);
            }
            daoRes.insertRequest(requestId, ownerId, "delete", "0");
            for (String residentIdElement : residentId) {
                daoRes.updateResident(requestId, residentIdElement);
            }
            url = SUCCESS;

        } catch (ClassNotFoundException | SQLException e) {
            log("Error at DeleteResidentController: " + e.toString());
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
