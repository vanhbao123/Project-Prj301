<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="vi-VN">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Gatcomart - Đăng nhập</title>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.css">
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
                <jsp:include page="../common/homepage/header-top white-bg.jsp"/>
                <jsp:include page="../common/homepage/header-middle ptb-20 white-bg.jsp"/>
                <jsp:include page="../common/homepage/header-bottom ptb-10 blue-bg.jsp"/>
                <jsp:include page="../common/homepage/fixed-icon d-none d-md-block.jsp"/>
            </header>

            <div class="sign-up main-signin ptb-50">
                <div class="container">
                    <div class="section-title mb-50">
                        <h2>Đăng nhập tài khoản</h2>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-6">
                            <div class="create-account riview-field">
                                <div class="sign-in">
                                    <h3 class="mb-15 pb-15">Khách hàng đã đăng ký</h3>
                                    <p class="mb-30">Nếu bạn đã có tài khoản, vui lòng đăng nhập.</p>
                                    <form autocomplete="off" action="authen?action=login" method="POST">
                                        <div class="form-group">
                                            <label class="req" for="usernameInput">Tên đăng nhập</label>
                                            <input type="text" class="form-control" id="usernameInput" required="required" name="username">
                                        </div>
                                        <div class="form-group">
                                            <label class="req" for="passwordInput">Mật khẩu</label>
                                            <input type="password" class="form-control" id="passwordInput" required="required" name="password">
                                        </div>
                                        <button type="submit" id="sign-in">Đăng nhập</button>
                                        <c:if test="${not empty error}">
                                            <div class="alert alert-danger mt-3" role="alert">
                                                ${error}
                                            </div>
                                        </c:if>
                                    </form>
                                    <div class="mt-3">
                                        <p>Chưa có tài khoản? <a href="authen?action=register">Đăng ký ngay</a></p>
                                        <%-- Dòng Quên mật khẩu đã được xóa hoặc giữ comment --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
                <jsp:include page="../common/homepage/footer-top ptb-40 white-bg.jsp"/>
                <jsp:include page="../common/homepage/footer-middle ptb-30.jsp"/>
                <jsp:include page="../common/homepage/footer-bottom ptb-30 white-bg.jsp"/>
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