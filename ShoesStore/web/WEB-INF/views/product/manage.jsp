<%-- 
    Document   : manage
    Created on : Mar 9, 2024, 10:21:24 AM
    Author     : Nguyen Tien Kha
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<div>
    <div class=" col-11 ms-auto me-auto">
        <a class="btn-add-card btn btn-dark btn-sm mt-2 rounded-4 text-nowrap p-2" href="<c:url value="/product/create.do"/>">Create new product</a>
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

                <div class="d-flex justify-content-center">
                    <div class="col-5 m-1"><a class="btn-add-card btn btn-success btn-sm mt-2 rounded-4 text-nowrap p-1 w-100" href="<c:url value="/product/edit.do?id=${product.id}" />">Edit</a></div>
                    <div class="col-5 m-1"><a class="btn-add-card btn btn-danger btn-sm mt-2 rounded-4 text-nowrap p-1 w-100" href="<c:url value="/product/delete.do?id=${product.id}" />">Delete</a></div>
                </div>

            </form>
        </c:forEach>
    </div>

</div>