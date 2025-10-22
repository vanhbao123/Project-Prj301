<%-- 
    Document   : header-middle ptb-20 white-bg
    Created on : Oct 14, 2025, 8:13:01 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header-middle ptb-20 white-bg">
    <div class="container position-relative">
        <div class="row">
            <!-- Logo Start -->
            <div class="col-lg-3 col-md-4">
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/img/logo/logo-vietstore.png" alt="logo-image"></a>
                </div>
            </div>
            <!-- Logo End -->
            <!-- Header Middle Menu Start -->
            <div class="col-lg-9 col-md-8">
                <div class="middle-menu d-none d-lg-block">
                    <nav>
                        <ul class="middle-menu-list">
                            <li><a href="index.html">Nhà</a>
                            </li>
                            </li>
                            <li><a href="#">Trang</a>
                                
                            </li>
                            <li><a href="contact.html">Liên Lạc</a></li>
                            <li><a href="blog.html">blog</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
            <!-- Header Middle Menu End -->
        </div>
        <!-- Row End -->
    </div>
    <!-- Container End -->
</div>

<style>
    .middle-menu {
        margin-left: 150px;
    }
    .logo a img{
        width: 100%;
    }
    

</style>
