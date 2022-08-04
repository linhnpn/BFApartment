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
@WebServlet(name = "AddOwnerController", urlPatterns = {"/AddOwnerController"})
public class AddOwnerController extends HttpServlet {

    private static final String SUCCESS = "MainController?action=Statistic";
    private static final String ERROR = "addOwner.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String name = request.getParameter("name");
            String userId = request.getParameter("userId");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String job = request.getParameter("job");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            boolean check = true;
            ResidentError error;
            ResidentDTO owner;
            owner = new ResidentDTO();
            error = new ResidentError();
            if (name.length() < 7) {
                error.setNameError("Tên phải nhiều hơn 7 kí tự");
                check = false;
            } else {
                owner.setName(name);
            }
            if (email.length() < 7 || !Utils.validEmail(email)) {
                error.setEmailError("Email phải nhiều hơn 7 kí tự và fomat abc@gmail.com");
                check = false;
            } else {
                owner.setEmail(email);
            }
            if (!"1".equals(gender) && !"0".equals(gender)) {
                error.setSexError("Giới tính không hợp lệ.");
                check = false;
            } else {
                owner.setGender("1".equals(gender));
            }
            java.util.Date now = new java.util.Date();
            if (!Utils.isValidDate(dob)) {
                error.setDobError("Ngày sinh không hợp lệ");
                check = false;
            } else if (now.compareTo(Utils.getDate(dob)) == -1) {
                error.setDobError("Ngày sinh không thể đặt trong tương lai!!");
                check = false;
            } else {
                owner.setDob(dob);
            }
            if (job.length() < 5) {
                error.setJobError("Công việc phải nhiều hơn 5 kí tự");
                check = false;
            } else {
                owner.setJob(job);
            }
            if (!Utils.inputPattern(phone, "[\\d]{10}") || phone.length() < 10) {
                error.setPhoneError("SĐT phải có định dạng số và lớn hơn 10 kí tự");
                check = false;
            } else {
                owner.setPhone(phone);
            }

            if (check) {
                ResidentDAO dao = new ResidentDAO();
                int indexOwn = dao.countOwner("", "") + 1;
                String ownerId = "OWN" + indexOwn;
                boolean confirm = dao.addOwner(new ResidentDTO(userId, ownerId, name, dob, "1".equals(gender), job, email, phone, true));
                if (confirm) {
                    url = SUCCESS;
                    request.setAttribute("SUCCESS", "Success!!!");
                } else {
                    request.setAttribute("ERROR", "Error!!!");
                }
            } else {
                request.setAttribute("OWNER_ERROR", error);
                request.setAttribute("OWNER", owner);
            }

        } catch (SQLException e) {
            log("Error at AddResidentCOntroller: " + e.toString());
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
