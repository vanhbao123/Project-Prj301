<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="sidebar navbar-nav">
    <%-- Mục Trang chủ (Dashboard) --%>
    <li class="nav-item active">
        <%-- Link về trang chủ quản lý của người dùng --%>
        <a class="nav-link" href="${pageContext.request.contextPath}/home">
            <i class="fas fa-fw fa-home"></i> <%-- Thay icon thành hình ngôi nhà --%>
            <span>Trang chủ</span> <%-- Đổi tên thành Trang chủ --%>
        </a>
    </li>
    <%-- Các mục menu Pages, Charts, Tables đã được xóa vì là placeholder --%>
</ul>