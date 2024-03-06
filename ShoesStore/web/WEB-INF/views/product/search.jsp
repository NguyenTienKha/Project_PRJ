<%-- 
    Document   : search
    Created on : Mar 3, 2024, 2:56:20 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<p>Search result for</p>
<div class="d-flex justify-content-between align-items-center pb-4">
    <h3><Strong>${search} (${list.size()})</Strong></h3>
    <div class="dropdown">
        <button class="btn btn-dark dropdown-toggle rounded-5" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
            Sort by
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
            <li><a class="dropdown-item" type="button">Price : Low - High</a></li>
            <li><a class="dropdown-item" type="button">Price : High - Low</a></li>
        </ul>
    </div>
</div>
<div class="row">
    <c:forEach var="product" items="${list}">
        <div class="col-4">
            <img src="<c:url value="/products/${product.id}.png" />" width="100%" />
            <div class="fw-bold text-wrap name" style="color:brown">${product.name}</div><br/>
            <div>${product.gender}</div>
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
            <div class="sizes">
                Size:
                <select name="size">
                    <c:forEach var="size" items="${product.sizes}">
                        <option value="${size}">${size}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    </c:forEach>
</div>
