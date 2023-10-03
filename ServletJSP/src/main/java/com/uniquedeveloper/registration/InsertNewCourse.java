package com.uniquedeveloper.registration;

import java.io.IOException;
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
 * Servlet implementation class InsertNewCourse
 */
@WebServlet("/InsertNewCourse")
public class InsertNewCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNewCourse() {
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
		    String Course=request.getParameter("name");
		    
		    /**member1 mb=new member1(RegNo,Name,Dept_name,Email,Contact,Password);
		    
			/**RegistrationDao nb = new RegistrationDao();
			String result = nb.insert(mb);
		    
		    PrintWriter out = response.getWriter();
		    out.println(result);
		    */
		    
		     String dbUrl = "jdbc:mysql://localhost:3306/university";
			 String dbUname = "root";
			 String dbPassword = "12345678";
			 String dbDriver = "com.mysql.cj.jdbc.Driver"; 
			 String sql ="insert into course(Course_id) values(?)";
		    
		    
		   RequestDispatcher dispatcher = null;
		    Connection con = null;
		    try {
		    	Class.forName(dbDriver);
		    	con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		    	PreparedStatement pst = con.prepareStatement(sql);
		    	
		    	
		    	pst.setString(1,Course);
		    	
		    	
		    	
		    	
		    	int rowCount = pst.executeUpdate();
		    	dispatcher = request.getRequestDispatcher("InsertCourse.jsp");
		    	
		    	
		    	if(rowCount>0) {
		    		request.setAttribute("status", "success");
		    	}
		    	else {
		    		request.setAttribute("status", "failed");
		    	}
		    	
		    	dispatcher.forward(request, response);
		    
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

}
