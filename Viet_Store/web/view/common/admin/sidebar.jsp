<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="sidebar navbar-nav">
    <%-- Mục Bảng điều khiển (Dashboard) --%>
    <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/admin-home">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Quản Lý Sản phẩm</span>
        </a>
    </li>
    <%-- THÊM MỤC MỚI ĐỂ QUẢN LÝ TÀI KHOẢN --%>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/accounts">
            <i class="fas fa-fw fa-users"></i>
            <span>Quản Lý Tài Khoản</span>
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/revenue">
            <i class="fas fa-chart-line"></i>
            <span>Báo Cáo Doanh Thu</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/OrderListServlet">
            <i class="fas fa-chart-line"></i>
            <span>Danh Sách Đơn Hàng </span>
        </a>
    </li>
    <%-- Các mục quản lý khác đã được xóa --%>
</ul>