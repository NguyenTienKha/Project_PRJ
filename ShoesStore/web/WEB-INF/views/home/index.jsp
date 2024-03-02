<%-- 
    Document   : index
    Created on : Jan 11, 2024, 3:55:59 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col">

    <div class="row">
        <img src="<c:url value="/images/img-main-background.png" />"  width="100%"/>
        <div class="text-center mt-5">
            <div class="text-uppercase fw-bold fs-1" >Shoes<br/>Everyday Staples</div>
            <p>Style and legacy come together in the latest collection.</p>
            <a class="btn btn-dark rounded-5" href="<c:url value="/" />" >Shop</a>
        </div>
    </div>

    <div class="row">
        <div class="fw-bold fs-4 mt-5 mb-3">Top Trending</div>
        <div class="col-sm-12 d-flex">
            <div class="col-sm-4">
                <img src="<c:url value="/images/img-trending-1.jpg"/>" width="98%"/>
                <div class="mt-3">Nike Blazer Mid '77</div>
            </div>
            <div class="col-sm-4">
                <img src="<c:url value="/images/img-trending-2.jpg"/>" width="98%"/>
                <div class="mt-3">Air Jordan 1 Retro High OG "Black/White"</div>
            </div>
            <div class="col-sm-4">
                <img src="<c:url value="/images/img-trending-3.jpg"/>" width="98%"/>
                <div class="mt-3">Nike Air Force 1'07</div>
            </div>

        </div>
    </div>


    <div class="row">
        <div class="fw-bold fs-4 mt-5 mb-3">Featured</div>
        <div class="col-sm-12 d-flex">
            <div class="col-sm-6 position-relative">
                <img src="<c:url value="/images/img-featured-1.jpg"/>" width="98%"/>
                <div class="product-featured position-absolute text-white">
                    <div class="mt-3 fw-bold">Nike Soccer</div>
                    <button class="btn btn-dark rounded-5">Shop Now</button>
                </div>
            </div>
            <div class="col-sm-6 position-relative">
                <img src="<c:url value="/images/img-featured-2.jpg"/>" width="98%"/>
                <div class="product-featured position-absolute text-white">
                    <div class="mt-3 fw-bold">Nike Air Force</div>
                    <button class="btn btn-dark rounded-5 ">Shop Now</button>
                </div>
            </div>
        </div>
    </div>

    <br/>


    <div class="row">
        <div class="fw-bold fs-4 mt-5 mb-3">Some our products</div>
        <c:forEach var="product" items="${list}" varStatus="loop">
            <c:choose>
                <c:when test="${loop.index == 0 || loop.index == 1 || loop.index == 8 || loop.index == 9 || loop.index == 18 || loop.index == 19 || loop.index == 28 || loop.index == 29}">
                    <div class="col-sm-3 col-6 p-3 d-flex flex-column justify-content-between">
                        <div class="details">
                            <img src="<c:url value="/products/${product.id}.png" />" width="100%" />
                            <div class="fw-bold text-wrap name" style="color:brown">${product.name}</div><br/>
                            <div>${product.gender}</div>
                            <c:choose>
                                <c:when test="${product.discount == 0}">
                                    <fmt:formatNumber value="${product.price}" type="currency"/><br/>
                                </c:when>
                                <c:otherwise>
                                    <strike><fmt:formatNumber value="${product.price}" type="currency"/></strike><br/>
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
                        <a class="btn-add-card btn btn-dark btn-sm mt-2 rounded-4 p-2" href="<c:url value="/cart/add?id=${product.id}"/>">Add to Cart <i class="bi bi-bag-plus"></i></a>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>
        <br/>
        <div class="text-center fs-2"><i class="bi bi-three-dots"></i></div>
        <button class="btn-show-more btn btn-dark rounded-5 text-nowrap mt-4">Show more</button>

    </div>


    <div class="row">
        <img src="<c:url value="/images/img-member.jpg" />" width="100%" />
        <div class="membership text-center">
            <div class="mt-3 fw-bold fs-1">The best of Nike</div>
            <div class="mt-3 fs-5">It's Better as a Member</div>
            <br/>
            <a class="btn btn-dark rounded-5"  href="<c:url value="/account/create.do" />">Sign Up</a>
        </div>
    </div>
    <br/>

