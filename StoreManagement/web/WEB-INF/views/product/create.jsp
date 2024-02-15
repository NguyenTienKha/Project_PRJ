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
                <label for="pName">Name:</label>
                <input type="text" name="pName" id="pName" class="form-control" value="${param.pName}" />
            </div>
            <div class="mb-3">
                <label for="pImage">Url image:</label>
                <input type="text" name="pImage" id="pImage" class="form-control" value="${param.pImage}" />
            </div>
            <div class="mb-3">
                <label for="pPrice">Price:</label>
                <input type="number" name="pPrice" id="pPrice" class="form-control" value="${param.pPrice}" />
            </div>
            <div class="mb-3">
                <label for="bID">Brand ID:</label>
                <input type="text" name="bID" id="bID" class="form-control" value="${param.bID}" />
            </div>
            <button type="submit" value="create" class="text-white bg-primary fw-bold"><i class="bi bi-check-lg"></i> Create</button>
        </form>
        <i style="color:red;">${errorMsg}</i>
    </div>
    <div class="col">

    </div>
</div>