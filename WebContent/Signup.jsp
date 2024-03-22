<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>AUCA | Signup</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
        }

        form {
            width: 100%;
            max-width: 500px;
            padding: 20px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #131E3A;
        }

        input[type=text], input[type=email], input[type=password], input[type=submit] {
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

        .info {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #131E3A;
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
    <a href="index.jsp">Home</a>
    <a href="Login.jsp" class="active">Login</a>
</div>

<div class="main">
    <form action="users" method="post">
        <h2>Signup</h2>
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" id="id" name="id" placeholder="Enter your ID">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password">
        </div>
        <div class="form-group submit-btn">
            <input type="submit" value="Signup">
        </div>
        <div>
            <a href="Login.jsp" class="info">I already have an account</a>
        </div>
    </form>
</div>

<footer>
    <p>Copyright (C) - 2024  </p>
</footer>

</body>
</html>
