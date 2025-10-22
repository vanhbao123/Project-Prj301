<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- Thêm taglib để dùng c:if --%>
<!doctype html>
<html class="no-js" lang="vi-VN"> <%-- Đổi ngôn ngữ --%>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Gatcomart - Đăng ký</title> <%-- Đổi tiêu đề --%>
        <meta name="description" content="Default Description">
        <meta name="keywords" content="E-commerce" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/icon/favicon.png"> <%-- Sửa đường dẫn --%>
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

            <div class="sign-up ptb-50">
                <div class="container">
                    <div class="section-title mb-50">
                        <h2>Tạo tài khoản mới</h2> <%-- Việt hóa --%>
                    </div>
                    <div class="row d-flex justify-content-center"> <%-- Căn giữa form --%>
                        <div class="col-lg-8 col-md-10 col-sm-12"> <%-- Cho form rộng hơn một chút --%>
                            <form autocomplete="off" action="authen?action=register" method="POST">
                                <div class="create-account riview-field">
                                    <div class="sign-in">
                                        <h3 class="mb-30">Thông tin đăng ký</h3> <%-- Việt hóa --%>
                                        <div class="form-group">
                                            <label class="req" for="username">Tên đăng nhập</label> <%-- Việt hóa --%>
                                            <input type="text" class="form-control" id="username" required="required" name="username">
                                        </div>
                                        <div class="form-group">
                                            <label class="req" for="password">Mật khẩu</label> <%-- Việt hóa --%>
                                            <input type="password" class="form-control" id="password" required="required" name="password">
                                        </div>
                                        <div class="form-group">
                                            <label class="req" for="sure-password">Xác nhận mật khẩu</label> <%-- Việt hóa --%>
                                            <input type="password" class="form-control" id="sure-password"
                                                   required="required" name="confirm-password">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email</label> <%-- Bỏ class req nếu email không bắt buộc --%>
                                            <input type="email" class="form-control" id="email" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Địa chỉ</label> <%-- Bỏ class req nếu địa chỉ không bắt buộc --%>
                                            <input type="text" class="form-control" id="address" name="address">
                                        </div>
                                        <button class="mt-10 btn-account" type="submit">Tạo tài khoản</button> <%-- Việt hóa & thêm class btn-account --%>
                                        <br/>
                                        <c:if test="${not empty error}">
                                            <div class="alert alert-danger mt-3" role="alert">
                                                ${error}
                                            </div>
                                        </c:if>
                                        <div class="mt-3">
                                             <p>Đã có tài khoản? <a href="authen?action=login">Đăng nhập ngay</a></p> <%-- Thêm link đăng nhập --%>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Đã xóa phần Newsletter --%>

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