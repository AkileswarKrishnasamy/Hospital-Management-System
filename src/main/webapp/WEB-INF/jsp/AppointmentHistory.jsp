<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Past Appointments</title>
    <link rel="stylesheet" type="text/css" href="/css/AppointmentHistory.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #9CC3D5FF;
        }
        
        h2 {
            text-align: center;
            color: #333;
        }

        .table-container {
            width: 80%;
            margin: auto;
            overflow-x: auto;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #0063B2FF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin: 20px auto;
            width: 80%;
        }

        .btn {
            text-decoration: none;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-back {
            background-color: #0063B2FF;
        }

        .btn-back:hover {
            background-color: #004494;
        }

        .btn-logout {
            background-color: #d9534f;
        }

        .btn-logout:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>


<h2>Past Appointments</h2>

<div class="table-container">
    <c:if test="${empty appointments}">
        <p style="text-align: center; color: #777;">No past appointments found.</p>
    </c:if>

    <c:if test="${not empty appointments}">
        <table>
            <thead>
                <tr>
                    <th>Appointment ID</th>
                    <th>Appointment Date</th>
                    <th>Doctor Name</th>
                    <th>Time Slot</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="appointment" items="${appointments}">
                    <tr>
                        <td>${appointment.appointmentId}</td>
                        <td>${appointment.appointmentDate}</td>
                        <td>${appointment.doctor.doctorName}</td>
                        <td>${appointment.timeSlot}</td>
                        <td>${appointment.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

</body>
</html>
