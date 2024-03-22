<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AUCA | Report</title>
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
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #131E3A;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #131E3A;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="Report.jsp" class="active">Report</a>
    <a href="LogoutServlet">Logout</a>
</div>

<div class="main">
    <h2>Report Overview</h2>
    <!-- Example of a report table -->
     <form action="report" method="post">
    <input type="hidden" name="action" value="fetchData" />
    <input type="submit" value="Fetch All Data" />
</form>
        <center><h4>Students</h4></center>
        <table>
            <thead>
                <tr>
                    <th>Reg No</th>
                    <th>Full Name</th>
                    <th>Date of Birth</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listStudents}" var="student">
                    <tr>
                        <td>${student.regno}</td>
                        <td>${student.fullname}</td>
                        <td>${student.dateofbirth}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <center><h4>Semester</h4></center>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listSemester}" var="semester">
                    <tr>
                        <td>${semester.id}</td>
                        <td>${semester.name}</td>
                        <td>${semester.startDate}</td>
                        <td>${semester.endDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <center><h4>AcademicUnit</h4></center>
        <table>
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Academic Type</th>
                    <th>Academic Name</th>
                    <th>Parent Code</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listAcademicUnit}" var="academicunit">
                    <tr>
                        <td>${academicunit.code}</td>
                        <td>${academicunit.academicType}</td>
                        <td>${academicunit.name}</td>
                        <td>${academicunit.parentAcademic.code}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <center><h4>Teacher</h4></center>
<table>
    <thead>
        <tr>
            <th>Code</th>
            <th>Names</th>
            <th>Qualification</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listTeacher}" var="teacher">
            <tr>
                <td>${teacher.code}</td>
                <td>${teacher.names}</td>
                <td>${teacher.qualification}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<center><h4>CourseDefinition</h4></center>
<table>
    <thead>
        <tr>
            <th>Code</th>
            <th>Names</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listCourseDefinition}" var="coursedefinition">
            <tr>
                <td>${coursedefinition.code}</td>
                <td>${coursedefinition.name}</td>
                <td>${coursedefinition.description}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<center><h4>Course</h4></center>
<table>
    <thead>
        <tr>
            <th>Code</th>
            <th>AcademicUnit Code</th>
            <th>Semester Id</th>
            <th>Teacher Code</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listCourse}" var="course">
            <tr>
                <td>${course.code}</td>
                <td>${course.academicunit.code}</td>
                <td>${course.semester.id}</td>
                <td>${course.teacher.code}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<center><h4>Student Course</h4></center>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Credits</th>
            <th>Results</th>
            <th>Course Code</th>
            <th>Student Registration</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${liststudentcourse}" var="studentcourse">
            <tr>
                <td>${studentcourse.id}</td>
                <td>${studentcourse.credits}</td>
                <td>${studentcourse.results}</td>
                <td>${studentcourse.course.code}</td>
                <td>${studentcourse.studentregistration.id}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<center><h4>Student Registration</h4></center>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Registration Date</th>
            <th>Academic Unit Code</th>
            <th>Semester ID</th>
            <th>Student ID</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listStudentRegistration}" var="studentregistration">
            <tr>
                <td>${studentregistration.id}</td>
                <td>${studentregistration.registrationDate}</td>
                <td>${studentregistration.academicunit.code}</td>
                <td>${studentregistration.semester.id}</td>
                <td>${studentregistration.regno.regno}</td> 
                <td>${studentregistration.status}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>


<footer>
    <p>Copyright (C) - 2024 | <p>
</footer>
</body>
</html>
