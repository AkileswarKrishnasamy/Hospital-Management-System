<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointments Needing Medical History Update</title>
    
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
        h2 {
            color: #003366;
            margin-bottom: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
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
        .update-link {
            background-color: #0063B2FF;
            color: white;
            padding: 8px 12px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            transition: background-color 0.3s;
        }
        .update-link:hover {
            background-color: #004b8d;
        }
        .no-appointments {
            text-align: center;
            font-size: 18px;
            color: #ff0000;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <h2>Appointments Needing Medical History Update</h2>
    <div class="container">
        <c:choose>
            <c:when test="${empty appointments}">
                <div class="no-appointments">
                    <p>No appointments needing medical history update found.</p>
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>Appointment ID</th>
                            <th>Patient Name</th>
                            <th>Appointment Date</th>
                            <th>Time Slot</th>
                            <th>Gender</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="appointment" items="${appointments}">
                            <tr>
                                <td>${appointment.appointmentId}</td>
                                <td>${appointment.patient.patientName}</td>
                                <td>${appointment.appointmentDate}</td>
                                <td>${appointment.timeSlot}</td>
                                <td>${appointment.patient.gender}</td>
                                <td><a href="/doctor/updateMedicalHistory/${appointment.appointmentId}" class="update-link">Update History</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>
