<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/css/UnAuthorizedAccess.css">

<meta charset="UTF-8">
<title>Unauthorized Access</title>
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

<h2>You are not Authorized to access this page</h2>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>