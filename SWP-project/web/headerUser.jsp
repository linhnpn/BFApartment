<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid sticky-top" style="padding: 0px !important;">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark" style="border-radius: 5px">
        <a class="navbar-brand" href="user.jsp">BF Apartment</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExample04">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item home">
                    <a class="nav-link" href="user.jsp">Trang chủ <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item bill">
                    <a class="nav-link" href="MainController?action=ViewBill">Hóa đơn</a>
                </li>
                <li class="nav-item detail">
                    <a class="nav-link" href="MainController?action=ViewDetailRoom">Thông tin phòng ở</a>
                </li>
                <li class="nav-item trouble">
                    <a class="nav-link" href="MainController?action=BeforeCreateTrouble">Báo cáo sự cố</a>
                </li>
                <li class="nav-item password">
                    <a class="nav-link" href="changePassword.jsp">Đổi mật khẩu</a>
                </li>
                <li class="nav-item dropdown request">
                    <a class="nav-link dropdown-toggle" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Yêu cầu</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="addResident.jsp">Thêm người ở</a>
                        <a class="dropdown-item" href="MainController?action=BeforeDeleteResident">Xóa người ở</a>
                        <a class="dropdown-item" href="MainController?action=ViewRequest">Yêu cầu đang xử lý</a>
                    </div>
                </li>

            </ul>
            <form class="form-inline my-2 my-md-0" action="MainController">
                <button class="btn btn-light" type="submit" name="action" value="Logout">Đăng xuất</button>
            </form>
        </div>
    </nav>
</div>
