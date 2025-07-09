<!DOCTYPE html>
<%@page import="com.example.demo.bean.booking_list"%>
<%@page import="java.util.ArrayList"%>
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
    /* Table Styles */
    .table-container {
      margin-top: 30px;
      padding-bottom: 40px;
      text-align: center; /* Center align the entire container */
    }

    .table-container h2 {
      margin-bottom: 30px; /* Space below the header */
    }

    .table {
      width: 80%; /* Adjusted width to 80% of the parent container */
      margin: 0 auto; /* Centering the table */
      border-collapse: collapse;
      border-radius: 8px;
      overflow: hidden;
    }

    .table th,
    .table td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    .table th {
      background-color: #34495e;
      color: white;
      font-size: 18px;
    }

    .table td {
      font-size: 16px;
    }

    .table tbody tr:hover {
      background-color: #f1f1f1;
    }

    .table .actions button {
      background-color: #1abc9c;
      color: white;
      border: none;
      padding: 5px 15px;
      font-size: 14px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    
    button{
     background-color: #1abc9c;
      color: white;
      border: none;
      padding: 5px 15px;
      font-size: 14px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .table .actions button:hover {
      background-color: #16a085;
    }

    /* For the product images (background images inside the table cells) */
    .table td img {
      width: 100%; /* Ensure the image takes up the full width */
      height: 150px; /* Set the height to match the table row */
      object-fit: cover; /* Make the image cover the area without distortion */
      border-radius: 4px;
    }

    /* Image cells: adjust size and make sure they fit properly */
    .table td[style*="background-image"] {
      background-size: cover;
      background-position: center;
      width: 100px; /* Adjust as per your layout needs */
      height: 150px; /* Maintain a fixed height for consistency */
    }
    /* Modal Styles */
    .modal {
      display: none; /* Hidden by default */
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.4);
      overflow: auto;
    }

    .modal-content {
      background-color: white;
      margin: 15% auto;
      padding: 20px;
      border-radius: 8px;
      width: 25%;
    height: 231px;
    justify-content: center;
    align-items: center;
}
    }

    .star {
      font-size: 30px;
      cursor: pointer;
    }
    
    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .star-rating{
     display:flex;
     flex-direction:row-reverse;
     justify-content:center;
   }
   .star-rating input{
    display:none;
    
   }
   .star-rating label{
     font-size:30px;
     color:grey;
     cursor:pointer;
   }
   .star-rating input:checked~label{
     color:gold;
   }
  </style>
</head>

<body>
  <div class="hero_area">

    <%@include file="header.jsp" %>

  </div>

  <div class="table-container">
    <h2>Your Services</h2> <!-- Add a header for the table -->

    <table class="table" style="width:80%!important">
      <thead>
        <tr>
          
          <th>Service Name</th>
          <th>Service Provider Name</th>
          <th>Booking Date</th>
          <th>Booking Time</th>
          <th>Status</th>
          
          
          <th>Rating</th>
          
          
        </tr>
      </thead>
      <tbody>
    <% ArrayList<booking_list> list = (ArrayList) session.getAttribute("bookinglist");
    		
    		if(session.getAttribute("login name")!=null){
    		
    		%>
        <!-- Example of a product row -->
        
        <%for(booking_list b:list){
        	if(b.getEmail().equals(session.getAttribute("email"))){
        	%>
        
        <tr>
         
          <td><%=b.getService() %></td>
          <td><%=b.getService_provider() %></td>
          <td><%=b.getBooking_date() %></td>
          <td><%=b.getBooking_time() %></td>
          <input type="hidden" value="<%=b.getB_id() %>" id="id">
         <%if(b.getStatus()==null) {%>
          
          <td>In process</td>
          <%}else{ %>
           <td><%=b.getStatus() %></td>
          <%} %>
            <td>
                    <%
                    int st=b.getStarRating();
                   
                    if(st==0){
                    for(int i=1;i<=5;i++){
                    %>
                    <span class="star" style="color:black;font-size:20px" >&#9733;</span>
                    <%} %>
                    	<button onclick="showRatingPopup(this)">Give Feedback</button>
                  <%}else{   
                    for(int i=1;i<=5;i++){ 
                    if(i<=st){
                    %>
                        <span class="star" style="color: gold; font-size: 20px">&#9733;</span>
                  <%}else{
                	  %>
                	  
                	  <span class="star" style="color:black;font-size:20px" >&#9733;</span>
                <%   }}
                    
                  %>
                 <button onclick="showRatingPopup(this)">Update Feedback</button>
                  
                  <%} %>
                
                
                
                </td>
        </tr>
        <%}}} %>
        
        <!-- Add more product rows here -->

      </tbody>
    </table>
  </div>
  <script>
  
  function showRatingPopup(button) {
	    var row = button.closest('tr'); 
	    var id = row.querySelector('input[type="hidden"]').value; 
	    
	    document.getElementById('idSet').value = id; 
	    document.getElementById('ratingModal').style.display = 'block'; 
	}

	// Close the Rating Popup
	function closeRatingPopup() {
	    document.getElementById('ratingModal').style.display = 'none';
	}

    </script>
<div id="ratingModal" class="modal">
    <div class="modal-content" style="width: 500px;
    height: 351px;
    text-align: center;">
        <form action="starUpdate" method="post">
            <h3>Rate This Service</h3>
            <input type="hidden" id="idSet" name="b_id">
            
            <!-- Name Field -->
            <input type="text" name="name" value="<%= session.getAttribute("login name") %>" class="form-control" readonly>
            
            <!-- Email Field -->
            <input type="email"style=" margin-top: 5px;" name="email" value="<%= session.getAttribute("email") %>" class="form-control" readonly>

            <!-- Star Rating -->
            <div class="star-rating">
                <input type="radio" value="5" id="5-stars" name="starRating"><label for="5-stars">&#9733;</label>
                <input type="radio" value="4" id="4-stars" name="starRating"><label for="4-stars">&#9733;</label>
                <input type="radio" value="3" id="3-stars" name="starRating"><label for="3-stars">&#9733;</label>
                <input type="radio" value="2" id="2-stars" name="starRating"><label for="2-stars">&#9733;</label>
                <input type="radio" value="1" id="1-stars" name="starRating"><label for="1-stars">&#9733;</label>
            </div>

            <!-- Message Field -->
            <textarea name="message" placeholder="Enter your feedback here..." class="form-control" rows="3" required></textarea>
            
            <!-- Submit Button -->
            <button style="margin-top: 15px;">Submit Feedback</button>
        </form>
    </div>
</div>

  
 
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
