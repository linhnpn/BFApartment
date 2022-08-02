/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BillDAO;
import entity.BankAccount;
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
@WebServlet(name = "PayBillController", urlPatterns = {"/PayBillController"})
public class PayBillController extends HttpServlet {

    private static final String ERROR = "payment.jsp";
    private static final String SUCCESS = "MainController?action=ViewBill";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String billId = request.getParameter("billId");
            double total = Double.parseDouble(request.getParameter("total"));
            String accountNum = request.getParameter("bankNumber");
            String PIN = request.getParameter("PIN");
            String name = request.getParameter("name");
            String bankName = request.getParameter("bankName");
            BillDAO dao = new BillDAO();
            boolean check = false;
            BankAccount bank = dao.checkBank(accountNum, PIN, name, bankName);
            if (bank != null) {
                if (total < bank.getBlance()) {
                    check = dao.minusMoney(accountNum, total) && dao.addMoney(total);
                    if (check) {
                        dao.PaymentBill(billId);
                        url = SUCCESS;
                    }
                } else {
                    request.setAttribute("BANK_ERROR", "Your blance is not enough");
                }
            } else {
                request.setAttribute("BANK_ERROR", "Your bank account is invalid");
            }
        } catch (SQLException e) {
            log("Error at PayBillController: " + e.toString());
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
