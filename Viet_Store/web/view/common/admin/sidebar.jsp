<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="sidebar navbar-nav">
    <%-- Mục Bảng điều khiển (Dashboard) --%>
    <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/admin-home">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Quản lý Sản phẩm</span>
        </a>
    </li>
    <%-- THÊM MỤC MỚI ĐỂ QUẢN LÝ TÀI KHOẢN --%>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/accounts">
            <i class="fas fa-fw fa-users"></i>
            <span>Quản lý Tài khoản</span>
        </a>
    </li>
    <%-- Các mục quản lý khác đã được xóa --%>
</ul>