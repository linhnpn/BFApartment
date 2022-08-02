/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ServiceDAO;
import entity.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh Hoàng
 */
public class AddServiceController extends HttpServlet {

    private static final String ERROR = "addService.jsp";
    private static final String SUCCESS = "addService.jsp";

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
            String type = request.getParameter("type");
            Service s = new Service(serID, serName, sqlDate, 1, type, serPrice);
            ServiceDAO SerDAO = new ServiceDAO();
            String mess;
            boolean checkDuplicate = SerDAO.checkDuplicate(serID);
            if (checkDuplicate) {
                mess = "Mã dịch vụ đã tồn tại: " + serID + " !";
                request.setAttribute("ERROR_MESSAGE", mess);
            } else {
                boolean checkInsert = SerDAO.insertService(s);
                if (checkInsert) {
                    url = SUCCESS;
                    mess = "Add new service successfully!";
                    request.setAttribute("ERROR_MESSAGE", mess);
                } else {
                    mess = "Cannot insert, unknow error!";
                    request.setAttribute("ERROR_MESSAGE", mess);
                }
            }
            
        } catch (Exception e) {
            log("Error at AddServiceController" + e.toString());
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
