<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin phòng</title>
    </head>
    <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/viewTrouble.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'AD')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <div class="container-fluid">
                <h1 class="text-center">Thông tin phòng</h1>
                <form action="MainController" method="POST">
                    <div class="input-group mb-3 btn-search">
                        <input type="text" class="form-control" placeholder="Căn hộ số" name="searchApartment" value="${param.searchApartment}"/>
                    <div class="input-group-append">                        
                        <button class="btn" type="submit" name="action" value="SearchApartment">
                            <span class="input-group-text">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </span>
                        </button>
                    </div>
                </div>
            </form>
            <c:if test="${requestScope.LIST_APARTMENT!=null}">
                <c:if test="${not empty requestScope.LIST_APARTMENT}">
                    <div class="table-responsive" id="no-more-tables">
                        <table class="table col-sm-12 table-bordered table-striped table-condensed cf">
                            <thead class="cf">
                                <tr>
                                    <th style="width:15px">Căn hộ số</th>
                                    <th style="width:79px">Diện tích</th>
                                    <th style="width:194px">Thuộc tính</th>
                                    <th style="width:108px">Tên Building</th>
                                    <th style="width:50px">Giá thuê</th>
                                    <th style="width:50px">Giá mua</th>
                                    <th style="width:50px">Trạng thái</th>
                                    <th style="width:50px">Cập nhật</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="apartment" items="${requestScope.LIST_APARTMENT}" varStatus="counter">
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td data-title="Căn hộ số: " >${apartment.apartmentId}
                                            <input type="hidden" name="apartmentId" value="${apartment.apartmentId}" readonly=""/>
                                        </td>
                                        <td  data-title="Diện tích: " >
                                            ${apartment.size}
                                            <input type="hidden" name="size" value="${apartment.size}" readonly=""/>
                                        </td>
                                        <td data-title="Ảnh: " >                                            
                                            <input type="text" name="image" value="${apartment.image}" required=""/>
                                            <div class="img">
                                                <img class="rounded" src="${apartment.image}" width="256px" height="230px"/>
                                            </div>
                                        </td>
                                        <td  data-title="Tên Building: " >
                                            ${apartment.buildingName}
                                        </td>
                                        <td data-title="Giá thuê: " >
                                            <input type="number" name="rentPrice" value="${apartment.rentPrice}" required=""/>
                                        </td>
                                        <td  data-title="Giá mua: " >
                                            <input type="number" name="salePrice" value="${apartment.salePrice}" required=""/>
                                        </td>
                                        <td  data-title="Trạng thái: " >
                                            <select name="status">
                                                <c:if test="${apartment.status eq 'Con phong'}">
                                                    <option value="1">Available</option>
                                                    <option value="0">Not Available</option>
                                                </c:if>
                                                <c:if test="${apartment.status ne 'Con phong'}">
                                                    <option value="0">Not Available</option>
                                                    <option value="1">Available</option>
                                                </c:if>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="hidden" name="searchApartment" value="${param.searchApartment}">
                                            <button class="btn btn-outline-secondary" type="submit" name="action" value="UpdateApartment">Cập nhật</button>
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>                           
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </c:if>


            <!--PAGING-->
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${tag-1==0}">
                        <li class="page-item disabled">
                            <a class="page-link" href="MainController?action=SearchApartment&searchApartment=&index=${tag-1}">Previous</a>
                        </li>
                    </c:if>
                    <c:if test="${tag-1!=0}">
                        <li class="page-item">
                            <a class="page-link" href="MainController?action=SearchApartment&searchApartment=&index=${tag-1}">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${endP}" var="i">
                        <li class="page-item ${tag==i?"active":""}"><a class="page-link" href="MainController?action=SearchApartment&searchApartment=&index=${i}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${tag==endP}">
                        <li class="page-item disabled">
                            <a class="page-link" href="MainController?action=SearchApartment&searchApartment=&index=${tag+1}">Next</a>
                        </li>
                    </c:if>
                    <c:if test="${tag!=endP}">
                        <li class="page-item">
                            <a class="page-link" href="MainController?action=SearchApartment&searchApartment=&index=${tag+1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        </body>
    <c:if test="${requestScope.ERROR!=null}">
        <c:if test="${not empty requestScope.ERROR}">
            <script>
                $(document).ready(function () {
                    alert("${requestScope.ERROR}");
                });
            </script>
        </c:if>
    </c:if>
    <script>
        $(document).ready(function () {
            $(".room").addClass("active");
        });
    </script>
</html>
