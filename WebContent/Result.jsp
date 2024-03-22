<%@page import="com.mugabo.domain.CourseData"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.mugabo.domain.StudentRegistration" %>
<%@ page import="com.mugabo.domain.StudentCourse" %>
<%@ page import="com.mugabo.domain.Course" %>
<%@ page import="com.mugabo.domain.CourseData" %>
<%@ page import="com.mugabo.domain.CourseDefinition" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mugabo.view.HibernateUtil" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>AUCA | Result</title>
    
    <!--fav-icon-->
    <link rel="shortcut icon" href="images/favicon.png"/>
    <script src="asserts/script.js"></script>
</head>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    nav {
        background-color: #00447b;
        color: #ffffff;
        padding: 10px 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    nav a.logo img {
        height: 40px;
    }

    .menu-btn {
        display: none;
    }

    nav ul {
        list-style: none;
        display: flex;
        margin: 0;
        padding: 0;
    }

    nav ul li a {
        color: white;
        text-decoration: none;
        padding: 10px 15px;
        display: block;
    }

    nav ul li a:hover,
    nav ul li a.active {
        background-color: #0267C1;
        border-radius: 5px;
    }

    section.main {
        padding: 20px;
    }

    h4 {
        color: #333;
        margin: 20px 0;
    }

    table {
        width: 100%;
        margin-bottom: 20px;
        border-collapse: collapse;
    }

    table, th, td {
        border: 1px solid #ddd;
    }

    th, td {
        text-align: left;
        padding: 8px;
    }

    th {
        background-color: #00447b;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    input[type="submit"] {
        background-color: #00447b;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    input[type="submit"]:hover {
        background-color: #0267C1;
    }

    center {
        margin: 20px 0;
    }
    </style>
<body>
<section class="main">
    <nav>
        <a href="adminDashboard.jsp" class="logo">
            <img src="images/logo.png" height="40px" />
        </a>
        <input class="menu-btn" type="checkbox" id="menu-btn"/>
        <label class="menu-icon" for="menu-btn">
            <span class="nav-icon"></span>
        </label>
        <ul class="menu" style="border-radius: 5px;">
            <li><a href="index.jsp">Home</a></li>
            <li><a class="active" onclick="document.getElementById('id01').style.display='block'" style="width:auto; border-radius: 5px; cursor: pointer;">Login</a></li>
        </ul>
    </nav>

    <form action="result" method="get">
       <center><h2>Students per Semester</h2></center>
    <label for="semesterId">Select a Semester:</label>
    <select name="semesterId" id="semesterId">
        <!-- Add options dynamically from your database if needed -->
        <option value="1">Semester 1</option>
        <option value="2">Semester 2</option>
        <!-- Add more options as needed -->
    </select>
    <br></br>
    <!-- Add the "department" input field here -->
    <label for="department">Select Department:</label>
    <select name="department" id="department">
        <option value="A05">Network and Communication</option>
        <option value="A04">Software Engineering</option>
        <option value="A03">Business Administration</option>
        <!-- Add more department options as needed -->
    </select>
    <br></br>
    <input type="submit" value="Get Students">
</form>
<br></br>
<center><h2>Students Per Semester</h2></center>
    <table>
        <tr>
            <th>RegNo</th>
            <th>FullName</th>
            <th>DateOfBirth</th>
            <th>Code</th>
            <th>AcademicUnit</th>
            <th>StudentRegistration</th>
            <th>Status</th>
            <!-- Add more columns as needed -->
        </tr>
        <c:forEach var="studentReg" items="${students}">
    <tr>
        <td>${studentReg.regno.regno}</td>
        <td>${studentReg.regno.fullname}</td>
        <td>${studentReg.regno.dateofbirth}</td>
        <td>${studentReg.academicunit.code}</td>
        <td>${studentReg.academicunit.name}</td>
        <td>${studentReg.registrationDate}</td>
        <td>${studentReg.status}</td>
        <!-- Add more fields as needed -->
    </tr>
</c:forEach>
    </table>
<br><br>
<center><h2>Students Per Department and Semester</h2></center>
<!-- Table for displaying students in the selected department -->
<table>
    <tr>
        <th>RegNo</th>
        <th>Full Name</th>
        <th>Date of Birth</th>
        <th>Academic Unit Code</th>
        <th>Academic Unit Name</th>
        <th>Registration Date</th>
        <th>Status</th>
        <!-- Add more fields as needed -->
    </tr>
    <c:forEach var="student" items="${departmentStudents}">
        <tr>
            <td>${student.regno.regno}</td>
            <td>${student.regno.fullname}</td>
            <td>${student.regno.dateofbirth}</td>
            <td>${student.academicunit.code}</td>
            <td>${student.academicunit.name}</td>
            <td>${student.registrationDate}</td>
            <td>${student.status}</td>
            <!-- Add more fields as needed -->
        </tr>
    </c:forEach>
</table>  

<center><h1>Courses List Per Student</h1></center>
<table>
    <tr>
        <th>ID</th>
        <th>RegNo</th>
        <th>Date</th>
        <th>Code</th>
        <th>Course</th>
    </tr>
    <c:forEach var="courseData" items="${courseDataList}">
    <tr>
        <td>${courseData.id}</td>
        <td>${courseData.regNo}</td>
        <td>${courseData.registrationDate}</td>
        <td>${courseData.courseCode}</td>
        <td>${courseData.courseName}</td>
    </tr>
</c:forEach>    
</table>

  
    <%-- Courses per Semester Table --%>
<form action="courseresult" method="get">
    <label for="courseSemesterId">Select a Semester:</label>
    <select name="courseSemesterId" id="courseSemesterId">
        <!-- Add options dynamically from your database if needed -->
        <option value="1">Semester 1</option>
        <option value="2">Semester 2</option>
        <!-- Add more options as needed -->
    </select>
    <br></br>
    
    <label for="department">Select Department:</label>
    <select name="department" id="department">
        <option value="A05">Network and Communication</option>
        <option value="A04">Software Engineering</option>
        <option value="A03">Business Administration</option>
        <!-- Add more department options as needed -->
    </select>
    <br></br>
    
    <input type="submit" value="Get Courses">
</form>


<!-- Courses per Semester Table -->
<center><h2>Courses per Semester</h2></center>
<table>
    <tr>
        <th>Code</th>
        <th>Course Name</th>
        <th>Teacher</th>
        <th>Course Description</th>
        <th>Academic Unit</th>
        <!-- Add more columns as needed -->
    </tr>
    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.cousedefinition.code}</td>
			<td>${course.cousedefinition.name}</td>
			<td>${course.teacher.names}</td>
			<td>${course.cousedefinition.description}</td>
			<td>${course.academicunit.code}</td>

            <!-- Add more data fields as needed -->
        </tr>
    </c:forEach>
</table>





</section>
</body>
</html>
