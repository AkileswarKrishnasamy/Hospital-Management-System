<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Details</title>

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
            max-width: 600px;
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
        .detail {
            margin-bottom: 15px;
            text-align: left;
            padding: 10px;
            border-radius: 8px;
            background-color: #f2f2f2;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        textarea {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            resize: vertical;
            font-size: 16px;
        }
        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #0063B2FF;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #004b8d;
        }
        .no-details {
            text-align: center;
            font-size: 18px;
            color: #ff0000;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <h2>Patient Details</h2>
    <div class="container">
        <c:choose>
            <c:when test="${empty patient}">
                <div class="no-details">
                    <p>No patient details available.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="detail">
                    <label>Name:</label>
                    <div>${patient.patientName}</div>
                </div>
                <div class="detail">
                    <label>Date of Birth:</label>
                    <div>${patient.dateOfBirth}</div>
                </div>
                <div class="detail">
                    <label>Gender:</label>
                    <div>${patient.gender}</div>
                </div>
                <div class="detail">
                    <form action="update" method="post">
                        <label>Medical History:</label>
                        <input name="appointmentId" value="${appointmentId}" type="hidden">
                        <input name="patientId" value="${patient.patientId}" type="hidden">
                        <textarea id="medicalHistory" name="medicalHistory" rows="10">${patient.medicalHistory}</textarea>
                        <input type="submit" value="Update Medical History">
                    </form>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>
