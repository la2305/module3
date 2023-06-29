<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<form action="/calculator" method="post">
    <h1>Calculator</h1>
    <label>Mô tả của sản phẩm</label>
    <br>
    <input type="text" name="description" placeholder="Nhập mô tả" value="abc">
    <br>
    <label> Giá niêm yết của sản phẩm</label>
    <br>
    <input type="text" name="price" placeholder="Nhập giá" value="100000.0 VND">
    <br>
    <label>Tỷ lệ chiết khấu (phần trăm)</label>
    <br>
    <input type="text" name="discount" placeholder="Nhập chiết khấu" value="%">
    <br>
    <input type="submit" id="submit" value="pay">
</form>
</body>
</html>