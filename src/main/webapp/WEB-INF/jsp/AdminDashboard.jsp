<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #9CC3D5FF;
            margin: 0;
            display: flex;
        }
        .sidebar {
            width: 250px;
            background-color: #0063B2FF;
            color: white;
            height: 100vh;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            padding: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
            border-radius: 5px;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        .sidebar svg {
            width: 20px;
            height: 20px;
            fill: white;
        }
        .content {
            flex-grow: 1;
            padding: 40px;
        }
        .stats-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        .stat-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            flex: 1;
            min-width: 200px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="/changePassword">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
            <path d="M12 2a7 7 0 0 0-7 7v5H4a2 2 0 0 0-2 2v4h20v-4a2 2 0 0 0-2-2h-1V9a7 7 0 0 0-7-7zm0 4a3 3 0 0 1 3 3v5h-6V9a3 3 0 0 1 3-3z"/>
        </svg> Change Password
    </a>
    <a href="admin/addAdmin">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
            <path d="M12 2a5 5 0 1 1-5 5 5 5 0 0 1 5-5zm-8 18v-1a6 6 0 0 1 12 0v1zM15 14h4v2h-4v4h-2v-4H9v-2h4v-4h2z"/>
        </svg> Add Admin
    </a>
    <a href="admin/manageDoctors">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
            <path d="M12 2a5 5 0 1 1-5 5 5 5 0 0 1 5-5zm-6 14h12v2H6zm6-5 2 2h-4z"/>
        </svg> Manage Doctors
    </a>
    <a href="admin/managePatients">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
            <path d="M12 2a5 5 0 1 1-5 5 5 5 0 0 1 5-5zm0 14c-4 0-8 2-8 3v1h16v-1c0-1-4-3-8-3z"/>
        </svg> Manage Patients
    </a>
    <a href="admin/manageAppointments">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
            <path d="M6 2h2v2h8V2h2v2h3v18H3V4h3zm0 4v14h12V6zm3 4h6v2H9zm0 4h6v2H9z"/>
        </svg> Manage Appointments
    </a>
    <a href="admin/manageBills">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
            <path d="M5 3h14v16h-5l-2 2-2-2H5zM8 7h8v2H8zm0 4h8v2H8z"/>
        </svg> Manage Bills
    </a>
    <a href="/logout">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
            <path d="M10 2h10v20H10v-2h8V4h-8zm-1 5-4 4 4 4v-3h7v-2H9z"/>
        </svg> Logout
    </a>
</div>

    <div class="content">
        <h2>Welcome, ${adminName}</h2>
        <div class="stats-container">
            <div class="stat-box">Total Doctors: 15</div>
            <div class="stat-box">Total Patients: 120</div>
            <div class="stat-box">Appointments Today: 20</div>
            <div class="stat-box">Pending Bills: 5</div>
        </div>
    </div>
</body>
</html>
