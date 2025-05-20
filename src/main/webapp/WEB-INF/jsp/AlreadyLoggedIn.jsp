<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/css/AlreadyLoggedIn.css">

<meta charset="UTF-8">
<title>Already LoggedIn</title>
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

<h2>you are already logged In,${currentUser.userName}</h2>
<a href="${pageContext.request.contextPath}/user/logout">Logout</a>
<button onclick="window.history.back()">Back</button>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>