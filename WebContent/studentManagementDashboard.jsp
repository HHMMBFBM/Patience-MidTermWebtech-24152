<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.mugabo.domain.Users" %>
<%
HttpSession existingSession = request.getSession(false);
    Users user = null;
    if (session != null) {
        user = (Users) session.getAttribute("user");
    }
    if (user == null || ! "admin".equals(user.getRole())) {
        // User is not logged in or not an admin, redirect to login page
        response.sendRedirect("Login.jsp");
        return;
    }
%>
  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"> <!-- Link to your CSS file -->
</head>
<body>
    <div class="main"> <!-- Assuming 'main' class is used for styling -->
        <nav>
            <!-- Your navigation bar here, if any -->
        </nav>
        <section class="section main" style="padding-top: 100px;"> <!-- Added 'section' and 'main' classes for styling -->
            <h1>Student Management Dashboard</h1>
            <div class="dashboard-links">
                <a href="add-student.jsp" class="dashboard-link">Add New Student</a>
                <a href="ListStudentsServlet" class="dashboard-link">View / Edit / Delete Students</a>
            </div>
        </section>
    </div>
</body>
</html>
