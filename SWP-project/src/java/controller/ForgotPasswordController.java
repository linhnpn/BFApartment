/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.PasswordError;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Utils;

/**
 *
 * @author Nhat Linh
 */
@WebServlet(name = "ForgotPasswordController", urlPatterns = {"/ForgotPasswordController"})
public class ForgotPasswordController extends HttpServlet {

    private static final String ERROR = "newPassword.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String userId = request.getParameter("userId");
        String password = request.getParameter("newPassword");
        String rePassword = request.getParameter("reNewPassword");
        PasswordError error = new PasswordError();
        String url = ERROR;
        boolean check = true;
        try {
            if (userId != null && !userId.isEmpty()) {
                UserDAO dao = new UserDAO();
                if (password.length() <= 2) {
                    error.setNewPassError("Mật khẩu yếu!!");
                    check = false;
                }
                if (!password.equals(rePassword)) {
                    error.setReNewPassError("Không khớp!!");
                    check = false;
                }
                if (check) {
                    boolean cofirm = dao.updatePass(userId, Utils.getMd5(password));
                    if (cofirm) {
                        url = SUCCESS;
                    }
                } else {
                    request.setAttribute("PASSWORD_ERROR", error);
                }
            }else {
                url = "login.jsp";
            }
        } catch (SQLException e) {
            log("Error at ForgotPasswordController: " + e.toString());
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
