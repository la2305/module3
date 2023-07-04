<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 7/4/2023
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Search user</title>
</head>
<body>
<center>
  <h2>
    <a href="/users">Back To List</a>
  </h2>
  <form action="/users?action=search" method="post">
    <fieldset>
      <legend>Search</legend>
      <label for="country">Country Name</label> <input type="text" id="country" name="country">
      <br><input type="submit" value="Search">
    </fieldset>
  </form>
</center>
<div align="center">
  <table border="1" cellpadding="5">
    <caption><h2>List Of Search</h2></caption>
    <tr>
      <th>Name</th>
      <th>Email</th>
      <th>Country</th>
    </tr>
    <c:if test="${listUser != null}">
      <c:forEach var="user" items="${listUser}">
        <tr>
          <td><c:out value="${user.name}"/></td>
          <td><c:out value="${user.email}"/></td>
          <td><c:out value="${user.country}"/></td>
        </tr>
      </c:forEach>
    </c:if>
  </table>
</div>
</body>
</html>
