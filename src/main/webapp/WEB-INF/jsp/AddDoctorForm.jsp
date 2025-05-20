<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Doctor</title>
    <link rel="stylesheet" type="text/css" href="/css/AddDoctorForm.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #9CC3D5FF;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 25px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 450px;
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .submit-button {
            width: 100%;
            padding: 10px;
            background-color: #0063B2FF;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .submit-button:hover {
            background-color: #004a8d;
        }

        .error {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h1>Add New Doctor</h1>
        <form:form action="${pageContext.request.contextPath}/admin/manageDoctors/addDoctor/validateNewDoctor" method="post" modelAttribute="user">
            <div class="form-group">
                <label for="username">Username:</label>
                <form:input path="userName" id="username" required="true" />
                <form:errors path="userName" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <form:input path="email" id="email" required="true" />
                <form:errors path="email" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <form:password path="password" id="password" required="true" />
                <form:errors path="password" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <form:password path="confirmPassword" id="confirmPassword" required="true" />
                <form:errors path="confirmPassword" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="doctorName">Name:</label>
                <form:input path="doctor.doctorName" id="doctorName" required="true" />
                <form:errors path="doctor.doctorName" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="specialization">Specialization:</label>
                <form:input path="doctor.specialization" id="specialization" required="true" />
                <form:errors path="doctor.specialization" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="contactNumber">Contact Number:</label>
                <form:input path="doctor.contactNumber" id="contactNumber" required="true" />
                <form:errors path="doctor.contactNumber" cssClass="error" />
            </div>

            <div class="form-group">
                <label>Availability Schedule:</label>
                <div>
                    <label>Start time:</label>
                    <input type="time" id="startTime" name="startTime" min="08:00" max="22:00" step="3600" required="true" />
                    <label>End time:</label>
                    <input type="time" id="endTime" name="endTime" min="08:00" max="22:00" step="3600" required="true" />
                </div>
                <form:errors path="doctor.availabilitySchedule" cssClass="error" />
            </div>

            <form:hidden path="userRole" value="DOCTOR" />
            <button type="submit" class="submit-button">Add Doctor</button>
        </form:form>
    </div>

</body>
</html>
