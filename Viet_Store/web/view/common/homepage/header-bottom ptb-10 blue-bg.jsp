<%-- 
    Document   : header-bottom ptb-10 blue-bg
    Created on : Oct 14, 2025, 8:13:50 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header-bottom ptb-10 blue-bg">
                <div class="container">
                    <div class="row">
                        <!-- Primary Vertical-Menu Start -->
                        <div class="col-md-4 d-none d-lg-block">
                           
                        </div>
                        <!-- Primary Vertical-Menu End -->
                        <!-- Search Box Start -->
                        <div class="col-xl-6 col-lg-5 col-md-8">
                            <div class="search-box-view fix">
                                <form action="${pageContext.request.contextPath}/home">
                                    <input type="hidden" name="search" value="search-bar">
                                    <input type="text" class="email" placeholder="Tìm kiếm tên sách ở đây..."
                                        name="keyword" id="search">
                                    <button type="submit" class="submit"></button>
                                </form>
                            </div>
                        </div>
                        <!-- Search Box End -->
                        <!-- Cartt Box Start -->
                        <div class="col-xl-2 col-lg-3 col-md-4">
                            <div class="cart-box mobile-cart-box d-none d-md-block">
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/cart"><span class="cart-text">Giỏ Hàng</span><span class="cart-counter"></span></a>
                                        
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Cartt Box End -->
                    </div>
                    <!-- Row End -->
                </div>
                <!-- Container End -->
            </div>
