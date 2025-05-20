<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bills</title>
    <link rel="stylesheet" type="text/css" href="/css/ManageAppointments.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #9CC3D5FF;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #0063B2FF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #0063B2FF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #004b8d;
        }
        .paid {
            color: green;
            font-weight: bold;
        }
        .unpaid {
            color: red;
            font-weight: bold;
        }
        .update-btn {
            padding: 8px 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .update-btn:hover {
            background-color: #218838;
        }
        .logout-container {
            position: absolute;
            top: 10px;
            right: 10px;
        }
    </style>
</head>
<body>

<div class="logout-container">
    <a href="logout" class="btn">Logout</a>
</div>

<h1>Manage Bills</h1>

<table>
    <thead>
        <tr>
            <th>Bill ID</th>
            <th>Bill Date</th>
            <th>Patient Name</th>
            <th>Doctor Name</th>
            <th>Appointment Date</th>
            <th>Time Slot</th>
            <th>Payment Status</th>
            <th>Update Status</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="bill" items="${bills}">
            <tr>
                <td>${bill.billId}</td>
                <td>${bill.billDate}</td>
                <td>${bill.patient.patientName}</td>
                <td>${bill.appointment.doctor.doctorName}</td>
                <td>${bill.appointment.appointmentDate}</td>
                <td>${bill.appointment.timeSlot}</td>
                <td class="${bill.paymentStatus}">${bill.paymentStatus}</td>
                <td>
                    <form action="/admin/manageBills/updatePaymentStatus" method="post">
                        <input type="hidden" name="billId" value="${bill.billId}">
                        <button type="submit" class="update-btn">Update to PAID</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
