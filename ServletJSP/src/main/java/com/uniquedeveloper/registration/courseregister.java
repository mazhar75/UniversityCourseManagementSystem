package com.uniquedeveloper.registration;

import java.io.IOException;



import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class courseregister
 */
@WebServlet("/courseregister")
public class courseregister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public courseregister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String[] course=request.getParameterValues("yes");
		    String reg=request.getParameter("reg");
		    /**PrintWriter out = response.getWriter();
		    out.println(reg);
		    for(int i=0;i<course.length;i++) {
		    	out.print(course[i]);
		    	out.print(" ");
		    }
		    */
		    
		    
		     String dbUrl = "jdbc:mysql://localhost:3306/university";
			 String dbUname = "root";
			 String dbPassword = "12345678";
			 String dbDriver = "com.mysql.cj.jdbc.Driver"; 
			 String sql ="insert into takes(RegNo,Course_id) values(?,?)";
			 RequestDispatcher dispatcher = null;
			 int update=0;
		        for(int i=0;i<course.length;i++) {
			    
			    Connection con = null;
			    try {
			    	Class.forName(dbDriver);
			    	con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
			    	PreparedStatement pst = con.prepareStatement(sql);
			    	
			    	
			    	pst.setString(1, reg);
			    	pst.setString(2, course[i]);
			    
			    	
			    	
			    	
			    	int rowCount = pst.executeUpdate();
			    	
			    	
			    	
			    	if(rowCount>0) {
			    		update++;
			    	}
			    	
			    	
			    	
			    
			    }catch(Exception e) {
			    	e.printStackTrace();
			    }finally {
			    	try {
			    		con.close();
			    	}catch(SQLException e) {
			    		e.printStackTrace();
			    	}
			    }
		   }
		   dispatcher = request.getRequestDispatcher("NewCourseRegistration.jsp");     
		   if(course.length==update) {
			   request.setAttribute("status", "success");
		   }
		   else {
			   request.setAttribute("status", "failed");
		   }
		   dispatcher.forward(request, response);
		  
	}

}
