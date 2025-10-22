<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="vi-VN">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Gatcomart - Giỏ hàng</title>
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
                <jsp:include page="../../common/homepage/header-top white-bg.jsp"></jsp:include>
                <jsp:include page="../../common/homepage/header-middle ptb-20 white-bg.jsp"></jsp:include>
                <jsp:include page="../../common/homepage/header-bottom ptb-10 blue-bg.jsp"></jsp:include>
                <jsp:include page="../../common/homepage/fixed-icon d-none d-md-block.jsp"></jsp:include>
            </header>

            <div class="header-bradcrubm pb-40">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="main-categorie">
                                <div class="main-breadcrumb">
                                    <ul class="ptb-15 breadcrumb-list">
                                        <li><a href="home">Trang chủ</a></li>
                                        <li><a class="active" href="#">Giỏ hàng</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="cart-main-area pb-50">
                <div class="container">
                    <div class="section-title mb-50">
                        <h2>Giỏ hàng</h2>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="table-content table-responsive mb-50">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">Ảnh</th>
                                            <th class="product-name">Sản phẩm</th>
                                            <th class="product-price">Giá</th>
                                            <th class="product-quantity">Số lượng</th>
                                            <th class="product-subtotal">Tổng cộng</th>
                                            <th class="product-remove">Xóa</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${cart.listOrderDetails}" var="odt">
                                            <c:forEach items="${listProduct}" var="product">
                                                <c:if test="${product.id == odt.productId}">
                                                    <c:set var="p" value="${product}"/>
                                                </c:if>
                                            </c:forEach>
                                            <tr>
                                                <td class="product-thumbnail">
                                                    <a href="product-page?id=${p.id}"><img src="${pageContext.request.contextPath}/img/products/${p.image}" alt="cart-image" /></a>
                                                </td>
                                                <td class="product-name"><a href="product-page?id=${p.id}">${p.name}</a></td>
                                                <td class="product-price"><span class="amount">${p.price}</span></td>
                                                <td class="product-quantity">
                                                    <form action="cart?action=change-quantity" method="POST">
                                                        <input type="hidden" name="id" value="${p.id}"/>
                                                        <input type="number" value="${odt.quantity}" min="1" name="quantity" onchange="this.closest('form').submit()"/>
                                                    </form>
                                                </td>
                                                <td class="product-subtotal">${odt.quantity * p.price}</td>
                                                <td class="product-remove">
                                                    <form action="cart?action=delete-product" method="POST">
                                                        <input type="hidden" name="id" value="${p.id}"/>
                                                        <a href="#" onclick="this.closest('form').submit(); return false;"><i class="zmdi zmdi-close"></i></a>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <div class="row">
                                <div class="col-lg-8 col-md-7">
                                </div>
                                <div class="col-lg-4 col-md-5">
                                    <div class="cart_totals">
                                        <h2>Tổng giỏ hàng</h2>
                                        <br />
                                        <table>
                                            <tbody>
                                                <tr class="cart-subtotal">
                                                    <th>Tạm tính</th>
                                                    <td><span class="amount" id="sub-total">0</span> VND</td>
                                                </tr>
                                                <tr class="order-total">
                                                    <th>Tổng cộng</th>
                                                    <td>
                                                        <strong><span class="amount" id="total-amount">0</span> VND</strong>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="wc-proceed-to-checkout">
                                            <form action="cart?action=check-out" method="POST">
                                                <a href="#" onclick="this.closest('form').submit(); return false;">Tiến hành thanh toán</a>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
                <jsp:include page="../../common/homepage/footer-top ptb-40 white-bg.jsp"></jsp:include>
                <jsp:include page="../../common/homepage/footer-middle ptb-30.jsp"></jsp:include>
                <jsp:include page="../../common/homepage/footer-bottom ptb-30 white-bg.jsp"></jsp:include>
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

        <script>
            window.onload = updateSubtotal;

            function updateSubtotal() {
                let total = 0;
                let productSubtotalCells = document.querySelectorAll('td.product-subtotal');

                productSubtotalCells.forEach(cell => {
                    total += parseFloat(cell.textContent) || 0;
                });

                document.querySelector("#sub-total").textContent = total;
                document.querySelector("#total-amount").textContent = total;
            }
        </script>
    </body>
</html>