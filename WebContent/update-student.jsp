<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mugabo.domain.Student" %>
<%@ page import="com.mugabo.view.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<html>
<head>
    <title>Update Student</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f0f0;
            color: #333;
            padding: 20px;
            margin: 0;
        }

        .container {
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        h2 {
            color: #007bff;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="text"], input[type="submit"] {
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #007bff;
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 15px;
            }
        }
    </style>
</head>

<body>
<%
    String regno = request.getParameter("regno");
    Student student = null;
    org.hibernate.Session hibernateSession = null; // Use fully qualified name to avoid confusion with HttpSession
    try {
        hibernateSession = HibernateUtil.getSession().openSession();
        student = hibernateSession.get(Student.class, regno); // Use the Hibernate session to get the student
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (hibernateSession != null) {
            hibernateSession.close(); // Make sure to close the Hibernate session
        }
    }
%>

<h2>Update Student</h2>
<form action="UpdateStudentServlet" method="post">
    Reg No: <input type="text" name="regno" value="<%= student.getRegno() %>" readonly><br>
    Full Name: <input type="text" name="fullname" value="<%= student.getFullname() %>" required><br>
    Date of Birth: <input type="text" name="dateofbirth" value="<%= student.getDateofbirth() %>" required><br>
    <input type="submit" value="Update">
</form>
</body>
</html>
