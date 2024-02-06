<%-- 
    Document   : list
    Created on : Jan 23, 2024, 4:17:34 PM
    Author     :Nguyen Tien Kha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h3 class="text-center">Student list</h3><hr/>
<a class="text-decoration-none border border-2 rounded-3 border-primary p-2 fw-bold" href="<c:url value="/student/create.do" />">Create</a><br/><br/>
<table class="table table-hover table-bordered">
    <thead>
        <tr>
            <th class="bg-body-secondary">Id</th>
            <th class="bg-body-secondary">Full Name</th>
            <th class="bg-body-secondary">Exam Date</th>
            <th class="bg-body-secondary">Point</th>
            <th class="bg-body-secondary">Operations</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="student" items="${list}" >
            <tr>
                <td>${student.id}</td>
                <td>${student.fullName}</td>
                <td><fmt:formatDate value="${student.examDate}" pattern="MM-dd-yyyy" /></td>
                <td>${student.point}</td>
                <td>
                    <a class="text-decoration-none text-white bg-success fw-bold border border-2 border-success p-1" href="<c:url value="/student/edit.do?id=${student.id}" />">Edit <i class="bi bi-pen"></i></a> 
                    <a class="text-decoration-none text-white bg-danger fw-bold border border-2 border-danger p-1" href="<c:url value="/student/delete.do?id=${student.id}" />">Delete <i class="bi bi-trash"></i></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<i style="color:red;">${errorMsg}</i>
