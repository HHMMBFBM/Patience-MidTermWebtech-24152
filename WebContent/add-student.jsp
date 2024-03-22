<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<html>
<head>
    <title>Add Student</title>
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

        .main-content {
            margin-left: 250px;
            padding: 20px;
            background-color: #fff;
            min-height: 100vh;
        }

        h2 {
            color: #131E3A;
        }

        .form-group {
            margin: 20px 0;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #131E3A;
        }

        input[type=text], input[type=date], input[type=submit] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
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
            background-color: #0d1a26;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="Report.jsp">Report</a>
    <a href="Result.jsp">Result</a>
    <a href="LogoutServlet" class="active">Logout</a>
</div>

<div class="main-content">
    <h2>Add New Student</h2>
    <form action="AddStudentServlet" method="post" style="max-width: 500px; margin: auto;">
        <div class="form-group">
            <label for="regno">Reg No:</label>
            <input type="text" id="regno" name="regno" required>
        </div>
        <div class="form-group">
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" required>
        </div>
        <div class="form-group">
            <label for="dateofbirth">Date of Birth:</label>
            <input type="date" id="dateofbirth" name="dateofbirth" required>
        </div>
        <div class="form-group">
            <input type="submit" value="Submit" class="main-login">
        </div>
    </form>
</div>
</body>
</html>
