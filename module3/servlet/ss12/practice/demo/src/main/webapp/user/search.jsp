<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 7/6/2023
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search By Country</title>
    <style>
        table, tr, td, th {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 20px;
        }
    </style>
</head>
<body>
<center>
    <h1>Enter country <span>${searchStr}</span></h1>
    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <c:forEach  var="user" items="${list}">
            <tr>
                <td>${user.getId()}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
            </tr>
        </c:forEach>
    </table>
    <h2><a href="/users">Back to Main menu</a></h2>
</center>
</body>
</html>
