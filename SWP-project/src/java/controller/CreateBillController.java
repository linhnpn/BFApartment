/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BillDAO;
import dto.BillDTO;
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
@WebServlet(name = "CreateBillController", urlPatterns = {"/CreateBillController"})
public class CreateBillController extends HttpServlet {

    private static final String SUCCESS = "employee.jsp";
    private static final String ERROR = "createBill.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String date = request.getParameter("date");
        String[] serviceId = request.getParameterValues("serviceId");
        String apartmentId = request.getParameter("apartmentId");
        String oldElec = request.getParameter("oldIndexElec");
        String newElec = request.getParameter("newIndexElec");
        String oldWater = request.getParameter("oldIndexWater");
        String newWater = request.getParameter("newIndexWater");
        BillDAO dao;
        try {
            dao = new BillDAO();
            int usageElec = Integer.parseInt(newElec) - Integer.parseInt(oldElec);
            int usageWater = Integer.parseInt(newWater) - Integer.parseInt(oldWater);
            if (usageElec > 0 && usageWater > 0) {
                double priceElec = dao.getPrice("E01");
                double priceWater = dao.getPrice("W01");
                double total = priceElec * usageElec + usageWater * priceWater;
                String billId = String.valueOf(dao.countBill("%%", "%%") + 1);
                dao.addBill(new BillDTO(billId, total, false, date, apartmentId));
                if (serviceId != null && serviceId.length > 0) {
                    for (String serviceId1 : serviceId) {
                        double price = dao.getPrice(serviceId1);
                        total += price;
                        dao.addBillDetail(billId, serviceId1, price);
                    }
                }
                dao.addBillDetail(billId, "E01", priceElec * usageElec);
                dao.addBillDetail(billId, "W01", usageWater * priceWater);
                dao.addServiceBillDetail(oldElec, newElec, usageElec, date, "E01", billId);
                dao.addServiceBillDetail(oldWater, newWater, usageWater, date, "W01", billId);
                url = SUCCESS;
                request.setAttribute("SUCESS", "Success!!");
            } else {
                request.setAttribute("ERROR", "Chỉ số mới phải lớn hơn!!!");
            }

        } catch (SQLException e) {
            log("Error at Create Bill Controller: " + e.toString());
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
