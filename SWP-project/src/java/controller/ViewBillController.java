/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BillDAO;
import dto.BillDTO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nhat Linh
 */
@WebServlet(name = "ViewBillController", urlPatterns = {"/ViewBillController"})
public class ViewBillController extends HttpServlet {

    private static final String ERROR = "viewBill.jsp";
    private static final String SUCCESS = "viewBill.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String indexPage = request.getParameter("index");
        if ("".equals(indexPage) || indexPage == null) {
            indexPage = "1";
        }
        int count = 0;
        int index = Integer.parseInt(indexPage);
        int tag = index;
        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        String curUser = loginUser.getUserID();
        List<BillDTO> listBill = null;
        BillDAO dao = new BillDAO();
        String url = ERROR;
        try {
            count = dao.countBill(curUser, "%%");
            int endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }
            listBill = dao.getBill(curUser, "%%", index);
            if (listBill.size() > 0) {
                request.setAttribute("endP", endPage);
                request.setAttribute("tag", tag);
                request.setAttribute("LIST_BILL", listBill);
                url = SUCCESS;
            }
        } catch (SQLException e) {
            log("Error at ViewBillController: " + e.toString());
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
