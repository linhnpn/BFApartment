/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh Hoàng
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN_ACTION = "Login";
    private static final String LOGIN = "LoginController";
    private static final String FORGOT = "ForgotPassword";
    private static final String FORGOT_CONTROLLER = "ForgotPasswordController";
    private static final String LOGOUT_ACTION = "Logout";
    private static final String LOGOUT = "LogoutController";
    private static final String CREATE_ACCOUNT_ACTION = "createAccount";
    private static final String CREATEACCOUNT = "CreateAccountController";
    private static final String STATISTIC = "Statistic";
    private static final String STATISTIC_CONTROLLER = "StatisticController";
    private static final String UPDATE_CONTRACT = "UpdateContract";
    private static final String VIEW_DETAIL_ROOM = "ViewDetailRoom";
    private static final String VIEW_DETAIL_ROOM_CONTROLLER = "ViewDetailRoomController";
    private static final String DELETE_CONTRACT = "DeleteContract";
    private static final String DELETE_CONTRACT_CONTROLLER = "DeleteContractController";
    private static final String UPDATE_CONTRACT_CONTROLLER = "UpdateContractController";
    private static final String BEF_CREATE_BILL = "BefCreateBill";
    private static final String BEF_CREATE_BILL_CONTROLLER = "BefCreateBillController";
    private static final String LOAD_INDEX = "LoadIndex";
    private static final String LOAD_INDEX_CONTROLLER = "LoadIndexController";
    private static final String SEARCH_ACTION = "Search";
    private static final String SEARCH = "SearchController";
    private static final String UPDATE_ACTION = "Update";
    private static final String UPDATE = "UpdateController";
    private static final String DELETE_ACTION = "Delete";
    private static final String DELETE = "DeleteController";
    private static final String SENDMAIL_ACTION = "SendMail";
    private static final String CHECK_USERNAME = "CheckUserName";
    private static final String VIEW_REQUEST = "ViewRequest";
    private static final String VIEW_REQUEST_CONTROLLER = "ViewRequestController";
    private static final String CHECK_USERNAME_CONTROLLER = "CheckUserController";
    private static final String CREATE_CONTRACT = "CreateContract";
    private static final String CREATE_CONTRACT_CONTROLLER = "CreateContractController";
    private static final String CREATE_BILL = "CreateBill";
    private static final String CREATE_BILL_CONTROLLER = "CreateBillController";
    private static final String SENDMAIL = "SendMailController";
    private static final String ADD_SERVICE_ACTION = "AddService";
    private static final String ADD_SERVICE = "AddServiceController";
    private static final String SEARCH_SERVICE_ACTION = "SearchService";
    private static final String SEARCH_SERVICE = "SearchServiceController";
    private static final String UPDATE_SERVICE_ACTION = "UpdateService";
    private static final String UPDATE_SERVICE = "UpdateServiceController";
    private static final String REMOVE_SERVICE_ACTION = "RemoveService";
    private static final String REMOVE_SERVICE = "RemoveServiceController";
    private static final String ADD_DETAIL_SERVICE_ACTION = "AddDetailService";
    private static final String ADD_DETAIL_SERVICE = "AddDetailServiceController";

    private static final String VIEW_TROUBLE = "ViewTrouble";
    private static final String VIEW_TROUBLE_CONTROLLER = "ViewTroubleController";
    private static final String UPDATE_TROUBLE = "UpdateTrouble";
    private static final String UPDATE_TROUBLE_CONTROLLER = "UpdateTroubleController";
    private static final String SEND_TROUBLE = "SendTrouble";
    private static final String SEND_TROUBLE_CONTROLLER = "SendTroubleController";
    private static final String CREATE_TROUBLE = "CreateTrouble";
    private static final String CREATE_TROUBLE_CONTROLLER = "CreateTroubleController";
    private static final String VIEW_RESIDENT = "ViewResident";
    private static final String UPDATE_STATUS_BILL = "UpdateStatusBill";
    private static final String UPDATE_STATUS_BILL_CONTROLLER = "UpdateStatusBillController";
    private static final String VIEW_RESIDENT_CONTROLLER = "ViewResidentController";
    private static final String ADD_RESIDENT = "AddResident";
    private static final String ADD_RESIDENT_CONTROLLER = "AddResidentController";
    private static final String BEFORE_CREATE_TROUBLE = "BeforeCreateTrouble";
    private static final String BEFORE_CREATE_TROUBLE_CONTROLLER = "BeforeCreateTroubleController";
    private static final String BEFORE_DELETE_RESIDENT = "BeforeDeleteResident";
    private static final String BEFORE_DELETE_RESIDENT_CONTROLLER = "BeforeDeleteResidentController";
    private static final String DELETE_RESIDENT = "DeleteResident";
    private static final String DELETE_RESIDENT_CONTROLLER = "DeleteResidentController";
    private static final String BEFORE_RESIDENT_REQUEST = "befResidentRequest";
    private static final String BEFORE_RESIDENT_REQUEST_CONTROLLER = "befResidentRequestController";
    private static final String ACCEPT_REQUEST = "AcceptRequest";
    private static final String ACCEPT_REQUEST_CONTROLLER = "AcceptRequestController";
    private static final String REJECT_REQUEST = "RejectRequest";
    private static final String UPDATE_RESIDENT = "UpdateResident";
    private static final String REMOVE_RESIDENT = "RemoveResident";
    private static final String REJECT_REQUEST_CONTROLLER = "RejectRequestController";
    private static final String UPDATE_RESIDENT_CONTROLLER = "UpdateResidentController";
    private static final String REMOVE_RESIDENT_CONTROLLER = "RemoveResidentController";
    private static final String ADD_OWNER = "AddOwner";
    private static final String ADD_OWNER_CONTROLLER = "AddOwnerController";

    private static final String VIEW_BILL = "ViewBill";
    private static final String PAY_BILL = "PayBill";
    private static final String PAY_BILL_CONTROLLER = "PayBillController";
    private static final String VIEW_BILL_DETAIL = "ViewDetail";
    private static final String VIEW_ALL_BILL = "ViewAllBill";
    private static final String VIEW_ALL_BILL_CONTROLLER = "ViewAllBillController";
    private static final String VIEW_BILL_CONTROLLER = "ViewBillController";
    private static final String VIEW_BILL_DETAIL_CONTROLLER = "ViewBillDetailController";
    private static final String CHANGE_PASSWORD = "ChangePassword";
    private static final String CHANGE_PASSWORD_CONTROLLER = "ChangePasswordController";

    private static final String SEARCH_APARTMENT = "SearchApartment";
    private static final String SEARCH_APARTMENT_CONTROLLER = "SearchApartmentController";
    private static final String UPDATE_APARTMENT = "UpdateApartment";
    private static final String UPDATE_APARTMENT_CONTROLLER = "UpdateApartmentController";
    private static final String UPDATE_APARTMENT_STATUS = "UpdateApartmentStatus";
    private static final String UPDATE_APARTMENT_STATUS_CONTROLLER = "UpdateApartmentStatusController";
    private static final String AD_SEARCH_CONTRACT = "SearchContract";
    private static final String AD_SEARCH_CONTRACT_CONTROLLER = "SearchContractController";
    private static final String CREATE_TYPE_TROUBLE = "CreateTypeTrouble";
    private static final String CREATE_TYPE_TROUBLE_CONTROLLER = "CreateTypeTroubleController";
    private static final String SEARCH_TYPE_TROUBLE = "SearchTypeTrouble";
    private static final String SEARCH_TYPE_TROUBLE_CONTROLLER = "SearchTypeTroubleController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN_ACTION.equals(action)) {
                url = LOGIN;
            } else if (UPDATE_RESIDENT.equals(action)) {
                url = UPDATE_RESIDENT_CONTROLLER;
            } else if (FORGOT.equals(action)) {
                url = FORGOT_CONTROLLER;
            } else if (CHECK_USERNAME.equals(action)) {
                url = CHECK_USERNAME_CONTROLLER;
            } else if (BEF_CREATE_BILL.equals(action)) {
                url = BEF_CREATE_BILL_CONTROLLER;
            } else if (LOAD_INDEX.equals(action)) {
                url = LOAD_INDEX_CONTROLLER;
            } else if (VIEW_DETAIL_ROOM.equals(action)) {
                url = VIEW_DETAIL_ROOM_CONTROLLER;
            } else if (CREATE_BILL.equals(action)) {
                url = CREATE_BILL_CONTROLLER;
            } else if (STATISTIC.equals(action)) {
                url = STATISTIC_CONTROLLER;
            } else if (VIEW_REQUEST.equals(action)) {
                url = VIEW_REQUEST_CONTROLLER;
            } else if (REMOVE_RESIDENT.equals(action)) {
                url = REMOVE_RESIDENT_CONTROLLER;
            } else if (UPDATE_CONTRACT.equals(action)) {
                url = UPDATE_CONTRACT_CONTROLLER;
            } else if (ADD_OWNER.equals(action)) {
                url = ADD_OWNER_CONTROLLER;
            } else if (DELETE_CONTRACT.equals(action)) {
                url = DELETE_CONTRACT_CONTROLLER;
            } else if (LOGOUT_ACTION.equals(action)) {
                url = LOGOUT;
            } else if (UPDATE_STATUS_BILL.equals(action)) {
                url = UPDATE_STATUS_BILL_CONTROLLER;
            } else if (VIEW_ALL_BILL.equals(action)) {
                url = VIEW_ALL_BILL_CONTROLLER;
            } else if (CREATE_ACCOUNT_ACTION.equals(action)) {
                url = CREATEACCOUNT;
            } else if (PAY_BILL.equals(action)) {
                url = PAY_BILL_CONTROLLER;
            } else if (SEARCH_ACTION.equals(action)) {
                url = SEARCH;
            } else if (UPDATE_ACTION.equals(action)) {
                url = UPDATE;
            } else if (DELETE_ACTION.equals(action)) {
                url = DELETE;
            } else if (ACCEPT_REQUEST.equals(action)) {
                url = ACCEPT_REQUEST_CONTROLLER;
            } else if (REJECT_REQUEST.equals(action)) {
                url = REJECT_REQUEST_CONTROLLER;
            } else if (SENDMAIL_ACTION.equals(action)) {
                url = SENDMAIL;
            } else if (ADD_SERVICE_ACTION.equals(action)) {
                url = ADD_SERVICE;
            } else if (SEARCH_SERVICE_ACTION.equals(action)) {
                url = SEARCH_SERVICE;
            } else if (UPDATE_SERVICE_ACTION.equals(action)) {
                url = UPDATE_SERVICE;
            } else if (REMOVE_SERVICE_ACTION.equals(action)) {
                url = REMOVE_SERVICE;
            } else if (ADD_DETAIL_SERVICE_ACTION.equals(action)) {
                url = ADD_DETAIL_SERVICE;
            } else if (VIEW_TROUBLE.equals(action)) {
                url = VIEW_TROUBLE_CONTROLLER;
            } else if (UPDATE_TROUBLE.equals(action)) {
                url = UPDATE_TROUBLE_CONTROLLER;
            } else if (CREATE_TROUBLE.equals(action)) {
                url = CREATE_TROUBLE_CONTROLLER;
            } else if (SEND_TROUBLE.equals(action)) {
                url = SEND_TROUBLE_CONTROLLER;
            } else if (VIEW_RESIDENT.equals(action)) {
                url = VIEW_RESIDENT_CONTROLLER;
            } else if (ADD_RESIDENT.equals(action)) {
                url = ADD_RESIDENT_CONTROLLER;
            } else if (BEFORE_CREATE_TROUBLE.equals(action)) {
                url = BEFORE_CREATE_TROUBLE_CONTROLLER;
            } else if (BEFORE_DELETE_RESIDENT.equals(action)) {
                url = BEFORE_DELETE_RESIDENT_CONTROLLER;
            } else if (DELETE_RESIDENT.equals(action)) {
                url = DELETE_RESIDENT_CONTROLLER;
            } else if (BEFORE_RESIDENT_REQUEST.equals(action)) {
                url = BEFORE_RESIDENT_REQUEST_CONTROLLER;
            } else if (VIEW_BILL.equals(action)) {
                url = VIEW_BILL_CONTROLLER;
            } else if (VIEW_BILL_DETAIL.equals(action)) {
                url = VIEW_BILL_DETAIL_CONTROLLER;
            } else if (CHANGE_PASSWORD.equals(action)) {
                url = CHANGE_PASSWORD_CONTROLLER;
            } else if (CREATE_CONTRACT.equals(action)) {
                url = CREATE_CONTRACT_CONTROLLER;
            } else if (SEARCH_APARTMENT.equals(action)) {
                url = SEARCH_APARTMENT_CONTROLLER;
            } else if (UPDATE_APARTMENT.equals(action)) {
                url = UPDATE_APARTMENT_CONTROLLER;
            } else if (UPDATE_APARTMENT_STATUS.equals(action)) {
                url = UPDATE_APARTMENT_STATUS_CONTROLLER;
            } else if (AD_SEARCH_CONTRACT.equals(action)) {
                url = AD_SEARCH_CONTRACT_CONTROLLER;
            } else if (CREATE_TYPE_TROUBLE.equals(action)) {
                url = CREATE_TYPE_TROUBLE_CONTROLLER;
            } else if (SEARCH_TYPE_TROUBLE.equals(action)) {
                url = SEARCH_TYPE_TROUBLE_CONTROLLER;
            } else {

                HttpSession session = request.getSession();
                session.setAttribute("ERROR_MESSAGE", "Function is not avaible!");
            }
        } catch (Exception e) {
            log("Error at MainController:" + e.toString());
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
