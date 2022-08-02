<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm người ở</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/addResident.css">
        <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>    
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'US')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerUser.jsp"></jsp:include>
        <jsp:include page="slider.jsp"></jsp:include>
            <div class="container">
                <h1 class="text-center" style="margin-top: 3%">Yêu cầu thêm người ở</h1>
            <c:if test="${requestScope.RESIDENT_ERROR!=null}">
                <c:if test="${not empty requestScope.RESIDENT_ERROR }">
                    <form action="MainController" method="POST">
                        <div id="inputElement">
                            <c:forEach var="error" items="${requestScope.RESIDENT_ERROR}" varStatus="s" >
                                <div class="resElement" >
                                    <div class="form-row">
                                        <div class="col-md-8 mb-3">
                                            <label>Họ và tên: </label>
                                            <c:if test="${error.nameError eq ''}">
                                                <input type="text" class="form-control is-valid" name="name" placeholder="Nguyễn Văn A" value="${requestScope.RESIDENT[s.count-1].name}" required="">
                                                <div class="valid-feedback">
                                                    Tên hợp lệ!!
                                                </div>
                                            </c:if>
                                            <c:if test="${error.nameError ne ''}">
                                                <input type="text" class="form-control is-invalid" name="name" placeholder="Nguyễn Văn A" value="${requestScope.RESIDENT[s.count-1].name}" required>
                                                <div class="invalid-feedback">
                                                    ${error.nameError}
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label>Giới tính: </label>
                                            <c:if test="${error.sexError eq ''}">
                                                <select class="custom-select form-control is-valid" name="gender">
                                                    <c:if test="${requestScope.RESIDENT[s.count-1].gender}">
                                                        <option value="1" selected="">Nam</option>
                                                        <option value="0">Nữ</option>
                                                    </c:if>
                                                    <c:if test="${!requestScope.RESIDENT[s.count-1].gender}">
                                                        <option value="1">Nam</option>
                                                        <option value="0" selected="">Nữ</option>
                                                    </c:if>
                                                </select>
                                                <div class="valid-feedback">
                                                    Hợp lệ!
                                                </div>
                                            </c:if>
                                            <c:if test="${error.sexError ne ''}">
                                                <select class="custom-select form-control is-invalid" name="gender">
                                                    <option selected value="-1">Giới tính</option>
                                                    <option value="1">Nam</option>
                                                    <option value="0">Nữ</option>

                                                </select>
                                                <div class="invalid-feedback">
                                                    ${error.sexError}
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="form-row" >
                                        <div class="col-md-4 mb-3" >
                                            <label for="validationServer02">Sinh ngày: </label>
                                            <c:if test="${error.dobError eq ''}">
                                                <input type="date" class="form-control is-valid" name="dob" value="${requestScope.RESIDENT[s.count-1].dob}" required="">
                                                <div class="valid-feedback">
                                                    Hợp lệ!!
                                                </div>
                                            </c:if>
                                            <c:if test="${error.dobError ne ''}">
                                                <input type="date" class="form-control is-invalid" name="dob" value="${requestScope.RESIDENT[s.count-1].dob}" required>
                                                <div class="invalid-feedback">
                                                    ${error.dobError}
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="col-md-4 mb-3" >
                                            <label>Nghề nghiệp: </label>
                                            <c:if test="${error.jobError eq ''}">
                                                <input type="text" class="form-control is-valid" name="job" placeholder="Giáo viên..." value="${requestScope.RESIDENT[s.count-1].job}" required="">
                                                <div class="valid-feedback">
                                                    Hợp lệ!!
                                                </div>
                                            </c:if>
                                            <c:if test="${error.jobError ne ''}">
                                                <input type="text" class="form-control is-invalid" name="job" placeholder="Giáo viên..." value="${requestScope.RESIDENT[s.count-1].job}" required>
                                                <div class="invalid-feedback">
                                                    ${error.jobError}
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="col-md-4 mb-3" >
                                            <label>Số điện thoại: </label>
                                            <c:if test="${error.phoneError eq ''}">
                                                <input type="text" class="form-control is-valid" name="phone" placeholder="0123456789..." value="${requestScope.RESIDENT[s.count-1].phone}" required="">
                                                <div class="valid-feedback">
                                                    Hợp lệ!!
                                                </div>
                                            </c:if>
                                            <c:if test="${error.phoneError ne ''}">
                                                <input type="text" class="form-control is-invalid" name="phone" placeholder="0123456789..." value="${requestScope.RESIDENT[s.count-1].phone}" required>
                                                <div class="invalid-feedback">
                                                    ${error.phoneError}
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <button type="submit" class="btn btn-primary btn-form float-right" name="action" value="AddResident">Gửi</button>
                    </form>
                </c:if>
            </c:if>

            <!-- Lần đầu chạy -->
            <c:if test="${requestScope.RESIDENT_ERROR==null}">
                <form action="MainController" method="POST">
                    <div id="inputElement">                        
                        <div class="resElement">
                            <hr>
                            <div class="form-row">
                                <div class="col-md-8 mb-3">
                                    <label>Họ và tên: </label>
                                    <input type="text" class="form-control" name="name" placeholder="Nguyễn Văn A" value="" required="">
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label>Giới tính: </label>
                                    <select class="custom-select" name="gender">
                                        <option selected>Giới tính</option>
                                        <option value="1">Nam</option>
                                        <option value="0">Nữ</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row" >
                                <div class="col-md-4 mb-3" >
                                    <label>Sinh ngày: </label>
                                    <input type="date" class="form-control" name="dob" placeholder="" value="2001-01-01" required="">
                                </div>
                                <div class="col-md-4 mb-3" >
                                    <label>Nghề nghiệp: </label>
                                    <input type="text" class="form-control" name="job" placeholder="Giáo viên..." value="" required="">
                                </div>
                                <div class="col-md-4 mb-3" >
                                    <label>Số điện thoại: </label>
                                    <input type="text" class="form-control" name="phone" placeholder="0123456789..." value="" required="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-form float-right" name="action" value="AddResident">Gửi</button>
                </form>
            </c:if>
            <button class="btn btn-outline-info btn-add float-left">+</button>   
        </div>

        <a href="user.jsp"><button class="btn btn-light btn-form float-right">Hủy</button></a>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script src="js/js.js" ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".request").addClass("active");
        });
    </script>
    <script>
        $.newRes = '<div class="resElement">'
                + '\n            <button class="btn btn-outline-warning btn-delete"><i class="fa fa-times-circle" aria-hidden="true"></i></button>'
                + '\n             <hr>'
                + '\n             <div class="form-row">'
                + '\n                 <div class="col-md-8 mb-3">'
                + '\n                    <label>Họ và tên: </label>'
                + '\n                     <input type="text" class="form-control" name="name" placeholder="Nguyễn Văn A" value="" required="">'
                + '\n                 </div>'
                + '\n                 <div class="col-md-4 mb-3">'
                + '\n                     <label>Giới tính: </label>'
                + '\n                     <select class="custom-select" name="gender">'
                + '\n                         <option selected>Giới tính</option>'
                + '\n                         <option value="1">Nam</option>'
                + '\n                         <option value="0">Nữ</option>'
                + '\n                     </select>'
                + '\n                 </div>'
                + '\n             </div>'
                + '\n             <div class="form-row" >'
                + '\n                 <div class="col-md-4 mb-3" >'
                + '\n                     <label>Sinh ngày: </label>'
                + '\n                     <input type="date" class="form-control" name="dob" placeholder="" value="2001-01-01" required="">'
                + '\n                 </div>'
                + '\n                 <div class="col-md-4 mb-3" >'
                + '\n                     <label>Nghề nghiệp: </label>'
                + '\n                     <input type="text" class="form-control" name="job" placeholder="Giáo viên..." value="" required="">'
                + '\n                 </div>'
                + '\n                 <div class="col-md-4 mb-3" >'
                + '\n                     <label>Số điện thoại: </label>'
                + '\n                     <input type="text" class="form-control" name="phone" placeholder="0123456789..." value="" required="">'
                + '\n                 </div>'
                + '\n             </div>'
                + '\n         </div>';
        $(document).ready(function () {
            $(".btn-delete").live("click", function () {
                $(this).parent().slideUp(300);
                $(this).parent().show().delay(500).queue(function () {
                    $(this).remove();
                });
            });

            $(".btn-add").live("click", function () {
                $($.newRes).hide().appendTo($("#inputElement")).show('normal');
            });
        });
    </script>
</html>
