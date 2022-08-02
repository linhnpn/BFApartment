/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.ServiceDAO;
import entity.Service;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Minh Hoàng
 */
public class UpdateServiceController extends HttpServlet {

    private static final String ERROR = "SearchServiceController";
    private static final String SUCCESS = "SearchServiceController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String serID = request.getParameter("serID");
            String serName = request.getParameter("serName");
            //
            String serDate = request.getParameter("serDate");            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = sdf.parse(serDate);
            java.sql.Date sqlDate = new Date(date.getTime());
            //
            float serPrice = Float.parseFloat(request.getParameter("serPrice"));  
            //
            ServiceDAO dao = new ServiceDAO();
            Service s = dao.getService(serID);
            //
            s.setServiceName(serName);
            s.setCreatedDate(sqlDate);
            s.setPrice(serPrice);
            boolean check = dao.updateService(s);
            if (check) {
                    url = SUCCESS;
            }
        } catch (NumberFormatException | SQLException | ParseException e) {
            log("Error at UpdateServiceController" + e.toString());
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
