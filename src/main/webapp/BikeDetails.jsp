<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bike Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
    <style> 
  
   /* Main Container */
.container {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    flex-wrap: wrap;
    padding: 50px;
    gap: 20px;
}

/* Bike Details Container */
.bike-container {
    flex: 1;
    max-width: 45%;
    text-align: center;
    background: lightgreen;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.bike-details p {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
}

.bike-button {
    display: inline-block;
    margin-top: 15px;
    padding: 10px 20px;
    background: gray;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    transition: 0.3s ease-in-out;
}

.bike-button:hover {
    background: red;
}

/* Form Container */
.form-container {
    flex: 1;
    max-width: 50%;
    background: skyblue;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.form-label {
    font-weight: bold;
}

.btn-primary {
    width: 100%;
    font-size: 16px;
}

/* Responsive Design */
@media (max-width: 992px) {
    .container {
        flex-direction: column;
        align-items: center;
        text-align: center;
    }

    .bike-container, .form-container {
        max-width: 100%;
    }
}

    </style>
</head>
<body>

<%
    String model = request.getParameter("model") != null ? request.getParameter("model") : "Unknown Model";
    String cc = request.getParameter("cc") != null ? request.getParameter("cc") : "N/A";
    String price = request.getParameter("price") != null ? request.getParameter("price") : "N/A";
%>
<div class="container">
    <div class="bike-container">
        <!-- Bike Details -->
        <div class="bike-details">
            <p>Model: <%= model %></p>
            <p>CC: <%= cc %> cc</p>
            <p>Price: ₹<%= price %></p>
        </div>
		
		<%
		    session.setAttribute("model", model);
		    session.setAttribute("cc", cc);
		    session.setAttribute("price", price);
		%>
		
		
        <!-- Back Button -->
        <a href="AllBikesDetails.jsp" class="bike-button">Back to List</a>
    </div>

    <div class="form-container">
        <!-- Bootstrap Form -->
        <form class="row g-3" action="order" method="post" enctype="multipart/form-data">
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label">PAN CARD NUMBER</label>
                <input type="text" class="form-control" id="inputEmail4" name="pannumber">
            </div>
            <div class="col-md-6">
                <label for="inputPassword4" class="form-label">DRIVING LICENCE NUMBER</label>
                <input type="text" class="form-control" id="inputPassword4" name="drnumber">
            </div>
            <div class="col-md-6">
                <label for="inputPassword4" class="form-label">PAN CARD</label>
                <input type="file" class="form-control" id="inputPassword4" name="pancard" >
            </div>
             <div class="col-md-6">
                <label for="inputPassword4" class="form-label">DRIVING LICENCE</label>
                <input type="file" class="form-control" id="inputPassword4" name="drivinglicence" >
            </div>
            <div class="col-12">
                <label for="inputAddress" class="form-label">Address</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="address of present located" name="address">
            </div>
            <div class="col-md-6">
                <label for="inputCity" class="form-label">City</label>
                <input type="text" class="form-control" id="inputCity" name="city">
            </div>
            <div class="col-md-4">
                <label for="inputState" class="form-label">State</label>
                <select id="inputState" class="form-select" name="state">
                    <option selected>Choose...</option>
                    <option>Andhra Pradesh</option>
                    <option>Arunachal Pradesh</option>
                    <option>Assam</option>
                    <option>Bihar</option>
                    <option>Chatishgar</option>
                    <option>Goa</option>
                    <option>Gujarat</option>
                    <option>Harayana</option>
                    <option>Himachal Pradesh</option>
                    <option>Jarkand</option>
                    <option>Karnataka</option>
                    <option>Kerla</option>
                    <option>Madhya Pradesh</option>
                    <option>Maharastra</option>
                    <option>Mainpur</option>
                    <option>Meghalaya</option>
                    <option>Mizorem</option>
                    <option>Nagaland</option>
                    <option>Odisha</option>
                    <option>Punjab</option>
                    <option>Rajasthan</option>
                    <option>Sikkim</option>
                    <option>Tamil Nadu</option>
                    <option>Telangana</option>
                    <option>Tripura</option>
                    <option>Utter Pradesh</option>
                    <option>Uttrakhand</option>
                    <option>West Bangal</option>
                    
                    
                </select>
            </div>
            <div class="col-md-2">
                <label for="inputZip" class="form-label">PinCode</label>
                <input type="text" class="form-control" id="inputZip" name="pin">
            </div>
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="gridCheck">
                    <label class="form-check-label" for="gridCheck">
                        Check me out
                    </label>
                </div>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Order Bike</button>
            </div>
        </form>
    </div>
</div>


</body>
</html>
