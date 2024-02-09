<%-- 
    Document   : login
    Created on : Feb 1, 2024, 2:02:07 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
    <div class="col">
        <h3>LOGIN</h3>
        <hr/>
        <form action="<c:url value="/account/login_handler.do" />">
            <div class="mb-3">
                <label for="email">Email :</label>
                <input type="email" name="email" id="email" class="form-control" value="${param.email}" placeholder="Enter your email" required/>
            </div>
            <div class="mb-3">
                <label for="password">Password :</label>
                <input type="password" name="password" id="password" class="form-control" value="${param.password}" placeholder="Enter your password" required />
            </div>
            <div class="form-check mb-3">
                <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="remember"> Remember me
                </label>
            </div>
            <button type="submit" value="login" class="btn btn-primary fw-bold border-0">Login</button>
        </form>
        <i style="color:red;">${errorMsg}</i>
    </div>
    <div class="col">

    </div>
</div>