<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="p-5">
    <center>
    <h1>Teacher's data</h1>
    <table class="table table-bordered table-striped table-light text-center">
    <thead>
    <tr>
      <th>Name</th>
      <th>ID</th>
      <th>Department</th>
      <th>Email</th>
      <th>Contact</th>
    </tr> 
    </thead>
    <%
     String dbUrl = "jdbc:mysql://localhost:3306/university";
	 String dbUname = "root";
	 String dbPassword = "12345678";
	 String dbDriver = "com.mysql.cj.jdbc.Driver"; 
	 String sql = "select Name,ID,Dept_name,Email,Contact from instructor";
	 
	

	 
	 
	 
	 
	 try{
		Class.forName(dbDriver); 
		Connection con=DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		PreparedStatement pst=con.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		while(rs.next()){
	     %>
	     <tbody>
	     <tr>
	        <td><%=rs.getString("Name") %></td>
	        <td><%=rs.getString("ID") %></td>
	        <td><%=rs.getString("Dept_name") %></td>
	        <td><%=rs.getString("Email") %></td>
	        <td><%=rs.getString("Contact") %></td>
	        
	     </tr>
	     </tbody>
	     <%
		}
		
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 
    %>
    </table>
    </center>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    
</body>
</html>