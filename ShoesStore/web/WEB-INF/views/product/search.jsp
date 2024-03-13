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
        <button class="btn text-dark dropdown-toggle rounded-5" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
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
        <div class="col-sm-3 col-6  p-3 d-flex flex-column justify-content-between ">
            <div class="details">
                <img src="<c:url value="/products/${product.id}.png" />" width="100%" />
                <div class="fw-bold text-wrap name" style="color:brown">${product.name}</div><br/>
                <div style="color:grey">${product.gender} <span>'s Shoes</span></div>
                <div class="sizes">
                    Size:
                    <select name="size">
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
            <a class="btn-add-card btn btn-dark btn-sm mt-2 rounded-4 text-nowrap p-2" href="<c:url value="/cart/add?id=${product.id}"/>">Add to Cart <i class="bi bi-bag-plus"></i></a>
        </div>
    </c:forEach>
</div>
