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
                        <a class=""  href="<c:url value="/account/login.do" />">Login</a>
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
     
        <div class="body">
            <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
        </div>


        <div class="footer text-center">
            &copy Nguyen Tien Kha - SE170170 - FPT Students
        </div>
    </div>
</body>

