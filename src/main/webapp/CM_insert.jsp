<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Curriculum Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: url('images/back.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .glass-container {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 30px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.18);
            animation: fadeInUp 0.8s ease-out;
        }

        @keyframes fadeInUp {
            from {
                transform: translateY(30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .form-icon {
            position: absolute;
            top: 10px;
            left: 15px;
            color: #6c757d;
        }

        .input-group {
            position: relative;
        }

        .input-group input, .input-group select, .input-group textarea {
            padding-left: 2.5rem;
        }

        h3, h5 {
            font-weight: 600;
            color: #fff;
        }

        label, ::placeholder, .form-control, .form-select {
            color: #fff;
        }

        .form-control, .form-select, textarea {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .right-image {
            background: url('images/admin.png') no-repeat center center;
            background-size: contain;
            min-height: 500px;
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

<header>
	



</header>

 
<div class="container">
    <div class="row align-items-center">
        <!-- Left Form -->
        <div class="col-lg-6">
            <div class="glass-container">
                <h3 class="text-center mb-4"><i class="bi bi-person-plus-fill me-2"></i>Add New Curriculum Manager</h3>
                <form action="CMInsertServlet" method="post">

                    <!-- Personal Info -->
                    <h5><i class="bi bi-person-lines-fill me-2"></i>Personal Details</h5>

                    <div class="row mb-3">
                        <div class="col input-group">
                            <i class="bi bi-card-heading form-icon"></i>
                            <input type="text" name="stf_id" pattern="CM\d{5}" required class="form-control" placeholder="Staff ID (CM00001)">
                        </div>
                        <div class="col input-group">
                            <i class="bi bi-calendar-event form-icon"></i>
                            <input type="date" name="stf_hireDate" class="form-control">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col input-group">
                            <i class="bi bi-person-fill form-icon"></i>
                            <input type="text" name="stf_fname" class="form-control" placeholder="First Name">
                        </div>
                        <div class="col input-group">
                            <i class="bi bi-person-fill form-icon"></i>
                            <input type="text" name="stf_lname" class="form-control" placeholder="Last Name">
                        </div>
                    </div>

                    <div class="mb-3 input-group">
                        <i class="bi bi-envelope-fill form-icon"></i>
                        <input type="email" name="stf_email" required class="form-control" placeholder="Email">
                    </div>

                    <div class="row mb-3">
                        <div class="col input-group">
                            <i class="bi bi-telephone-fill form-icon"></i>
                            <input type="text" name="stf_phone" class="form-control" placeholder="Phone">
                        </div>
                        <div class="col input-group">
                            <i class="bi bi-card-text form-icon"></i>
                            <input type="text" name="stf_nic" class="form-control" placeholder="NIC">
                        </div>
                    </div>

                    <div class="mb-3 input-group">
                        <i class="bi bi-geo-alt-fill form-icon"></i>
                        <textarea name="stf_address" class="form-control" rows="2" placeholder="Address"></textarea>
                    </div>

                    <div class="row mb-3">
                        <div class="col input-group">
                            <i class="bi bi-calendar-heart form-icon"></i>
                            <input type="date" name="stf_dob" class="form-control">
                        </div>
                        <div class="col input-group">
                            <i class="bi bi-currency-dollar form-icon"></i>
                            <input type="number" step="0.01" name="stf_salary" class="form-control" placeholder="Salary">
                        </div>
                    </div>

                    <div class="mb-3 input-group">
                        <i class="bi bi-lock-fill form-icon"></i>
                        <input type="password" name="stf_password" class="form-control" placeholder="Password">
                    </div>

                    <!-- CM Info -->
                    <h5 class="mt-4"><i class="bi bi-shield-lock-fill me-2"></i>Curriculum Manager Details</h5>
                    <div class="row mb-3">
                        <div class="col input-group">
                            <i class="bi bi-person-badge-fill form-icon"></i>
                            <input type="text" name="cm_role" class="form-control" placeholder="Role">
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="d-flex justify-content-between mt-4">
                        <button type="submit" name="action" value="insert" class="btn btn-primary px-4">
                            <i class="bi bi-plus-circle me-1"></i>Add CR_Manager
                        </button>
                        <button type="reset" class="btn btn-outline-light px-4">
                            <i class="bi bi-arrow-clockwise me-1"></i>Reset
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Right Image -->
        <div class="col-lg-6 d-none d-lg-block right-image"></div>
    </div>
</div>
</body>
</html>
