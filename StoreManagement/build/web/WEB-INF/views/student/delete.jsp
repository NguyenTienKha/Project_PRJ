<%-- 
    Document   : delete
    Created on : Jan 23, 2024, 4:15:50 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Confirmation</h3>
<hr/>
<form action="<c:url value="/product/delete_handler.do" />">
    Are you sure to delete this product ( id=${id} )?<br/>
    <input type="hidden" name="id" value="${id}"/>
    <button class="btn btn-success fw-bold" type="submit" value="Yes" name="op"><i class=" bi bi-trash3"></i> Yes</button>
    <button class="btn btn-danger fw-bold" type="submit" value="No" name="op"><i class="bi bi-x-circle"></i> No</button>

</form>
<i style="color:red;font-style: italic;">${errorMsg}</i>
