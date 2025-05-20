<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Billing Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/PatientBilling.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #9CC3D5FF;
            margin: 20px;
        }
        .billing-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .billing-header {
            text-align: center;
            margin-bottom: 20px;
            color: #0063B2FF;
        }
        .billing-info {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .billing-info p {
            margin: 5px 0;
            font-size: 16px;
        }
        .make-payment {
            text-align: center;
            margin-top: 10px;
        }
        .make-payment a {
            padding: 10px 20px;
            background-color: #0063B2FF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        .make-payment a:hover {
            background-color: #004a8d;
        }
        .no-bills {
            text-align: center;
            font-size: 18px;
            color: #888;
        }
        .btn-back {
            background-color: #0063B2FF;
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-weight: bold;
            display: inline-block;
        }
        .btn-back:hover {
            background-color: #004a8d;
        }
    </style>
</head>
<body>

<div class="billing-container">
    <div class="billing-header">
        <h2>Patient Billing Status</h2>
    </div>
    <c:choose>
        <c:when test="${empty bills}">
            <div class="no-bills">
                <p>No billing information available.</p>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="bill" items="${bills}">
                <div class="billing-info">
                    <p><strong>Bill Date:</strong> <c:out value="${bill.billDate}"/></p>
                    <p><strong>Total Amount:</strong> <c:out value="${bill.totalAmount}"/></p>
                    <p><strong>Bill Status:</strong> <c:out value="${bill.paymentStatus}"/></p>
                    <p><strong>Doctor Name:</strong> <c:out value="${bill.appointment.doctor.doctorName}"/></p>
                    <p><strong>Time Slot:</strong> <c:out value="${bill.appointment.timeSlot}"/></p>
                    <a href="/patient/billing/invoice?billId=${bill.billId}" class="btn-back">View Invoice</a>
                </div>
                <c:if test="${bill.paymentStatus == 'UNPAID'}">
                    <div class="make-payment">
                        <a href="/patient/billing/paybill?billId=${bill.billId}" onclick="return confirm('Are you sure you want to make Payment?');">Pay Bill</a>
                    </div>
                </c:if>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
