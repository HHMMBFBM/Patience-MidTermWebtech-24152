<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AUCA | Login</title>
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
        align-items: center;
        justify-content: center;
    }

    .form-container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        color: #131E3A;
    }

    input[type=email], input[type=password], input[type=submit] {
        width: 100%;
        padding: 10px;
        margin: 5px 0 20px 0;
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

    .info {
        display: block;
        text-align: center;
        margin-top: 20px;
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
    <a class="active" onclick="document.getElementById('id01').style.display='block'">Login</a>
</div>

<div class="main">
    <form action="LoginServlet" method="post" class="form-container">
        <h2>Login</h2>
        <div class="form-group email">
            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Enter your email" name="email">
        </div>
        <div class="form-group password">
            <label for="password">Password</label>
            <input type="password" id="password" placeholder="Enter your password" name="password">
        </div>
        <div>
            <a href="#" class="info" style="color: red;">Forgot Password</a>
        </div>
        <div class="form-group submit-btn">
            <input type="submit" value="Login">
        </div>
        <div>
            <a href="Signup.jsp" class="info" style="color: #131E3A;">Don't Have an Account?</a>
        </div>
        <% if (request.getAttribute("error") != null) { %>
            <p class="info" style="color: red;"><%= request.getAttribute("error").toString() %></p>
        <% } %>
    </form>
</div>

<footer>
    <p>Copyright (C) - 2024 </p>
</footer>

</body>
</html>
