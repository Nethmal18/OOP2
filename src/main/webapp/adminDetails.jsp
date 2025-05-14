<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administrators</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background: url('images/school.jpg') no-repeat center center;
    		background-size: cover;
        }

        .add-new-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .add-new-box {
            background-color: #fff;
            border: 2px dashed #007bff;
            border-radius: 12px;
            padding: 20px;
            cursor: pointer;
            text-align: center;
            transition: background 0.3s ease;
        }

        .add-new-box:hover {
            background-color: #f0f8ff;
        }

        .add-new-icon {
            font-size: 30px;
            color: #007bff;
        }

        .add-new-text {
            margin-top: 5px;
            font-weight: bold;
            color: #007bff;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            padding: 20px 40px;
        }

        .admin-card {
            background: white;
            padding: 20px;
            border-radius: 16px;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
        }

        .admin-card:hover {
            transform: translateY(-5px);
        }

        .card-actions {
            margin-top: 16px;
            display: flex;
            gap: 10px;
        }

        .custom-button {
            flex: 1;
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
            border: none;
            background-color: #007bff;
            color: white;
        }

        .custom-button.delete {
            background-color: #e74c3c;
        }
        
        /* for the navBar */


		.nav-item 
		{
			margin-right : 50px;
		}
		
		.nav-item a:hover{
			
			color : royalblue;
		}
		
		.navbar-brand {
		
		  font-size: var(--bs-navbar-brand-font-size);
		  color: var(--bs-navbar-brand-color);
		  text-decoration: none;
		  white-space: nowrap;
		  top: -23px;
		  left: -8px;
		  position:absolute;
		  height : 50px;
		  margin-top : 0px;
		}
		
		.navbar 
		{
			height : 80px !important;
		}
		
		
		.logOutDiv {
		  display: inline-block;
		  margin-right: 0px;
		  transition-duration: 0.5s;
		}
		
		
		.logOutDiv:hover 
		{
			scale : 110%;
			transition-duration: 0.5s;
		}
		
		
		.pfpDiv 
		{
			display : inline-block;
			margin-right: 60px;
		}
		
		
		.logOutIcon 
		{
			width: 70px;
		 	 height: 70px;
		}
		
		.profile-pic {
		  width: 43px;
		  height: 43px;
		  margin-right: 23px;
		}
		
		.profile-pic img {
		            width: 100%;
		            height: 100%;
		 }
		        
        
    </style>
</head>
<body>
<!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="CountServlet">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="admin.jsp">Home</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="STservlet">Students</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="TeacherServlet">Teachers</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="AdminServlet">Administration</a>
		        </li>
		        
		        
            
		        
		      </ul>
		    
		    <div style = "margin-top : 10px" onclick = "location.href='CountServlet'"  class = "logOutDiv">
		
					<img class ="profile-pic" src = "images/notifications.png">
		      
		      </div>
		      
		      
		      <div   onclick = "location.href='home.jsp'"  class = "logOutDiv">
					<img class ="logOutIcon" src = "images/logout.gif">
		      
		      </div>
		      
	
		    </div>
		  </div>
	</nav> 

<div class="add-new-container">
  <div class="add-new-box" onclick="window.location.href='InsertAdmin.jsp'">
    <div class="add-new-icon">+</div>
    <div class="add-new-text">Add New</div>
  </div>
</div>

<!-- Card Grid Display -->
    <div class="card-grid">
        <c:forEach var="ad" items="${adminDetails}">
        
        	<!-- Create and assigns values to variables In purpose of display data when updating-->
        	<c:set var="tid" value="${ad.id}" />
	        <c:set var="fname" value="${ad.fname }" />
	        <c:set var="lname" value="${ad.lname}" />
	        <c:set var="email" value="${ad.email}" />
	        <c:set var="phone" value="${ad.phone }" />
	        <c:set var="address" value="${ad.address }" />
	        <c:set var="nic" value="${ad.nic }" />
	        <c:set var="dob" value="${ad.dob }" />
	        <c:set var="salary" value="${ad.salary }" />
	        <c:set var="hd" value="${ad.hireDate }" />
         	<c:set var="ex" value="${ad.systemAccess }" />
         	<c:set var="dsig" value="${ad.designation }" />
         	<c:set var="pass" value="${ad.password }" />
        
            <div class="admin-card">
                <h3>${ad.fname} ${ad.lname}</h3>
                <p><strong>Admin ID: </strong> ${ad.id}</p>
                <p><strong>Email:</strong> ${ad.email}</p>
                <p><strong>Phone:</strong> ${ad.phone}</p>
                <p><strong>Address:</strong> ${ad.address}</p>
                <p><strong>NIC:</strong> ${ad.nic}</p>
                <p><strong>Date Of Birth:</strong> ${ad.dob}</p>
                <p><strong>Salary:</strong> ${ad.salary}</p>
                <p><strong>Hire Date:</strong> ${ad.hireDate}</p>
                <p><strong>SysAccess:</strong> ${ad.systemAccess}</p>
                <p><strong>Designation:</strong> ${ad.designation}</p>
                
                <!-- For Update -->
                	<c:url value="UpdateAdmin.jsp" var="update">
                		<c:param name="aid" value="${ad.id}" />
				        <c:param name="fname" value="${ad.fname }" />
				        <c:param name="lname" value="${ad.lname}" />
				        <c:param name="email" value="${ad.email}" />
				        <c:param name="phone" value="${ad.phone }" />
				        <c:param name="address" value="${ad.address }" />
				        <c:param name="nic" value="${ad.nic }" />
				        <c:param name="dob" value="${ad.dob }" />
				        <c:param name="salary" value="${ad.salary }" />
				        <c:param name="hd" value="${ad.hireDate }" />
			         	<c:param name="sys" value="${ad.systemAccess }" />
			         	<c:param name="dsig" value="${ad.designation }" />
			         	<c:param name="pass" value="${ad.password }" />
                	</c:url>
                
                <!-- For Delete  -->
                	<c:url value="UpdateAdmin.jsp" var="delete">
                		<c:param name="aid" value="${ad.id}" />
				        <c:param name="fname" value="${ad.fname }" />
				        <c:param name="lname" value="${ad.lname}" />
				        <c:param name="email" value="${ad.email}" />
				        <c:param name="phone" value="${ad.phone }" />
				        <c:param name="address" value="${ad.address }" />
				        <c:param name="nic" value="${ad.nic }" />
				        <c:param name="dob" value="${ad.dob }" />
				        <c:param name="salary" value="${ad.salary }" />
				        <c:param name="hd" value="${ad.hireDate }" />
			         	<c:param name="sys" value="${ad.systemAccess }" />
			         	<c:param name="dsig" value="${ad.designation }" />
			         	<c:param name="pass" value="${ad.password }" />
                	</c:url>
                
                <div class="card-actions">
                    <a href="${update}">
                        <button class="custom-button">Update</button>
                    </a>
                    <form method="post" action="DeleteAdminServlet" onsubmit="return confirm('Delete this admin?');">
                        <input type="hidden" name="id" value="${ad.id}" />
                        <input type="hidden" name="action" value="delete" />
                        <button type="submit" class="custom-button delete">Delete</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
