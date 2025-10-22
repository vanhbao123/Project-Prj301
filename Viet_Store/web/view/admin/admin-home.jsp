<%-- Bổ sung thư viện fmt để định dạng số --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Trang quản trị Admin</title>

        <link href="${pageContext.request.contextPath}/vendor-admin/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/vendor-admin/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colReorder-bootstrap4.css">

        <style>
            .error { color: red; }
            /* Căn giữa cột hành động và giới hạn chiều rộng */
            #dataTable td:last-child, #dataTable th:last-child {
                text-align: center;
                width: 130px; /* Điều chỉnh nếu cần */
            }
            /* Căn giữa ảnh trong cột */
            td[name="image"] {
                 text-align: center;
                 vertical-align: middle;
            }
        </style>

    </head>

    <body id="page-top">

        <jsp:include page="../common/admin/navbar.jsp"/>

        <div id="wrapper">

            <jsp:include page="../common/admin/sidebar.jsp"/>

            <div id="content-wrapper">
                <div class="container-fluid">

                    <jsp:include page="../common/admin/breadcumbs.jsp"/>
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-book"></i>
                            Quản lý Sản phẩm
                             <button type="button" class="btn btn-success btn-sm float-right"
                                    data-toggle="modal" data-target="#addModal">
                                <i class="fas fa-plus"></i> Thêm mới
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mã SP</th>
                                            <th>Tên SP</th>
                                            <th>Ảnh</th>
                                            <th>SL</th>
                                            <th>Giá</th>
                                            <th>Loại</th>
                                            <th>Mô tả</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Mã SP</th>
                                            <th>Tên SP</th>
                                            <th>Ảnh</th>
                                            <th>SL</th>
                                            <th>Giá</th>
                                            <th>Loại</th>
                                            <th>Mô tả</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${listAdminProduct}" var="p">
                                            <tr>
                                                <td name="id">${p.id}</td>
                                                <td name="name">${p.name}</td>
                                                <td name="image">
                                                    <img src="${pageContext.request.contextPath}/img/products/${p.image}" width="70" height="70" alt="${p.name}" />
                                                </td>
                                                <td name="quantity">${p.quantity}</td>
                                                <td name="price">
                                                    <fmt:formatNumber value="${p.price}" type="number" currencyCode="VND" />
                                                </td>
                                                <td name="category">
                                                    <c:forEach items="${listAdminCategory}" var="c">
                                                        <c:if test="${c.id==p.categoryId}">
                                                            ${c.name}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td name="description">${p.description}</td>
                                                <td>
                                                    <div style="display: flex; gap: 5px; justify-content: center;">
                                                        <button type="button" class="btn btn-primary btn-sm"
                                                                data-toggle="modal"
                                                                data-target="#editProductModal"
                                                                onclick="editProductModal(this)">
                                                            <i class="fas fa-edit"></i> Sửa
                                                        </button>
                                                        <button type="button" class="btn btn-danger btn-sm"
                                                                data-toggle="modal" data-target="#delete-product-modal"
                                                                onclick="deleteProductModal(${p.id})">
                                                            <i class="fas fa-trash-alt"></i> Xóa
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <%-- <div class="card-footer small text-muted">Cập nhật lúc ...</div> --%>
                    </div>

                </div>
                <jsp:include page="../common/admin/footer.jsp"/>

            </div>
            </div>
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <jsp:include page="../common/admin/logoutmodal.jsp"/>
        <jsp:include page="addProductModal.jsp"/>
        <jsp:include page="deleteProductModal.jsp"/>
        <jsp:include page="editProductModal.jsp"/>

        <script src="${pageContext.request.contextPath}/vendor-admin/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/jquery-easing/jquery.easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/datatables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/datatables/dataTables.bootstrap4.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/sb-admin.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/demo/datatables-demo.js"></script>
        

    </body>
</html>