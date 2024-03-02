<%-- 
    Document   : main
    Created on : Jan 11, 2024, 4:19:20 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Shoes Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<link rel="stylesheet" type="text/css" href="<c:url value="/styles/style.css" />">

<body>
    <div class="container-fluid">
        <div class="header d-flex flex-column">
            <div class="row information-user">
                <c:if test="${account == null}">
                    <div class="d-flex flex-row justify-content-end">                 
                        <a class="ps-1 pe-1"  href="<c:url value="/account/create.do" />">Sign in</a> |
                        <a class="ps-1 pe-1"  href="<c:url value="/account/login.do" />">Login</a>
                    </div>
                </c:if>
                <c:if test="${account != null}">
                    <div class="d-flex flex-row justify-content-end">
                        <div class="me-2">Hi, <span class="fw-bold">${account.fullName}</span> | </div> 
                        <a class=""  href="<c:url value="/account/logout.do" />">Logout</a>
                    </div>
                </c:if>
            </div>
        </div>
<!--        Nav bar-->
        <div class="d-flex header-navbar bg-light w-100 z-3">
            <nav class="d-flex w-100 navbar-move d-flex justify-content-between align-items-center">
                <span class="navbar-left">
                    <img src="<c:url value="/images/logo-nike.png" />"  width="27%"/>
                </span>
                <span class="navbar-middle">
                    <a class="fw-bold text-decoration-none" href="<c:url value="/" />">Home</a> 
                </span>
                <span class="navbar-right">
                    <div class="d-flex align-items-center justify-content-evenly">                        
                        <form class="form-search border border-1 rounded-5 py-1 px-4 me-1 col-8 d-flex align-items-center">    
                            <i onclick="openSearchBar()" class="bi bi-search me-2 p-1 cursor-pointer"></i>
                            <input onchange="handleSearch()" class="form-input border-0 w-100 search-btn" type="text" placeholder="Search">
                        </form>
                        <div class="navbar-cart"><i class="bi bi-basket2-fill"></i><sup>1</sup></div>
                    </div>
                </span>
                <span style="display: none;" class="navbar-added"></span>
            </nav>
            <div class="result-bar"></div>
        </div>

        <main>
            <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
        </main>

        <footer class="text-center">
            &copy Nguyen Tien Kha - SE170170 - FPT Students
        </footer>
    </div>
</body>
<script>
    var lastScrollTop = 0;
    var navbar = document.querySelector('.header-navbar');
    window.addEventListener("scroll", function () {
        var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        if (scrollTop > lastScrollTop) {
            navbar.style.top = '-100%';
        } else {
            if (scrollTop === 0) {
                navbar.style.top = '36px';
            } else {
                navbar.style.top = '0px';
            }
        }
        navbar.style.transition = 'all ease-in 0.2s';
        lastScrollTop = scrollTop;
    });
    function openSearchBar() {
        let navLeft = document.querySelector('.navbar-left');
        let navMiddle = document.querySelector('.navbar-middle');
        let navRight = document.querySelector('.navbar-right');
        let navCart = document.querySelector('.navbar-cart');
        let navMove = document.querySelector(".navbar-move");
        let navAdded = document.querySelector('.navbar-added');
        navMiddle.style.display = 'none';
        navCart.style.display = 'none';
        navLeft.classList.add("col-2");
        navRight.classList.add("col-8");
        navAdded.innerHTML = "<span class='cancel-navbar'>Cancel</span>"
        navAdded.style.display = 'block';
        navAdded.classList.add("col-2");
        document.querySelector('.search-btn').style.transition = 'all 0.3s ease';
        navRight.style.transition = 'all 0.3s ease';
        navAdded.style.transition = 'all 0.3s ease';
        navMove.style.transition = 'all 0.3s ease';    
    }
    function cancelSearchBar() {
        
    }
</script>

