<%-- 
    Document   : create
    Created on : Mar 2, 2024, 9:55:14 AM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col">
        <h3>Join our community <i class="bi bi-globe-asia-australia"></i></h3>
        <hr/>
        <form action="<c:url value="/account/create_handler.do" />">
            <div class="mb-3">
                <label for="id">Id:</label>
                <input type="text" name="id" id="id" class="form-control" value="${param.id}" />
            </div>
            <div class="mb-3">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" class="form-control" value="${param.email}" />
            </div>
            <div class="mb-3">
                <label for="fullName">Full Name:</label>
                <input type="text" name="fullName" id="fullName" class="form-control" value="${param.fullName}" />
            </div>
            <div class="mb-3">
                <label for="roleId">Role Id:</label>
                <input type="text" name="roleId" id="roleId" class="form-control" value="${param.roleId}" />
            </div>
            <div class="mb-3">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" class="form-control" value="${param.password}" />
            </div>
            <button type="submit" value="create"><i class="bi bi-check-lg"></i> Create</button>
        </form>
        <i style="color:red;">${errorMsg}</i>
    </div>
    <div class="col">

    </div>
</div>