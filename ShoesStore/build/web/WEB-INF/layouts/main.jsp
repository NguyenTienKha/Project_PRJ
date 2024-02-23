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
    </head>
    <style>
        .navbar-middle{

        }
    </style>

    <body>
        <div class="container-fluid">
            <div class="row header">
                <div style="float:right;">
                    <c:if test="${account == null}">
                        <a href="<c:url value="/account/login.do" />">Login</a>
                    </c:if>
                    <c:if test="${account != null}">
                        Welcome ${account.fullName} | 
                        <a href="<c:url value="/account/logout.do" />">Logout</a>
                    </c:if>
                </div>
                <div class="mt-2">
                    <nav class="mb-4 d-flex justify-content-between align-items-center">
                        <span class="navbar-left">
                            <img src="<c:url value="/images/logo-nike-removebg-preview.png" />"  width="50%"/>
                        </span>
                        <span class="navbar-middle">
                            <a class="fw-bold text-decoration-none"  href="<c:url value="/" />">Home</a> 
                        </span>
                        <span class="navbar-right">
                            <div class="d-flex align-items-center">
                                <form class=" border border-1 rounded-4 p-1 me-1">
                                    <i class="bi bi-search"></i>
                                    <input class="border-0" type="text" >
                                </form>
                                <div><i class="bi bi-basket2-fill"></i><sup>1</sup></div>
                            </div>
                        </span>
                    </nav>
                </div>
            </div>
            <hr/>      
            <div class="body">
                <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
            </div>
            <hr/>

            <div class="footer text-center">
                &copy Nguyen Tien Kha - SE170170 - FPT Students
            </div>
        </div>
    </body>
</html>
