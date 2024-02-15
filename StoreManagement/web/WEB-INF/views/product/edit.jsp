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
        <label for="pID">Id:</label>
        <input type="text" value="${product.pID}" disabled class="form-control" />
        <input type="hidden" name="pID" id="pID" value="${param.pID}" />
    </div>
    <div class="mb-3">
        <label for="pName">Name : </label>
        <input type="text" name="pName" id="pName" class="form-control" value="${param.pName}" />
    </div>
    <div class="mb-3">
        <label for="pImage">URL Image : </label>
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
    <button type="submit" value="create" class="text-white bg-success fw-bold border border-2 border-success p-1"><i class="bi bi-pen"></i> Edit</button>
</form>
<i style="color:red;">${errorMsg}</i>
