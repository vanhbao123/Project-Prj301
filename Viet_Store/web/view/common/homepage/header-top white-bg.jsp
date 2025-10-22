<%-- 
Document   : header-top white-bg
Created on : Oct 14, 2025, 8:00:37 PM
Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header-top white-bg">
    <div class="container">
        <div class="row">
            <!-- Header Top left Start -->
            <div class="col-lg-3 col-md-4">
                
            </div>
            <!-- Header Top left End -->
            <!-- Header Top Right Start -->
            <div class="col-lg-9 col-md-8">
                <div class="header-top-right f-right header-top-none">
                    <ul class="header-list-menu right-menu">
                        <!--Nguoi dung-->
                        <c:if test="${account.roleId == 2}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user-home">Tài khoản của tôi</a>
                            </li>
                        </c:if>
                        <!--Admin-->
                        <c:if test="${account.roleId == 1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/admin-home">Tài khoản của tôi</a>
                            </li>
                        </c:if>
                        <c:if test="${account !=null}">
                            <li><a href="${pageContext.request.contextPath}/cart">Giỏ Hàng</a></li>
                            </c:if>
                            <c:if test="${account ==null}">
                            <li><a href="authen?action=login">Đăng Nhập</a></li>
                            </c:if>

                        <c:if test="${account !=null}">
                            <li><a href="authen?action=logout">Đăng Xuất</a></li>
                            </c:if>
                            <c:if test="${account ==null}">
                            <li><a href="authen?action=register">Đăng Kí</a></li>
                            </c:if>
                       
                    </ul>
                    <!-- Header-list-menu End -->
                </div>

            </div>
            <!-- Header Top Right End -->
        </div>
        <!-- Row End -->
    </div>
    <!-- Container End -->
</div>
