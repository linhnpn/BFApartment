<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm mới chủ sở hữu</title>
        <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/addResident.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'AD')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerAdmin.jsp"></jsp:include>
        <jsp:include page="slider.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="float-left" style="margin-top: 20px">Thêm mới chủ sở hữu</h2>
                    </div>
                </div>

            <c:if test="${requestScope.OWNER_ERROR==null}">
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
                                <div class="col-md-3 mb-3" >
                                    <label>Sinh ngày: </label>
                                    <input type="date" class="form-control" name="dob" placeholder="" value="2001-01-01" required="">
                                </div>
                                <div class="col-md-3 mb-3" >
                                    <label>Nghề nghiệp: </label>
                                    <input type="text" class="form-control" name="job" placeholder="Giáo viên..." value="" required="">
                                </div>
                                <div class="col-md-3 mb-3" >
                                    <label>Số điện thoại: </label>
                                    <input type="text" class="form-control" name="phone" placeholder="0123456789..." value="" required="">
                                </div>
                                <div class="col-md-3 mb-3" >
                                    <label>Email: </label>
                                    <input type="text" class="form-control" name="email" placeholder="abc@...." value="" required="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="userId" value="${param.userId}">
                    <button type="submit" class="btn btn-primary btn-form float-right btn-search" name="action" value="AddOwner">Thêm mới</button>
                </form>  
                <a href="MainController?action=Statistic"><button style="padding: 0px 40px; margin: 10px 10px" class="btn btn-light float-right">Hủy</button></a> 
            </c:if>




            <c:if test="${requestScope.OWNER_ERROR!=null}">
                <c:if test="${not empty requestScope.OWNER_ERROR}">
                    <form action="MainController" method="POST">
                        <div id="inputElement">
                            <div class="resElement" >
                                <div class="form-row">
                                    <div class="col-md-8 mb-3">
                                        <label>Họ và tên: </label>
                                        <c:if test="${requestScope.OWNER_ERROR.nameError eq ''}">
                                            <input type="text" class="form-control is-valid" name="name" placeholder="Nguyễn Văn A" value="${requestScope.OWNER.name}" required="">
                                            <div class="valid-feedback">
                                                Tên hợp lệ!!
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.OWNER_ERROR.nameError ne ''}">
                                            <input type="text" class="form-control is-invalid" name="name" placeholder="Nguyễn Văn A" value="${requestScope.OWNER.name}" required>
                                            <div class="invalid-feedback">
                                                ${requestScope.OWNER_ERROR.nameError}
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label>Giới tính: </label>
                                        <c:if test="${requestScope.OWNER_ERROR.sexError eq ''}">
                                            <select class="custom-select form-control is-valid" name="gender">
                                                <c:if test="${requestScope.OWNER.gender}">
                                                    <option value="1" selected="">Nam</option>
                                                    <option value="0">Nữ</option>
                                                </c:if>
                                                <c:if test="${!requestScope.OWNER.gender}">
                                                    <option value="1">Nam</option>
                                                    <option value="0" selected="">Nữ</option>
                                                </c:if>
                                            </select>
                                            <div class="valid-feedback">
                                                Hợp lệ!
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.OWNER_ERROR.sexError ne ''}">
                                            <select class="custom-select form-control is-invalid" name="gender">
                                                <option selected value="-1">Giới tính</option>
                                                <option value="1">Nam</option>
                                                <option value="0">Nữ</option>

                                            </select>
                                            <div class="invalid-feedback">
                                                ${requestScope.OWNER_ERROR.sexError}
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-row" >
                                    <div class="col-md-3 mb-3" >
                                        <label for="validationServer02">Sinh ngày: </label>
                                        <c:if test="${requestScope.OWNER_ERROR.dobError eq ''}">
                                            <input type="date" class="form-control is-valid" name="dob" value="${requestScope.OWNER.dob}" required="">
                                            <div class="valid-feedback">
                                                Hợp lệ!!
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.OWNER_ERROR.dobError ne ''}">
                                            <input type="date" class="form-control is-invalid" name="dob" value="${requestScope.OWNER.dob}" required>
                                            <div class="invalid-feedback">
                                                ${requestScope.OWNER_ERROR.dobError}
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-md-3 mb-3" >
                                        <label>Nghề nghiệp: </label>
                                        <c:if test="${requestScope.OWNER_ERROR.jobError eq ''}">
                                            <input type="text" class="form-control is-valid" name="job" placeholder="Giáo viên..." value="${requestScope.OWNER.job}" required="">
                                            <div class="valid-feedback">
                                                Hợp lệ!!
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.OWNER_ERROR.jobError ne ''}">
                                            <input type="text" class="form-control is-invalid" name="job" placeholder="Giáo viên..." value="${requestScope.OWNER.job}" required>
                                            <div class="invalid-feedback">
                                                ${requestScope.OWNER_ERROR.jobError}
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-md-3 mb-3" >
                                        <label>Số điện thoại: </label>
                                        <c:if test="${requestScope.OWNER_ERROR.phoneError eq ''}">
                                            <input type="text" class="form-control is-valid" name="phone" placeholder="0123456789..." value="${requestScope.OWNER.phone}" required="">
                                            <div class="valid-feedback">
                                                Hợp lệ!!
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.OWNER_ERROR.phoneError ne ''}">
                                            <input type="text" class="form-control is-invalid" name="phone" placeholder="0123456789..." value="${requestScope.OWNER.phone}" required>
                                            <div class="invalid-feedback">
                                                ${requestScope.OWNER_ERROR.phoneError}
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-md-3 mb-3" >
                                        <label for="validationServer02">Email: </label>
                                        <c:if test="${requestScope.OWNER_ERROR.emailError eq ''}">
                                            <input type="text" class="form-control is-valid" name="email" value="${requestScope.OWNER.email}" required="">
                                            <div class="valid-feedback">
                                                Hợp lệ!!
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.OWNER_ERROR.emailError ne ''}">
                                            <input type="text" class="form-control is-invalid" name="email" value="${requestScope.OWNER.email}" required>
                                            <div class="invalid-feedback">
                                                ${requestScope.OWNER_ERROR.emailError}
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="userId" value="${param.userId}">
                        <button type="submit" class="btn btn-primary btn-form float-right" name="action" value="AddOwner">Thêm mới</button>                        
                    </form>
                    <a href="MainController?action=Statistic"><button style="padding: 0px 40px; margin: 10px 10px" class="btn btn-light float-right">Hủy</button></a>  
                </c:if>
            </c:if>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script src="js/js.js" ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".account").addClass("active");
        });
    </script>
</html>
