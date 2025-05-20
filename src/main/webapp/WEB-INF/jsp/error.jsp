<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/css/error.css">

    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            text-align: center;
        }
        h2 {
            color: #d9534f;
        }
        p {
            color: #333;
        }
    </style>
</head>
<body>

<style>
    .logout-container {
        position: absolute;
        top: 10px;
        right: 10px;
    }
</style>
<div class="logout-container">
    <a href="logout" class="btn btn-danger">Logout</a>
</div>

<a href="javascript:history.back()" class="btn btn-secondary">⬅ Back</a>

    <div class="container">
        <h2>Error</h2>
        <p>${message}</p>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>