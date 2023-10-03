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
    <h1>Here is your courses</h1>
    <table class="table table-bordered table-striped table-light text-center">
    <thead>
    <tr>
      <th>Course Name</th>
    </tr> 
    </thead>
    <%
     String dbUrl = "jdbc:mysql://localhost:3306/university";
	 String dbUname = "root";
	 String dbPassword = "12345678";
	 String dbDriver = "com.mysql.cj.jdbc.Driver"; 
	 String sql = "select Course_id from section where section.ID=?";
	 
	 String id=String.valueOf(session.getAttribute("id"));

	 
	 
	 
	 
	 try{
		Class.forName(dbDriver); 
		Connection con=DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		PreparedStatement pst=con.prepareStatement(sql);
		pst.setString(1,id);
		ResultSet rs=pst.executeQuery();
		while(rs.next()){
	     %>
	     <tbody>
	     <tr>
	        <td><%=rs.getString("Course_id") %></td>
	        
	     </tr>
	     </tbody>
	     <%
		}
		
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 
    %>
    </table>
  <form action="SpecificCourseWiseStudentList.jsp" method="POST" >
  <div class="form-row">
      
      <input type="text" class="form-control" name="course_id" placeholder="Enter the Course Name"/>
     
    
  </div>
  <div class="form-row">
       
         <button type="submit" class="btn-block  btn  btn-outline-primary mb-3 btn-lg">Get registered student's list</button>
       
  </div>
</form>
    </center>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    
</body>
</html>