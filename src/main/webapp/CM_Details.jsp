<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Curriculum Manager</title>
    <!-- Bootstrap and FontAwesome -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="css/button1.css">

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .nav-item {
            margin-right: 50px;
        }

        .nav-item a:hover {
            color: royalblue;
        }

        .navbar-brand {
            font-size: var(--bs-navbar-brand-font-size);
            color: var(--bs-navbar-brand-color);
            text-decoration: none;
            white-space: nowrap;
            top: -23px;
            left: -8px;
            position: absolute;
            height: 50px;
            margin-top: 0px;
        }

        .content-box {
            display: flex;
            justify-content: space-around;
            margin-top: 100px;
        }

        .box {
            width: 300px;
            height: 200px;
            background-color: #f5f5f5;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }

        .box:hover {
            transform: translateY(-5px);
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

        .admin-card h3 {
            margin-top: 0;
            color: #2c3e50;
        }

        .admin-card p {
            margin: 8px 0;
            font-size: 14px;
            color: #555;
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
            transition: background 0.2s ease-in-out;
        }

        .custom-button:hover {
            background-color: #0056b3;
        }

        .custom-button.delete {
            background-color: #e74c3c;
        }

        .custom-button.delete:hover {
            background-color: #c0392b;
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
    <div class="add-new-box" onclick="window.location.href='CM_insert.jsp'">
        <div class="add-new-icon">+</div>
        <div class="add-new-text">Add New</div>
    </div>
</div>

<!-- Card Grid Display -->
<div class="card-grid">
    <c:forEach var="cm" items="${cmDetails}">
        <c:set var="cid" value="${cm.id}" />
        <c:set var="fname" value="${cm.fname}" />
        <c:set var="lname" value="${cm.lname}" />
        <c:set var="email" value="${cm.email}" />
        <c:set var="phone" value="${cm.phone}" />
        <c:set var="address" value="${cm.address}" />
        <c:set var="nic" value="${cm.nic}" />
        <c:set var="dob" value="${cm.dob}" />
        <c:set var="salary" value="${cm.salary}" />
        <c:set var="hd" value="${cm.hireDate}" />
        <c:set var="role" value="${cm.cm_role}" />
        <c:set var="pass" value="${cm.password}" />

        <div class="admin-card">
            <h3>${cm.fname} ${cm.lname}</h3>
            <p><strong>CM ID: </strong> ${cm.cm_id}</p>
            <p><strong>Email:</strong> ${cm.email}</p>
            <p><strong>Phone:</strong> ${cm.phone}</p>
            <p><strong>Address:</strong> ${cm.address}</p>
            <p><strong>NIC:</strong> ${cm.nic}</p>
            <p><strong>Date Of Birth:</strong> ${cm.dob}</p>
            <p><strong>Salary:</strong> ${cm.salary}</p>
            <p><strong>Hire Date:</strong> ${cm.hireDate}</p>
            <p><strong>Role:</strong> ${cm.cm_role}</p>

            <c:url value="UpdateCM.jsp" var="update">
                <c:param name="cid" value="${cm.id}" />
                <c:param name="fname" value="${cm.fname}" />
                <c:param name="lname" value="${cm.lname}" />
                <c:param name="email" value="${cm.email}" />
                <c:param name="phone" value="${cm.phone}" />
                <c:param name="address" value="${cm.address}" />
                <c:param name="nic" value="${cm.nic}" />
                <c:param name="dob" value="${cm.dob}" />
                <c:param name="salary" value="${cm.salary}" />
                <c:param name="hd" value="${cm.hireDate}" />
                <c:param name="role" value="${cm.cm_role}" />
                <c:param name="pass" value="${cm.password}" />
            </c:url>

            <div class="card-actions">
                <form action="${update}" method="get" style="display:inline;">
                    <button type="submit" class="custom-button" title="Update">
                        <i class="fas fa-edit"></i>
                    </button>
                </form>

                <form method="post" action="DeleteCMServlet" onsubmit="return confirm('Delete this Curriculum Manager?');" style="display:inline;">
                    <input type="hidden" name="cid" value="${cm.id}" />
                    <input type="hidden" name="action" value="delete" />
                    <button type="submit" class="custom-button delete" title="Delete">
                        <i class="fas fa-trash-alt"></i>
                    </button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
