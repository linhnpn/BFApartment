<%-- 
    Document   : addService
    Created on : May 30, 2022, 8:33:29 PM
    Author     : Minh Hoàng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="entity.ServiceTypes"%>
<%@page import="dao.ServiceDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm dịch vụ</title>
        <link rel="stylesheet" href="css/viewTrouble.css"/>

    </head>
    <%
        ServiceDAO dao = new ServiceDAO();
        List<ServiceTypes> listType = dao.getListServiceType();
    %>
    <body>
        <jsp:include page="headerAdmin.jsp"></jsp:include>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'AD')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
            <!--NEW-->
            <div class="container">
                <h2 class="text-center" style="margin-top: 3%;">Thêm dịch vụ</h2>
                <form action="MainController" method="POST">
                    <div id="inputElement">                        
                        <div class="billElement">
                            <hr>
                            <div class="form-row">
                                <div class="col-md-4 mb-3">
                                    <label>Mã dịch vụ: </label>
                                    <input type="text" class="form-control" name="serID" value="" required="">
                                </div>
                                <div class="col-md-8 mb-3">
                                    <label>Tên dịch vụ: </label>
                                    <input type="text" class="form-control" name="serName" value="" required="">
                                </div>
                            </div>
                            <div class="form-row" >
                                <div class="col-md-4 mb-3" >
                                    <label>Ngày tạo: </label>
                                    <input type="date" id="Elec" class="form-control" name="serDate" placeholder="123..">
                                </div>
                                <div class="col-md-4 mb-3" >
                                    <label>Giá (VNĐ): </label>
                                    <input type="text" class="form-control" name="serPrice" placeholder="123..." value="">
                                </div>
                                <div class="col-md-4 mb-3" >
                                    <label>Loại dịch vụ: </label>
                                    <select class="custom-select" name="type">
                                    <%
                                        for (ServiceTypes st : listType) {
                                    %>
                                    <option value="<%=st.getTypeId()%>"><%=st.getTypeName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <br>
                            </div>
                        </div>                       
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-form float-right" name="action" value="AddService">Thêm dịch vụ</button>
            </form>
            <a href="MainController?action=Statistic">
                <button class="btn btn-form float-right btn-light">Hủy</button>
            </a> 
        </div>
        <!--END-NEW-->
        <jsp:include page="footer.jsp"></jsp:include>
        </body>
    <c:if test="${requestScope.ERROR_MESSAGE!=null}">
        <c:if test="${not empty requestScope.ERROR_MESSAGE}">
            <script>
                $(document).ready(function () {
                    alert("${requestScope.ERROR_MESSAGE}");
                });
            </script>
        </c:if>
    </c:if>
    <script>
        $(document).ready(function () {
            $(".service").addClass("active");
        });
    </script>
</html>
