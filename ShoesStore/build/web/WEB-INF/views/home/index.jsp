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
<div class="col">
    <div class="row mt-2">
        <nav class=" d-flex justify-content-between align-items-center">
            <span class="navbar-left">
                <img src="<c:url value="/images/logo-nike.png" />"  width="50%"/>
            </span>
            <span class="navbar-middle">
                <a class="fw-bold text-decoration-none"  href="<c:url value="/" />">Home</a> 
            </span>
            <span class="navbar-right">
                <div class="d-flex align-items-center justify-content-evenly">
                    <form class="form-search border border-1 rounded-5 p-2 me-1 col-8 d-flex">
                        <i class="bi bi-search"></i>
                        <input class="form-input border-0 w-100" type="text" placeholder="Search">
                    </form>
                    <div><i class="bi bi-basket2-fill"></i><sup>1</sup></div>
                </div>
            </span>
        </nav>
    </div>
    <hr/>

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
        <!--    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="5000">
                        <img src="<c:url value="/images/img-carousel-1.jpg"/>" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <img src="<c:url value="/images/img-carousel-2.jpg" />" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="<c:url value="/images/img-carousel-3.jpg" />" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>-->
        <c:forEach var="product" items="${list}">
            <div class="col-sm-3 col-6  p-3 d-flex flex-column justify-content-between ">
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
                <a class="btn btn-dark btn-sm mt-2 rounded-4" href="<c:url value="/cart/add?id=${product.id}"/>">Add to Cart <i class="bi bi-bag-plus"></i></a>
            </div>
        </c:forEach>
    </div>
</div>
