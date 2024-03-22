<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.mugabo.domain.Users" %>

<%
HttpSession existingSession = request.getSession(false);
Users user = null;
if (session != null) {
    user = (Users) session.getAttribute("user");
}
if (user == null || !"admin".equals(user.getRole())) {
    // User is not logged in or not an admin, redirect to login page
    response.sendRedirect("Login.jsp");
    return;
}
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AUCA | Dash</title>
<link rel="shortcut icon" href="images/favicon.png"/>
<script src="asserts/script.js"></script>
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

    .sidebar a {
        padding: 10px 15px;
        text-decoration: none;
        font-size: 18px;
        color: white;
        display: block;
    }

    .sidebar a:hover, .sidebar a.active {
        background-color: #0056b3;
    }

    .main {
        margin-left: 250px;
        padding: 20px;
        background-image: url('images/hero-bg.png');
        background-size: cover;
        background-position: center;
        min-height: 100vh;
        color: white;
    }

    .services {
        padding: 20px;
        background-color: #f4f4f4;
        color: #131E3A;
    }

    .services .box {
        text-align: center;
        padding: 20px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        background: #fff;
        margin: 20px;
        border-radius: 10px;
    }

    .services img {
        margin-top: 20px;
    }

    .services a {
        display: inline-block;
        margin: 20px 0;
        background-color: #131E3A;
        color: white;
        padding: 10px 15px;
        text-decoration: none;
        border-radius: 5px;
        transition: background 0.3s ease;
    }

    .services a:hover {
        background-color: #0d1a26;
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
    <a href="Report.jsp">Report</a>
    <a href="ListStudentsServlet">Manage Students</a>
    <a href="LogoutServlet" class="active">Logout</a>
</div>

<div class="main">
    <section style="padding-top: 100px;">
        <h3>ADVENTIST UNIVERSITY OF CENTRAL AFRICA</h3>
        <h1>Administration Portal</h1>
    </section>

    <section class="services">
        <div class="services-heading">
            <h2>SERVICES</h2>
        </div>
        <div class="box-container">
            <div class="box">
                <img src="images/icon5.png">
                <font>Add New TEACHER</font>
                <a href="teacher.jsp">Go</a>
            </div>
             <!--box-2-------->
            <div class="box">
                <img src="images/icon5.png">
                <font>Add New COURSES DEFINITION</font>
                
                <!--btn--------->
                <a href="CourseDefinition.jsp">Go</a>
            </div>
            <!--box-3-------->
            <div class="box">
                <img src="images/icon5.png">
                <font>Add New SEMESTER</font>
                
                <!--btn--------->
                <a href="Semester.jsp">Go</a>
            </div>
            <!--box-4-------->
            <div class="box">
                <img src="images/icon5.png">
                <font>Add New AcademicUnit</font>
                
                <!--btn--------->
                <a href="AcademicUnit.jsp">Go</a>
            </div>
            <!--box-5-------->
            <div class="box">
                <img src="images/icon5.png">
                <font>Add New Course</font>
                
                <!--btn--------->
                <a href="Course.jsp">Go</a>
            </div>
            <!--box-5-------->
            <div class="box">
                <img src="images/icon5.png">
                <font>Add New Student Course</font>
                
                <!--btn--------->
                <a href="StudentCourse.jsp">Go</a>
            </div>
            <!--box-5-------->
            <div class="box">
                <img src="images/icon5.png">
                <font>Edit Student Registration</font>
                
                <!--btn--------->
                <a href="StudentRegistrationAdmin.jsp">Go</a>
            </div>
        </div>
            
            <!-- Additional service boxes -->
        </div>
    </section>
</div>

<footer>
   <p>Copyright (C) - 2024</p>
</footer>

</body>
</html>
