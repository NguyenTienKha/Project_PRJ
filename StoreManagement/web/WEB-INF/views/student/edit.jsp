<%-- 
    Document   : edit
    Created on : Jan 23, 2024, 4:15:58 PM
    Author     : Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h3>Edit Student</h3>
<hr/>
<form action="<c:url value="/student/edit_handler.do" />">
    <div class="mb-3">
        <label for="id">Id:</label>
        <input type="text" value="${student.id}" disabled class="form-control" />
        <input type="hidden" name="id" id="id" value="${param.id}" />
    </div>
    <div class="mb-3">
        <label for="fullName">Full name:</label>
        <input type="text" name="fullName" id="fullName" class="form-control" value="${param.fullName}" />
    </div>
    <div class="mb-3">
        <label for="examDate">Exam date:</label>
        <input type="date" name="examDate" id="examDate" class="form-control" value="${param.examDate}" />
    </div>
    <div class="mb-3">
        <label for="point">Point:</label>
        <input type="number" name="point" id="point" class="form-control" value="${param.point}" />
    </div> 
    <button type="submit" value="create" class="text-white bg-success fw-bold border border-2 border-success p-1"><i class="bi bi-pen"></i> Edit</button>
</form>
<i style="color:red;">${errorMsg}</i>
