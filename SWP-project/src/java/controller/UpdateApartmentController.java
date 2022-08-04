/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ApartmentDAO;
import dto.ApartmentDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Trieu Do
 */
@WebServlet(name = "UpdateApartmentController", urlPatterns = {"/UpdateApartmentController"})
public class UpdateApartmentController extends HttpServlet {

    private static final String ERROR = "MainController?action=SearchApartment&searchApartment=";
    private static final String SUCCESS = "MainController?action=SearchApartment&searchApartment=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        boolean check, confirm;
        try {
            String apartmentId = request.getParameter("apartmentId");
            String image = request.getParameter("image");
            String status = request.getParameter("status");
            String salePrice = request.getParameter("salePrice");
            String rentPrice = request.getParameter("rentPrice");
            String search = request.getParameter("searchApartment");
            if (search == null) {
                search = "";
            }
            ApartmentDAO dao = new ApartmentDAO();
            ApartmentDTO apartment = new ApartmentDTO(apartmentId, image, Float.parseFloat(rentPrice), Float.parseFloat(salePrice), status);
            confirm = dao.checkRoom(apartmentId);
            if (status.equals("1") && confirm) {
                request.setAttribute("ERROR", "Lỗi: Không thể cập nhật trạng thái với phòng đang sử dụng trong hợp đồng!!!");
            } else {
                check = dao.updateApartment(apartment) && dao.UpdateAprtmentPrice(apartment);
                if (check) {
                    url = SUCCESS + search;
                }
            }

        } catch (NumberFormatException | SQLException e) {
            log("Error at UpdateController: " + e.toString());
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
