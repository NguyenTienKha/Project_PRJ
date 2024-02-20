<%-- 
    Document   : login
    Created on : Feb 1, 2024, 2:02:07 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .wrapper-form{
        background-color: #ffe99c;
        opacity: 1;
        index:100;
    }
    .wapper-page-login{
        background: pink;
    }
</style>
<div class="wapper-page-login row pt-4 pb-4 ">
    <div class="wrapper-form col col-6 border border-2 p-2 rounded-5 m-auto shadow-lg ">
        <h3 class="text-center">LOGIN</h3>
        <hr/>
        <form class="col-8 m-auto" action="<c:url value="/account/login_handler.do" />">
            <div class="form-floating mb-3">
                <input type="email" name="email" id="uEmail" class="form-control" value="${param.email}" required>
                <label for="email">Email</label>
            </div>
            <div class="form-floating">
                <input type="password" name="password" id="password" class="form-control" value="${param.password}"required >
                <label for="password">Password</label>
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
</div>