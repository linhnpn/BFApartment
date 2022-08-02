/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ServiceDAO;
import entity.ServiceDetail;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh Hoàng
 */
public class AddDetailServiceController extends HttpServlet {

    private static final String ERROR = "addDetailService.jsp";
    private static final String SUCCESS = "addDetailService.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            ServiceDAO dao = new ServiceDAO();
            String detailID = request.getParameter("detailID");
            if (dao.checkDuplicateServiceDetail(detailID)) {
                request.setAttribute("MESSAGE", "Duplicate ID: " + detailID);
            } else {
                String serID = request.getParameter("serID");
                //
                int nIndex = Integer.parseInt(request.getParameter("nIndex"));
                int oIndex = Integer.parseInt(request.getParameter("oIndex"));
                //
                float price = Float.parseFloat(request.getParameter("price"));
                //
                if (nIndex < oIndex) {
                    request.setAttribute("MESSAGE", "New index must be greater than old index!");
                } else {
                    Date date = dao.getService(serID).getCreatedDate();
                    ServiceDetail sd = new ServiceDetail(detailID, nIndex, oIndex, price, date, serID);
                    if (dao.addSerDetail(sd)) {
                            url = SUCCESS;
                            request.setAttribute("MESSAGE", "successfully!");
                    }
                    else {
                        request.setAttribute("MESSAGE", "add fail!");
                    }
                }
            }
        } catch (NumberFormatException e) {
            request.setAttribute("MESSAGE", "Wrong format price!");
            log("Error at AddDetailServiceController" + e.toString());
        } catch (SQLException ex) {
            Logger.getLogger(AddDetailServiceController.class.getName()).log(Level.SEVERE, null, ex);
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
