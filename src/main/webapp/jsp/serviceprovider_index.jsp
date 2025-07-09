<%@page import="com.example.demo.bean.booking_list"%>
<%@page import="com.example.demo.bean.services"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="styles.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Global styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fb;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            color: #333;
        }

        /* Main container (flexbox layout) */
        .admin-container {
            display: flex;
            width: 100%;
           
            height: 100%;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: linear-gradient(135deg, #2c3e50, #34495e);
            color: white;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            box-shadow: 2px 0 15px rgba(0, 0, 0, 0.1);
        }

        .sidebar-header {
            margin-bottom: 30px;
        }

        .sidebar-header h2 {
            font-size: 24px;
            text-align: center;
            font-weight: bold;
            color: #fff;
        }

        .sidebar ul {
            list-style: none;
            width: 100%;
            padding: 0;
        }

        .sidebar ul li {
            width: 100%;
            margin-bottom: 15px;
        }

        .sidebar ul li a {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: white;
            font-size: 18px;
            padding: 10px 15px;
            transition: background-color 0.3s ease-in-out, transform 0.2s;
        }

        .sidebar ul li a:hover {
            background-color: #1abc9c;
            transform: translateX(5px);
        }

        .sidebar ul li a i {
            margin-right: 15px;
        }

        /* Main content */
        .content {
            flex: 1;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-left: 20px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 20px;
            border-bottom: 2px solid #ddd;
        }

        header h1 {
            font-size: 28px;
            color: #333;
        }

        header .header-right i {
            font-size: 20px;
            margin-left: 15px;
            cursor: pointer;
            color: #333;
            transition: color 0.3s ease;
        }

        header .header-right i:hover {
            color: #1abc9c;
        }

        .main-content {
            margin-top: 30px;
        }

        h2 {
            font-size: 22px;
            color: #333;
            margin-bottom: 20px;
        }

        /* Cards for displaying quick stats */
        .cards-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            width: 30%;
            text-align: center;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .card h3 {
            font-size: 20px;
            color: #34495e;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 26px;
            color: #2ecc71;
        }

        /* Logout Button (same as other buttons in sidebar) */
        .sidebar ul li button {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: white;
            font-size: 18px;
            padding: 10px 15px;
            width: 100%;
            background: transparent;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out, transform 0.2s;
        }

        .sidebar ul li button:hover {
            background-color: #1abc9c;
            transform: translateX(5px);
        }

        .sidebar ul li button i {
            margin-right: 15px;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .admin-container {
                flex-direction: column;
                align-items: stretch;
            }

            .sidebar {
                width: 100%;
                height: auto;
            }

            .sidebar ul li {
                text-align: center;
            }

            .cards-container {
                flex-direction: column;
            }

            .card {
                width: 100%;
                margin-bottom: 20px;
            }

            header h1 {
                font-size: 24px;
            }
        }
         /* Table Styles */
        .table-container {
            margin-top: 30px;
            padding-bottom: 40px;
        }
        
        .table-container h2 {
			    margin-bottom: 30px;  /* This adds space below the heading */
			}

        .table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
        }

        .table th, .table td {
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

        .table .actions button:hover {
            background-color: #16a085;
        }
        
        /* For the product images (background images inside the table cells) */
		.table td img {
		    width: 100%;  /* Ensure the image takes up the full width */
		    height: 150px;  /* Set the height to match the table row */
		    object-fit: cover;  /* Make the image cover the area without distortion */
		    border-radius: 4px;
		}
		
		/* Image cells: adjust size and make sure they fit properly */
		.table td[style*="background-image"] {
		    background-size: cover;
		    background-position: center;
		    width: 100px; /* Adjust as per your layout needs */
		    height: 150px; /* Maintain a fixed height for consistency */
		}

        /* Responsive design */
        @media (max-width: 768px) {
            .admin-container {
                flex-direction: column;
                align-items: stretch;
            }

            .sidebar {
                width: 100%;
                height: auto;
            }

            .sidebar ul li {
                text-align: center;
            }

            header h1 {
                font-size: 24px;
            }

            .table-container {
                margin-top: 30px;
    			
            }

			.table-container h2 {
    			margin-bottom: 30px;  
			}
			
            .table th, .table td {
                padding: 8px;
                font-size: 14px;
            }
        }
        
        /* Responsive design */
			@media (max-width: 768px) {
			    .table th, .table td {
			        padding: 8px;
			        font-size: 14px;
			    }
			
			    .table td[style*="background-image"] {
			        height: 120px; /* Adjust image height for smaller screens */
			    }
			}
        

    </style>
</head>
<body>
    <div class="admin-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h2>Service Provider</h2>
            </div>
            <ul>
                <li><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                
                
               
                <form action="logout">
                    <li><button type="submit"><i class="fas fa-sign-out-alt"></i> Logout</button></li>
                </form>
            </ul>
        </div>

        <!-- Main content -->
        <div class="content">
            <header>
                <div class="header-left">
                    <h1>Welcome  <% if(session.getAttribute("provider name")!= null){ %>
                        
                        	<%= session.getAttribute("provider name") %>
                        	
                        	<%} %> !!

							</h1>
							
				<small>
				    <% 
				        java.util.Date currentDate = new java.util.Date();
				        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
				    %>
				    Current Date & Time: <%= sdf.format(currentDate) %>
				</small>

                </div>
                <div class="header-right">
                    <i class="fas fa-user-circle"></i>
                </div>
            </header>

            
            <div>
                <h2>Booking List</h2>
                
                
                <% ArrayList<booking_list> list = (ArrayList) session.getAttribute("bookinglist");
                   
              
                %>
                
                <table class="table">
                    <thead>
                        <tr>
                        	<th>Id</th>
                        	<th>Customer</th>
                            <th>Booking Date</th>
                            <th>Booking Time</th>
                            <th>Address</th>
                            <th>Phone No</th>
                            <th>Service</th>
                            
                            <th>Rating</th>
                            <th>Status</th>
                       </tr>
                    </thead>
                    <tbody>
                    <%if(list!=null){ 
                    for(booking_list s : list){ 
                    
                  
                    %>
                        <!-- Example of a product row -->
                        <tr>
                        	<td><%=s.getB_id() %></td>
                        	
                        	
                            <td><%= s.getName() %></td>
                            <td><%= s.getBooking_date() %></td>
                            <td><%= s.getBooking_time() %></td>
                            <td><%= s.getAddress() %></td>
                             <td><%= s.getPhone_no() %></td>
                              <td><%= s.getService() %></td>
                             
                             <td>
                    <%
                    int st=s.getStarRating();
                    
                    if(st==0){
                    for(int i=1;i<=5;i++){
                    %>
                    <span class="star" style="color:black;font-size:20px" >&#9733;</span>
                    <%} %>
                    	
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
                 
                  
                  <%} %>
                
                
                
                </td>
                <td class="actions">
					<form action="update_service_status" method="post">
					    <input type="hidden" name="b_id" value="<%= s.getB_id() %>">
					    
					    <% if (s.getStatus() == null) { %>
					        <button type="submit" name="status" value="Accepted" style="height:40px;">
					            Accept
					        </button>
					        <button type="submit" name="status" value="Rejected" style="height:40px;">
					            Reject
					        </button>
					    <% } else { %>
					        <button type="button" style="height:40px;" disabled>
					            <%= s.getStatus() %>
					        </button>
					    <% } %>
					</form>
                            </td>
                           
                            
                        </tr>
                        <%} }%>
                        <!-- Add more product rows here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>