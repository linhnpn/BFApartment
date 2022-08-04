/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ResidentDAO;
import dao.UserDAO;
import dto.ResidentDTO;
import dto.ResidentError;
import dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Utils;

/**
 *
 * @author Nhat Linh
 */
@WebServlet(name = "AddResidentController", urlPatterns = {"/AddResidentController"})
public class AddResidentController extends HttpServlet {

    private static final String SUCCESS = "MainController?action=ViewRequest";
    private static final String ERROR = "addResident.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String[] name = request.getParameterValues("name");
            String[] dob = request.getParameterValues("dob");
            String[] gender = request.getParameterValues("gender");
            String[] job = request.getParameterValues("job");
            String[] phone = request.getParameterValues("phone");
            boolean check = true;
            List<ResidentError> listResError = new ArrayList<>();
            List<ResidentDTO> listRes = new ArrayList<>();
            for (int i = 0; i < name.length; i++) {
                ResidentDTO res = new ResidentDTO();
                ResidentError resError = new ResidentError();
                if (name[i].length() < 7) {
                    resError.setNameError("Tên của người thứ " + (i + 1) + " phải nhiều hơn 7 kí tự");
                    check = false;
                } else {
                    res.setName(name[i]);
                }
                if (!"1".equals(gender[i]) && !"0".equals(gender[i])) {
                    resError.setSexError("Giới tính của người thứ " + (i + 1) + " không hợp lệ.");
                    check = false;
                } else {
                    res.setGender("1".equals(gender[i]));
                }
                java.util.Date now = new java.util.Date();
                if (!Utils.isValidDate(dob[i])) {
                    resError.setDobError("Ngày sinh của người thứ " + (i + 1) + " không hợp lệ");
                    check = false;
                } else if (now.compareTo(Utils.getDate(dob[i])) == -1) {
                    resError.setDobError("Ngày sinh không thể đặt trong tương lai!!");
                    check = false;
                } else {
                    res.setDob(dob[i]);
                }
                if (job[i].length() < 5) {
                    resError.setJobError("Công việc của người thứ " + (i + 1) + " phải nhiều hơn 5 kí tự");
                    check = false;
                } else {
                    res.setJob(job[i]);
                }
                if (!Utils.inputPattern(phone[i], "[\\d]{10}") || phone[i].length() < 10) {
                    resError.setPhoneError("SĐT phải có định dạng số và lớn hơn 10 kí tự");
                    check = false;
                } else {
                    res.setPhone(phone[i]);
                }
                listResError.add(resError);
                listRes.add(res);
            }
            if (check) {
                int count = 0;
                HttpSession session = request.getSession();
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                UserDAO dao = new UserDAO();
                String ownerId = dao.getOwnerId(loginUser.getUserID());
                ResidentDAO daoRes = new ResidentDAO();
                int indexRes = daoRes.countResident();
                String residentId = "";
                int indexReq = daoRes.getIndexRequest() + 1;
                String requestId = "REQ";
                if (indexReq > 99) {
                    requestId += String.valueOf(indexReq);
                } else {
                    requestId += "0" + String.valueOf(indexReq);
                }
                boolean confirm = daoRes.insertRequest(requestId, ownerId, "add", "0");
                if (confirm) {
                    for (int i = 0; i < name.length; i++) {
                        residentId = "RES" + String.valueOf(indexRes + i + 1);
                        confirm = daoRes.addResident(new ResidentDTO(residentId, ownerId, name[i], dob[i], (gender[i].equals("1")), job[i], phone[i], false, requestId));
                        if (confirm) {
                            count++;
                        }
                    }
                    if (count > 0) {
                        url = SUCCESS;
                    }
                }
            } else {
                request.setAttribute("RESIDENT_ERROR", listResError);
                request.setAttribute("RESIDENT", listRes);
            }

        } catch (ClassNotFoundException | SQLException e) {
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
