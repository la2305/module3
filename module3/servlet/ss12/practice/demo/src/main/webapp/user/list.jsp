<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 7/5/2023
  Time: 11:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
        <br>
        <h2>
            <form action="/users?action=search" method="post">
                <input type="text" name="searchStr" id="searchStr" placeholder="Search By Country">
                <input type="submit" value="Search By Country">
            </form>
        </h2>
        <br>
        <a href="/users?action=sort">Order By Name</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Email</td>
            <td>Country</td>
            <td>Actions</td>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
<%--                /////////??????????????--%>
                <td>${user.getId()}</td>
                <td>${user.name}</td>
                <td>${user.email}"/></td>
                <td>${user.country}</td>
                <td>
<%--                    ??????--%>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
