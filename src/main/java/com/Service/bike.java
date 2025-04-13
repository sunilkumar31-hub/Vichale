package com.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DTO.Bike;

@WebServlet("/allbikes")
public class bike extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException {

		
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Vechile","root","12345");
			String qe="select * from bikedetails ";
			PreparedStatement ps = con.prepareStatement(qe);
			ResultSet resultSet = ps.executeQuery();
			 List<Bike> bike = new ArrayList<>();
			 
			 while(resultSet.next()) {
				 Bike b=new  Bike();
				
				 b.setBike_id(resultSet.getInt("bike_id"));
				 b.setBikeName(resultSet.getString("bikeName"));
				 b.setBikeModel(resultSet.getString("bikeModel"));
				 b.setBikeCC(resultSet.getString("bikeCC"));
				 b.setBikePrice(resultSet.getString("bikePrice"));
				 b.setBikeUrl(resultSet.getString("bikeUrl"));
				
				 bike.add(b);
			 }
			 
			 HttpSession session=req.getSession();
			 session.setAttribute("bikelist", bike);
			System.out.println(bike);
			RequestDispatcher requestDispatcher=req.getRequestDispatcher("AllBikesDetails.jsp");
			requestDispatcher.forward(req, res);
		}catch(Exception e) {
			
		}
	}
}
