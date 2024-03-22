<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mugabo.domain.Eregistration" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.mugabo.domain.Users" %>

<%
HttpSession existingSession = request.getSession(false);
Users user = null;
if (session != null) {
    user = (Users) session.getAttribute("user");
}
if (user == null || !"student".equals(user.getRole())) {
    // User is not logged in or not a student, redirect to login page
    response.sendRedirect("Login.jsp");
    return;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AUCA | StudentRegistration</title>
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

        form {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #131E3A;
        }

        input[type=text], input[type=date], input[type=submit] {
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
    <a href="studentDashboard.jsp">Dashboard</a>
    <a href="LogoutServlet" class="active">Logout</a>
</div>

<div class="main">
    <form action="studentregistration" method="post">
        <h2>Student Registration</h2>
        <div class="form-group">
            <label for="code">Student ID</label>
            <input type="text" id="code" name="code" placeholder="Enter student id">
        </div>
        <div class="form-group">
            <label for="date">Registration Date</label>
            <input type="date" id="date" name="date" placeholder="Enter registration date">
        </div>
        <div class="form-group">
            <label for="academicunitcode">Academic Unit</label>
            <input type="text" id="academicunitcode" name="academicunitcode" placeholder="Enter academic unit">
        </div>
        <div class="form-group">
            <label for="semestercode">Semester</label>
            <input type="text" id="semestercode" name="semestercode" placeholder="Enter semester">
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
