<%-- 
    Document   : index
    Created on : Feb 29, 2024, 12:40:50 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
    <div class="row col-9 ms-auto me-auto mt-5">
        <div class="cart row">
            <div class="col-8">
                <h3 class="ms-5">Bag</h3><br/>
                <div class="information-cart">
                    <c:forEach var="item" items="${cart.items}" varStatus="loop">               
                        <form class="d-flex m-5" action="<c:url value="/cart/update.do"/>">
                            <input type="hidden" name="id" value="${item.id}"/>
                            <div class="col-sm-3 me-4 m-3">
                                <img src="<c:url value="/products/${item.id}.png" />" width="100" />
                            </div>
                            <div class="col-sm-9 d-flex">
                                <div class="col">
                                    <div class="fw-bold">${item.product.name}</div>
                                    <div class="text-secondary">${item.product.gender}<span>'s Shoes</span></div>
                                    <div class="text-secondary">Size : ${item.size}</div>
                                    <div class="text-secondary"><input style="width: 50px;" type="number" name="quantity" value="${item.quantity}"/></div>
                                    <div class="d-flex text-secondary">
                                        <button class="btn " type="submit"><i class="bi bi-floppy"></i></button>
                                        <a class="m-2" href="<c:url value="/cart/delete.do?id=${item.id}"/>"><i class="bi bi-trash"></i></a>
                                    </div>
                                </div>
                                <div class="col d-flex justify-content-end">                                   
                                    <strike style="color:grey"> <fmt:formatNumber value="${item.product.price}" type="currency"/></strike>     
                                    <div class="ps-2 pe-2 fw-bold"><fmt:formatNumber value="${item.cost}" type="currency" /></div>
                                </div>
                            </div>

                        </form>
                        <hr class="w-75 ms-auto me-auto"/>



                    </c:forEach>
                </div>
            </div>
            <div class="col-4">
                <h3>Summary</h3><br/>
                <div class="">
                    <div class="d-flex justify-content-between">
                        <b class="">
                            Total :
                        </b>
                        <div class="text-success fw-bold">
                            <fmt:formatNumber value="${cart.totalCost}" type="currency" />
                        </div>
                    </div>
                </div>
                <hr>
                <div class="d-flex">
                    <a class="btn btn-dark rounded-5 m-2 text-nowrap" href="<c:url value="/cart/checkout.do"/>">Check Out <i class="bi bi-coin"></i></a>
                    <a class="btn btn-dark rounded-5 m-2 text-nowrap" href="<c:url value="/cart/empty.do"/>">Empty Cart <i class="bi bi-trash3"></i></a>
                </div>
            </div>
        </div>
        <i style="color:red;">${errorMsg}</i>
    </div>
</div>
