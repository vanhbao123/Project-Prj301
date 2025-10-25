<%-- 
    Document   : manage-accounts
    Created on : Oct 23, 2025, 11:07:07 PM
    Author     : dinhl (Dựa trên template admin-home.jsp)
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Trang quản lý tài khoản">
        <meta name="author" content="">

        <title>Quản lý Tài khoản</title>

        <%-- Các link CSS giống hệt trang quản lý sản phẩm để đồng bộ giao diện --%>
        <link href="${pageContext.request.contextPath}/vendor-admin/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/vendor-admin/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colReorder-bootstrap4.css">

        <style>
            /* Căn giữa cột hành động và giới hạn chiều rộng */
            #dataTable td:last-child, #dataTable th:last-child {
                text-align: center;
                width: 100px; /* Điều chỉnh nếu cần */
            }
        </style>

    </head>

    <body id="page-top">

        <%-- Nạp Navbar chung --%>
        <jsp:include page="../common/admin/navbar.jsp"/>

        <div id="wrapper">

            <%-- Nạp Sidebar chung --%>
            <jsp:include page="../common/admin/sidebar.jsp"/>

            <div id="content-wrapper">
                <div class="container-fluid">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/view/homepage/home.jsp">Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item active">Quản lý tài khoản</li>
                    </ol>

                    <div class="card mb-3">
                        <div class="card-header">
                            <%-- Thay icon và tiêu đề --%>
                            <i class="fas fa-users"></i>
                            Quản lý Tài khoản
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <%-- Thay đổi các cột của bảng --%>
                                            <th>ID</th>
                                            <th>Tên đăng nhập</th>
                                            <th>Email</th>
                                            <th>Địa chỉ</th>
                                            <th>Vai trò (ID)</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên đăng nhập</th>
                                            <th>Email</th>
                                            <th>Địa chỉ</th>
                                            <th>Vai trò (ID)</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%-- THAY ĐỔI LỚN NHẤT: Lặp qua danh sách tài khoản --%>
                                        <%-- Servlet đã setAttribute("listAccounts", ...) --%>
                                        <c:forEach items="${requestScope.listAccounts}" var="acc">
                                            <tr>
                                                <%-- Hiển thị thông tin của mỗi tài khoản --%>
                                                <td>${acc.id}</td>
                                                <td>${acc.name}</td> <%-- Dựa theo model của bạn --%>
                                                <td>${acc.email}</td>
                                                <td>${acc.address}</td>
                                                <td>${acc.roleId}</td>
                                                <td>
                                                    <%-- Nút Xóa --%>
                                                    <a href="accounts?action=delete&id=${acc.id}" 
                                                       class="btn btn-danger btn-sm"
                                                       onclick="return confirm('Bạn có chắc chắn muốn xóa tài khoản [${acc.name}] không?');">
                                                        <i class="fas fa-trash-alt"></i> Xóa
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <%-- Nạp Footer chung --%>
                <jsp:include page="../common/admin/footer.jsp"/>

            </div>
        </div>
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <%-- Nạp Logout Modal chung --%>
        <jsp:include page="../common/admin/logoutmodal.jsp"/>

        <%-- Các link script giống hệt trang quản lý sản phẩm để đảm bảo chức năng (sắp xếp, tìm kiếm...) hoạt động --%>
        <script src="${pageContext.request.contextPath}/vendor-admin/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/jquery-easing/jquery.easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/datatables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/datatables/dataTables.bootstrap4.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/sb-admin.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/demo/datatables-demo.js"></script>

    </body>
</html>