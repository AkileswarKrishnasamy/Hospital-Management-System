<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/css/Invoice.css">

<title>Insert title here</title>
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

<h1>This is the bill of the patient:${patientName}</h1>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>