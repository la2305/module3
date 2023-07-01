<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css">
</head>
<body>
<form action="converter.jsp" method="post">
    <h2>Currency Converter</h2>
    <label>Rate: </label>
    <br>
    <input type="text" name="rate" value="22000">
    <br>
    <label>USD: </label>
    <br>
    <input type="text" name="usd" value="0">
    <br>
    <input type="submit" id="convert" value="convert">
</form>
</body>
</html>