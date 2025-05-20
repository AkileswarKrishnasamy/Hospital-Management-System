<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success</title>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #9CC3D5FF;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        h1 {
            color: #003366;
            margin-bottom: 20px;
        }
        .btn-primary {
            background-color: #0063B2FF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary:hover {
            background-color: #004080;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Success!</h1>
        <a href="/${role}" class="btn-primary">Back to Dashboard</a>
    </div>

</body>
</html>
