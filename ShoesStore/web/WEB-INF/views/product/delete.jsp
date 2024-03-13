<%-- 
    Document   : delete
    Created on : Mar 9, 2024, 10:30:35 AM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Confirmation</h3>
<hr/>
<form action="<c:url value="/product/delete_handler.do" />">
    Are you sure to delete this product (id = ${id})? 
    <br/>
    <input type="hidden" name="id" value="${id}"/>
    <button type="submit" value="Yes" name="op"><i class="bi bi-check-lg"></i> Yes</button>
    <button type="submit" value="No" name="op"><i class="bi bi-x-lg"></i> No</button>
</form>
<i style="color:red;font-style: italic;">${errorMsg}</i>