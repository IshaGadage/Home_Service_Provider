<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

/* Main content */
.content {
    flex: 1;
    padding: 30px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-left: 270px; /* Add space for the fixed sidebar */
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
        
  /* Container for the form */
.container-fluid {
    padding-top: 30px;
    padding-bottom: 30px;
}

.bg-light {
    background-color: #ffffff;
    border-radius: 10px;
    padding: 40px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    max-width: 100%; /* Ensures the background doesn't stretch unnecessarily */
    margin: 0 auto; /* Centers the form */
}

/* Form heading */
h3.mb-6 {
    font-size: 24px;
    font-weight: bold;
    color: #34495e;
    margin-bottom: 30px;
}

/* Form Fields */
.form-label {
    font-weight: 600;
    color: #555;
    margin-bottom: 10px;
}

.form-control {
    border-radius: 8px;
    border: 1px solid #ddd;
    padding: 12px;
    font-size: 16px;
    transition: border-color 0.3s ease;
    width: 100%;
}

.form-control:focus {
    border-color: #1abc9c;
    box-shadow: 0 0 5px rgba(26, 188, 156, 0.3);
}

/* File Upload Input */
input[type="file"] {
    border-radius: 8px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    padding: 12px;
    cursor: pointer;
}

input[type="file"]:hover {
    border-color: #1abc9c;
}

/* Submit Button */
button[type="submit"] {
    background-color: #1abc9c;
    color: white;
    border: none;
    padding: 12px 30px;
    font-size: 18px;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: 200px;
}

button[type="submit"]:hover {
    background-color: #16a085;
}

/* Spacing Between Form Elements */
.mb-4 {
    margin-bottom: 20px;
}

/* Button Center Alignment */
.text-center {
    text-align: center;
}

/* Mobile Responsiveness */
@media (max-width: 768px) {
    .bg-light {
        padding: 20px;
    }

    h3.mb-6 {
        font-size: 22px;
    }

    .form-control {
        font-size: 14px;
    }

    button[type="submit"] {
        width: 100%;
    }
}

     

    </style>
</head>
<body>

  <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h2>Admin Panel</h2>
            </div>
            <ul>
                <li><a href="admin_index"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="admin_showusers"><i class="fas fa-users"></i> Users</a></li>
                <li><a href="admin_showproviders"><i class="fas fa-users"></i>View Providers</a></li>
                <li><a href="admin_showservices"><i class="fas fa-chart-line"></i>View Services</a></li>
                <li><a href="admin_contact"><i class="fas fa-chart-line"></i>Contact</a></li>
                <li><a href="admin_feedback"><i class="fas fa-chart-line"></i>Feedback</a></li>
               
                <form action="logout">
                    <li><button type="submit"><i class="fas fa-sign-out-alt"></i> Logout</button></li>
                </form>
            </ul>
        </div>

        <!-- Main content -->
        <div class="content">
            <header>
                <div class="header-left">
                    <h1>Welcome Admin <% if(session.getAttribute("admin name")!= null){ %>
                        
                        	<%= session.getAttribute("admin name") %>
                        	
                        	<%} %> !!</h1>
                </div>
                <div class="header-right">
                    <i class="fas fa-user-circle"></i>
                </div>
            </header>

</body>
</html>