<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AUCA | StudentCourse</title>
    <link rel="shortcut icon" href="images/favicon.png"/>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
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
            background-color: #fff;
            min-height: 100vh;
        }

        form {
            width: 100%;
            max-width: 600px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #131E3A;
        }

        input[type=text], input[type=submit] {
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

        footer {
            text-align: center;
            padding: 20px;
            background-color: #131E3A;
            color: white;
            position: fixed;
            bottom: 0;
            left: 250px;
            width: calc(100% - 250px);
        }
    </style>
</head>
<body>

<div class="sidebar">
    <a href="adminDashboard.jsp">Back</a>
    <a href="Report.jsp">Report</a>
    <a href="Login.jsp" class="active">Logout</a>
</div>

<div class="main">
    <h2>Add Student Course</h2>
    <form action="studentcourse" method="post">
        <div class="form-group">
            <label for="regig">Student Registration</label>
            <input type="text" id="regig" name="regig" placeholder="Enter student registration">
        </div>
        <div class="form-group">
            <label for="credits">Credits</label>
            <input type="text" id="credits" name="credits" placeholder="Enter Course Credits">
        </div>
        <div class="form-group">
            <label for="course">Course</label>
            <input type="text" id="course" name="course" placeholder="Enter Course">
        </div>
        <div class="form-group">
            <label for="results">Results</label>
            <input type="text" id="results" name="results" placeholder="Enter results">
        </div>
        <div class="form-group submit-btn">
            <input type="submit" value="Add">
        </div>
    </form>
</div>

<footer>
    <p>Copyright (C) - 2024 </p>
</footer>

</body>
</html>
