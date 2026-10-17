<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<!DOCTYPE html>
<html xmlns:c="http://www.w3.org/1999/XSL/Transform" lang="en">
<head>
    <title>View All Students</title>
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
<h1>VIEW ALL STUDENTS</h1>
<div class="search-container">
    <label for="searchInput"></label><input
            type="text"
            id="searchInput"
            placeholder="Search by name, email, or course..."
            onkeyup="searchStudents()">
    <a href="/students/add-students" class="back-link">+ Add New Student</a>
</div>


<table id="studentsTable">
    <thead>
    <tr>
        <th onclick="sortTable(0)">Student ID &nbsp;&#8597;</th>
        <th onclick="sortTable(1)">Name &nbsp;&#8597;</th>
        <th onclick="sortTable(2)">Email &nbsp;&#8597;</th>
        <th onclick="sortTable(3)">Status &nbsp;&#8597;</th>
        <th onclick="sortTable(4)">Course ID &nbsp;&#8597;</th>
        <th onclick="sortTable(5)">Course Name &nbsp;&#8597;</th>
        <th>Action</th>
    </tr>
    </thead>


    <tbody>
    <c:forEach var="student" items="${students}">
        <span id="searchInfo"></span>
        <tr>
            <td>${student.studentId}</td>
            <td><c:out value="${student.studentName}" /></td>
            <td><c:out value="${student.email}" /></td>
            <td>
                <c:choose>
                    <c:when test="${student.is_active}">Active</c:when>
                    <c:otherwise>Inactive</c:otherwise>
                </c:choose>
            </td>
            <td>${student.courseId}</td>
            <td>
                <c:forEach var="course" items="${courses}">
                    <c:if test="${course.courseId == student.courseId}">
                        <c:out value="${course.courseName}" />
                    </c:if>
                </c:forEach>
            </td>
            <td>
                <a href="/students/edit-student/${student.studentId}" class="btn-edit">Edit</a>
                <a href="/students/delete-student/${student.studentId}" onclick="alert('Selected student is Deleted')" class="btn-delete">Delete</a>
                <a href="/students/student-detail/${student.studentId}" class="btn-details">Details</a>
            </td>
        </tr>
    </c:forEach>

    <c:if test="${empty students}">
        <tr>
            <td colspan="5" style="text-align: center;">
                No students found.
            </td>
        </tr>
    </c:if>
    </tbody>

</table>



<div class="pagination-controls">
    <label for="pageSize">Rows per page:</label>

    <select id="pageSize" onchange="changePageSize()">
        <option value="5">5</option>
        <option value="10" selected>10</option>
        <option value="20">20</option>
        <option value="50">50</option>
    </select>



    <button type="button" id="prevBtn" onclick="changePage(-1)">
        Previous
    </button>

    <button type="button" id="nextBtn" onclick="changePage(1)">
        Next
    </button>
</div>

<script>
    function searchStudents() {
        const input = document.getElementById("searchInput");
        const filter = input.value.toLowerCase();
        const table = document.querySelector("table");
        const rows = table.querySelectorAll("tbody tr");

        rows.forEach(row => {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    }

    let currentPage = 1;
    let sortColumn = -1;
    let sortAscending = true;

    function getRows() {
        const tbody = document.querySelector("#studentsTable tbody");

        return Array.from(tbody.querySelectorAll("tr")).filter(row =>
            row.cells.length > 1
        );
    }

    function getFilteredRows() {
        const search = document.getElementById("searchInput");

        const query = search ? search.value.toLowerCase().trim() : "";

        let rows = getRows().filter(row =>
            row.textContent.toLowerCase().includes(query)
        );

        if (sortColumn >= 0) {
            rows.sort((a, b) => {
                const first = a.cells[sortColumn].textContent.trim();
                const second = b.cells[sortColumn].textContent.trim();

                let result;

                if (sortColumn === 0) {
                    result = Number(first) - Number(second);
                } else {
                    result = first.localeCompare(
                        second,
                        undefined,
                        { numeric: true, sensitivity: "base" }
                    );
                }

                return sortAscending ? result : -result;
            });
        }

        return rows;
    }

    function renderTable() {
        const tbody = document.querySelector("#studentsTable tbody");
        const rows = getFilteredRows();

        const pageSize = Number(
            document.getElementById("pageSize").value
        );

        const totalPages = Math.max(1, Math.ceil(rows.length / pageSize));

        currentPage = Math.min(currentPage, totalPages);

        const start = (currentPage - 1) * pageSize;
        const visibleRows = rows.slice(start, start + pageSize);

        // Hide all original rows first
        getRows().forEach(row => row.style.display = "none");

        // Show only rows for the current page
        visibleRows.forEach(row => {
            row.style.display = "";
            tbody.appendChild(row);
        });

        document.getElementById("searchInfo").textContent =
            rows.length === 0
                ? "No students found"
                : "";

        document.getElementById("prevBtn").disabled = currentPage <= 1;
        document.getElementById("nextBtn").disabled =
            currentPage >= totalPages;
    }

    function searchStudents() {
        currentPage = 1;
        renderTable();
    }

    function sortTable(column) {
        if (sortColumn === column) {
            sortAscending = !sortAscending;
        } else {
            sortColumn = column;
            sortAscending = true;
        }

        currentPage = 1;
        renderTable();
    }

    function changePage(direction) {
        currentPage += direction;
        renderTable();
    }

    function changePageSize() {
        currentPage = 1;
        renderTable();
    }

    document.addEventListener("DOMContentLoaded", renderTable);
    document.getElementById("noStudentsFound").style.display =
        rows.length === 0 ? "" : "none";
</script>

</body>
</html>