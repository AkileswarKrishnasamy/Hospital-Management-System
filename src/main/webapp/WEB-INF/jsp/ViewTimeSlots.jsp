<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <title>View Slots</title>
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
        .date-box {
            background-color: #f0f8ff;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 2px 4px 12px rgba(0, 0, 0, 0.1);
        }
        .slot-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
        }
        .slot-box {
            border: 2px solid #0063B2FF;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .slot-box input[type="radio"] {
            display: none;
        }
        .slot-box label {
            display: block;
            padding: 10px 15px;
            text-align: center;
            font-weight: bold;
            color: #0063B2FF;
            border-radius: 8px;
        }
        .slot-box input[type="radio"]:checked + label {
            background-color: #0063B2FF;
            color: white;
        }
        .book-slot {
            background-color: #0063B2FF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin-top: 15px;
        }
        .book-slot:hover {
            background-color: #004b8d;
        }
        .message h1{
            color: #ff0000;
            font-size: 18px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <c:if test="${empty slotMap}">
            <div class="message">
                <h1>Sorry, no available slots for this doctor at the moment. Please check back later or choose another doctor.</h1>
            </div>
        </c:if>
        <c:if test="${not empty slotMap}">
            <h1>Available Slots</h1>
            <form method="post" action="/patient/bookAppointments/viewTimeSlots/selectSlot">
                <c:forEach var="entry" items="${slotMap}">
                    <div class="date-box">
                        <h3>Date: ${entry.key}</h3>
                        <div class="slot-container">
                            <c:forEach var="slot" items="${entry.value}">
                                <div class="slot-box">
                                    <input type="radio" id="${slot.slotId}" name="selectedSlotId" value="${slot.slotId}">
                                    <label for="${slot.slotId}">${slot.slotTime}</label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
                <button type="submit" class="book-slot">Book Slot</button>
            </form>
        </c:if>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>