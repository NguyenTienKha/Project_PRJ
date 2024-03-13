<%-- 
    Document   : add
    Created on : Mar 13, 2024, 10:11:09 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
    <div class="col-6 d-flex justify-content-center align-items-center">
        <div class="col-7">

            <form class="shadow-lg  p-5 rounded-5" action="<c:url value="/account/add_handler.do" />">
                <h3 class="text-center mb-5 text-secondary">Your money <i class="bi bi-wallet2 "></i></h3>
                <div class="mb-3">
                    <div class="mb-3">Your money : <span class="fw-bold text-success"><fmt:formatNumber value="${customer.money}" type="currency"/></span></div>
                </div>
                <div class="mb-3">
                    <label for="money" class="fw-bold">How much money you want to add ?</label>
                    <input type="number" name="money" id="fullName" class="form-control w-50" value="${param.money}"  placeholder="Enter your money" />
                </div>
                <div class="text-center"> 
                    <button type="submit" value="add" class="btn btn-dark rounded-5"><i class="bi bi-check-lg"></i> Add</button>
                </div>

            </form>
            <i style="color:red;">${errorMsg}</i>
        </div>
    </div>
    <div class="col-6">
        <img src="<c:url value="/images/img-bg-signin.jpg"/>" width="100%"/>
    </div>
</div>