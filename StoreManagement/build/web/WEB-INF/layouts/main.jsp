<%-- 
    Document   : main
    Created on : Jan 11, 2024, 1:46:07 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <title>Store Management</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col">                                                       `
                    <h1 class="text-center text-danger">Store</h1>
                    <hr/>
                    <a href="<c:url value="/"/>">Home</a> |
                    <span style="float:right">
                        <c:if test="${account == null}">
                            <a href="<c:url value="/account/login.do"/>">Log In</a>
                        </c:if>
                        <c:if test="${account != null}">
                            Welcome ${account.uName} | 
                            <a href="<c:url value="/account/logout.do"/>">Log Out</a>
                        </c:if>
                    </span>
                    <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
                    <hr/>
                    <div class="text-center text-success fw-bold">&copy Nguyen Tien Kha - FPT Students</div>
                </div>
            </div>
        </div>
    </body>
</html>
