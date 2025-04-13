 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.DTO.Bike" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bike List</title>
    <style>
        .bike-list {
            display: flex;
            flex-wrap: wrap; /* Ensures responsiveness */
            justify-content: center; /* Centers the bikes */
            gap: 20px; /* Adds spacing between bikes */
            padding: 20px;
        }
        .bike-container {
            text-align: center;
            width: 300px; /* Fixed width for each bike */
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            background: #f9f9f9;
        }
        .bike-img {
            width: 100%;
            height: 200px;
            border-radius: 10px;
            display: block;
        }
        .bike-details {
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
        }
        .bike-button {
            margin-top: 10px;
            padding: 10px 15px;
            background: blue;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="bike-list">
<%
    List<Bike> list = (List<Bike>) session.getAttribute("bikelist");
    if (list != null) {
        for (Bike bike : list) {
%>
    <div class="bike-container">
        <img class="bike-img" src="<%= bike.getBikeUrl() %>" alt="Bike Image">
        
        <!-- Bike Details -->
        <div class="bike-details">
            <p>Model: <%= bike.getBikeModel() %></p>
            <p>CC: <%= bike.getBikeCC() %> cc</p>
            <p>Price: <%= bike.getBikePrice() %></p>
        </div>

        <!-- Buttons -->
        <form action="BikeDetails.jsp" method="post">
            <input type="hidden" name="model" value="<%= bike.getBikeModel() %>">
            <input type="hidden" name="cc" value="<%= bike.getBikeCC() %>">
            <input type="hidden" name="price" value="<%= bike.getBikePrice() %>">
            <button type="submit" class="bike-button">View Details</button>
            <button type="submit" class="bike-button">Order Bike</button>
        </form>
    </div>
<%
        }
    } else {
        out.println("<p>No bike list found in session.</p>");
    }
%>
</div>

</body>
</html>
