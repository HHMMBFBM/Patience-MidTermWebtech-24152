<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.mugabo.domain.Users" %>

<%
HttpSession existingSession = request.getSession(false);
Users user = null;
if (session != null) {
    user = (Users) session.getAttribute("user");
}
if (user == null || !"teacher".equals(user.getRole())) {
    // User is not logged in or not a teacher, redirect to login page
    response.sendRedirect("Login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AUCA | Teacher Dashboard</title>
    <link rel="shortcut icon" href="images/favicon.png"/>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('images/hero-bg.png');
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
            color: white;
            min-height: 100vh;
        }

        .home-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .home-text h3, .home-text h1 {
            margin: 10px 0;
        }

        .home-img img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <a href="teacherDashboard.jsp">Dashboard</a>
    <a href="Research.jsp">Research</a>
    <a href="MediaCenter.jsp">Media Center</a>
    <a href="LogoutServlet" class="active">Logout</a>
</div>

<div class="main">
    <div class="home-content">
        <h3>Welcome to the Teacher Dashboard</h3>
        <h1>Explore Resources</h1>
        <img src="images/teacher-dashboard.png" alt="Teacher Dashboard"/>
    </div>
</div>

</body>
</html>
