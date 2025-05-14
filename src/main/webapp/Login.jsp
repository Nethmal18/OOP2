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
    <!-- Background animation elements -->
    <div class="bg-animation">
        <div class="wave"></div>
        <div class="wave"></div>
        <div class="wave"></div>
    </div>
    
    <!-- Floating bubbles -->
    <div class="bubbles">
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
    </div>
 
    <div class="wrapper">
        <div class="login-card">
            <div class="brand">
                <div class="logo-container">
                    <img src="images/Avatar.png" alt="Logo">
                </div>
                <h2>Welcome Back</h2>
                <p>Please sign in to continue</p>
            </div>
            
            <form action="LoginServlet" method="post" class="login-form">
                <div class="input-container">
                    <input type="text" name="uid" placeholder="User ID" required>
                </div>
                <div class="input-container">
                    <input type="password" name="pass" placeholder="Password" required>
                </div>
                <div class="actions">
                    <a href="#">Forgot Password?</a>
                </div>
                <button type="submit">Sign In</button>
            </form>
            <div class="signup">
                <span>Don't have an account?</span> <a href="Signup.jsp">Signup</a>
            </div>
            
            <!-- Water effect -->
            <div class="water-effect"></div>
        </div>
    </div>
</body>
</html>