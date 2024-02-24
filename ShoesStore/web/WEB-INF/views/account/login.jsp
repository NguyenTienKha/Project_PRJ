<%-- 
    Document   : login
    Created on : Feb 1, 2024, 4:20:46 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
    <div class="container-form-login d-flex justify-content-center align-items-center">

        <div class="col-sm-5 form-login rounded-5 pt-3 pb-3 shadow-lg" >
            <h3 class="text-center">Login</h3>

            <form class="w-75" action="<c:url value="/account/login_handler.do" />">
                <div class="mb-3 mt-3">
                    <label for="email" class="form-label fw-bold">Email:</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="${param.email!=null?param.email:email.value}">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label fw-bold">Password:</label>
                    <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" value="${param.password!=null?param.password:password.value}">
                </div>
                <div class="form-check mb-3">
                    <label class="form-check-label fw-bold">
                        <input class="form-check-input" type="checkbox" name="remember" ${param.remember=="on"? "checked": ""}> Remember me
                    </label>
                </div>
                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-dark rounded-5 ps-4 pe-4">Login</button>
                </div>
            </form>
        </div>
        <i style="color:red;">${errorMsg}</i>
    </div>
    <!--<div class="wrapper-img-login position-absolute"><img class="img-login" src="<c:url value="/images/img-bg-login.jpg" />" width="100%"/></div>-->

</div>