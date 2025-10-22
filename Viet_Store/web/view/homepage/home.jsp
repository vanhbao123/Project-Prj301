<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en-US">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Gatcomart - Mega Shop Responsive HTML Template</title>
        <meta name="description" content="Default Description">
        <meta name="keywords" content="E-commerce" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/icon/favicon.png">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,900" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meanmenu.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nivo-slider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fancybox.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" integrity="sha512-rRQtF4V2wtAvXsou4iUAs2kXHi3Lj9NE7xJR77DE7GHsxgY9RTWy93dzMXgDIG8ToiRTD45VsDNdTiUagOFeZA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" integrity="sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    </head>
    
    <c:if test="${not empty sessionScope.message}">
        <script type="text/javascript">
            alert('${sessionScope.message}');
        </script>
        <c:remove var="message" scope="session" />
    </c:if>
    
    <body>
        <div class="wrapper">
            <div class="preloader">
                <div class="loading-center">
                    <div class="loading-center-absolute">
                        <div class="object object_one"></div>
                        <div class="object object_two"></div>
                        <div class="object object_three"></div>
                    </div>
                </div>
            </div>
            
            <header>
                <jsp:include page="../common/homepage/header-top white-bg.jsp"></jsp:include>
                <jsp:include page="../common/homepage/header-middle ptb-20 white-bg.jsp"></jsp:include>
                <jsp:include page="../common/homepage/header-bottom ptb-10 blue-bg.jsp"></jsp:include>
                <jsp:include page="../common/homepage/fixed-icon d-none d-md-block.jsp"></jsp:include>
            </header>
            
            <div class="accessories ptb-50">
                <div class="container">
                    <div class="section-title mb-50">
                        <h2>Cửa Hàng</h2>
                    </div>
                    <div class="row">
                        <div class="col-lg-9 col-md-8 order-md-2 order-1">
                            <div class="main-categorie">
                                <div class="main-breadcrumb mb-30">
                                    <ul class="ptb-15 breadcrumb-list">
                                        <li><a href="#">nhà</a></li>
                                        <li><a class="active" href="#">cửa hàng</a></li>
                                    </ul>
                                </div>
                                
                                <div class="electronics mb-30">
                                    <img class="full-img" src="${pageContext.request.contextPath}/img/logo/background.jpg" alt="">
                                </div>
                                
                                <div class="main mb-30">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="grid-list-view f-left">
                                                <ul class="nav">
                                                    <li><a class="active" data-bs-toggle="tab" href="#grid-view"><i class="zmdi zmdi-view-dashboard"></i>grid</a></li>
                                                </ul>
                                            </div>
                                            <div class="main-toolbar-sorter f-right">
                                                <div class="toolbar-sorter f-left">
                                                </div>
                                                <div class="field-limiter f-right">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="tab-content">
                                    <div id="grid-view" class="tab-pane fade show active">
                                        <div class="row">
                                            <c:forEach items="${listProduct}" var="p">
                                                <div class="col-lg-4 col-md-6">
                                                    <div class="single-product">
                                                        <div class="pro-img">
                                                            <a href="product-page?id=${p.id}">
                                                                <img class="primary-img" src="${pageContext.request.contextPath}/img/products/${p.image}" alt="single-product">
                                                            </a>
                                                        </div>
                                                        <div class="pro-content">
                                                            <h4><a href="product-page?id=${p.id}">${p.name}</a></h4>
                                                            <p><span>${p.price} VND</span></p>
                                                            <div class="pro-actions">
                                                                <div class="actions-secondary">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="toolbar-pagination mb-20 mt-40">
                                <ul class="text-center toolbar-pagination-list">
                                    <li><a href="#"><i class="zmdi zmdi-chevron-left"></i></a></li>
                                    <c:forEach begin="1" end="${page.totalPage}" var="pageCurrent">
                                        <li><a href="${page.urlParrtern}page=${pageCurrent}">${pageCurrent}</a></li>
                                    </c:forEach>
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="col-lg-3 col-md-4 order-md-1 order-2">
                            <div class="sidebar white-bg">
                                <h3 class="sidebar-title">Tính Năng Cửa Hàng</h3>
                                <div class="flter-option mb-30">
                                    <h4>Tìm theo giá</h4>
                                    <form action="${pageContext.request.contextPath}/home" method="GET">
                                        <input type="hidden" name="search" value="price">
                                        <div style="margin-bottom: 10px;">
                                            <label for="minPrice">Từ:</label>
                                            <input type="number" name="minPrice" id="minPrice" placeholder="0" style="width: 100%; padding: 5px;">
                                        </div>
                                        <div style="margin-bottom: 15px;">
                                            <label for="maxPrice">Đến:</label>
                                            <input type="number" name="maxPrice" id="maxPrice" placeholder="1000000" style="width: 100%; padding: 5px;">
                                        </div>
                                        <button type="submit" class="styled-button">Tìm Kiếm</button>
                                    </form>
                                </div>
                                
                                <div class="manufacturer mb-30">
                                    <h4>Loại Sách</h4>
                                    <ul class="pt-5">
                                        <c:forEach items="${listCategory}" var="c">
                                            <li><a href="home?search=category&categoryId=${c.id}">${c.name} </a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <footer>
                <jsp:include page="../common/homepage/footer-top ptb-40 white-bg.jsp"></jsp:include>
                <jsp:include page="../common/homepage/footer-middle ptb-30.jsp"></jsp:include>
                <jsp:include page="../common/homepage/footer-bottom ptb-30 white-bg.jsp"></jsp:include>
            </footer>
        </div>
        
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-3.11.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendor/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendor/jquery-migrate-3.3.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.meanmenu.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.js"></script>
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.fancybox.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.nivo.slider.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>
    
    <style>
        /* ---- CSS Cho Nút Đẹp Hơn ---- */
        .styled-button {
            background-color: #4CAF50; /* Màu nền xanh lá cây */
            color: white; /* Chữ màu trắng */
            padding: 10px 20px; /* Đệm xung quanh chữ */
            border: none; /* Bỏ viền */
            border-radius: 5px; /* Bo tròn góc */
            cursor: pointer; /* Biểu tượng con trỏ khi rê chuột */
            font-size: 16px; /* Cỡ chữ */
            transition: background-color 0.3s ease; /* Hiệu ứng chuyển màu nền khi hover */
        }

        .styled-button:hover {
            background-color: #45a049; /* Màu xanh đậm hơn khi rê chuột */
        }

        /* Nếu bạn muốn nút có kích thước đầy đủ chiều rộng */
        .styled-button.full-width {
            width: 100%;
            box-sizing: border-box; /* Đảm bảo padding không làm tăng chiều rộng tổng thể */
        }

        /* Các tùy chọn khác: */
        /* Ví dụ: Nút màu xanh dương */
        .styled-button.blue {
            background-color: #008CBA;
        }
        .styled-button.blue:hover {
            background-color: #007bb5;
        }

        /* Ví dụ: Nút màu đỏ */
        .styled-button.red {
            background-color: #f44336;
        }
        .styled-button.red:hover {
            background-color: #da190b;
        }
    </style>
    
</html>