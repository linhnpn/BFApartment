<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm hợp đồng</title>
        <link rel="stylesheet" href="css/addResident.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'AD')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <!--NEW-->
            <div class="container">
                <h2 class="text-center" style="margin-top: 20px;">Thêm mới hợp đồng</h2>
                <form action="MainController" method="POST">
                    <div id="inputElement">                        
                        <div class="contractElement">
                            <hr>
                            <div class="form-row">
                                <div class="col-md-6 mb-3">
                                    <label>Mã căn hộ: </label>
                                    <select class="service custom-select" name="apartmentId">
                                    <%
                                        try {
                                            String sql = "SELECT apartmentId, size FROM Apartments WHERE status = 1 ORDER BY apartmentId";
                                            Connection conn = utils.Utils.getConnection();
                                            PreparedStatement ptm = conn.prepareStatement(sql);
                                            ResultSet rs = ptm.executeQuery();
                                            while (rs.next()) {
                                    %>
                                    <option value=" <%=rs.getString("apartmentId")%>"><%=rs.getString("apartmentId")%>-<%=rs.getString("size")%> mét vuông</option>
                                    <%
                                            }
                                        } catch (Exception e) {
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Mã chủ hộ: </label>
                                <select class="service custom-select" name="ownerId">
                                    <%
                                        try {
                                            String sql = "SELECT ownerId, fullName FROM Owners WHERE Owners.ownerId NOT IN (SELECT ownerId FROM Contracts)";
                                            Connection conn = utils.Utils.getConnection();
                                            PreparedStatement ptm = conn.prepareStatement(sql);
                                            ResultSet rs = ptm.executeQuery();
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("ownerId")%>"><%=rs.getString("ownerId")%>-<%=rs.getString("fullName")%></option>
                                    <%
                                            }
                                        } catch (Exception e) {
                                        }
                                    %>
                                </select>
                            </div>
                        </div>                       
                    </div>
                    <div class="form-row" >
                        <div class="col-md-6 mb-3" >
                            <label>Ngày ký: </label>
                            <input type="date" id="Elec" class="form-control" name="startDate" placeholder="">
                        </div>
                        <div class="col-md-6 mb-3" >
                            <label>Ngày kết thúc: </label>
                            <input type="date" class="form-control" name="endDate" placeholder="" value="">
                        </div>
                    </div>
                </div>
                <hr>
                <button type="submit" class="btn btn-primary btn-form float-right" name="action" value="CreateContract">Thêm mới hợp đồng</button>
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
            $(".contract").addClass("active");
        });
    </script>
</html>
