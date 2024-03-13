<%-- 
    Document   : thanks
    Created on : Feb 29, 2024, 2:20:20 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row col-6 ms-auto me-auto mt-5">
    <div class="border border-3 rounded-5 p-3 pb-5 shadow-lg">

        <div class="order-detail rounded-5  col-10 ms-auto me-auto">
            <h2 >Your Invoice  <i class="bi bi-receipt"></i></h2>
            <p>Customer : <span class="fw-bold ">${account.fullName}</span></p>
            <h2 class="text-center mb-3">In your bag</h2>
            <div class="border ">
                <c:forEach var="item" items="${cartItems}">
                    <div class="d-flex m-3 col-8 ms-auto me-auto">
                        <div class="col-sm-4 m-2">
                            <img src="<c:url value="/products/${item.product.id}.png" />" width="100" />
                        </div>
                        <div class="col-sm-8">
                            <div class="fw-bold">${item.product.name}</div>
                            <div class="text-secondary">${item.product.gender}<span>'s Shoes</span></div>
                            <div class="text-secondary">Qty : ${item.quantity}</div>
                            <div class="text-secondary">Size : ${item.size}</div>
                            <div class="fw-bold"><fmt:formatNumber value="${item.cost}" type="currency" /></div>
                        </div>
                    </div>
                    <hr class="w-75 ms-auto me-auto"/>
                </c:forEach>
                <h3 class="fw-bold text-center" >Total: <span class="text-success"><fmt:formatNumber value="${totalCost}" type="currency" /></span></h3>
            </div>

        </div> 
    </div>
</div>

