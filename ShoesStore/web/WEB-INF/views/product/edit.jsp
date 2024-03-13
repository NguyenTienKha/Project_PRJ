<%-- 
    Document   : edit
    Created on : Mar 9, 2024, 10:30:44 AM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
    <div class="col-6 d-flex justify-content-center align-items-center ">
        <div class="col-7">
            <h3>Edit Product</h3>
            <hr/>
            <form action="<c:url value="/product/edit_handler.do" />">
                <div class="mb-3">
                    <label for="id">Id</label>
                    <input type="text" value="${product.id}" disabled class="form-control" />
                    <input type="hidden" name="id" id="id" value="${param.id}" />
                </div>
                <div class="mb-3">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" class="form-control" value="${param.name}" />
                </div>
                <div class="mb-3">
                    <label for="gender">Subtitle</label>
                    <input type="text" name="gender" id="gender" class="form-control" value="${param.gender}" />
                </div>
                <div class="mb-3">
                    <label for="price">Price</label>
                    <input type="number" name="price" id="price" class="form-control" value="${param.price}" />
                </div>
                <div class="mb-3">
                    <label for="discount">Discount</label>
                    <input type="number" name="discount" id="discount" class="form-control" value="${param.discount}" />
                </div>
                <div class="mb-3">
                    <label for="category">Category</label>
                    <select name="category" id="category" size="1" class="form-control">
                        <c:forEach var="category" items="${list}">
                            <option value="${category.id}" ${category.id == param.category?"selected":""}>${category.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" value="edit" class="btn btn-dark rounded-5 ps-4 pe-4">Edit <i class="bi bi-check-lg"></i></button>
            </form>
            <i style="color:red;">${errorMsg}</i>
        </div>
    </div>
    <div class="col-6">
        <img src="<c:url value="/images/img-bg-create-product.jpg"/>" width="100%"/>
    </div>
</div>
