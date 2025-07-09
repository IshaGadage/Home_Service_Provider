<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Inance</title>

  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!-- font awesome style -->
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

  <style>
    .contact_section {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 80vh; /* Adjust height as needed */
}

.contact_section .container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.contact_section .row {
  width: 100%;
  display: flex;
  justify-content: center;
}

.contact_section form {
  max-width: 600px;
  width: 100%;
  background: #f8f9fa;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  text-align: center;
}

.contact_section form input,
.contact_section form button {
  width: 100%;
  margin-bottom: 10px;
}

.contact_section form .d-flex {
  justify-content: center;
  display: flex;
}

  </style>

</head>

<body>
  <div class="hero_area">
   
   <%@include file="header.jsp" %>
   
  </div>
  

  <%String registers=(String)session.getAttribute("Register-Failed");
   if(registers!=null){
  
  %> 
  
  		<div class="alert alert-danger" role="alert">
 <%=registers %><a href="login">Please click to login</a>
</div>
<%}session.removeAttribute("Register-Failed"); %>



  <!-- contact section -->

  <section class="contact_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <h2>
          Registration for user
        </h2>
      </div>
      
       <div class="dropdown">
        <button class="dropdown-button">Select Option</button>
        <div class="dropdown-content">
            
            <a href="serviceproviderreg">Registration for service provider</a>
            
        </div>
    </div>
    
      <div class="row">
        <div class="col-md-6">
          <form action="user_insert">
          	
            <div>
              <input type="text" placeholder="First Name" name="fname">
            </div>
            <div>
              <input type="text" placeholder="Last Name" name="lname">
            </div>
            <div>
              <input type="email" placeholder="Email" name="email">
            </div>
            <div>
              <input type="text" placeholder="Phone Number" name="phone_no" style="color:black;">
            </div>
            <div>
              <input type="password"  placeholder="Password" name="password" style="color:black;">
            </div>
            			<%
                        LocalDate lD=LocalDate.now();
                        DateTimeFormatter df=DateTimeFormatter.ofPattern("dd-MM-yyyy");
                        String reg_date=lD.format(df);
                        
                        LocalTime lT=LocalTime.now();
                        DateTimeFormatter df1=DateTimeFormatter.ofPattern("HH:mm:ss");
                        String reg_time=lT.format(df1);
                        %>
                        <hr />
         <input type="hidden" name="reg_date" value="<%=reg_date%>">
          <input type="hidden" name="reg_time" value="<%=reg_time%>">
            <div class="d-flex ">
              <button type="submit">
                Register
              </button>
            </div>
            <p><a href="login">Login Here </a></p>
          </form>
          
        </div>
        
      </div>
    </div>
  </section>

  <!-- end contact section -->


  <%@include file="footer.jsp" %>

  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
  <!-- End Google Map -->


</body>

</html>