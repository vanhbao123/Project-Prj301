<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Báo cáo Doanh thu</title>

        <!-- CSS giao diện quản trị -->
        <link href="${pageContext.request.contextPath}/vendor-admin/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">

        <!-- Thư viện Chart.js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>

    <body id="page-top">
        <!-- Navbar và sidebar -->
        <jsp:include page="../common/admin/navbar.jsp"/>
        <div id="wrapper">
            <jsp:include page="../common/admin/sidebar.jsp"/>

            <div id="content-wrapper">
                <div class="container-fluid">

                    <!-- Đường dẫn breadcrumb -->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/view/homepage/home.jsp">Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item active">Báo cáo doanh thu</li>
                    </ol>

                    <!-- Phần biểu đồ -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-line"></i> Biểu đồ doanh thu theo tháng
                        </div>
                        <div class="card-body">
                            <canvas id="revenueChart" height="100"></canvas>
                        </div>
                    </div>

                </div>
                <jsp:include page="../common/admin/footer.jsp"/>
            </div>
        </div>

        <!-- ===================
             PHẦN SCRIPT
        ==================== -->
        <script>
            // 1️⃣ Tạo 2 mảng để chứa dữ liệu
            const labels = []; // tên tháng
            const data = [];   // doanh thu từng tháng

            // 2️⃣ Lặp qua dữ liệu từ server (JSTL)
            <c:forEach var="entry" items="${revenueData}">
            labels.push("${entry.key}");   // tháng, ví dụ "10-2025"
            data.push(${entry.value});     // doanh thu, ví dụ 34000000
            </c:forEach>

            // 3️⃣ Vẽ biểu đồ cột bằng Chart.js
            const ctx = document.getElementById("revenueChart");
            new Chart(ctx, {
                type: "bar",
                data: {
                    labels: labels,
                    datasets: [{
                            label: "Doanh thu (VNĐ)",
                            data: data,
                            backgroundColor: "#4e73df",
                            borderColor: "#2e59d9",
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {beginAtZero: true}
                    },
                    plugins: {
                        title: {
                            display: true,
                            text: "Tổng doanh thu từng tháng"
                        }
                    }
                }
            });
        </script>
    </body>
</html>
