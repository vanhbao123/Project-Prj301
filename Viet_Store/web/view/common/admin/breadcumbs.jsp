<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <%-- Link về trang chủ admin --%>
        <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
    </li>
    <%-- Tên trang hiện tại, ví dụ: Tổng quan hoặc Quản lý sản phẩm --%>
    <li class="breadcrumb-item active">Quản lý sản phẩm</li>

    <%-- Nút thêm sản phẩm đẩy sang phải --%>
    <li class="breadcrumb-item ml-auto">
        <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#addModal"> <%-- Thêm btn-sm --%>
            <i class="fas fa-plus"></i> Thêm sản phẩm <%-- Thêm icon và dịch chữ --%>
        </button>
    </li>
</ol>