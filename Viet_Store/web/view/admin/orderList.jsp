<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Đơn hàng</title>

    <!-- FontAwesome & SB-Admin CSS -->
    <link href="${pageContext.request.contextPath}/vendor-admin/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body id="page-top">

    <!-- Navbar -->
    <jsp:include page="../common/admin/navbar.jsp"/>

    <div id="wrapper">
        <!-- Sidebar -->
        <jsp:include page="../common/admin/sidebar.jsp"/>

        <!-- Content Wrapper -->
        <div id="content-wrapper">
            <div class="container-fluid mt-4">

                <!-- Breadcrumb -->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/view/homepage/home.jsp">Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item active">Quản lý Đơn hàng</li>
                </ol>

                <!-- Card bảng đơn hàng -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-shopping-cart"></i> Danh sách Đơn hàng
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover text-center" width="100%">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Mã ĐH</th>
                                        <th>Khách hàng</th>
                                        <th>Địa chỉ</th>
                                        <th>Ngày tạo</th>
                                        <th>Tổng tiền</th>
                                        <th>Trạng thái</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <c:forEach var="o" items="${listOrders}">
                                        <c:if test="${o.status=='Chờ duyệt'}">
                                             <tr>
                                            <td>${o.id}</td>
                                            <td>${o.accountName}</td>
                                            <td>${o.address}</td>
                                            <td><fmt:formatDate value="${o.createAt}" pattern="dd/MM/yyyy HH:mm"/></td>
                                            <td><fmt:formatNumber value="${o.amount}" type="currency" currencySymbol="₫"/></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${o.status == 'Đã duyệt'}">
                                                        <span class="badge badge-success">Đã duyệt</span>
                                                    </c:when>
                                                    <c:when test="${o.status == 'Đã hủy'}">
                                                        <span class="badge badge-danger">Đã hủy</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-warning">Chờ duyệt</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/admin/OrderListServlet?action=approve&id=${o.id}" 
                                                   class="btn btn-sm btn-success">
                                                    <i class="fas fa-check"></i> Chấp nhận
                                                </a>
                                                <a href="${pageContext.request.contextPath}/admin/OrderListServlet?action=cancel&id=${o.id}" 
                                                   class="btn btn-sm btn-warning">
                                                    <i class="fas fa-times"></i> Hủy đơn
                                                </a>
                                            </td>
                                        </tr>
                                        </c:if>
                                       
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <jsp:include page="../common/admin/footer.jsp"/>
        </div>
    </div>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap & SB-Admin JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sb-admin.js"></script>

</body>
</html>
