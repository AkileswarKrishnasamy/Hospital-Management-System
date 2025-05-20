<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <title>Book Appointment</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
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
        .doctor-box {
            display: flex;
            align-items: center;
            padding: 15px;
            margin: 15px 0;
            border-radius: 12px;
            background-color: #f0f8ff;
            border-left: 6px solid #0063B2FF;
        }
        .doctor-icon {
            width: 80px;
            height: 80px;
            margin-right: 20px;
        }
        .doctor-details {
            flex: 1;
            text-align: left;
        }
        .doctor-details h2 {
            color: #004b8d;
            margin-bottom: 5px;
        }
        .doctor-details p {
            margin: 5px 0;
            color: #333;
            font-size: 14px;
        }
        .view-slots {
            display: inline-block;
            padding: 8px 12px;
            background-color: #0063B2FF;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 14px;
        }
        .view-slots:hover {
            background-color: #004b8d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Available Doctors</h1>
        <c:forEach var="doctor" items="${doctors}">
            <div class="doctor-box">
                <div class="doctor-details">
                    <h2>${doctor.doctorName}</h2>
                    <p><strong>Specialization:</strong> ${doctor.specialization}</p>
                    <p><strong>Contact Number:</strong> ${doctor.contactNumber}</p>
                    <p><strong>Availability Schedule:</strong> ${doctor.availabilitySchedule}</p>
                    <a class="view-slots" href="/patient/bookAppointments/viewTimeSlots?doctorId=${doctor.doctorId}">View Slots</a>
                </div>
            </div>
        </c:forEach>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
