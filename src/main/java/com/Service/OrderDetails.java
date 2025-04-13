package com.Service;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@WebServlet("/order")

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10, // 10MB
    maxRequestSize = 1024 * 1024 * 50 // 50MB
    )
public class OrderDetails extends HttpServlet {

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException {
		
		PrintWriter writer=res.getWriter();
		
	
		 String pan=req.getParameter("pannumber");
					  String panPattern = "^[A-Z]{5}[0-9]{4}[A-Z]{1}$";
				        Pattern pattern = Pattern.compile(panPattern);
				        Matcher matcher = pattern.matcher(pan);
				        if (matcher.matches()) {
				            writer.println("valid pan");
		 
		 String dr=req.getParameter("drnumber");
							 if (dr == null || dr.isEmpty()) {
								    writer.println("Driving License Number cannot be empty.");
								    return;
								}
								String regex = "^[A-Z]{2}\\d{14}$"; 
								if (!dr.matches(regex)) {
								    writer.println("Invalid Driving License Number format. It should be two letters followed by 14 digits (e.g., AP13020250000473).");
								    return;
								}

		 Part filePan = req.getPart("pancard");
		 Part fileDr = req.getPart("drivinglicence");
		 String orderaddress=req.getParameter("address");
		 String ordercity=req.getParameter("city");
		 String orderstate=req.getParameter("state");
		 long orderpin=Long.parseLong(req.getParameter("pin"));
		 								if(orderpin>100000l && orderpin<=999999l) {
		 
		 if (filePan.getSize() == 0 || fileDr.getSize() == 0) {
	            writer.println("File upload failed! Please upload valid files.");
	            return;
	        }else {

		try  (InputStream panStream = filePan.getInputStream();
	             InputStream drStream = fileDr.getInputStream())
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vechile","root","12345");
	
				String insert="insert into orderdetails(user_pan, driving_LIC_Number, order_pan, order_licence, order_address, order_city, order_state, order_pin) values(?,?,?,?,?,?,?,?)";
				PreparedStatement statement=con.prepareStatement(insert);
				
						statement.setString(1, pan);
						statement.setString(2, dr);
			            statement.setBlob(3, panStream);
			            statement.setBlob(4, drStream);
						statement.setString(5, orderaddress);
						statement.setString(6, ordercity);
						statement.setString(7, orderstate);
						statement.setLong(8, orderpin);
						
						int result=statement.executeUpdate();
						if(result>0) {
							HttpSession session =req.getSession();
							session.setAttribute("panValue", pan);
							RequestDispatcher dispatcher=req.getRequestDispatcher("Success.jsp");
							dispatcher.forward(req, res);
							System.out.println("order details inserted");
							 writer.println("order details inserted");
						}
						else {
							RequestDispatcher requestDispatcher = req.getRequestDispatcher("BikeDetails.jsp");
				        	 requestDispatcher.include(req, res);
				        	 writer.println("order details not inserted");
						}
					
						
					}catch (Exception e) {
						RequestDispatcher requestDispatcher = req.getRequestDispatcher("BikeDetails.jsp");
				     	requestDispatcher.include(req, res);
				      	writer.println("order details not inserted");
					}
	        	}
		 			}	
		 				else {
				        	 writer.println("invalid pin code enter valid pin code");
	 					    }
		 
	        }	
			else {
		         writer.println("invalid pan enter valid PAN ID");
	        	}
	}	
	
}
