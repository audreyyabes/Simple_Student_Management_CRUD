<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<!DOCTYPE html>
<html xmlns:c="http://www.w3.org/1999/XSL/Transform" lang="en">
<head>
    <title>View All COURSES</title>
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


<h4><a href="/home">Student management</a></h4>
<h1>VIEW ALL COURSES</h1>
<div class="search-container">
    <input type="text"
            id="searchInput"
            placeholder="Search by course name..."
            onkeyup="searchCourses()">
    <a href="/course/add-courses" class="back-link">+ Add New Course</a>
</div>
<table id="coursesTable">
    <thead>
    <tr>
        <th>Course ID</th>
        <th>Course Name</th>
        <th>ACTIONS</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.courseId}</td>
            <td>${course.courseName}</td>
            <td>
                <a href="/course/edit-course/${course.courseId}" class="btn-edit"> Edit</a>
                <a href="/course/delete-course/${course.courseId}" onclick="alert('Selected student is Deleted')" class="btn-delete"> Delete</a>
                <a href="/course/courses-detail/${course.courseId}" class="btn-details"> View</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>



<script>
    function searchCourses() {
        const input = document.getElementById("searchInput");
        const filter = input.value.toLowerCase();

        const rows = document.querySelectorAll("#coursesTable tbody tr");

        rows.forEach(row => {
            const courseName = row.cells[1].textContent.toLowerCase();

            row.style.display = courseName.includes(filter) ? "" : "none";
        });
    }
</script>

</body>
</html>