<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #9CC3D5FF; /* Aquamarine */
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        text-align: center;
        background-color: #fff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        width: 400px;
    }
    h1 {
        color: #0063B2FF; /* Electric Blue Lemonade */
        font-size: 24px;
    }
    p {
        color: #555;
        font-size: 16px;
    }
    .back-button {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #0063B2FF; /* Electric Blue Lemonade */
        color: #fff;
        text-decoration: none;
        border-radius: 4px;
        transition: background-color 0.3s;
    }
    .back-button:hover {
        background-color: #004a8d;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Access Denied</h1>
        <p>You do not have permission to access this page.</p>
        <a href="/" class="back-button">Go Back</a>
    </div>
</body>
</html>
