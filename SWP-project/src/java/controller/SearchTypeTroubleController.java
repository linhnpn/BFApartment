/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.TroubleDAO;
import dto.TroubleTypeDTO;
import dto.UserDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Trieu Do
 */
@WebServlet(name = "ViewTypeTroubleController", urlPatterns = {"/ViewTypeTroubleController"})
public class SearchTypeTroubleController extends HttpServlet {

    private static final String ERROR_AD = "admin.jsp";
    private static final String ERROR_EM = "employee.jsp";
    private static final String SUCCESS_AD = "troubleType.jsp";
    private static final String SUCCESS_EM = "troubleType.jsp";
    private static final String AD = "AD";
    private static final String EM = "EM";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        String curUser = loginUser.getRoleID();
        String url = "";
        List<TroubleTypeDTO> listTypeTrouble = null;
        TroubleDAO dao = new TroubleDAO();
        if (AD.equals(curUser)) {
            url = ERROR_AD;
        } else if (EM.equals(curUser)) {
            url = ERROR_EM;
        }
        try {
            String searchTypeTrouble = request.getParameter("searchTypeTrouble");
            if (searchTypeTrouble == null) {
                searchTypeTrouble = "";
            }
            if (AD.equals(curUser)) {
                listTypeTrouble = dao.getListTypeTrouble();
            } else if (EM.equals(curUser)) {
                listTypeTrouble = dao.getListTypeTrouble();
            }
            if (listTypeTrouble.size() > 0) {
                request.setAttribute("LIST_TYPE_TROUBLE", listTypeTrouble);
                if (AD.equals(curUser)) {
                    url = SUCCESS_AD;
                } else if (EM.equals(curUser)) {
                    url = SUCCESS_EM;
                }
            }

        } catch (Exception e) {
            log("Error at ViewTroubleController: " + e.toString());
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
