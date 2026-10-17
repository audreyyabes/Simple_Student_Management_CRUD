<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <title>Course Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f6f9;
        }

        h1 {
            text-align: center;
            color: #333;
        }
        h4 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            margin-top: 25px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .empty-message {
            text-align: center;
            color: #777;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            float: right;
        }

        .search-container {
            margin: 25px 0 15px;
        }

        #searchInput {
            width: 100%;
            max-width: 400px;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            box-sizing: border-box;
        }

        #searchInput:focus {
            border-color: #2563eb;
            box-shadow: 0 0 4px rgba(37, 99, 235, 0.2);
        }

        #studentsTable th[onclick] {
            cursor: pointer;
            user-select: none;
        }

        #studentsTable th[onclick]:hover {
            background-color: #1d4ed8;
        }

        .pagination-controls {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 20px;
        }

        .pagination-controls select {
            width: auto;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .pagination-controls button {
            width: auto;
            padding: 9px 14px;
            background-color: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .pagination-controls button:disabled {
            background-color: #cbd5e1;
            cursor: not-allowed;
        }

        #searchInfo {
            font-size: 20px;
            color: red;
        }
        .btn-edit {
            display: inline-block;
            padding: 6px 12px;
            background-color: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 13px;
        }

        .btn-edit:hover {
            background-color: #1d4ed8;
        }

        .btn-delete {
            display: inline-block;
            padding: 6px 12px;
            background-color: #eb2525;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 13px;
        }
        .btn-delete:hover {
            background-color: #d81d1d;
        }

        .btn-details {
            display: inline-block;
            padding: 6px 12px;
            background-color: #4cc63e;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 13px;
        }
        .btn-details:hover {
            background-color: #45b538;
        }


    </style>
</head>
<body>

<h1>Course Details</h1>

<h3>Enrolled Students in ${course.courseName}</h3>

<table border="1">
    <thead>
    <tr>
        <th>Student ID</th>
        <th>Student Name</th>
        <th>Email</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="student" items="${students}">
        <tr>
            <td>${student.studentId}</td>
            <td>${student.studentName}</td>
            <td>${student.email}</td>
        </tr>
    </c:forEach>

    <c:if test="${empty students}">
        <tr>
            <td colspan="3">No students enrolled in this course.</td>
        </tr>
    </c:if>
    </tbody>
</table>

<br>

<a href="/course/view-courses">Back to Courses</a>

</body>
</html>