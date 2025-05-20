<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Doctors</title>
    <link rel="stylesheet" type="text/css" href="/css/ManageDoctors.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #9CC3D5FF;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .container {
            width: 80%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
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

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .btn {
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            color: white;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .btn-add {
            background-color: #0063B2FF;
        }

        .btn-add:hover {
            background-color: #004b8d;
        }

        .btn-edit {
            background-color: #0063B2FF;
        }

        .btn-edit:hover {
            background-color: #004b8d;
        }

        .btn-delete {
            background-color: #d9534f;
        }

        .btn-delete:hover {
            background-color: #c9302c;
        }

        .btn-back {
            background-color: #555;
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
        }

        .logout-container .btn-logout:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>



<div class="container">
    <div class="button-container">
        <a href="${pageContext.request.contextPath}/admin/manageDoctors/addDoctor" class="btn btn-add">Add New Doctor</a>
    </div>

    <h1>List of Doctors</h1>

    <c:if test="${empty doctors}">
        <p style="text-align: center; color: #777;">No doctors found.</p>
    </c:if>

    <c:if test="${not empty doctors}">
        <table>
            <thead>
                <tr>
                    <th>Doctor ID</th>
                    <th>Doctor Name</th>
                    <th>Specialization</th>
                    <th>Contact Number</th>
                    <th>Availability Schedule</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="doctor" items="${doctors}">
                    <tr>
                        <td>${doctor.doctorId}</td>
                        <td>${doctor.doctorName}</td>
                        <td>${doctor.specialization}</td>
                        <td>${doctor.contactNumber}</td>
                        <td>${doctor.availabilitySchedule}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/manageDoctors/updateDoctor/${doctor.doctorId}" class="btn btn-edit">Edit</a>
                            <a href="${pageContext.request.contextPath}/admin/manageDoctors/deleteDoctor/${doctor.doctorId}" class="btn btn-delete" 
                               onclick="return confirm('Are you sure you want to delete this doctor?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

</body>
</html>
