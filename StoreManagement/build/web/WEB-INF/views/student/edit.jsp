<%-- 
    Document   : edit
    Created on : Jan 23, 2024, 4:15:58 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h3>Edit Product</h3>
<hr/>
<form action="<c:url value="/product/edit_handler.do" />">
    <div class="mb-3">
        <label for="id">Id:</label>
        <input type="text" value="${product.id}" disabled class="form-control" />
        <input type="hidden" name="id" id="id" value="${param.id}" />
    </div>
    <div class="mb-3">
        <label for="name">Name : </label>
        <input type="text" name="name" id="name" class="form-control" value="${param.name}" />
    </div>
    <div class="mb-3">
        <label for="brand">Brand:</label>
        <input type="text" name="brand" id="brand" class="form-control" value="${param.brand}" />
    </div>
    <div class="mb-3">
        <label for="price">Price:</label>
        <input type="number" name="price" id="price" class="form-control" value="${param.price}" />
    </div> 
    
    <button type="submit" value="create" class="text-white bg-success fw-bold border border-2 border-success p-1"><i class="bi bi-pen"></i> Edit</button>
</form>
<i style="color:red;">${errorMsg}</i>
