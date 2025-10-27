<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Báo cáo Doanh thu</title>

        <link href="${pageContext.request.contextPath}/vendor-admin/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body id="page-top">

        <jsp:include page="../common/admin/navbar.jsp"/>
        <div id="wrapper">
            <jsp:include page="../common/admin/sidebar.jsp"/>

            <div id="content-wrapper">
                <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/view/homepage/home.jsp">Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item active">Báo cáo doanh thu</li>
                    </ol>

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

        <script>
            const labels = [
            <c:forEach var="entry" items="${revenueData}">
                "${entry.key}",
            </c:forEach>
            ];
            const data = [
            <c:forEach var="entry" items="${revenueData}">
                ${entry.value},
            </c:forEach>
            ];

            const ctx = document.getElementById('revenueChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                            label: 'Doanh thu (VNĐ)',
                            data: data,
                            backgroundColor: '#4e73df',
                            borderColor: '#2e59d9',
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
                            text: 'Tổng doanh thu từng tháng'
                        }
                    }
                }
            });
        </script>
    </body>
</html>
