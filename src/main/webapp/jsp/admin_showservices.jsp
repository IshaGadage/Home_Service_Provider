<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.demo.bean.services"%>
<%@page import="java.util.ArrayList"%>

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
    overflow-x: hidden; /* Prevent horizontal scroll */
}

/* Main container (flexbox layout) */
.admin-container {
    display: flex;
    width: 100%;
    height: 100vh; /* Make the container take full viewport height */
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
    height: 100vh; /* Make sidebar stretch to full height */
    position: fixed; /* Keep sidebar fixed when scrolling */
    left: 0;
    top: 0;
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

/* Main content */
.content {
    flex: 1;
    padding: 30px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
     /* Add space for the fixed sidebar */
    height: 100vh; /* Ensure content area also fills the screen */
    overflow-y: auto; /* Allow scrolling if content overflows */
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
       
        <%@include file="admin_header.jsp" %>
				
				<% ArrayList<services> list = (ArrayList) session.getAttribute("servicelist"); %>
				
            <!-- Table Container -->
            <div class="table-container">
                <h2>Product List</h2>
                
                
                
                
                <table class="table">
                    <thead>
                        <tr>
                        	<th>Id</th>
                        	<th>Image</th>
                            <th>Service Name</th>
                            <th>Description</th>
                            <th>Time</th>
                            <th>Date</th>
                            <th>Delete</th>
                       </tr>
                    </thead>
                    <tbody>
                    <% for(services s : list){ %>
                        <!-- Example of a product row -->
                        <tr>
                        	<td><%=s.getService_id() %></td>
                        	<td  style="background-size: cover;width: 70px;height:70px;background-image: url('images/<%= s.getImg() %>');"></td>
                        	
                            <td><%= s.getService_name() %></td>
                            <td><%= s.getDescription() %></td>
                            <td><%= s.getTime() %></td>
                            <td><%= s.getDate() %></td>
                           
                            <td class="actions">
                                <form action="delete_services">
                                <input type="hidden" name="service_id" value="<%= s.getService_id() %>">
                                <button type="submit" style="width: 80px;height:40px;">Delete</button>
                                </form>
                            </td>
                        </tr>
                        <%} %>
                        <!-- Add more product rows here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
