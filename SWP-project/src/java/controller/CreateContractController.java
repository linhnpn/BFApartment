/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ApartmentDAO;
import dao.ContractDAO;
import dto.ContractDTO;
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
@WebServlet(name = "CreateContractController", urlPatterns = {"/CreateContractController"})
public class CreateContractController extends HttpServlet {

    private static final String ERROR = "addContract.jsp";
    private static final String SUCCESS = "addContract.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String ownerId = request.getParameter("ownerId").replaceAll(" ", "");
            String apartmentId = request.getParameter("apartmentId").replaceAll(" ", "");
            boolean check = true;
            ContractDAO contractDao = new ContractDAO();
            ApartmentDAO dao = new ApartmentDAO();
            int numId = contractDao.countContract("") + 1;
            String contractId = "CT" + (numId < 10 ? ("0" + numId) : numId);
            ContractDTO contract = new ContractDTO(contractId, apartmentId, ownerId, startDate, endDate, "1");
            String mess = "";
            if (contractDao.checkDuplicateApartment(apartmentId)) {
                mess = "Mã phòng " + apartmentId + " đã được sử dụng";
                request.setAttribute("ERROR_MESSAGE", mess);
                check = false;
            }
            if (contractDao.checkDuplicateOwner(ownerId)) {
                mess = "Khách hàng " + ownerId + " đã có hợp đồng";
                request.setAttribute("ERROR_MESSAGE", mess);
                check = false;
            }
            if (check) {
                boolean checkCreate = contractDao.insertContract(contract);
                dao.updateApartmentStatus(apartmentId, "0");
                if (checkCreate) {
                    mess = "Tạo hợp đồng thành công";
                    request.setAttribute("ERROR_MESSAGE", mess);
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR_MESSAGE", mess);
                }
            }
        } catch (SQLException e) {
            log("Error at CreateContractController" + e.toString());
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
