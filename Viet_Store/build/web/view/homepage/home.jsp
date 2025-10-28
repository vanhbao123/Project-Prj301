<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Gatcomart - Mega Shop Responsive HTML Template</title>
        <meta name="description" content="Default Description">
        <meta name="keywords" content="E-commerce">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/favicon.png" type="image/x-icon">

        <!-- Fonts & Icons -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,900" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" integrity="sha512-rRQtF4V2wtAvXsou4iUAs2kXHi3Lj9NE7xJR77DE7GHsxgY9RTWy93dzMXgDIG8ToiRTD45VsDNdTiUagOFeZA==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" integrity="sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous" referrerpolicy="no-referrer">

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meanmenu.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nivo-slider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fancybox.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home-sidebar.css">

        <!-- Swiper -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css">
        <style>
            body  {
                background-color: black !important;
            }
            .wrapper {
                background-color: #ffffff;
            }
        </style>

        <style>

            /* Snow Canvas */
            #snowCanvas {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                pointer-events: none;
                z-index: 9999;
            }

            /* Swiper */
            .swiper {
                width: 100%;
                height: 350px;
                padding: 20px 0;
            }

            .swiper-slide {
                text-align: center;
                display: flex;
                flex-direction: column;
                align-items: center;
                opacity: 0.6;
                width: 250px;
                transition: transform 0.4s ease, opacity 0.4s ease;
            }

            .swiper-slide-active {
                transform: scale(1.1);
                opacity: 1;
            }

            .swiper-slide img {
                width: 200px;
                height: 250px;
                border-radius: 12px;
                object-fit: cover;
            }

            .swiper-slide a {
                text-decoration: none;
                color: black;
                font-size: 14px;
            }

            .swiper-button-next,
            .swiper-button-prev {
                color: #ffca28;
                background: rgba(0, 0, 0, 0.3);
                padding: 8px 12px;
                border-radius: 50%;
                top: 50%;
                transform: translateY(-50%);
            }

            .swiper-button-next:hover,
            .swiper-button-prev:hover {
                background: rgba(0, 0, 0, 0.6);
            }

            .swiper-pagination-bullet {
                background: #ffca28;
            }
        </style>
    </head>

    <body>
        <c:if test="${not empty sessionScope.message}">
            <script>alert('${sessionScope.message}');</script>
            <c:remove var="message" scope="session" />
        </c:if>

        <canvas id="snowCanvas"></canvas>
        <div class="wrapper">
            <!-- Preloader -->
            <div class="preloader">
                <div class="loading-center">
                    <div class="loading-center-absolute">
                        <div class="object object_one"></div>
                        <div class="object object_two"></div>
                        <div class="object object_three"></div>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <header>
                <jsp:include page="../common/homepage/header-top white-bg.jsp" />
                <jsp:include page="../common/homepage/header-middle ptb-20 white-bg.jsp" />
                <jsp:include page="../common/homepage/header-bottom ptb-10 blue-bg.jsp" />
                <jsp:include page="../common/homepage/fixed-icon d-none d-md-block.jsp" />
            </header>

            <!-- Main content -->
            <div class="accessories ptb-50">
                <div class="container">
                    <div class="section-title mb-50">
                        <h2>Cửa Hàng</h2>
                    </div>

                    <div class="row">
                        <!-- Product List -->
                        <div class="col-lg-9 col-md-8 order-md-2 order-1">
                            <!-- Breadcrumb -->
                            <div class="main-breadcrumb mb-30">
                                <ul class="ptb-15 breadcrumb-list">
                                    <li><a href="#">nhà</a></li>
                                    <li><a class="active" href="#">cửa hàng</a></li>
                                </ul>
                            </div>

                            <!-- Featured Products Swiper -->
                            <div class="featured-products ptb-50">
                                <div class="section-title mb-50">
                                    <h2>Sản Phẩm Nổi Bật</h2>
                                </div>

                                <div class="swiper mySwiper">
                                    <div class="swiper-wrapper">
                                        <c:forEach var="p" items="${listProduct}">
                                            <div class="swiper-slide">
                                                <a href="product-page?id=${p.id}">
                                                    <img src="${pageContext.request.contextPath}/img/products/${p.image}" alt="${p.name}">
                                                    <div style="text-align:center; margin-top:5px;">
                                                        <strong>${p.name}</strong><br>
                                                        Giá: ${p.price.longValue()} VND
                                                    </div>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <div class="swiper-button-next"></div>
                                    <div class="swiper-button-prev"></div>
                                    <div class="swiper-pagination"></div>
                                </div>
                            </div>

                            <!-- Grid view -->
                            <div class="tab-content">
                                <div id="grid-view" class="tab-pane fade show active">
                                    <div class="row">
                                        <c:forEach items="${listProduct}" var="p">
                                            <div class="col-lg-4 col-md-6">
                                                <div class="single-product">
                                                    <div class="pro-img">
                                                        <a href="product-page?id=${p.id}">
                                                            <img class="primary-img" src="${pageContext.request.contextPath}/img/products/${p.image}" alt="${p.name}">
                                                        </a>
                                                    </div>
                                                    <div class="pro-content">
                                                        <h4><a href="product-page?id=${p.id}">${p.name}</a></h4>
                                                        <p><span>${p.price.longValue()} VND</span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>

                            <!-- Pagination -->
                            <div class="toolbar-pagination mb-20 mt-40 text-center">
                                <ul class="toolbar-pagination-list">
                                    <li><a href="#"><i class="zmdi zmdi-chevron-left"></i></a></li>
                                            <c:forEach begin="1" end="${page.totalPage}" var="pageCurrent">
                                        <li><a href="${page.urlParrtern}page=${pageCurrent}">${pageCurrent}</a></li>
                                        </c:forEach>
                                    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- Sidebar -->
                        <div class="col-lg-3 col-md-4 order-md-1 order-2">
                            <div class="sidebar white-bg">
                                <!-- Price filter -->
                                <div class="flter-option mb-30">
                                    <h4>Tìm theo giá</h4>
                                    <form action="${pageContext.request.contextPath}/home" method="GET">
                                        <input type="hidden" name="search" value="price">
                                        <div style="margin-bottom:10px;">
                                            <label for="minPrice">Từ:</label>
                                            <input type="number" name="minPrice" id="minPrice" placeholder="0" style="width:100%; padding:5px;">
                                        </div>
                                        <div style="margin-bottom:15px;">
                                            <label for="maxPrice">Đến:</label>
                                            <input type="number" name="maxPrice" id="maxPrice" placeholder="1000000" style="width:100%; padding:5px;">
                                        </div>
                                        <button type="submit" class="styled-button">Tìm Kiếm</button>
                                    </form>
                                </div>

                                <!-- Categories -->
                                <div class="manufacturer mb-30">
                                    <h4>Loại Sách</h4>
                                    <ul class="pt-5">
                                        <c:forEach items="${listCategory}" var="c">
                                            <li><a href="home?search=category&categoryId=${c.id}">${c.name}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>

                                <!-- Top 3 products -->
                                <div class="best-seller mb-30">
                                    <h4>🔥 TOP 3 SẢN PHẨM BÁN CHẠY</h4>
                                    <ul class="pt-5 top-product-list">
                                        <c:forEach items="${topProducts}" var="tp" varStatus="status">
                                            <li class="top-product-item">
                                                <span class="rank-number">${status.index + 1}</span>
                                                <a href="product-page?id=${tp.id}" class="top-product-link">
                                                    <img src="${pageContext.request.contextPath}/img/products/${tp.image}" alt="${tp.name}" class="top-product-img">
                                                    <span class="top-product-name">${tp.name}</span>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                                <!-- Top 3 customers -->
                                <div class="top-customer mb-30">
                                    <h4>👑 TOP 3 KHÁCH HÀNG TIÊU NHIỀU NHẤT</h4>
                                    <ul class="pt-5 top-customer-list">
                                        <c:forEach items="${topCustomers}" var="tc" varStatus="status">
                                            <li class="top-customer-item">
                                                <span class="rank-number customer-rank">${status.index + 1}</span>
                                                <div class="customer-info">
                                                    <i class="fa fa-user-circle"></i>
                                                    <span class="customer-name">${tc.name}</span><br>
                                                    <span class="customer-email">${tc.email}</span>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer>
                <jsp:include page="../common/homepage/footer-top ptb-40 white-bg.jsp" />
                <jsp:include page="../common/homepage/footer-middle ptb-30.jsp" />
                <jsp:include page="../common/homepage/footer-bottom ptb-30 white-bg.jsp" />
            </footer>
        </div>

        <!-- JS Libraries -->
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
        <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

        <!-- Snow effect -->
        <script>
                const canvas = document.getElementById("snowCanvas");
                const ctx = canvas.getContext("2d");
                let w = canvas.width = window.innerWidth;
                let h = canvas.height = window.innerHeight;
                const snowflakes = [];
                const snowCount = 100;
                for (let i = 0; i < snowCount; i++) {
                    snowflakes.push({x: Math.random() * w, y: Math.random() * h, radius: Math.random() * 3 + 1, speed: Math.random() * 1 + 0.5, wind: Math.random() * 0.5 - 0.25});
                }
                function drawSnow() {
                    ctx.clearRect(0, 0, w, h);
                    ctx.fillStyle = "white";
                    ctx.beginPath();
                    snowflakes.forEach(f => {
                        ctx.moveTo(f.x, f.y);
                        ctx.arc(f.x, f.y, f.radius, 0, Math.PI * 2);
                    });
                    ctx.fill();
                    moveSnow();
                }
                function moveSnow() {
                    snowflakes.forEach(f => {
                        f.y += f.speed;
                        f.x += f.wind;
                        if (f.y > h)
                            f.y = -f.radius;
                        if (f.x > w)
                            f.x = 0;
                        if (f.x < 0)
                            f.x = w;
                    });
                }
                function animate() {
                    drawSnow();
                    requestAnimationFrame(animate);
                }
                animate();
                window.addEventListener('resize', () => {
                    w = canvas.width = window.innerWidth;
                    h = canvas.height = window.innerHeight;
                });
        </script>

        <!-- Swiper -->
        <script>
            const swiper = new Swiper(".mySwiper", {
                effect: 'coverflow',
                grabCursor: true,
                centeredSlides: true,
                slidesPerView: 3,
                loop: true,
                spaceBetween: 30,
                coverflowEffect: {rotate: 30, stretch: 0, depth: 200, modifier: 1, slideShadows: true},
                navigation: {nextEl: ".swiper-button-next", prevEl: ".swiper-button-prev"},
                pagination: {el: ".swiper-pagination", clickable: true},
                autoplay: {delay: 3000, disableOnInteraction: false},
                breakpoints: {0: {slidesPerView: 1}, 600: {slidesPerView: 2}, 900: {slidesPerView: 3}}
            });
            const swiperEl = document.querySelector('.mySwiper');
            swiperEl.addEventListener('mouseenter', () => swiper.autoplay.stop());
            swiperEl.addEventListener('mouseleave', () => swiper.autoplay.start());
        </script>
    </body>
</html>
