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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nhat Linh
 */
@WebServlet(name = "ViewAllBillController", urlPatterns = {"/ViewAllBillController"})
public class ViewAllBillController extends HttpServlet {

    private static final String ERROR = "employee.jsp";
    private static final String SUCCESS = "listBill.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String search = request.getParameter("search");
        if (search == null) {
            search = "";
        }
        String indexPage = request.getParameter("index");
        if ("".equals(indexPage) || indexPage == null) {
            indexPage = "1";
        }
        int count = 0;
        int index = Integer.parseInt(indexPage);
        int tag = index;
        String url = ERROR;
        List<BillDTO> list;
        BillDAO dao = new BillDAO();
        try {
            count = dao.countBillV2("%" + search + "%", "%" + search + "%");
            int endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }
            list = dao.getBillV2("%" + search + "%", "%" + search + "%", index);
            if (list.size() > 0) {
                request.setAttribute("endP", endPage);
                request.setAttribute("tag", tag);
                request.setAttribute("LIST_ALL_BILL", list);
                url = SUCCESS;
            }
        } catch (SQLException e) {
            log("Error at ViewAllBillController: " + e.toString());
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
