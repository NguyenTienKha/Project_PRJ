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
            <button class="btn btn-dark dropdown-toggle rounded-5" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
                Sort by
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                <li><button class="dropdown-item" type="button">Price : High - Low</button></li>
                <li><button class="dropdown-item" type="button">Price : Low - High</button></li>
            </ul>
        </div>
    </div>
    <div class="row">
        <c:forEach var="product" items="${list}">
            <div class="col-sm-3 col-6  p-3 d-flex flex-column justify-content-between ">
                <div class="details">
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
                <a class="btn-add-card btn btn-dark btn-sm mt-2 rounded-4 text-nowrap p-2" href="<c:url value="/cart/add?id=${product.id}"/>">Add to Cart <i class="bi bi-bag-plus"></i></a>
            </div>
        </c:forEach>
    </div>
</div>
