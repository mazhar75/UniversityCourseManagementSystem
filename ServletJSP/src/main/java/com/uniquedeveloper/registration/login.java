package com.uniquedeveloper.registration;

import java.io.IOException;

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		String email=request.getParameter("username");
		String pwd=request.getParameter("password");
		
		 String dbUrl = "jdbc:mysql://localhost:3306/university";
		 String dbUname = "root";
		 String dbPassword = "12345678";
		 String dbDriver = "com.mysql.cj.jdbc.Driver"; 
		 String sql ="select * from student where Email=? and Password=?";
		 HttpSession session =request.getSession();
		 RequestDispatcher dispatcher=null;
		 								
		try {
			Class.forName(dbDriver);
			Connection con=DriverManager.getConnection(dbUrl,dbUname,dbPassword);
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pwd);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				session.setAttribute("name",rs.getString("Name"));
				session.setAttribute("reg", rs.getString("RegNo"));
				session.setAttribute("dpt", rs.getString("Dept_name"));
				session.setAttribute("email", rs.getString("Email"));
				session.setAttribute("phone", rs.getString("Contact"));
				dispatcher=request.getRequestDispatcher("studentProfile.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("login.jsp");
				
			}
			dispatcher.forward(request,response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
