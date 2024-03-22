<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AUCA | Home</title>
<link rel="shortcut icon" href="images/favicon.png"/>
<style>
    body, html {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        height: 100%;
        background-color: #f4f4f4;
    }

    .sidebar {
        height: 100%;
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

    .sidebar a:hover {
        background-color: #0056b3;
    }

    .main {
        margin-left: 250px;
        padding: 0px 10px;
        background-image: url('images/EAQQL.jpg');
        background-size: cover;
        background-position: center;
        min-height: 100vh;
        color: white;
    }

    .home-content {
        padding: 20px;
        background-color: rgba(0, 68, 123, 0.7);
        border-radius: 10px;
        max-width: 600px;
        margin: 20px auto;
        text-align: center;
    }

    .home-text h3, .home-text h1, .home-text p {
        margin: 15px 0;
    }

    .main-login {
        background-color: #007bff;
        color: white;
        padding: 10px 30px;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease-in-out;
        text-decoration: none;
        display: inline-block;
        margin-top: 20px;
        border-radius: 5px;
    }

    .main-login:hover {
        background-color: #0056b3;
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

    @media screen and (max-width: 767px) {
        .sidebar {
            width: 100px;
        }

        .sidebar a {
            text-align: center;
            padding: 10px 6px;
            font-size: 12px;
        }

        .main {
            margin-left: 100px;
        }

        footer {
            left: 0;
            width: 100%;
        }
    }
</style>
</head>
<body>
<div class="sidebar">
    <a href="index.jsp">Home</a>
    <a href="Report.jsp">Report</a>
    <a href="Login.jsp">Apply Now</a>
    <a href="Login.jsp">Login</a>
</div>

<div class="main">
    <section style="background-image: url(images/EAQQL.jpg);">    
        <!--main-content-->
        <div class="home-content">
            <!--text-->
            <div class="home-text">
                <h3>ADVENTIST UNIVERSITY OF CENTRAL AFRICA</h3>
                <h1>University Portal</h1>
                <p>The purpose of Schools is to prepare students with promise
                    to enhance their intellectual, physical, social, emotional, spiritual,
                    and artistic growth so that they may realize their power for good
                    as citizens of the world.</p>
                <!--login-btn-->
                <a href="Login.jsp" class="main-login">Apply Now</a>
            </div>        
        </div>
    </section>
</div>

<!--footer------------->
<footer>
    <p>Copyright (C) - 2024</p>
</footer>

</body>
</html>
