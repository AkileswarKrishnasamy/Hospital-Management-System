<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
    <link rel="stylesheet" type="text/css" href="/css/DoctorDashboard.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #9CC3D5FF;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        h3 {
            color: #333;
            margin-bottom: 20px;
        }
        .dashboard-links {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .dashboard-links a {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
            background-color: #0063B2FF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .dashboard-links a:hover {
            background-color: #004b8d;
        }
        .dashboard-links a svg {
            margin-right: 10px;
            width: 20px;
            height: 20px;
            fill: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Welcome to the dashboard, ${currentDoctor.doctorName}</h3>
        <div class="dashboard-links">
            <a href="/changePassword">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                    <path d="M12 2a7 7 0 0 0-7 7v5H4a2 2 0 0 0-2 2v4h20v-4a2 2 0 0 0-2-2h-1V9a7 7 0 0 0-7-7zm0 4a3 3 0 0 1 3 3v5h-6V9a3 3 0 0 1 3-3z"/>
                </svg> Change Password
            </a>
            <a href="/doctor/generateAppointments">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M19 3h-1V1h-2v2H8V1H6v2H5a2 2 0 0 0-2 2v16c0 1.1.9 2 2 2h14a2 2 0 0 0 2-2V5c0-1.1-.9-2-2-2zM5 21V8h14v13H5zm4-10h2v6H9v-6zm4 0h2v6h-2v-6z"/></svg>
                Generate Slots
            </a>
            <a href="/doctor/upcommingAppointments">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M5 4v2h14V4h2v16H3V4h2zm2 4v2h10V8H7zm0 4v2h10v-2H7zm0 4v2h10v-2H7z"/></svg>
                Upcoming Appointments
            </a>
            <a href="/doctor/updateMedicalHistory">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M3 5h18v2H3V5zm0 4h18v2H3V9zm0 4h18v2H3v-2zm0 4h18v2H3v-2z"/></svg>
                Update History
            </a>
            <a href="/doctor/completedConsultation">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M3 3h18v2H3V3zm0 4h18v2H3V7zm0 4h18v2H3v-2zm0 4h18v2H3v-2zm0 4h18v2H3v-2z"/></svg>
                Completed Consultation
            </a>
            <a href="/logout">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                    <path d="M10 2h10v20H10v-2h8V4h-8zm-1 5-4 4 4 4v-3h7v-2H9z"/>
                </svg> Logout
            </a>
        </div>
    </div>
</body>
</html>
