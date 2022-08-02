<%-- 
    Document   : troubleType
    Created on : Jun 14, 2022, 4:22:55 PM
    Author     : Trieu Do
--%>

<%@page import="dto.TroubleTypeDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trouble Type Page</title>
    </head>
    <body>
        <a href="createTypeTrouble.jsp">Create Trouble Type</a><br>
        
        <%
            String searchTypeTrouble = (String) request.getParameter("searchTypeTrouble");
            if (searchTypeTrouble == null) {
                searchTypeTrouble = "";
            }
        %>
        <form action="MainController">
            Search Trouble Type<input type="text" name="searchTypeTrouble" value="<%= searchTypeTrouble%>"/>
            <input type="submit" name="action" value="SearchTypeTrouble"/>
        </form>

        
        <%
            List<TroubleTypeDTO> listTypeTrouble = (List<TroubleTypeDTO>) request.getAttribute("LIST_TYPE_TROUBLE");
            if (listTypeTrouble != null) {
                if (listTypeTrouble.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Trouble Id</th>
                    <th>Trouble Name</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (TroubleTypeDTO troubleType : listTypeTrouble) {
                %>
            <form action="MainController" >
                <tr>
                    <td><%= count++%></td>
                    <td>
                        <input type="text" name="typeId" value="<%= troubleType.getTypeId()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="troubleName" value="<%= troubleType.getDetail() %>" required=""/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <%
            }
        }
    %>
</body>
</html>
