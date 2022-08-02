<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid sticky-top" style="padding: 0px !important;">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark" style="border-radius: 5px">
        <a class="navbar-brand" href="MainController?action=Statistic">BF Apartment</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExample04">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item home">
                    <a class="nav-link home" href="MainController?action=Statistic">Trang chủ <span class="sr-only"></span></a>
                </li>
                <li class="nav-item trouble">
                    <a class="nav-link" href="MainController?action=ViewTrouble">Sự cố</a>
                </li>
                <li class="nav-item password">
                    <a class="nav-link" href="changePassword.jsp">Đổi mật khẩu</a>
                </li>
                <li class="nav-item dropdown account">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Quản lí tài khoản</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="managerAccount.jsp">Tạo mới tài khoản</a>
                        <a class="dropdown-item" href="MainController?action=Search&search=">Danh sách tài khoản</a>
                    </div>
                </li>
                <li class="nav-item dropdown contract">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hợp đồng</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown03">
                        <a class="dropdown-item" href="addContract.jsp">Tạo mới hợp đồng</a>
                        <a class="dropdown-item" href="MainController?searchContract=&action=SearchContract">Danh sách hợp đồng</a>
                    </div>
                </li>
                <li class="nav-item resident">
                    <a class="nav-link" href="MainController?action=ViewResident&search=">Thông tin hộ dân</a>
                </li>
                <li class="nav-item dropdown service">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dịch vụ</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown02">
                        <a class="dropdown-item" href="addService.jsp">Tạo mới dịch vụ</a>
                        <a class="dropdown-item" href="MainController?action=SearchService&search=">Quản lí dịch vụ</a>
                    </div>
                </li>
                <li class="nav-item room">
                    <a class="nav-link" href="MainController?action=SearchApartment&searchApartment=">Thông tin phòng</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-md-0" action="MainController">
                <button class="btn btn-light" type="submit" name="action" value="Logout">Đăng xuất</button>
            </form>
        </div>
    </nav>
</div>
