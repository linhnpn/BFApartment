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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Trieu Do
 */
@WebServlet(name = "SearchApartmentController", urlPatterns = {"/SearchApartmentController"})
public class SearchApartmentController extends HttpServlet {

    private static final String ERROR = "viewApartment.jsp";
    private static final String SUCCESS = "viewApartment.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String indexPage = request.getParameter("index");
        if ("".equals(indexPage) || indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        int tag = index;
        String url = ERROR;
        int count = 0;
        List<ApartmentDTO> listApartment = null;
        ApartmentDAO dao = new ApartmentDAO();
        try {
            String searchApartment = request.getParameter("searchApartment");
            count = dao.getTotalApartment(searchApartment);
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            if (searchApartment == null) {
                searchApartment = "";
            }
            listApartment = dao.getListApartment_AD(searchApartment, index);
            request.setAttribute("endP", endPage);
            request.setAttribute("tag", tag);
            if (listApartment.size() > 0) {
                request.setAttribute("LIST_APARTMENT", listApartment);
                url = SUCCESS;
            }
        } catch (SQLException e) {
            log("Error at SearchController: " + e.toString());
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
