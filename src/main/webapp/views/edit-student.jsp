
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/xlink">
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f4f8;
        margin: 0;
        padding: 40px 20px;
    }


    * {
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f2f4f8;
        margin: 0;
        padding: 40px 20px;
        color: #333;
    }

    .container {
        width: 100%;
        max-width: 460px;
        margin: 0 auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
    }

    h1 {
        text-align: center;
        font-size: 26px;
        margin: 0 0 25px;
        color: #1f2937;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        display: block;
        margin-bottom: 8px;
        color: #444;
        font-size: 14px;
        font-weight: 600;
    }

    input[type="text"],
    input[type="email"],
    input[type="number"],
    select {
        width: 100%;
        padding: 12px 14px;
        margin-bottom: 20px;
        border: 1px solid #d1d5db;
        border-radius: 7px;
        font-size: 14px;
        background-color: #fff;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    input:focus,
    select:focus {
        outline: none;
        border-color: #2563eb;
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
    }

    .checkbox-group {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 22px;
    }

    .checkbox-group label {
        margin: 0;
        cursor: pointer;
    }

    input[type="checkbox"] {
        width: 17px;
        height: 17px;
        margin: 0;
        accent-color: #2563eb;
        cursor: pointer;
    }

    button {
        width: 100%;
        padding: 13px;
        background-color: #2563eb;
        color: #fff;
        border: none;
        border-radius: 7px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.2s;
    }

    button:hover {
        background-color: #1d4ed8;
    }

    .cancel-link {
        display: block;
        margin-top: 18px;
        text-align: center;
        color: #6b7280;
        text-decoration: none;
        font-size: 14px;
    }

    .cancel-link:hover {
        color: #2563eb;
    }

    @media (max-width: 480px) {
        body {
            padding: 20px 12px;
        }

        .container {
            padding: 22px;
        }
    }

</style>
<body>

<h1>EDIT STUDENT</h1>

<form action="/students/edit-student" method="post">

    <input type="hidden" name="studentId" value="${students.studentId}">

    <label for="studentName">Name:</label>
    <input type="text" id="studentName" name="studentName"
           value="<c:out value='${students.studentName}'/>" required>
    <br><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email"
           value="<c:out value='${students.email}'/>" required>
    <br><br>

    <label for="courseId">Choose a Course:</label>
    <select name="courseId" id="courseId" required>
        <option value="${students.courseId}">Select a Course</option>
        <c:forEach items="${courses}" var="course">
            <option value="${course.courseId}">
                <c:out value="${course.courseName}" />
            </option>
        </c:forEach>
    </select>
    <br><br>

    <div class="checkbox-group">
        <input type="checkbox" id="is_active" name="is_active"
               value="true" ${students.is_active ? 'checked' : ''}>
        <label for="is_active">Active</label>
    </div>
    <br><br>

    <button type="submit">Update Student</button>

</form>

<a class="cancel-link"
   href="${pageContext.request.contextPath}/students/view-students">
    Cancel
</a>

</body>
</html>
