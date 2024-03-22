<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Teacher</title>
    <link rel="shortcut icon" href="images/favicon.png"/>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('images/EAQQL.jpg');
            background-size: cover;
            background-position: center;
        }

        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #131E3A;
            overflow-x: hidden;
            padding-top: 20px;
        }

        .sidebar a, .sidebar a.active {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }

        .sidebar a:hover {
            background-color: #0056b3;
        }

        .main {
            margin-left: 250px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            min-height: 100vh;
        }

        .form-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #131E3A;
        }

        input[type=text], select, input[type=submit] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            background-color: #131E3A;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        input[type=submit]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="Report.jsp">Report</a>
    <a href="LogoutServlet" class="active">Logout</a>
</div>

<div class="main">
    <div class="form-container">
        <h2>Add New Teacher</h2>
        <form action="AddTeacherServlet" method="post">
            <div class="form-group">
                <label for="teacherCode">Teacher Code:</label>
                <input type="text" id="teacherCode" name="code" required>
            </div>
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="qualification">Qualification:</label>
                <select id="qualification" name="qualification">
                    <option value="BACHELOR">Bachelor</option>
                    <option value="MASTER">Master</option>
                    <option value="PHD">PhD</option>
                </select>
            </div>
            <input type="submit" value="Add Teacher">
        </form>
    </div>
</div>

</body>
</html>
