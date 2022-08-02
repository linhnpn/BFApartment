/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BillDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nhat Linh
 */
@WebServlet(name = "UpdateStatusBillController", urlPatterns = {"/UpdateStatusBillController"})
public class UpdateStatusBillController extends HttpServlet {

    private static final String SUCCESS = "MainController?action=ViewAllBill&index=";
    private static final String ERROR = "MainController?action=ViewAllBill&index=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String billId = request.getParameter("billId");
            String status = request.getParameter("status");
            String indexPage = request.getParameter("index");
            if ("".equals(indexPage) || indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
            url += index;
            BillDAO dao = new BillDAO();
            if (dao.updateStatusBill(billId, status)) {
                url = SUCCESS + index;
                request.setAttribute("SUCCESS", "Success!!!");
            } else {
                request.setAttribute("ERROR", "Error!!!");
            }
        } catch (NumberFormatException | SQLException e) {
            log("Error at UpdateStatusBillController: " + e.toString());

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
