<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.demo.bean.serviceprovider_register"%>
<%@page import="java.util.ArrayList"%>
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


  <!-- contact section -->

  <section class="contact_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <h2>
         Book your service
        </h2>
      </div>
       <% serviceprovider_register a1=(serviceprovider_register)session.getAttribute("servicedata"); %>
       <div class="dropdown">
        
        <div class="dropdown-content">
            
            <a href="register">Registration for user</a>
            
        </div>
    </div>
     
      <div class="row">
        <div class="col-md-6">
          <form action="book_service">
          	
            <div>
              <input type="text" placeholder="Name" name="name">
            </div>
           
            <%if(session.getAttribute("email")!=null){ %>
              <input type="hidden" placeholder="Email" name="email" value="<%=session.getAttribute("email")%>">
           <%} %>
           
            <div>
              <input type="text" placeholder="Phone Number" name="phone_no" style="color:black;">
            </div>	
           	 <div>
             
             <input type="hidden" name="s_id" value="<%=a1.getS_id() %>">
             
             <%
                        LocalDate lD=LocalDate.now();
                        DateTimeFormatter df=DateTimeFormatter.ofPattern("dd-MM-yyyy");
                        String booking_date=lD.format(df);
                        
                        LocalTime lT=LocalTime.now();
                        DateTimeFormatter df1=DateTimeFormatter.ofPattern("HH:mm:ss");
                        String booking_time=lT.format(df1);
                        %>
                        <hr />
         <input type="hidden" name="booking_date" value="<%=booking_date%>">
          <input type="hidden" name="booking_time" value="<%=booking_time%>">
              
             <label for="options">Which service to provide:</label>
    			<input name="service"  value="<%=a1.getService()%>" style="color:black;" readonly>
            </div>
             <div>
             <label for="options">Service Provider Name:</label>
              <input name="service_provider"  value="<%=a1.getFname()%> <%=a1.getLname() %>" style="color:black;" readonly >
             </div>
             <input name="serviceprovider_email"  value="<%=a1.getEmail()%>" type="hidden">
             <div>
             <label for="options">Service Provider Price (Rs) :</label>
              <input  name="price" value="<%=a1.getPrice() %>" style="color:black;" readonly>
            </div>
            <div>
            <label for="datetime">Select Date and Time:</label>
              <input type="datetime-local" placeholder="Time and date" name="datetime_service" style="color:black;">
            </div>
             <div>
              <input type="text" placeholder="Address" name="address" style="color:black; height: 122px ;">
            </div>
            
            
             <% if(session.getAttribute("login name")!= null){ %>
            <div class="d-flex ">
              <button type="submit">
               Book Now & Pay
              </button>
            </div>
            <% } 
			else { %>
				
				<p><a href="login">Please Login first!! </a></p>
			
			<%} 
             
          	
          	%>
           
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