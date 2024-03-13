<%-- 
    Document   : list
    Created on : Mar 2, 2024, 9:27:29 AM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--    View products-->
<div class="row d-flex justify-content-end">
    <div class="dropdown">
        <button class="btn dropdown-toggle rounded-5 text-dark" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
            Sort by
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
            <li><a href="<c:url value="/product/search.do?search=${search}&order=asc"/>" class="dropdown-item" type="button">Price : Low - High</a></li>
            <li><a href="<c:url value="/product/search.do?search=${search}&order=desc"/>" class="dropdown-item" type="button">Price : High - Low</a></li>
        </ul>
    </div>
</div>
<div class="row col-11 ms-auto me-auto">
    <c:forEach var="product" items="${list}">
        <form class="col-sm-3 col-6  p-3 d-flex flex-column justify-content-between " action="<c:url value="/cart/add.do?id=${product.id}&size=${size}" />" >
            <div class="details">
                <input type="hidden" name="id" value="${product.id}"/>
                <img src="<c:url value="/products/${product.id}.png" />" width="100%" />
                <div class="fw-bold text-wrap name" style="color:brown">${product.name}</div><br/>
                <div style="color:grey">${product.gender} <span>'s Shoes</span></div>
                <div class="sizes">
                    Size:
                    <select id="size_${product.id}" name="size">
                        <c:forEach var="size" items="${product.sizes}">
                            <option value="${size}">${size}</option>
                        </c:forEach>
                    </select>
                </div>
                <c:choose>
                    <c:when test="${product.discount == 0}">
                        <div class="fw-bold"><fmt:formatNumber value="${product.price}" type="currency"/></div><br/>
                    </c:when>
                    <c:otherwise>
                        <span class="fw-bold"><fmt:formatNumber value="${product.price*(1-product.discount)}" type="currency"/></span>
                        <strike style="color:grey"> <fmt:formatNumber value="${product.price}" type="currency"/></strike> <br/>
                        <span class="fw-bold" style="color:green"><fmt:formatNumber value="${product.discount}" type="percent"/></span>
                    </c:otherwise>
                </c:choose>

            </div>

            <button class="btn-add-card btn btn-dark btn-sm mt-2 rounded-4 text-nowrap p-2">Add to Cart <i class="bi bi-bag-plus"></i></button>

        </form>
    </c:forEach>
</div>

