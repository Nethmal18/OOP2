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
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">
      <img src="images/logo.png" alt="LOGO" width="100" height="90">
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item ms-4">
          <a class="nav-link" href="#">Link1</a>
        </li>
        <li class="nav-item ms-4">
          <a class="nav-link" href="#">Link2</a>
        </li>
      </ul>
      <form class="d-flex ms-4" role="search">
        <input class="form-control me-2" type="search" placeholder="Search">
        <button class="btn btn-outline-primary" type="submit">Search</button>
      </form>
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
