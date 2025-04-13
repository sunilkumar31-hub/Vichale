package com.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/registration")
public class Registration  extends HttpServlet{
	
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException {
		
		PrintWriter wr=res.getWriter();
		
		String fname=req.getParameter("fname");
		if(fname.charAt(0)>='A' && fname.charAt(0)<='Z') {
			wr.println("valid fname");
		
		String lname=req.getParameter("lname");
		if(lname.charAt(0)>='A' && lname.charAt(0)<='Z') {
			wr.println("valid lname");
		
		String email=req.getParameter("email");
		long number=Long.parseLong(req.getParameter("number"));
		if(number>6000000000l && number<9999999999l) {
			wr.println("valid PH:number");
		
		long aadhaar=Long.parseLong(req.getParameter("aadhaar"));
		if(aadhaar>100000000000l && number<999999999999l) {
			wr.println("valid aadhaar number");
		
		String pan=req.getParameter("pan"); 
		
		  String panPattern = "^[A-Z]{5}[0-9]{4}[A-Z]{1}$";
	        
	        Pattern pattern = Pattern.compile(panPattern);
	        
	        Matcher matcher = pattern.matcher(pan);
	        
	        if (matcher.matches()) {
	            wr.println("valid pan");
	        

		System.out.println(fname+" "+lname+" "+email+" "+number+" "+aadhaar+"  "+pan);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vechile","root","12345");
			String qe="insert into userdetails(F_Name,L_Name,Email,Number,Aadhaar,Pan) values(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(qe);
			ps.setString(1,fname);
			ps.setString(2,lname);
			ps.setString(3,email);
			ps.setLong(4,number);
			ps.setLong(5,aadhaar);
			ps.setString(6,pan);
			
			int result = ps.executeUpdate();
			
			if(result>0) {
				 RequestDispatcher requestDispatcher = req.getRequestDispatcher("home.html");
	        	 requestDispatcher.forward(req, res);
			//	wr.println("<h1>data inserted</h1>");
			}
			else {
				 RequestDispatcher requestDispatcher = req.getRequestDispatcher("registeration.jsp");
	        	 requestDispatcher.include(req, res);
			//	wr.println("<h1>data not inserted</h1>");
			}
		}catch(Exception e) {
			wr.println("<h1>data not inserted</h1>");
			 e.printStackTrace();
		}
	        } else {
	        	 wr.println("invalid pan enter valid PAN ID");
	        }
		}
		else {
			wr.println("invalid aadhaarnumber  enter valid aaadhaar number");
		}
		}
		else {
			wr.println("invalid PH:number  enter valid PH:number");
		}
		}
		else {
			wr.println("invalid lname");
		}
		}
		else {
			wr.println("invalid fname");
		}
		
}
}
