<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/UpdatePatientForm.css">
<meta charset="UTF-8">
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
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 400px;
    border-radius: 8px;
}

h1 {
    text-align: center;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
    text-align: left;
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
    background-color: #004b8d;
}
</style>
<title>Update Patient</title>
</head>
<body>

    <div class="form-container">
        <h1>Update Patient</h1>
        <form:form action="${pageContext.request.contextPath}/admin/managePatients/updatePatient" method="post" modelAttribute="patient">
            <form:hidden path="patientId" />

            <div class="form-group">
                <label for="name">Name:</label>
                <form:input path="patientName" id="name" required="true" />
                <form:errors path="patientName" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="dateOfBirth">Date of Birth:</label>
                <form:input type="date" path="dateOfBirth" id="dateOfBirth" required="true" />
                <form:errors path="dateOfBirth" cssClass="error" />
            </div>

			<div class="form-group">
			    <label for="gender">Gender:</label>
			    <form:select path="gender" id="gender" required="true">
			        <form:option value="">Select Gender</form:option>
			        <form:option value="male">MALE</form:option>
			        <form:option value="female">FEMALE</form:option>
			        <form:option value="other">OTHER</form:option>
			    </form:select>
			    <form:errors path="gender" cssClass="error" />
			</div>
			
            <div class="form-group">
                <label for="contactNumber">Contact Number:</label>
                <form:input path="contactNumber" id="contactNumber" required="true" />
                <form:errors path="contactNumber" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <form:input path="address" id="address" required="true" />
                <form:errors path="address" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="medicalHistory">Medical History:</label>
                <form:textarea path="medicalHistory" id="medicalHistory" required="true"></form:textarea>
                <form:errors path="medicalHistory" cssClass="error" />
            </div>
            <button type="submit" class="submit-button">Update Patient</button>
        </form:form>
    </div>

</body>
</html>
