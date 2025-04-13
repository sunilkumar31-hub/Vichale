<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bike Order Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center">Bike Order Details</h2>

		<%
		String model = (String) session.getAttribute("model");
		String cc = (String) session.getAttribute("cc");
		String price = (String) session.getAttribute("price");
		%>

		<h2>Bike Ordered</h2>
		<p>
			Model:
			<%=model%></p>
		<p>
			CC:
			<%=cc%></p>
		<p>
			Price: ₹<%= price %></p>


		<%
        String url = "jdbc:mysql://localhost:3306/vechile";
        String user = "root";
        String password = "12345";
        
        

        String panValue =(String)session.getAttribute("panValue");
        System.out.println("Received PAN: " + panValue);  // Debugging
        
        System.out.println("PAN Value Received: '" + panValue + "'");

        if (panValue != null && !panValue.trim().isEmpty()) {
        	String sql = "SELECT u.UserId, u.F_Name, u.L_Name, u.Email, u.Number, u.Aadhaar, u.Pan,o.order_id, o.user_pan, o.driving_LIC_Number, o.order_address,o.order_city, o.order_state, o.order_pin FROM userdetails u INNER JOIN orderdetails o ON u.Pan = o.user_pan WHERE u.Pan = ? ";




            System.out.println("Executing Query: " + sql);  // Debugging

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                try (Connection conn = DriverManager.getConnection(url, user, password);
                     PreparedStatement pstmt = conn.prepareStatement(sql)) {

                    pstmt.setString(1, panValue);
                    ResultSet rs = pstmt.executeQuery();

                    if (rs.next()) {  
    %>

    <table class="table table-bordered">
        <tr><th>User ID</th><td><%= rs.getInt("UserId") %></td></tr>
        <tr><th>First Name</th><td><%= rs.getString("F_Name") %></td></tr>
        <tr><th>Last Name</th><td><%= rs.getString("L_Name") %></td></tr>
        <tr><th>Email</th><td><%= rs.getString("Email") %></td></tr>
        <tr><th>Phone Number</th><td><%= rs.getString("Number") %></td></tr>
        <tr><th>Aadhaar</th><td><%= rs.getString("Aadhaar") %></td></tr>
        <tr><th>PAN Number</th><td><%= rs.getString("Pan") %></td></tr>
        <tr><th>Order ID</th><td><%= rs.getInt("order_id") %></td></tr>
        <tr><th>Driving License</th><td><%= rs.getString("driving_LIC_Number") %></td></tr>
        <tr><th>Order Address</th><td><%= rs.getString("order_address") %></td></tr>
        <tr><th>Order City</th><td><%= rs.getString("order_city") %></td></tr>
        <tr><th>Order State</th><td><%= rs.getString("order_state") %></td></tr>
        <tr><th>Order Pin</th><td><%= rs.getString("order_pin") %></td></tr>
    </table>

    <%
                    } else {
    %>
                        <p class="text-warning text-center">No order found for PAN: <%= panValue %></p>
    <%
                    }
                    rs.close();
                }
            } catch (ClassNotFoundException e) {
    %>
                <p class="text-danger text-center">Error: MySQL JDBC Driver not found.</p>
    <%
            } catch (SQLException e) {
    %>
                <p class="text-danger text-center">Database Error: <%= e.getMessage() %></p>
    <%
            } catch (Exception e) {
    %>
                <p class="text-danger text-center">Unexpected Error: <%= e.getMessage() %></p>
    <%
            }
        } else {
    %>
        <p class="text-warning text-center">Please provide a valid PAN number.</p>
    <%
        }
    %>

    <a href="home.html" class="btn btn-primary">Back to Home</a>
</div>

</body>
</html>
