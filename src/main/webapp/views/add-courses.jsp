<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<form action="${pageContext.request.contextPath}/course/add-course" method="post">
    <label>Course Name</label>
    <input type="text" name="courseName" required>

    <button type="submit" onclick="alert('Course Added')">Add Course</button>
</form>



</body>
</html>
