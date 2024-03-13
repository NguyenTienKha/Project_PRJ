<%-- 
    Document   : create
    Created on : Mar 2, 2024, 9:55:14 AM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-6 d-flex justify-content-center align-items-center">
        <div class="col-7">
            <h3 class="text-center mb-5">Join our community <i class="bi bi-globe-asia-australia"></i></h3>
            <form action="<c:url value="/account/create_handler.do" />">
                <div class="mb-3">
                    <label for="email" class="fw-bold">Email</label>
                    <input type="email" name="email" id="email" class="form-control" value="${param.email}" placeholder="Enter your email" required/>
                </div>
                <div class="mb-3">
                    <label for="fullName" class="fw-bold">Full Name</label>
                    <input type="text" name="fullName" id="fullName" class="form-control" value="${param.fullName}"  placeholder="Enter your name" required />
                </div>
                <div class="mb-3">
                    <label for="password" class="fw-bold">Password</label>
                    <input type="password" name="password" id="password" class="form-control" value="${param.password}"  placeholder="Enter your password" required />
                </div>
                <br/>
                <div class="text-center"> 
                    <button type="submit" value="create" class="btn btn-dark rounded-5"><i class="bi bi-check-lg"></i> Create</button>
                </div>

            </form>
            <i style="color:red;">${errorMsg}</i>
        </div>
    </div>
    <div class="col-6">
        <img src="<c:url value="/images/img-bg-signin.jpg"/>" width="100%"/>
    </div>
</div>