/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.TroubleDAO;
import dto.TroubleDTO;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "SendTroubleController", urlPatterns = {"/SendTroubleController"})
public class SendTroubleController extends HttpServlet {
    
    private final static String ERROR = "MainController?action=BeforeCreateTrouble";
    private final static String SUCCESS = "user.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String mess = "";
        boolean confirm = true;
        try {
            String apartmentId = request.getParameter("apartmentId");
            String typeId = request.getParameter("typeId");
            if (typeId == null || "".equals(typeId)) {
                mess += "Vui lòng chọn loại sự cố!!\n";
                confirm = false;
            }
            String detail = request.getParameter("detail");
            if (detail == null || "".equals(detail.trim())) {
                mess += "Vui lòng điền chi tiết thông tin bạn gặp phải!!\n";
                confirm = false;
            }
            java.util.Date now = new java.util.Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            
            String date = request.getParameter("date");
            if (date == null || "".equals(date.trim()) || !Utils.isValidDate(date) || now.compareTo(Utils.getDate(date)) == -1) {
                mess += "Ngày không hợp lệ!!";
                confirm = false;
            }
            if (confirm) {
                TroubleDAO dao = new TroubleDAO();
                String tranId = "TRAN" + String.valueOf(dao.getIndexTrouble() + 1);
                TroubleDTO trouble = new TroubleDTO(tranId, apartmentId, "", date, typeId, detail, false);
                boolean check = dao.createTrouble(trouble);
                if (check) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("ERROR", mess);
            }
            
        } catch (Exception e) {
            log("Error at SendTroubleController: " + e.toString());
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
