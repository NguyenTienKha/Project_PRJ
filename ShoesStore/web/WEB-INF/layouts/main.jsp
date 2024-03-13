<%-- 
    Document   : main
    Created on : Jan 11, 2024, 4:19:20 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Store</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" type="text/css" href="<c:url value="/styles/style.css" />">
    </head>

    <body>
        <div class="container-fluid">
            <div class="header-container d-flex flex-column">
                <div class="row information-user">
                    <c:if test="${account == null}">
                        <div class="d-flex flex-row justify-content-end">                 
                            <a class="ps-1 pe-1"  href="<c:url value="/account/create.do" />">Sign up</a> |
                            <a class="ps-1 pe-1"  href="<c:url value="/account/login.do" />">Login</a>
                        </div>
                    </c:if>
                    <c:if test="${account != null}">
                        <div class="d-flex flex-row justify-content-end">

                            <c:if test="${account != null && account.roleId == 2}">
                                <a class="me-2" href="<c:url value="/account/add.do"/>"> Your money : <span class="fw-bold text-success"><fmt:formatNumber value="${customer.money}" type="currency"/></span> </a>
                            </c:if>
                            <div class="me-2">Hi, <span class="fw-bold">${account.fullName}</span> | </div> 
                            <a class=""  href="<c:url value="/account/logout.do" />">Logout</a>
                        </div>
                    </c:if>
                </div>

                <header class="d-flex w-100 pt-2 pb-2 justify-content-between align-items-center ps-5 pe-5 col-12">
                    <span class="navbar-left">
                        <a href="<c:url value="/home/index.do" />"> <img src="<c:url value="/images/logo-nike.png" />"  width="27%"/></a>
                    </span>
                    <span class="navbar-middle">
                        <a class="fw-bold text-decoration-none ms-3 me-3" href="<c:url value="/" />">Home</a> 
                        <a class="fw-bold text-decoration-none ms-3 me-3"  href="<c:url value="/product/list.do" />">Shoes</a>
                        <c:if test="${account != null && account.roleId == 1}">
                            <a class="fw-bold text-decoration-none ms-3 me-3" href="<c:url value='/product/manage.do' />">Manage</a> 
                        </c:if>



                    </span>
                    <span class="navbar-right">
                        <div class="d-flex align-items-center justify-content-evenly">                        
                            <form action="<c:url value="/product/search.do" />" class="form-search rounded-5 col-7 d-flex align-items-center ps-2 pe-2">    
                                <i class="bi bi-search me-2 p-1 cursor-pointer"></i>
                                <input name="search" class="form-input border-0 w-75 search-btn" type="text" placeholder="Search">
                            </form>
                            <div class="navbar-cart">
                                <c:if test="${cart == null}">
                                    <i class="bi bi-cart"></i> <sup>(0)</sup>
                                </c:if>
                                <c:if test="${cart != null}">
                                    <a href="<c:url value="/cart/index.do" />"><i class="bi bi-cart"></i> <sup>(${cart.quantity})</sup></a>
                                </c:if>
                            </div>
                        </div>
                    </span>
                </header>
            </div>

            <main>
                <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
            </main>

            <footer class="text-center">
                &copy SE1842 - Team 5 - FPT Students
            </footer>
        </div>
    </body>
</html>
