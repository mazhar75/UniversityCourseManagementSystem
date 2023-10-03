<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Student Profile</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    

  <div class="container margin-top">
         
     <nav class="bg-light" >
          
     <div class="row">
        <div class="col-11"></div> 
        <div class="col-1"><a href="adminlogout" class="btn btn-outline-primary">Logout</a></div>
     </div>   
     
     </nav>
     <div class="row">
        <div class="col-5"></div>
        <div class="col-4">
            <figure>
							<img src="images/adminprofile.png">
			</figure>
        
        </div>
        <div class="col-3"></div>
     </div>
     <div class="row">
          <div class="col-5"></div>
        <div class="col-4">
         <h4>Name: <%=session.getAttribute("name")%></h4>    
        
        </div>
        <div class="col-3"></div>
     
     </div>
     <div class="row">
        <div class="col-5"></div>
        <div class="col-5"><a href="adminpanel.jsp" class="btn-block  btn  btn-outline-primary mb-3 btn-lg">Admin panel </a></div>
        <div class="col-2"></div>
     
     </div>
     <div class="row">
        <div class="col-5"></div>
        <div class="col-5"><a href="studentlist.jsp" class="btn-block  btn  btn-outline-primary mb-3 btn-lg">Student details</a></div>
        <div class="col-2"></div>
     
     </div>
     <div class="row">
        <div class="col-5"></div>
        <div class="col-5"><a href="teacherlist.jsp" class="btn-block  btn  btn-outline-primary mb-3 btn-lg">Teacher details</a></div>
        <div class="col-2"></div>
     
     </div>
     <div class="row">
        <div class="col-5"></div>
        <div class="col-5"><a href="courselist.jsp" class="btn-block  btn  btn-outline-primary mb-3 btn-lg">Course details</a></div>
        <div class="col-2"></div>
     
     </div>
     <div class="row">
        <div class="col-5"></div>
        <div class="col-5"><a href="InsertCourse.jsp" class="btn-block  btn  btn-outline-primary mb-3 btn-lg">Insert New Course</a></div>
        <div class="col-2"></div>
     
     </div>
     <div class="row">
        <div class="col-5"></div>
        <div class="col-5"><a href="InsertTeacher.jsp" class="btn-block  btn  btn-outline-primary mb-3 btn-lg">Register Teacher</a></div>
        <div class="col-2"></div>
     
     </div>
     
  </div>   
  
		
		
	
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	
	
</body>
</html>