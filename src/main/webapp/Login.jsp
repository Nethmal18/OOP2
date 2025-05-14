<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | School Info System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/Login.css">
</head>
<body>
    <div class="wrapper">
        <div class="login-card">
            <div class="brand">
                <img src="images/Avatar.png" alt="Logo">
                <h2>Welcome Back</h2>
                <p>Please sign in to continue</p>
            </div>
            <form action="loginServlet" method="post" class="login-form">
                <input type="text" name="uid" placeholder="User ID" required>
                <input type="password" name="pass" placeholder="Password" required>
                <div class="actions">
                    <a href="#">Forgot Password?</a>
                </div>
                <button type="submit">Sign In</button>
            </form>
            <div class="signup">
                <span>Don’t have an account?</span> <a href="#">Sign Up</a>
            </div>
        </div>
    </div>
</body>
</html>
