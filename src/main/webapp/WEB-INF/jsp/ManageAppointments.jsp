<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointments</title>
    <link rel="stylesheet" type="text/css" href="/css/ManageAppointments.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #9CC3D5FF;
            margin: 0;
            padding: 20px;
        }
        h2 {
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
        .logout-container {
            position: absolute;
            top: 10px;
            right: 10px;
        }
    </style>
</head>
<body>



<h2>Appointments</h2>

<table>
    <thead>
        <tr>
            <th>Appointment ID</th>
            <th>Appointment Date</th>
            <th>Time Slot</th>
            <th>Patient Name</th>
            <th>Patient Contact Number</th>
            <th>Doctor Name</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="appointment" items="${appointments}">
            <tr>
                <td><c:out value="${appointment.appointmentId}"/></td>
                <td><c:out value="${appointment.appointmentDate}"/></td>
                <td><c:out value="${appointment.timeSlot}"/></td>
                <td><c:out value="${appointment.patient.patientName}"/></td>
                <td><c:out value="${appointment.patient.contactNumber}"/></td>
                <td><c:out value="${appointment.doctor.doctorName}"/></td>
                <td><c:out value="${appointment.status}"/></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>