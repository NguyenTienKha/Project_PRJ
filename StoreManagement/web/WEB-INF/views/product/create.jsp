<%-- 
    Document   : create
    Created on : Jan 23, 2024, 4:15:40 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col">
        <h3>Create a New Product</h3>
        <hr/>
        <form action="<c:url value="/product/create_handler.do" />">
            <div class="mb-3">
                <label for="name">Name:</label>
                <input type="text" name="name" id="name" class="form-control" value="${param.name}" />
            </div>
            <div class="mb-3">
                <label for="image">Url image:</label>
                <input type="text" name="image" id="image" class="form-control" value="${param.image}" />
            </div>
            <div class="mb-3">
                <label for="price">Price:</label>
                <input type="number" name="price" id="price" class="form-control" value="${param.price}" />
            </div>
            <div class="mb-3">
                <label for="categry">Category:</label>
                <input type="text" name="category" id="category" class="form-control" value="${param.category}" />
            </div>
            <button type="submit" value="create" class="text-white bg-primary fw-bold"><i class="bi bi-check-lg"></i> Create</button>
        </form>
        <i style="color:red;">${errorMsg}</i>
    </div>
    <div class="col">

    </div>
</div>