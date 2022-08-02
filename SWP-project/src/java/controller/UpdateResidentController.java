/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ResidentDAO;
import dto.ResidentDTO;
import dto.ResidentError;
import java.io.IOException;
import java.sql.SQLException;
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
@WebServlet(name = "UpdateResidentController", urlPatterns = {"/UpdateResidentController"})
public class UpdateResidentController extends HttpServlet {

    private static final String SUCCESS = "MainController?action=ViewResident&search=";
    private static final String ERROR = "MainController?action=ViewResident&search=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            String indexPage = request.getParameter("index");
            if ("".equals(indexPage) || indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
            url = ERROR + search + "&index=" + index;
            String residentId = request.getParameter("residentId");
            String ownerId = request.getParameter("ownerId");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            boolean sex = "1".equals(gender);
            String dob = request.getParameter("dob");
            String job = request.getParameter("job");
            String phone = request.getParameter("phone");
            boolean confirm = true;
            ResidentError resError = new ResidentError();
            if (name.length() < 7) {
                resError.setNameError("Tên phải nhiều hơn 7 kí tự");
                confirm = false;
            }
            if (!"1".equals(gender) && !"0".equals(gender)) {
                resError.setSexError("Giới tính không hợp lệ");
                confirm = false;
            }
            if (!Utils.isValidDate(dob)) {
                resError.setDobError("Ngày sinh không hợp lệ");
                confirm = false;
            }
            if (job.length() < 5) {
                resError.setJobError("Công việc phải nhiều hơn 5 kí tự");
                confirm = false;
            }
            if (!Utils.inputPattern(phone, "[\\d]{10}") || phone.length() < 10) {
                resError.setPhoneError("SĐT phải có định dạng số và lớn hơn 10 kí tự");
                confirm = false;
            }
            ResidentDAO dao = new ResidentDAO();
            ResidentDTO resident = new ResidentDTO(residentId, ownerId, name, dob, sex, job, phone, true, "");
            boolean check = false;
            if (confirm) {
                if (residentId.equals(ownerId)) {
                    check = dao.updateOwner(resident);
                } else {
                    check = dao.updateResident(resident);
                }
                if (check) {
                    url = SUCCESS + search + "&index=" + index;
                    request.setAttribute("SUCCESS", "Updated Success!!!");
                } else {
                    request.setAttribute("ERROR", "Error!!!");
                }
            } else {
                request.setAttribute("INFO_ERROR", resError);
                request.setAttribute("ERROR", "Error!!!");
            }

        } catch (SQLException e) {
            log("Error at UpdateResidentController: " + e.toString());
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
