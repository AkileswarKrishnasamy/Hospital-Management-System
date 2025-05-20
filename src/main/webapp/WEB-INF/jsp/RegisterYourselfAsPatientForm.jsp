<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register as Patient</title>

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
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 50%;
            text-align: center;
        }
        h1 {
            color: #003366;
            margin-bottom: 20px;
        }
        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }
        .error {
            color: red;
            font-size: 12px;
        }
        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #0063B2FF;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }
        .btn-submit:hover {
            background-color: #004080;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h1>Register as Patient</h1>
        <form:form action="${pageContext.request.contextPath}/register/addPatient" method="post" modelAttribute="user">
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
            </div>
            <div cRlass="form-group">
                <label for="patientName">Name:</label>
                <form:input path="patient.patientName" id="patientName" required="true" />
                <form:errors path="patient.patientName" cssClass="error" />
            </div>
            <div class="form-group">
                <label for="dateOfBirth">Date of Birth:</label>
                <form:input type="date" path="patient.dateOfBirth" id="dateOfBirth" required="true" />
                <form:errors path="patient.dateOfBirth" cssClass="error" />
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <form:select path="patient.gender" id="gender" required="true">
                    <form:option value="">Select Gender</form:option>
                    <form:option value="male">MALE</form:option>
                    <form:option value="female">FEMALE</form:option>
                    <form:option value="other">OTHER</form:option>
                </form:select>
                <form:errors path="patient.gender" cssClass="error" />
            </div>
            <div class="form-group">
                <label for="contactNumber">Contact Number:</label>
                <form:input path="patient.contactNumber" id="contactNumber" required="true" />
                <form:errors path="patient.contactNumber" cssClass="error" />
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <form:input path="patient.address" id="address" required="true" />
                <form:errors path="patient.address" cssClass="error" />
            </div>
            <div class="form-group">
                <label for="medicalHistory">Medical History:</label>
                <form:textarea path="patient.medicalHistory" id="medicalHistory" required="true"></form:textarea>
                <form:errors path="patient.medicalHistory" cssClass="error" />
            </div>
            <form:hidden path="userRole" value="PATIENT" />
            <button type="submit" class="btn-submit">Register</button>
        </form:form>
    </div>

</body>
</html>
