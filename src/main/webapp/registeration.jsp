<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VEHICLE</title>
 <style >
 *{
 
 }
 #form1{
 margin-top:40px;
 margin-left:25px;
 text-align:center;
 width:500px;
 height:400px;
	color:white;
	background-color:rgba(225,225,225,0.1);
	border-radius: 15px ;
	box-shadow: 2px 2px 5px white;
}
#h11{

background-color: gray;

}
input{
width:200px;
background-color: black;
margin-left: 10px;
color: white;
padding: 5px;
border-radius: 10px;
}
label{
width:200px;
margin-left: 10px;
background-color: black;
color: white;
 display: inline-block;
 padding: 5px;
 border-radius: 10px;
}
#background-video{
position: fixed;
z-index: -1;
top: 0px;
left: 0px;
height: 100%;
width: 100%;
  object-fit: cover; 
}
#head{
width:100%;

background-color:rgba(225,225,225,0.1);
 display: inline-block;
}
#home{
font-size: 15px;
}
.navbar{
background: rgba(255, 255, 225,0.1);padding-left: 15px;padding-right: 15px;margin-top: 35px;
}
.navdiv{
display: flex;align-items: center;justify-content: space-between;
}
#logo{
font-size: 25px;font-weight: bold; color:white;
}

button{
background-color: black;margin-left: 10px;border-radius: 10px;padding:3px;width:90px;box-shadow: 2px 2px 1px white;
}
button a{
color:white;font-weight: bold;font-size: 15px;
}
#div2{
width:500px;
 height:200px;
 
}
#login{
margin-left: 950px;
 margin-top: -50px;
 text-align:center;
 width:500px;
 height:200px;
 color:white;
 background-color:rgba(0,0,0,0.2);
 border-radius: 15px ;
 box-shadow: -2px -2px 5px white;

}
#div3{
width: 100%;
height: 40px;
background-color:rgba(0,0,0,0);

}
#logh1{
background-color:black;
color: white;
margin-top: -250px;
margin-left: 1050px;
margin-right: 225px;
font-size: 20px;

}

 </style>
 
</head>
<body>

  <video id="background-video" autoplay muted loop>
    <source src="https://videos.pexels.com/video-files/13718948/13718948-hd_1920_1080_60fps.mp4" type="video/mp4">
  </video>
  
  <nav class="navbar">
			<div class="navdiv">
				<div id="logo">&#x1F3CD;&#x1F697; REGISTER HERE FOR VEHICLE &#x1F697;&#x1F3CD;>
				</div>
					<button><a href="home.html">HOME</a></button>
			</div>
	</nav>

	<div>
		<form id="form1" action="registration" method="post">

			 <br><label>enter your first name</label>
			<input type="text"placeholder="enter your first name" name="fname"><br> <br> <br> 
			<label>enter your last name</label>
			<input type="text"placeholder="enter your last name" name="lname"><br> <br> <br>
			
			<label>enter your emailid </label>
			<input type="email"placeholder="enter your emailid" name="email"><br> <br> <br>
			
			<label>enter your phone number</label> 			
			<input type="number"placeholder="enter your pn.no" maxlength="10" name="number"><br> <br> <br>
			<label>enter your aadhaar number</label> 
			<input type="number"placeholder="enter your aadhar number" maxlength="12" name="aadhaar"><br> <br><br> 
			<label>enter your pan number</label>
			<input type="text"placeholder="enter your pan number" name="pan"><br> <br> <br>
			<input style="background-color: black;color:white" type="submit" value="SUBMIT">

		</form>
	</div>
	
	<div id="div2">
	<form id="login" action="loginvalidation" method="post">
		<br><label>enter your registered EmailId</label>
			<input type="text"placeholder="enter your registered emailid" name="email2"><br> <br> <br> 
			<label>enter your registered number</label>
			<input type="text"placeholder="enter your registered number" name="number2"><br> <br> <br>
			<input style="background-color: black;color:white" type="submit" value="SUBMIT">
			
			
	</form>
	</div>
	<div id="div3">
	<h1 id="logh1"> &nbsp;&nbsp;&nbsp;LOG INTO ACCOUNT</h1>
	</div>
	

</body>
</html>