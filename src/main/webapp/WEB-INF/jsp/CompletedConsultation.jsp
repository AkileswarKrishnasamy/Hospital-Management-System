<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Completed Appointments</title>

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
            max-width: 800px;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            color: #003366;
            margin-bottom: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #e0e0e0;
        }
        .no-appointments {
            text-align: center;
            font-size: 18px;
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Completed Appointments</h2>
        <c:if test="${not empty completedApointments}">
        <table>
            <thead>
                <tr>
                    <th>Appointment ID</th>
                    <th>Patient Name</th>
                    <th>Appointment Date</th>
                    <th>Time Slot</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="appointment" items="${completedAppointments}">
                    <tr>
                        <td>${appointment.appointmentId}</td>
                        <td>${appointment.patient.patientName}</td>
                        <td>${appointment.appointmentDate}</td>
                        <td>${appointment.timeSlot}</td>
                    </tr>
                </c:forEach>
                
            </tbody>
        </table>
        </c:if>
        <c:if test="${empty completedAppointments}">
                    <tr>
                        <td colspan="4" class="no-appointments">No completed appointments found.</td>
                    </tr>
                </c:if>
    </div>

</body>
</html>
