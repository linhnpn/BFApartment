/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import dto.UserDTO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author linhn
 */
@WebFilter(filterName = "Authen", urlPatterns = {"/*"})
public class Authen implements Filter {

    private static List<String> USER_RESOURCES;
    private static List<String> ADMIN_RESOURCES;
    private static List<String> EMPLOYEE_RESOURCES;
    private static List<String> NON_AUTHEN_RESOURCES;
    private static final String US = "US";
    private static final String AD = "AD";
    private static final String EM = "EM";
    private static final String LOGIN_PAGE = "login.jsp";
    private static final boolean debug = true;

    private FilterConfig filterConfig = null;

    public Authen() {
        //resource ma role US co quyen truy cap
        USER_RESOURCES = new ArrayList<>();
        USER_RESOURCES.add("login.jsp");
        USER_RESOURCES.add("changePassword.jsp");
        USER_RESOURCES.add("addResident.jsp");
        USER_RESOURCES.add("createTrouble.jsp");
        USER_RESOURCES.add("deleteResident.jsp");
        USER_RESOURCES.add("headerUser.jsp");
        USER_RESOURCES.add("payment.jsp");
        USER_RESOURCES.add("slider.jsp");
        USER_RESOURCES.add("user.jsp");
        USER_RESOURCES.add("viewBill.jsp");
        USER_RESOURCES.add("viewDetailBill.jsp");
        USER_RESOURCES.add("viewRequest.jsp");
        USER_RESOURCES.add("viewRoom.jsp");

        USER_RESOURCES.add("AddResidentController");
        USER_RESOURCES.add("BeforeCreateTroubleController");
        USER_RESOURCES.add("BeforeDeleteResidentController");
        USER_RESOURCES.add("ChangePasswordController");
        USER_RESOURCES.add("DeleteResidentController");
        USER_RESOURCES.add("LoginController");
        USER_RESOURCES.add("LogoutController");
        USER_RESOURCES.add("PayBillController");
        USER_RESOURCES.add("RejectRequestController");
        USER_RESOURCES.add("ViewBillController");
        USER_RESOURCES.add("ViewBillDetailController");
        USER_RESOURCES.add("SendTroubleController");
        USER_RESOURCES.add("MainController");
        USER_RESOURCES.add("ViewDetailRoomController");
        USER_RESOURCES.add("ViewRequestController");

        //resource ma role AD co quyen truy cap
        ADMIN_RESOURCES = new ArrayList<>();
        ADMIN_RESOURCES.add("addContract.jsp");
        ADMIN_RESOURCES.add("addOwner.jsp");
        ADMIN_RESOURCES.add("addService.jsp");
        ADMIN_RESOURCES.add("admin.jsp");
        ADMIN_RESOURCES.add("changePassword.jsp");
        ADMIN_RESOURCES.add("headerAdmin.jsp");
        ADMIN_RESOURCES.add("homeAdmin.jsp");
        ADMIN_RESOURCES.add("login.jsp");
        ADMIN_RESOURCES.add("managerAccount.jsp");
        ADMIN_RESOURCES.add("searchService.jsp");
        ADMIN_RESOURCES.add("viewAccount.jsp");
        ADMIN_RESOURCES.add("viewApartment.jsp");
        ADMIN_RESOURCES.add("viewContract.jsp");
        ADMIN_RESOURCES.add("viewResident.jsp");
        ADMIN_RESOURCES.add("viewTroubleAdmin.jsp");

        ADMIN_RESOURCES.add("AddOwnerController");
        ADMIN_RESOURCES.add("AddServiceController");
        ADMIN_RESOURCES.add("ChangePasswordController");
        ADMIN_RESOURCES.add("CreateAccountController");
        ADMIN_RESOURCES.add("CreateContractController");
        ADMIN_RESOURCES.add("DeleteContractController");
        ADMIN_RESOURCES.add("DeleteController");
        ADMIN_RESOURCES.add("LoginController");
        ADMIN_RESOURCES.add("LogoutController");
        ADMIN_RESOURCES.add("MainController");
        ADMIN_RESOURCES.add("RemoveServiceController");
        ADMIN_RESOURCES.add("SearchApartmentController");
        ADMIN_RESOURCES.add("SearchContractController");
        ADMIN_RESOURCES.add("SearchController");
        ADMIN_RESOURCES.add("SearchServiceController");
        ADMIN_RESOURCES.add("StatisticController");
        ADMIN_RESOURCES.add("UpdateApartmentController");
        ADMIN_RESOURCES.add("UpdateContractController");
        ADMIN_RESOURCES.add("UpdateController");
        ADMIN_RESOURCES.add("UpdateServiceController");
        ADMIN_RESOURCES.add("ViewResidentController");
        ADMIN_RESOURCES.add("ViewTroubleController");

        //resource ma role EM co quyen truy cap
        EMPLOYEE_RESOURCES = new ArrayList<>();
        EMPLOYEE_RESOURCES.add("login.jsp");
        EMPLOYEE_RESOURCES.add("changePassword.jsp");
        EMPLOYEE_RESOURCES.add("employee.jsp");
        EMPLOYEE_RESOURCES.add("headerEmp.jsp");
        EMPLOYEE_RESOURCES.add("listBill.jsp");
        EMPLOYEE_RESOURCES.add("createBill.jsp");
        EMPLOYEE_RESOURCES.add("requestResident.jsp");
        EMPLOYEE_RESOURCES.add("viewDetailBill.jsp");
        EMPLOYEE_RESOURCES.add("viewResident.jsp");
        EMPLOYEE_RESOURCES.add("viewTroubleEmployee.jsp");

        EMPLOYEE_RESOURCES.add("AcceptRequestController");
        EMPLOYEE_RESOURCES.add("ChangePasswordController");
        EMPLOYEE_RESOURCES.add("LoginController");
        EMPLOYEE_RESOURCES.add("MainController");
        EMPLOYEE_RESOURCES.add("LogoutController");
        EMPLOYEE_RESOURCES.add("RejectRequestController");
        EMPLOYEE_RESOURCES.add("RemoveResidentController");
        EMPLOYEE_RESOURCES.add("UpdateResidentController");
        EMPLOYEE_RESOURCES.add("UpdateStatusBillController");
        EMPLOYEE_RESOURCES.add("UpdateTroubleController");
        EMPLOYEE_RESOURCES.add("ViewAllBillController");
        EMPLOYEE_RESOURCES.add("ViewBillDetailController");
        EMPLOYEE_RESOURCES.add("ViewResidentController");
        EMPLOYEE_RESOURCES.add("ViewTroubleController");
        EMPLOYEE_RESOURCES.add("BefCreateBillController");
        EMPLOYEE_RESOURCES.add("CreateBillController");
        EMPLOYEE_RESOURCES.add("befResidentRequestController");

        //resource khong can xac thuc, ai cung truy cap dc
        NON_AUTHEN_RESOURCES = new ArrayList<>();
        NON_AUTHEN_RESOURCES.add("login.jsp");
        NON_AUTHEN_RESOURCES.add("home.jsp");
        NON_AUTHEN_RESOURCES.add("footer.jsp");
        NON_AUTHEN_RESOURCES.add("footer2.jsp");
//        NON_AUTHEN_RESOURCES.add("css");
//        NON_AUTHEN_RESOURCES.add("fonts");
//        NON_AUTHEN_RESOURCES.add("assets");
//        NON_AUTHEN_RESOURCES.add("images");
//        NON_AUTHEN_RESOURCES.add("js");
//        NON_AUTHEN_RESOURCES.add("vendor");
        NON_AUTHEN_RESOURCES.add("MainController");
        NON_AUTHEN_RESOURCES.add("LoginController");

        NON_AUTHEN_RESOURCES.add(".jpg");
        NON_AUTHEN_RESOURCES.add(".svg");
        NON_AUTHEN_RESOURCES.add(".png");
        NON_AUTHEN_RESOURCES.add(".ico");
        NON_AUTHEN_RESOURCES.add(".css");
        NON_AUTHEN_RESOURCES.add(".eot");
        NON_AUTHEN_RESOURCES.add(".svg");
        NON_AUTHEN_RESOURCES.add(".ttf");
        NON_AUTHEN_RESOURCES.add(".woff");
        NON_AUTHEN_RESOURCES.add(".woff2");
        NON_AUTHEN_RESOURCES.add(".otf");
        NON_AUTHEN_RESOURCES.add(".less");
        NON_AUTHEN_RESOURCES.add(".scss");
        NON_AUTHEN_RESOURCES.add(".js");
        NON_AUTHEN_RESOURCES.add(".map");

    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("Authen:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("Authen:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            String uri = req.getRequestURI();
            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);
            boolean checkContain = false;
            for (String value : NON_AUTHEN_RESOURCES) {
                if (uri.contains(value)) {
                    checkContain = true;
                    break;
                }
            }
            checkContain = true; //xoa sau khi da xong
            if (checkContain) {
                chain.doFilter(request, response);
            } else {
                HttpSession session = req.getSession();
//                xac thuc
                if (session == null || session.getAttribute("LOGIN_USER") == null) {
                    res.sendRedirect(LOGIN_PAGE);
                } else {
//                    phan quyen
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    String roleID = loginUser.getRoleID();
                    if (AD.equals(roleID) && ADMIN_RESOURCES.contains(resource)) {
                        chain.doFilter(request, response);
                    } else if (US.equals(roleID) && USER_RESOURCES.contains(resource)) {
                        chain.doFilter(request, response);
                    } else if (EM.equals(roleID) && EMPLOYEE_RESOURCES.contains(resource)) {
                        chain.doFilter(request, response);
                    } else {
                        res.sendRedirect(LOGIN_PAGE);
                    }
                }
            }
        } catch (Exception e) {
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("Authen:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("Authen()");
        }
        StringBuffer sb = new StringBuffer("Authen(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
