<%-- 
    Document   : index
    Created on : Jan 11, 2024, 3:55:59 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .name {
        white-space: nowrap;
        width: 80%; 
       
    }

</style>

<div class="row">
    <c:forEach var="product" items="${list}">
        <div class="col-sm-4 col-6  p-3 d-flex flex-column justify-content-between ">
            <div class="details">
                <img src="<c:url value="/products/${product.id}.jpg" />" width="100%" />
                <div class="fw-bold text-nowrap name" style="color:brown">${product.name}</div><br/>
                <c:choose>
                    <c:when test="${product.discount == 0}">
                        <fmt:formatNumber value="${product.price}" type="currency"/><br/>
                    </c:when>
                    <c:otherwise>
                        <strike> <fmt:formatNumber value="${product.price}" type="currency"/></strike><br/>
                        Discount : <fmt:formatNumber value="${product.discount}" type="percent"/>
                        <i class="bi bi-arrow-right"></i><fmt:formatNumber value="${product.price*(1-product.discount)}" type="currency"/><br/>
                    </c:otherwise>
                </c:choose>
            </div>
            <a class="btn btn-primary btn-sm mt-2" href="<c:url value="/cart/add?id=${product.id}"/>">Add to Cart <i class="bi bi-bag-plus"></i></a>
        </div>
    </c:forEach>
</div>
