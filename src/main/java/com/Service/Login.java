package com.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.ExpiresFilter.XHttpServletResponse;

@WebServlet("/loginvalidation")

public class Login extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException{
		
		PrintWriter wr=res.getWriter();
		
		String emailid=req.getParameter("email2");
		String phnumber=req.getParameter("number2");
		
		System.out.println(emailid+" "+phnumber);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vechile","root","12345");
			String qe="select * from userdetails where Email=? and Number=?";
			PreparedStatement ps=con.prepareStatement(qe);
			ps.setString(1,emailid);
			ps.setString(2,phnumber);
			ResultSet resultSet = ps.executeQuery();
			
			 if(resultSet.next()) {
	        	 RequestDispatcher requestDispatcher = req.getRequestDispatcher("/allbikes");
	        	 requestDispatcher.forward(req, res);
			 }else {
				 RequestDispatcher requestDispatcher = req.getRequestDispatcher("registeration.jsp");
	        	 requestDispatcher.include(req, res);
	        	// wr.println("enter valid email / number");
			 }
		}
		catch(Exception e) {
			 RequestDispatcher requestDispatcher = req.getRequestDispatcher("registeration.jsp");
        	 requestDispatcher.include(req, res);
        	// wr.println("enter valid email / number"); 
		}
	}
		
}
