<%--
  Created by IntelliJ IDEA.
  User: La
  Date: 6/30/2023
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    float price = Float.parseFloat(request.getParameter("price"));
    float discount = Float.parseFloat(request.getParameter("discount"));
    float discountAmount =  (price*discount*0.01f);
    float priceAfterDiscount =(price-price*(discount/100));
%>
<h1>discountAmount: <%=discountAmount%> </h1>
<h1>priceAfterDiscount: <%=priceAfterDiscount%> </h1>

</body>
</html>
