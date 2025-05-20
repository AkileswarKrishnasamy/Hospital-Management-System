<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Appointments</title>
    <link rel="stylesheet" type="text/css" href="/css/GenerateAppointmentsForm.css">
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
            max-width: 500px;
            width: 100%;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="date"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #0063B2FF;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border: none;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #004b8d;
        }   
.slot-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(70px, 1fr)); /* Ensures equal spacing */
    gap: 10px; /* Space between boxes */
    justify-content: center;
    align-items: center;
    margin-top: 10px;
}

.slot-box {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 70px; /* Ensure equal width */
    height: 40px; /* Ensure equal height */
    margin: 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
    background-color: white;
    transition: background-color 0.3s, color 0.3s;
}

.slot-box input[type="checkbox"] {
    display: none; /* Hide checkbox */
}

.slot-box label {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    font-weight: bold;
    font-size: 14px;
    border-radius: 5px;
}

.slot-box input[type="checkbox"]:checked + label {
    background-color: #0063B2FF;
    color: white;
    width: 100%;
    height: 100%;
}

        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .btn-container a {
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            color: white;
            background-color: #0063B2FF;
            transition: background-color 0.3s ease;
        }
        .btn-container a:hover {
            background-color: #004b8d;
        }
    </style>
</head>
<body>

<div class="container">
 

    <h2>Generate Appointment Time Slots</h2>

    <form action="/doctor/generateAppointments/generate" method="post">
        <label>Select the date to generate appointments</label>
        <input type="date" name="DateToGenerate">
        <input type="submit" value="Generate">
    </form>

    <form action="/doctor/generateAppointments/generateCustomSlots" method="post">
        <label>Select the Date</label>
        <input type="date" name="customDate" required>
       <div class="slot-container">
    <c:forEach var="slot" items="${slots}">
        <div class="slot-box">
            <input type="checkbox" id="${slot}" name="selectedSlots" value="${slot}">
            <label for="${slot}">${slot}</label>
        </div>
    </c:forEach>
</div>

        <input type="submit" value="Generate">
    </form>
</div>

</body>
</html>
