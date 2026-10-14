<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        td:first-child {
            font-weight: bold;
            color: #555;
            width: 35%;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }
        .back-link-right {
            display: inline-block;
            float: right;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>STUDENT DETAILS</h1>

    <table>
        <tr>
            <td>Student ID</td>
            <td>${students.studentId}</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>${students.studentName}</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>${students.email}</td>
        </tr>
    </table>
    <a href="/students/view-students" class="back-link">BACK</a>
    <a href="/students/edit-student/${students.studentId}" class="back-link-right">Edit Student</a>

</div>


</body>
</html>
