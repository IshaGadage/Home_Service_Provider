<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.example.demo.bean.services"%>
<%@page import="java.util.ArrayList"%>
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

</head>

<body>
  <div class="hero_area">
    
    <%@include file="header.jsp" %>
    
  </div>

  <!-- service section -->
<% ArrayList<services> list = (ArrayList) session.getAttribute("services"); %>
  <section class="service_section layout_padding">
    <div class="container ">
      <div class="heading_container heading_center">
        <h2> Our Services </h2>
      </div>
      
    
      <div class="row">
       <% for(services s : list){ %>
        <div class="col-sm-6 col-md-4 mx-auto">
          <div class="box ">
            <div class="img-box">
              <img src="images/<%=s.getImg() %>" alt="" />
            </div>
            <div class="detail-box">
              <h5>
                <a href="#" style="color:black;" ><%=s.getService_name() %></a>
              </h5>
              <p>
              <%=s.getDescription() %>
              </p>
            </div>
             <div class="btn-box">
        <a href="service_providers?&service_name=<%=s.getService_name()%>">
          View More
        </a>
      </div>
          </div>
        </div>
        
		  <%} %>
      </div>
     
    </div>
  </section>

  <!-- end service section -->

  <%@include file="footer.jsp" %>

  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
  <!-- End Google Map -->
<script>
  document.querySelector("input[name='query']").addEventListener("keyup", function() {
    let searchText = this.value.toLowerCase();
    let services = document.querySelectorAll(".service-item");

    services.forEach(service => {
      let serviceName = service.getAttribute("data-service-name");
      if (serviceName.includes(searchText)) {
        service.style.display = "block";
      } else {
        service.style.display = "none";
      }
    });
  });
</script>

</body>

</html>