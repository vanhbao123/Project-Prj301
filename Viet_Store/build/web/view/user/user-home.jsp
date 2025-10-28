<%-- Bổ sung thư viện fmt để định dạng số và ngày tháng --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi"> <%-- Đổi ngôn ngữ sang tiếng Việt --%>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Trang quản lý tài khoản</title> <%-- Đổi tiêu đề trang --%>

        <link href="${pageContext.request.contextPath}/vendor-admin/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/vendor-admin/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colReorder-bootstrap4.css">

        <style>
            .error {
                color: red;
            }
            /* Thêm CSS để căn giữa nội dung cột Action */
            #dataTable td:last-child, #dataTable th:last-child {
                text-align: center;
            }
        </style>
    </head>

    <%-- Xử lý thông báo (nếu có) --%>
    <c:if test="${not empty sessionScope.message}">
        <script type="text/javascript">
            alert('${sessionScope.message}');
        </script>
        <c:remove var="message" scope="session" />
    </c:if>

    <body id="page-top">

        <jsp:include page="../common/user/navbar.jsp"/>

        <div id="wrapper">

            <jsp:include page="../common/user/sideBar.jsp"/>

            <div id="content-wrapper">
                <div class="container-fluid">

                    <jsp:include page="../common/user/breadCrumb.jsp"/>

                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-history"></i> <%-- Đổi icon --%>
                            Lịch sử đơn hàng <%-- Đổi tiêu đề bảng --%>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0"> <%-- Thêm class table-hover --%>
                                    <thead>
                                        <tr>
                                            <th>Mã ĐH</th> <%-- Đổi tên cột --%>
                                            <th>Tổng tiền</th> <%-- Đổi tên cột --%>
                                            <th>Mã TK</th> <%-- Đổi tên cột --%>
                                            <th>Ngày tạo</th> <%-- Đổi tên cột --%>
                                            <th>Trạng thái</th> <%-- Đổi tên cột --%>
                                            <th style="width: 100px;">Hành động</th> <%-- Đổi tên cột và giới hạn chiều rộng --%>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listOrder}" var="list">
                                            <tr>
                                                <td>#${list.id}</td> <%-- Thêm dấu # --%>
                                                <td>
                                                    <%-- Định dạng tiền tệ VNĐ --%>
                                                    <fmt:formatNumber value="${list.amount}" type="currency" currencyCode="VND" />
                                                </td>
                                                <td>${list.accountId}</td>
                                                <td>
                                                    <%-- Định dạng ngày tháng dd/MM/yyyy HH:mm --%>
                                                    <fmt:formatDate value="${list.createAt}" pattern="dd/MM/yyyy HH:mm" />
                                                </td>
                                                <td>
                                                    ${list.getStatus()}

                                                </td>
                                                <td>
                                                    <%-- Form hủy đơn hàng --%>
                                                    <form action="user-home?action=cancel-order" method="POST" style="margin:0;">
                                                        <input type="hidden" name="orderId" value="${list.id}">
                                                        <button type="submit" class="btn btn-danger btn-sm"
                                                                onclick="return confirm('Bạn có chắc chắn muốn hủy đơn hàng #${list.id} không? Hành động này không thể hoàn tác.')">
                                                            <i class="fas fa-trash-alt"></i> Hủy <%-- Thêm icon và đổi chữ --%>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <%-- Có thể bỏ dòng "Updated yesterday..." nếu không cần thiết --%>
                        <%-- <div class="card-footer small text-muted">Cập nhật lần cuối ...</div> --%>
                    </div>

                </div>
                <jsp:include page="../common/user/footer.jsp"/>

            </div>
        </div>
        <jsp:include page="../common/user/logOutModal.jsp"/>

        <script src="${pageContext.request.contextPath}/vendor-admin/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/jquery-easing/jquery.easing.min.js"></script>
        <%-- <script src="${pageContext.request.contextPath}/vendor-admin/chart.js/Chart.min.js"></script> --%> <%-- Bỏ Chart.js nếu không dùng biểu đồ --%>
        <script src="${pageContext.request.contextPath}/vendor-admin/datatables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/datatables/dataTables.bootstrap4.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/sb-admin.min.js"></script>
        <%-- <script src="${pageContext.request.contextPath}/js/admin/colReorder-bootstrap4-min.js"></script> --%> <%-- Bỏ colReorder nếu không dùng kéo thả cột --%>
        <%-- <script src="${pageContext.request.contextPath}/js/admin/colReorder-dataTables-min.js"></script> --%>
        <script src="${pageContext.request.contextPath}/js/admin/demo/datatables-demo.js"></script>
        <%-- <script src="${pageContext.request.contextPath}/js/admin/demo/chart-area-demo.js"></script> --%> <%-- Bỏ chart-area-demo nếu không dùng biểu đồ --%>
    </body>
</html>