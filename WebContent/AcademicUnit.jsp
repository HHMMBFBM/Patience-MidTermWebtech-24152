<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mugabo.domain.Eacademicunit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AUCA | AcademicUnit</title>
<link rel="stylesheet" href="css/style.css"/>
<link rel="shortcut icon" href="images/favicon.png"/>
<script src="asserts/script.js"></script>
<style>
    body, html {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
    }

    .sidebar {
        height: 100vh;
        width: 200px;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        background-color: #333;
        overflow-x: hidden;
        padding-top: 20px;
    }

    .sidebar a {
        padding: 10px 15px;
        text-decoration: none;
        font-size: 16px;
        color: #fff;
        display: block;
    }

    .sidebar a:hover, .sidebar a.active {
        background-color: #555;
    }

    .main {
        margin-left: 200px;
        padding: 20px;
        background-color: #fff;
        min-height: 100vh;
    }

    form {
        background-color: #f9f9f9;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    label {
        color: #333;
        font-weight: bold;
    }

    input[type=text], input[type=submit], select {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type=submit] {
        width: auto;
        background-color: #333;
        color: #fff;
        cursor: pointer;
    }

    input[type=submit]:hover {
        background-color: #555;
    }

    footer {
        text-align: center;
        padding: 10px;
        background-color: #333;
        color: #fff;
        position: fixed;
        bottom: 0;
        left: 200px;
        width: calc(100% - 200px);
    }
</style>

</head>
<body>
<div class="sidebar">
    <a href="adminDashboard.jsp">Back</a>
    <a href="Report.jsp">Report</a>
    <a href="LogoutServlet" class="active">Logout</a>
</div>

<div class="main">
    <form action="academicunit" method="post">
        <h2>Add New AcademicUnit</h2>
        <div class="form-group email">
          <label for="email">Code</label>
          <input type="text" id="code" placeholder="Enter the Code" name="code">
        </div>
        <div class="form-group password">
          <label for="password">Name</label>
          <input type="text" id="name" placeholder="Enter the name" name="name">
        </div>
        <div class="form-group qualification">
            <label for="qualification">Academic Type</label>
            <select id="qualification" name="type">
                <c:forEach var="academicUnitType" items="${Eacademicunit.values()}">
                    <option value="${academicUnitType}">${academicUnitType}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group password">
          <label for="email">Parent Code</label>
          <input type="text" id="parent" placeholder="Enter the parent code" name="parent">
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
