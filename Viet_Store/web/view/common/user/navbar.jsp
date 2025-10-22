<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <%-- Đổi tên thương hiệu và link về trang chủ user --%>
    <a class="navbar-brand mr-1" href="${pageContext.request.contextPath}/user-home">Gatcomart User</a>

    <%-- Nút bật/tắt sidebar (giữ nguyên) --%>
    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <%-- Đã xóa thanh tìm kiếm --%>

    <%-- Navbar items (chỉ giữ lại menu user) --%>
    <ul class="navbar-nav ml-auto"> <%-- Dùng ml-auto để đẩy menu user sang phải --%>
        <%-- Đã xóa icon chuông và phong bì --%>
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-circle fa-fw"></i>
                <%-- Có thể thêm tên người dùng ở đây nếu muốn: ${sessionScope.account.username} --%>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <%-- Dịch các mục trong menu --%>
                <a class="dropdown-item" href="#">Cài đặt</a>
                <a class="dropdown-item" href="#">Lịch sử hoạt động</a>
                <div class="dropdown-divider"></div>
                <%-- Giữ nguyên link và chức năng mở modal đăng xuất --%>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Đăng xuất</a>
            </div>
        </li>
    </ul>

</nav>