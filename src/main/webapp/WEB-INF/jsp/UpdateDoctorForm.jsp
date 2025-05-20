<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Doctor</title>
    <link rel="stylesheet" type="text/css" href="/css/UpdateDoctorForm.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #9CC3D5FF;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: white;
            padding: 30px;
            padding-right:50px;
            width: 500px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-group textarea {
            resize: none;
            height: 80px;
        }

        .error {
            color: red;
            font-size: 12px;
        }

        .submit-button {
            width: 100%;
            padding: 10px;
            background-color: #0063B2FF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        .submit-button:hover {
            background-color: #004b8d;
        }

        .btn-back {
            display: inline-block;
            padding: 10px 15px;
            background-color: #555;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
            margin-bottom: 15px;
        }

        .btn-back:hover {
            background-color: #444;
        }

        .logout-container {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .logout-container .btn-logout {
            background-color: #d9534f;
            padding: 10px 15px;
            text-decoration: none;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .logout-container .btn-logout:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>



<div class="form-container">

    <h1>Update Doctor</h1>
    <form:form action="${pageContext.request.contextPath}/admin/manageDoctors/updateDoctor" method="post" modelAttribute="doctor">
        <form:hidden path="doctorId" />

        <div class="form-group">
            <label for="doctorName">Doctor Name:</label>
            <form:input path="doctorName" id="doctorName" required="true" maxlength="100" />
            <form:errors path="doctorName" cssClass="error" />
        </div>

        <div class="form-group">
            <label for="specialization">Specialization:</label>
            <form:input path="specialization" id="specialization" required="true" maxlength="100" />
            <form:errors path="specialization" cssClass="error" />
        </div>

        <div class="form-group">
            <label for="contactNumber">Contact Number:</label>
            <form:input path="contactNumber" id="contactNumber" required="true" maxlength="15" />
            <form:errors path="contactNumber" cssClass="error" />
        </div>

        <div class="form-group">
            <label for="availabilitySchedule">Availability Schedule:</label>
            <form:textarea path="availabilitySchedule" id="availabilitySchedule" required="true" maxlength="2000"></form:textarea>
            <form:errors path="availabilitySchedule" cssClass="error" />
        </div>

        <button type="submit" class="submit-button">Update Doctor</button>
    </form:form>
</div>

</body>
</html>
