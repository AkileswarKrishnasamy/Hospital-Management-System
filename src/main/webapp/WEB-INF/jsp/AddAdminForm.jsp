<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #9CC3D5FF; /* Aquamarine */
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            width: 500px; /* Increased width */
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group button {
            width: 100%;
            padding: 12px;
            background-color: #0063B2FF; /* Electric Blue Lemonade */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }
        .form-group button:hover {
            background-color: #004a8d;
        }
        .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Add New Admin</h2>
        <form:form action="/admin/addAdmin/add" method="post" modelAttribute="user">
            <div class="form-group">
                <label for="userName">Username:</label>
                <form:input path="userName" id="userName" required="true" />
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
            <form:hidden path="userRole" value="ADMIN"/>
            <div class="form-group">
                <button type="submit">Add Admin</button>
            </div>
        </form:form>
    </div>

</body>
</html>
