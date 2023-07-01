<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 6/30/2023
  Time: 5:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1px" style="border-collapse: collapse">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td><c:out value="${customer.name}"/></td>
            <td><c:out value="${customer.date}"/></td>
            <td><c:out value="${customer.location}"/></td>
            <td><img src="${n.image}" ></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
