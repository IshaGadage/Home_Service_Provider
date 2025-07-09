<%@page import="com.example.demo.bean.serviceprovider_register"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  <section class="service_section layout_padding">
    <div class="container ">
      <div class="heading_container heading_center">
        <h2>Services</h2>
      </div>
        <div class="search-bar text-center mb-4">
    <form action="service_providers" method="GET">
      <input type="text" name="query" class="form-control" placeholder="Search City..." style="width: 50%; display: inline-block;">
      <input type="hidden" name="service_name" value="<%=request.getParameter("service_name")%>">
      <button type="submit" class="btn btn-primary">Search</button>
    </form>
  </div>
      <div class="row">
      
     <%ArrayList<serviceprovider_register> list=(ArrayList)session.getAttribute("showdata");%>
                    <% for(serviceprovider_register spr :list){
                    	
                    	if(request.getParameter("query")==null || request.getParameter("query").isEmpty()){
                    	%>
        <div class="col-sm-6 col-md-4 mx-auto">
          <div class="box ">
            <div class="img-box">
               <img src="images/profile.png"alt="" />
            </div>
            <div class="detail-box">
            	
            	<h5>
	                <a href="maintenance" style="color:black;"><%=spr.getService() %></a>
	              </h5><br>
            
	              <h5>
	                <a href="maintenance" style="color:black;"><%=spr.getFname() %>  <%=spr.getLname() %></a>
	              </h5><br>
	              <h5>
                    Rs.<%=spr.getPrice() %>
                </h5>
             <br>
              <div class="product-review">
                <%int rating=spr.getRating();
              
              for(int i=1;i<=5;i++){
               if(i<=rating){%>
               
                <i class="font-13 fa fa-star"></i>
                <%}else{ %>
                <i class="font-13 fa fa-star-o"></i>
                <%} }%>
            </div>
              <p>
               <%=spr.getDescription() %>
              </p>
               <div class="btn-box">
                <a href=" booking?price=<%=spr.getPrice()%>&service=<%=spr.getService()%>&fname=<%= spr.getFname() %>&s_id=<%=spr.getS_id()%>">
                  Take Service
                </a>
              </div>
            </div>
          </div>
        </div>
        <%}else if(spr.getCity().equalsIgnoreCase(request.getParameter("query"))){%>
         <div class="col-sm-6 col-md-4 mx-auto">
          <div class="box ">
            <div class="img-box">
               <img src="images/profile.png"alt="" />
            </div>
            <div class="detail-box">
            	
            	<h5>
	                <a href="maintenance" style="color:black;"><%=spr.getService() %></a>
	              </h5><br>
            
	              <h5>
	                <a href="maintenance" style="color:black;"><%=spr.getFname() %>  <%=spr.getLname() %></a>
	              </h5><br>
	              <h5>
                    Rs.<%=spr.getPrice() %>
                </h5>
             <br>
              <div class="product-review">
              <%int rating=5;
              
              for(int i=1;i<=5;i++){
               if(i<=rating){%>
               <%=spr.getRating() %>
                <i class="font-13 fa fa-star"></i>
                <%}else{ %>
                <i class="font-13 fa fa-star-o"></i>
                <%} }%>
            </div>
              <p>
               <%=spr.getDescription() %>
              </p>
               <div class="btn-box">
                <a href=" booking?price=<%=spr.getPrice()%>&service=<%=spr.getService()%>&fname=<%= spr.getFname() %>&s_id=<%=spr.getS_id()%>">
                  Take Service
                </a>
              </div>
            </div>
          </div>
        </div>
        <%}} %>
       
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
<!-- <script>
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
</script> -->

</body>

</html>