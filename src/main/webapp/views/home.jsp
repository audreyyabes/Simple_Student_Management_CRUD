<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management - Home</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            color: #1e293b;
            min-height: 100vh;
        }

        header {
            background: #2563eb;
            color: white;
            padding: 20px 40px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        header h2 {
            font-size: 24px;
        }

        .container {
            max-width: 900px;
            margin: 70px auto;
            padding: 20px;
            text-align: center;
        }

        .container h1 {
            font-size: 36px;
            margin-bottom: 12px;
        }

        .container p {
            color: #64748b;
            font-size: 16px;
            margin-bottom: 40px;
        }

        .cards {
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .card {
            background: white;
            padding: 35px 25px;
            width: 280px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.06);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            font-size: 21px;
            margin-bottom: 12px;
        }

        .card p {
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .btn {
            display: inline-block;
            background: #2563eb;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            transition: background 0.2s;
        }

        .btn:hover {
            background: #1d4ed8;
        }

        .btn-secondary {
            background: #0f172a;
        }

        .btn-secondary:hover {
            background: #334155;
        }

        footer {
            text-align: center;
            padding: 25px;
            color: #94a3b8;
            font-size: 13px;
        }

        @media (max-width: 600px) {
            header {
                padding: 20px;
            }

            .container {
                margin: 40px auto;
            }

            .container h1 {
                font-size: 28px;
            }

            .card {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<header>
    <h2>Student Management System</h2>
</header>

<div class="container">
    <h1>Welcome Home!</h1>
    <p>Manage your student records easily and efficiently.</p>

    <div class="cards">

        <div class="card">
            <h3>Add Student</h3>
            <p>Register a new student by entering their name, email, and course.</p>
            <a href="/students/add-students" class="btn">Add Student</a>
        </div>

        <div class="card">
            <h3>View Students</h3>
            <p>View and manage the list of registered students.</p>
            <a href="./students/view-students" class="btn btn-secondary">
                View All Students
            </a>
        </div>

    </div>
</div>

<footer>
    &copy; 2026 Student Management System
</footer>

</body>
</html>