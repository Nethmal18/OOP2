<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Administrator</title>
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
    </style>
</head>
<body>
<%
		String aid =request.getParameter("aid");
		String fname =request.getParameter("fname");
		String lname =request.getParameter("lname");
		String email =request.getParameter("email");
		String phone =request.getParameter("phone");
		String address =request.getParameter("address");
		String nic =request.getParameter("nic");
		String dob =request.getParameter("dob");
		String sal =request.getParameter("salary");
		String hd =request.getParameter("hd");
		String sys =request.getParameter("sys");
		String dsig =request.getParameter("dsig");
		String pass =request.getParameter("pass");
	%>
<div class="container">
    <div class="row align-items-center">
        <!-- Left Form -->
        <div class="col-lg-6">
            <div class="glass-container">
                <h3 class="text-center mb-4"><i class="bi bi-pencil-square"></i>Update Administrator</h3>
                <form action="UpdateAdminServlet" method="post">

                    <!-- Personal Info -->
                    <h5><i class="bi bi-person-lines-fill me-2"></i>Personal Details</h5>

                    <div class="row mb-3">
                        <div class="col input-group">
                            <i class="bi bi-card-heading form-icon"></i>
                            <input type="text" name="stf_id" pattern="AD\d{5}" required class="form-control" placeholder="Staff ID (AD00001)" value="<%=aid%>" readonly>
                        </div>
                        <div class="col input-group">
                            <i class="bi bi-calendar-event form-icon"></i>
                            <input type="date" name="stf_hireDate" class="form-control" value="<%=hd%>">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col input-group">
                            <i class="bi bi-person-fill form-icon"></i>
                            <input type="text" name="stf_fname" class="form-control" placeholder="First Name" value="<%=fname%>">
                        </div>
                        <div class="col input-group">
                            <i class="bi bi-person-fill form-icon"></i>
                            <input type="text" name="stf_lname" class="form-control" placeholder="Last Name" value="<%=lname%>">
                        </div>
                    </div>

                    <div class="mb-3 input-group">
                        <i class="bi bi-envelope-fill form-icon"></i>
                        <input type="email" name="stf_email" required class="form-control" placeholder="Email" value="<%=email%>" required>
                    </div>

                    <div class="row mb-3">
                        <div class="col input-group">
                            <i class="bi bi-telephone-fill form-icon"></i>
                            <input type="text" name="stf_phone" class="form-control" placeholder="Phone" value="<%=phone%>">
                        </div>
                        <div class="col input-group">
                            <i class="bi bi-card-text form-icon"></i>
                            <input type="text" name="stf_nic" class="form-control" placeholder="NIC" value="<%=nic%>">
                        </div>
                    </div>

                    <div class="mb-3 input-group">
                        <i class="bi bi-geo-alt-fill form-icon"></i>
                        <textarea name="stf_address" class="form-control" rows="2" placeholder="<%=address%>" ></textarea>
                    </div>

                    <div class="row mb-3">
                        <div class="col input-group">
                            <i class="bi bi-calendar-heart form-icon"></i>
                            <input type="date" name="stf_dob" class="form-control" value="<%= dob %>" readonly>
                        </div>
                        <div class="col input-group">
                            <i class="bi bi-currency-dollar form-icon"></i>
                            <input type="number" step="0.01" name="stf_salary" class="form-control" placeholder="Salary" value="<%=sal%>">
                        </div>
                    </div>

                    <div class="mb-3 input-group">
                        <i class="bi bi-lock-fill form-icon"></i>
                        <input type="password" name="stf_password" class="form-control" placeholder="Password" value="<%=pass%>">
                    </div>

                    <!-- Admin Info -->
                    <h5 class="mt-4"><i class="bi bi-shield-lock-fill me-2"></i>Administrator Details</h5>
                    <div class="row mb-3">
                        <div class="col input-group">
                            <i class="bi bi-key-fill form-icon"></i>
                            <select name="ad_systemAccess" class="form-select" >
                                <option value="0">0 - View Only</option>
                                <option value="1">1 - Manage Students</option>
                                <option value="2">2 - Manage Teachers</option>
                                <option value="3">3 - Full Access</option>
                            </select>
                        </div>
                        <div class="col input-group">
                            <i class="bi bi-person-badge-fill form-icon"></i>
                            <input type="text" name="ad_designation" class="form-control" placeholder="Designation" value="<%=dsig%>">
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="d-flex justify-content-between mt-4">
                        <button type="submit" name="action" value="insert" class="btn btn-primary px-4">
                            <i class="bi bi-pencil-square"></i> Update Admin
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
