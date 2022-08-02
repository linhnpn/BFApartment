<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid sticky-top" style="padding: 0px !important;">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark" style="border-radius: 5px">
        <a class="navbar-brand" href="employee.jsp">BF Apartment</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExample04">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item home">
                    <a class="nav-link" href="employee.jsp">Trang chủ <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item bill">
                    <a class="nav-link" href="MainController?action=ViewAllBill">Hóa đơn</a>
                </li>
                <li class="nav-item createbill">
                    <a class="nav-link" href="MainController?action=BefCreateBill">Tạo hóa đơn</a>
                </li>
                <li class="nav-item trouble">
                    <a class="nav-link" href="MainController?action=ViewTrouble">Sự cố</a>
                </li>
                <li class="nav-item password">
                    <a class="nav-link" href="changePassword.jsp">Đổi mật khẩu</a>
                </li>
                <li class="nav-item request">
                    <a class="nav-link" href="MainController?action=befResidentRequest">Yêu cầu khách hàng</a>
                </li>
                <li class="nav-item resident">
                    <a class="nav-link" href="MainController?action=ViewResident&search=">Thông tin hộ dân</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-md-0" action="MainController">
                <button class="btn btn-light" type="submit" name="action" value="Logout">Đăng xuất</button>
            </form>
        </div>
    </nav>
</div>
