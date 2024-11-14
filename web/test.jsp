<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm Loại Sản Phẩm</title>
</head>
<body>
    <h2>Thêm Loại Sản Phẩm Mới</h2>
    <form action="ThemLoaiSanPham" method="post">
         <label for="tenLoai">Mã Loại Sản Phẩm:</label>
        <input type="text" id="id" name="id" required><br><br>
        <label for="tenLoai">Tên Loại Sản Phẩm:</label>
        <input type="text" id="categoryname" name="categoryname" required><br><br>
        <label for="moTa">Mô Tả:</label>
        <textarea id="description" name="description" rows="4" cols="50" required></textarea><br><br>
        <input type="submit" value="Thêm">
    </form>
</body>
</html>
