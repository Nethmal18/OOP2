<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update Student</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body, html {
      height: 100%;
      margin: 0;
    }

    .bg-image {
      background: url('https://images.unsplash.com/photo-1588072432836-e10032774350?auto=format&fit=crop&w=1740&q=80') no-repeat center center fixed;
      background-size: cover;
      position: fixed;
      top: 0;
      left: 0;
      height: 100%;
      width: 100%;
      z-index: -2;
    }

    .bg-overlay {
      background-color: rgba(0, 0, 0, 0.6);
      position: fixed;
      top: 0;
      left: 0;
      height: 100%;
      width: 100%;
      z-index: -1;
    }

    .form-container {
      background-color: rgba(255, 255, 255, 0.9);
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
      width: 100%;
      max-width: 600px;
      margin: auto;
    }

    /* Added: Adjust form position above the center */
    .centered-form {
      position: relative;
      top: 5%;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
	<%
		String tid =request.getParameter("tid");
		String fname =request.getParameter("fname");
		String lname =request.getParameter("lname");
		String email =request.getParameter("email");
		String phone =request.getParameter("phone");
		String address =request.getParameter("address");
		String nic =request.getParameter("nic");
		String sal =request.getParameter("salary");
		String hd =request.getParameter("hd");
		String ex =request.getParameter("ex");
		String sp =request.getParameter("sp");
		String dsig =request.getParameter("dsig");
		String pass =request.getParameter("pass");
	%>
  <div class="bg-image"></div>
  <div class="bg-overlay"></div>

  <div class="form-container centered-form">
    <h2 class="text-center mb-4">Update Teacher Details</h2>
    <form action="TeacherInsertServlet" method="post">
      <div class="mb-3">
        <label for="tid" class="form-label">Teacher ID</label>
        <input type="text" class="form-control" id="stf_id" name="stf_id" value="<%=tid%>" readonly>
      </div>

      <div class="row">
        <div class="col-md-6 mb-3">
          <label for="fname" class="form-label">First Name</label>
          <input type="text" class="form-control" id="stf_fname" name="stf_fname"  value="<%=fname%>">
        </div>
        <div class="col-md-6 mb-3">
          <label for="lname" class="form-label">Last Name</label>
          <input type="text" class="form-control" id="stf_lname" name="stf_lname" value="<%=lname%>">
        </div>
      </div>

      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="stf_email" name="stf_email" value="<%=email%>">
      </div>

      <div class="mb-3">
        <label for="phone" class="form-label">Phone Number</label>
        <input type="text" class="form-control" id="stf_phone" name="stf_phone" value="<%=phone%>">
      </div>

      <div class="mb-3">
        <label for="address" class="form-label">Address</label>
        <textarea class="form-control" id="stf_address" name="stf_address" rows="2" placeholder="<%=address%>" required></textarea>
      </div>

      <div class="mb-3">
        <label for="nic" class="form-label">NIC</label>
        <input type="text" class="form-control" id="stf_nic" name="stf_nic" value="<%=nic%>">
      </div>
	  
	  <div class="mb-3">
        <label for="salary" class="form-label">Salary</label>
        <input type="text" class="form-control" id="stf_salary" name="stf_salary" value="<%=sal%>">
      </div>
      
      <div class="mb-3">
        <label for="hd" class="form-label">hireDate</label>
        <input type="text" class="form-control" id="stf_hireDate" name="stf_hireDate" value="<%=hd%>">
      </div>
      
      <div class="mb-3">
        <label for="experience" class="form-label">experience</label>
        <input type="text" class="form-control" id="tc_experience" name="tc_experience" value="<%=ex%>">
      </div>
      
      <div class="mb-3">
        <label for="specialization" class="form-label">specialization</label>
        <input type="text" class="form-control" id="tc_specialization" name="tc_specialization" value="<%=sp%>">
      </div>
      
       <div class="mb-3">
        <label for="designation" class="form-label">designation</label>
        <input type="text" class="form-control" id="tc_designation" name="tc_designation" value="<%=dsig%>">
      </div>
	  
	  
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="stf_password" name="stf_password" value="<%=pass%>">
      </div>

      <button type="submit" name="action" value="update"  class="btn btn-primary w-100">Update Teacher</button>
    </form>
  </div>
</body>
</html>
