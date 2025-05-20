<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Upcoming Appointments</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #9CC3D5FF;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            max-width: 900px;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #0063B2FF;
            color: white;
        }
        .cancel-button {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .cancel-button:hover {
            background-color: #cc0000;
        }
        .message {
            color: #ff0000;
            font-size: 18px;
            margin-top: 20px;
        }
        .logout-container {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .back-button {
            display: inline-block;
            margin-bottom: 15px;
            padding: 10px 15px;
            background-color: #0063B2FF;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .back-button:hover {
            background-color: #004b8d;
        }
    </style>
</head>
<body>
        <h2>Upcoming Appointments</h2>
    <div class="container">
        <c:if test="${empty appointments}">
            <div class="message">
                <p>No upcoming appointments found.</p>
            </div>
        </c:if>
        <c:if test="${not empty appointments}">
            <table>
                <thead>
                    <tr>
                        <th>Appointment ID</th>
                        <th>Appointment Date</th>
                        <th>Doctor Name</th>
                        <th>Time Slot</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="appointment" items="${appointments}">
                        <tr>
                            <td>${appointment.appointmentId}</td>
                            <td>${appointment.appointmentDate}</td>
                            <td>${appointment.doctor.doctorName}</td>
                            <td>${appointment.timeSlot}</td>
                            <td>
                                <a href="/patient/upcommingAppointments/cancel?appointmentId=${appointment.appointmentId}" class="cancel-button" onclick="return confirm('Are you sure you want to cancel this Appointment?');">Cancel</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
<script src="https://cdn.jsdelivr.n