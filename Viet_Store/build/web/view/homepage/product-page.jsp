<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en-US">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Gatcomart - Chi tiết sản phẩm</title>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reviewcss.css">
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-3.11.2.min.js"></script>
    </head>

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

                <div class="header-bradcrubm pb-50">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="main-categorie">
                                    <div class="main-breadcrumb">
                                        <ul class="ptb-15 breadcrumb-list">
                                            <li><a href="home">Trang chủ</a></li>
                                            <li><a class="active" href="#">${product.name}</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="main-product-thumbnail pb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="tab-content">
                                <div id="thumb1" class="tab-pane fade show active">
                                    <a data-fancybox="images" href="${pageContext.request.contextPath}/img/products/${product.image}">
                                        <img src="${pageContext.request.contextPath}/img/products/${product.image}" alt="product-view">
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-7">
                            <div class="thubnail-desc fix">
                                <h2 class="product-header">${product.name}</h2>
                            </div>

                            <div class="pro-price mb-15">
                                <span>${product.price.longValue()} VND</span>
                            </div>

                            <p class="pb-30">${product.description}</p>

                            <div class="box-quantity mb-30">
                                <form action="cart?action=add-product" method="POST">
                                    <input type="hidden" name="id" value="${product.id}"/>
                                    <input class="number" id="numeric" type="number" value="1" min="1" name="quantity">
                                    <button class="action-prime">Thêm vào giỏ</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="thumnail-desc pb-50">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <ul class="main-thumb-desc nav">
                            <li><a class="active" data-bs-toggle="tab" href="#dtail">Chi tiết</a></li>

                            <li><a data-bs-toggle="tab" href="#review">Đánh Giá</a></li>

                        </ul>

                        <div class="tab-content thumb-content">
                            <div id="dtail" class="tab-pane fade show active">
                                <p>${product.description}</p>
                            </div>

                            <div id="review" class="tab-pane fade">
                                <div class="reviews-list">
                                    <h3 style="margin-bottom: 20px;">Các đánh giá hiện có</h3>

                                    <c:if test="${empty listReviews}">
                                        <p>Chưa có đánh giá nào cho sản phẩm này.</p>
                                    </c:if>

                                    <c:forEach items="${listReviews}" var="r">
                                        <div class="review-item">
                                            <div class="review-header">
                                                <span class="reviewer-name">${r.customerName}</span>
                                                <span class="review-stars">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <c:if test="${i <= r.rating}">★</c:if>
                                                        <c:if test="${i > r.rating}">☆</c:if>
                                                    </c:forEach>
                                                </span>
                                            </div>
                                            <p class="review-text">${r.comment}</p>
                                        </div>
                                    </c:forEach>

                                </div>
                                <c:if test="${not empty sessionScope.account && canReview == true}">
                                    <div class="review-submission-form">
                                        <h3>Viết đánh giá của bạn</h3>
                                        <form id="new-review-form" action="product-page" method="POST" class="riview-field">
                                            <input type="hidden" name="productId" value="${product.id}">

                                            <div class="form-group">
                                                <label for="reviewer-name">Tên của bạn:</label>
                                                <input type="text" id="reviewer-name" name="reviewer-name" value="${sessionScope.account.name}" required class="form-control">
                                            </div>

                                            <div class="form-group">
                                                <label>Đánh giá của bạn:</label>
                                                <div class="star-rating">
                                                    <input type="radio" id="star5" name="rating" value="5" required><label for="star5" title="5 sao">★</label>
                                                    <input type="radio" id="star4" name="rating" value="4"><label for="star4" title="4 sao">★</label>
                                                    <input type="radio" id="star3" name="rating" value="3"><label for="star3" title="3 sao">★</label>
                                                    <input type="radio" id="star2" name="rating" value="2"><label for="star2" title="2 sao">★</label>
                                                    <input type="radio" id="star1" name="rating" value="1"><label for="star1" title="1 sao">★</label>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="review-comment">Bình luận của bạn:</label>
                                                <textarea id="review-comment" name="review-comment" required class="form-control" rows="5"></textarea>
                                            </div>

                                            <button type="submit" class="btn-default">Gửi Đánh Giá</button>
                                        </form>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="related-product mb-50">
            <div class="container">
                <div class="group-title">
                    <h2>Sản phẩm liên quan</h2>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="related-main-pro owl-carousel">

                            <c:forEach items="${sessionScope.listProduct}" var="p">
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
                            </c:forEach>
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

</html>