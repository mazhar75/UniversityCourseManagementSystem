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
<body>
   <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
   <center>
   <h1>Avialable courses</h1>
   <h3> Select the course to register</h3>
   <form action="courseregister" method="post" class="p-3 bg-light text-black">
     <div class="form-check-inline">
      <%
     String dbUrl = "jdbc:mysql://localhost:3306/university";
  	 String dbUname = "root";
  	 String dbPassword = "12345678";
  	 String dbDriver = "com.mysql.cj.jdbc.Driver"; 
  	 String sql = "select * from course where Course_id not in (select Course_id  from takes where RegNo=?)";
  	 String reg=String.valueOf(session.getAttribute("reg"));
  	 
  	 try{
  		Class.forName(dbDriver); 
		Connection con=DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		PreparedStatement pst=con.prepareStatement(sql);
		pst.setString(1,reg);
		ResultSet rs=pst.executeQuery();
		while(rs.next()){
		   String course=rs.getString("Course_id");	
		  
		  %>
		    
		    <div class="inline">
            <input  type="checkbox"  name="yes" value=<%=rs.getString("Course_id") %>>  
		    <label class="form-check-label" for="yes">
              <%=course%>
             </label>
            </div>
             
		  <%
		}
  		 
  	 }catch(Exception e){
  		 e.printStackTrace();
  	 }
       
       
      %>
    </div> 
    <div class="mb-3"> 
	<label for="reg"><i
     	class="zmdi zmdi-account material-icons-name"></i></label> <input
		type="text" name="reg" id="reg" placeholder="Your registration No." />
   </div>
    <div class="mb-3 bg-sm">
        <button class="btn-block  btn  btn-outline-primary mb-3 btn-lg">Submit</button>
    </div>
    <div class="mb-3">
         <a href="studentProfile.jsp" class="btn-block  btn  btn-outline-primary mb-3 btn-lg">Back</a>
    </div>
   </form>
   </center>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel=:stylesheet" href="alert/dist/sweetalert.css">
    
    <script type="text/javascript">
    var status=document.getElementById("status").value;
    if(status=="success"){
    	swal("Congrats","Your Courses registered succesfully!","success");
    }
    </script>   

</body>
</html>