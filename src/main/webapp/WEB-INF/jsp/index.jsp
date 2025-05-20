<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital Management System</title>
<style>
    /* General Styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #9CC3D5FF; /* Aquamarine background */
        margin: 0;
        padding: 0;
    }

    /* Navigation Bar */
    nav {
        background-color: #0063B2FF; /* Electric Blue Lemonade */
        color: #FFFFFF;
        padding: 15px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    nav .title {
        font-size: 22px;
        font-weight: bold;
    }

    /* Button Container */
    .button-container {
        display: flex;
        gap: 10px;
    }

    /* Common Button Styling */
    .btn {
        text-decoration: none;
        padding: 10px 15px;
        border-radius: 5px;
        font-size: 14px;
        font-weight: bold;
        text-align: center;
        display: inline-block;
        border: none;
        cursor: pointer;
    }

    .btn-primary { background-color: #0063B2FF; color: #FFFFFF; }
    .btn-primary:hover { background-color: #004B8D; }

    .btn-success { background-color: #FFFFFF; color: #0063B2FF; border: 2px solid #0063B2FF; }
    .btn-success:hover { background-color: #0063B2FF; color: #FFFFFF; }

    .btn-danger { background-color: #FA6775; color: #FFFFFF; border: none; }
    .btn-danger:hover { background-color: #D94F5B; }

    /* Content Section */
    .content {
        text-align: center;
        padding: 40px 20px;
    }

    .content h1 {
        color: #0063B2FF;
        font-size: 28px;
        font-weight: bold;
    }

    .content p {
        color: #333333;
        font-size: 16px;
        line-height: 1.6;
        max-width: 700px;
        margin: 0 auto;
    }

    /* Navigation Links */
    .nav-links {
        margin-top: 30px;
    }

    .nav-links a {
        margin: 10px;
        padding: 12px 18px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
        display: inline-block;
        background-color: #0063B2FF;
        color: #FFFFFF;
        border: none;
    }

    .nav-links a:hover {
        background-color: #004B8D;
    }

</style>
</head>
<body>

<!-- Navigation Bar -->
<nav>
    <div class="title">Hospital Management System</div>
    <div class="button-container">
        <a href="/login" class="btn btn-success">Login</a>
        <a href="/register" class="btn btn-success">Register as Patient</a>
        <a href="logout" class="btn btn-danger">Logout</a>
    </div>
</nav>

<!-- Main Content -->
<div class="content">
    <h1>Welcome to Our Hospital Management System</h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
    <div class="nav-links">
        <a href="/about" class="btn-primary">About</a>
        <a href="/contact" class="btn-primary">Contact Us</a>
    </div>
</div>

</body>
</html>
