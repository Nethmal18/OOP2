<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Teacher</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body style="background-color: #f8f9fa;">
<div class="container mt-5">
    <h2 class="mb-4">Add New Teacher</h2>
    <form action="TeacherInsertServlet" method="post">
        <!-- Staff Info -->
        <div class="row mb-3">
            <div class="col">
                <label>Staff ID (e.g., TC00001)</label>
                <input type="text" name="stf_id" class="form-control" pattern="TC\d{5}" required>
            </div>
            <div class="col">
                <label>Hire Date</label>
                <input type="date" name="stf_hireDate" class="form-control" >
            </div>
        </div>

        <div class="row mb-3">
            <div class="col">
                <label>First Name</label>
                <input type="text" name="stf_fname" class="form-control" >
            </div>
            <div class="col">
                <label>Last Name</label>
                <input type="text" name="stf_lname" class="form-control" >
            </div>
        </div>

        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="stf_email" class="form-control" >
        </div>

        <div class="row mb-3">
            <div class="col">
                <label>Phone</label>
                <input type="text" name="stf_phone" class="form-control">
            </div>
            <div class="col">
                <label>NIC</label>
                <input type="text" name="stf_nic" class="form-control">
            </div>
        </div>

        <div class="mb-3">
            <label>Address</label>
            <textarea name="stf_address" class="form-control" rows="2"></textarea>
        </div>

        <div class="row mb-3">
            <div class="col">
                <label>DOB</label>
                <input type="date" name="stf_dob" class="form-control">
            </div>
            <div class="col">
                <label>Salary</label>
                <input type="number" step="0.01" name="stf_salary" class="form-control">
            </div>
        </div>

        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="stf_password" class="form-control" >
        </div>

        <!-- Teacher Info -->
        <h4 class="mt-4">Teacher Details</h4>
        <div class="row mb-3">
            <div class="col">
                <label>Experience (years)</label>
                <input type="number" name="tc_experience" class="form-control">
            </div>
            <div class="col">
                <label>Specialization</label>
                <input type="text" name="tc_specialization" class="form-control">
            </div>
            <div class="col">
                <label>Designation</label>
                <input type="text" name="tc_designation" class="form-control">
            </div>
        </div>

        <button type="submit" name="action" value="insert" class="btn btn-primary">Add Teacher</button>
        <button type="reset" class="btn btn-secondary">Reset</button>
    </form>
</div>
</body>
</html>
