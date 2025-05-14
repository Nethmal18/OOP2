<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Academix - School Management System</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <!-- AOS Animation Library -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/home.css">
  
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      overflow-x: hidden;
    }
	#id{color:white;}
    /* Smooth scrolling */
    html {
      scroll-behavior: smooth;
    }

    .hero {
      color: white;
      padding: 130px 0;
      text-align: center;
      position: relative;
      z-index: 1;
    }

    .hero-content {
      opacity: 0;
      transform: translateY(30px);
      animation: fadeInUp 1s ease forwards 0.5s;
    }

    .features .icon {
      font-size: 3rem;
      color: #0d6efd;
      transition: transform 0.3s ease, color 0.3s ease;
    }

    .features .card {
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      border: none;
      overflow: hidden;
    }

    .features .card::before {
      content: '';
      position: absolute;
      top: -100%;
      left: 0;
      width: 100%;
      height: 5px;
      background: linear-gradient(90deg, #0d6efd, #0dcaf0);
      transition: top 0.3s ease;
    }

    .features .card:hover {
      transform: translateY(-10px);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1) !important;
    }

    .features .card:hover::before {
      top: 0;
    }

    .features .card:hover .icon {
      transform: scale(1.2);
      color: #0dcaf0;
    }

    footer {
      background-color: #f8f9fa;
      padding: 20px 0;
      position: relative;
      overflow: hidden;
    }

    .nav-item {
      margin-right: 50px;
      position: relative;
    }

    .nav-item::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 0;
      height: 2px;
      background-color: royalblue;
      transition: width 0.3s ease;
    }

    .nav-item:hover::after {
      width: 100%;
    }

    .nav-item a {
      transition: color 0.3s ease;
    }

    .nav-item a:hover {
      color: royalblue;
    }

    .navbar {
      transition: all 0.3s ease;
      padding: 15px 0;
      z-index: 1000;
    }

    .navbar.scrolled {
      background-color: rgba(255, 255, 255, 0.95) !important;
      box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
      padding: 10px 0;
    }

    .navbar-brand {
      font-size: var(--bs-navbar-brand-font-size);
      color: var(--bs-navbar-brand-color);
      text-decoration: none;
      white-space: nowrap;
      position: relative;
      transition: transform 0.3s ease;
    }

    .navbar-brand img {
      transition: transform 0.3s ease;
    }

    .navbar-brand:hover img {
      transform: scale(1.05);
    }

    #h {
      height: 100px;
    }
    
    #nav {
      position: fixed;
      width: 100%;
      top: 0;
    }
    
    #feed {
      background: linear-gradient(rgba(212, 237, 218, 0.7), rgba(212, 237, 218, 0.7));
      position: relative;
    }

    #feed::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><circle cx="50" cy="50" r="2" fill="%23ffffff80"/></svg>');
      opacity: 0.3;
      z-index: 0;
    }

    .btn-primary {
      background: linear-gradient(45deg, #0d6efd, #0dcaf0);
      border: none;
      position: relative;
      overflow: hidden;
      z-index: 1;
      transition: all 0.3s ease;
    }

    .btn-primary::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(45deg, #0dcaf0, #0d6efd);
      transition: all 0.3s ease;
      z-index: -1;
    }

    .btn-primary:hover::before {
      left: 0;
    }

    .btn-primary:hover {
      box-shadow: 0 5px 15px rgba(13, 110, 253, 0.4);
      transform: translateY(-2px);
    }

    /* Video Background */
    .video-bg {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      object-fit: cover;
      z-index: -2;
      filter: brightness(70%);
    }

    /* Overlay */
    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      background: linear-gradient(135deg, rgba(0,13,60,0.7) 0%, rgba(0,45,113,0.6) 100%);
      z-index: -1;
    }

    /* Feedback card animations */
    .feedback-card {
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .feedback-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
    }

    /* Star rating animation */
    .star-rating i {
      transition: transform 0.2s ease, color 0.2s ease;
    }

    .feedback-card:hover .star-rating i {
      color: #ffc107;
      animation: starPulse 0.5s ease infinite alternate;
    }

    /* Animations */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @keyframes float {
      0% {
        transform: translateY(0px);
      }
      50% {
        transform: translateY(-10px);
      }
      100% {
        transform: translateY(0px);
      }
    }

    @keyframes starPulse {
      0% {
        transform: scale(1);
      }
      100% {
        transform: scale(1.2);
      }
    }

    /* Scroll indicator */
    .scroll-down {
      position: absolute;
      bottom: 30px;
      left: 50%;
      transform: translateX(-50%);
      animation: bounce 2s infinite;
      cursor: pointer;
      z-index: 10;
    }

    .scroll-down i {
      color: white;
      font-size: 2rem;
      opacity: 0.8;
    }

    @keyframes bounce {
      0%, 20%, 50%, 80%, 100% {
        transform: translateY(0) translateX(-50%);
      }
      40% {
        transform: translateY(-20px) translateX(-50%);
      }
      60% {
        transform: translateY(-10px) translateX(-50%);
      }
    }

    /* Section titles */
    .section-title {
      position: relative;
      display: inline-block;
      margin-bottom: 2rem;
    }

    .section-title::after {
      content: '';
      position: absolute;
      bottom: -10px;
      left: 50%;
      transform: translateX(-50%);
      width: 50px;
      height: 3px;
      background: linear-gradient(90deg, #0d6efd, #0dcaf0);
    }

    /* Responsive padding for smaller screens */
    @media (max-width: 576px) {
      .hero {
        padding: 100px 0 80px;
      }

      .hero h1 {
        font-size: 2rem;
      }

      .navbar-brand {
        top: 0;
        left: 0;
        position: relative;
        height: auto;
        margin-top: 0;
        margin-left: 0;
      }

      .navbar-brand img {
        width: 100px;
        height: auto;
      }

      #h {
        height: auto;
        padding: 10px 0;
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
		
		
		.logOutIcon {
		  width: 65px;
		  height: 65px;
		}
		
		.profile-pic {
		  width: 57px;
		  height: 56px;
		  margin-right: 23px;
		}
		
		.profile-pic img {
		            width: 100%;
		            height: 100%;
		 }


      
    }
  </style>
</head>
<body>

   <!-- new nav bar -->
  <!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="home.jsp">
     				 <img src="images/LogoResized.png" alt="LOGO" width="100" height="100"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item"  style = "margin-left : 40px">
		  		  <a class="nav-link" href="#features">Features</a>
				</li>
				  
				<li class="nav-item">
		    		<a class="nav-link" href="#feedback">Testimonials</a>
		  		</li>
		  		
		  		<li class="nav-item">
		   			 <a class="nav-link" href="Login.jsp">Student</a>
		  		</li>
		  		
		  		<li class="nav-item">
		  		  <a class="nav-link" href="Login.jsp">Teacher</a>
		 	    </li>
		 	  
		        <li class="nav-item" >
		          <a class="nav-link" href="#">FAQ</a>
		        </li>
            
		        
		      </ul>
		
		    
		        
		     <div style = "margin-right : 20px;"onclick = "location.href='Signup.jsp'" class = "logOutDiv">
		
					<img class ="logOutIcon" src = "images/signUp.gif">
		      
		      </div>
		      
		         
		      <div  onclick = "location.href='Login.jsp'"  class = "logOutDiv">
		
					<img class ="logOutIcon" src = "images/logIn.gif">
		      
		      </div>
		      
		      
		     
		    </div>
		  </div>
	</nav> 
  
  
  <!-- Video Background -->
  <video autoplay muted loop class="video-bg">
    <source src="gift/home.mp4" type="video/mp4">
  </video>

  <!-- Overlay -->
  <div class="overlay"></div>
  
  <!-- Hero Section -->
  <section class="hero" id="home">
    <div class="container hero-content">
      <h1 class="display-4 fw-bold mb-4">Welcome to Academix</h1>
      <p class="lead mb-4">Simplify your school's administrative tasks with our all-in-one management system.</p>
    </div>
    <div class="scroll-down">
      <a href="#features"><i class="bi bi-chevron-double-down"></i></a>
    </div>
  </section>

  <!-- Features Section as Cards -->
  <section class="features py-5" id="features">
    <div class="container">
      <h2 class="text-center mb-5 section-title" id="id">Our Features</h2>
      <div class="row g-4 justify-content-center">
        
        <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
          <div class="card h-100 text-center shadow">
            <div class="card-body">
              <div class="icon mb-3">
                <i class="bi bi-people-fill"></i>
              </div>
              <h5 class="card-title">Student Management</h5>
              <p class="card-text">Effortlessly manage student records, attendance, and performance.</p>
            </div>
          </div>
        </div>

        <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
          <div class="card h-100 text-center shadow">
            <div class="card-body">
              <div class="icon mb-3">
                <i class="bi bi-person-badge-fill"></i>
              </div>
              <h5 class="card-title">Teacher Management</h5>
              <p class="card-text">Organize teacher profiles, schedules, and class assignments with ease.</p>
            </div>
          </div>
        </div>

        <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
          <div class="card h-100 text-center shadow">
            <div class="card-body">
              <div class="icon mb-3">
                <i class="bi bi-calendar-check-fill"></i>
              </div>
              <h5 class="card-title">Timetable Scheduling</h5>
              <p class="card-text">Create and manage class timetables efficiently to optimize learning.</p>
            </div>
            
          </div>
        </div>

      </div>
    </div>
  </section>

  <!-- Feedback Section -->
  <section class="py-5" id="feedback">
    <div class="container">
      <h2 class="text-center mb-4 section-title" id="id">What Our Users Say</h2>
      <div class="row g-4 justify-content-center">
        
        <!-- Feedback 1 -->
        <div class="col-md-3" data-aos="zoom-in" data-aos-delay="100">
          <div class="card h-100 shadow-sm feedback-card">
            <div class="card-body">
              <div class="d-flex align-items-center mb-3">
                <div class="flex-shrink-0">
                  <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
                    <i class="bi bi-person"></i>
                  </div>
                </div>
                <div class="flex-grow-1 ms-3">
                  <h5 class="card-title mb-0">Mr. Fernando</h5>
                  <small class="text-muted">Vice Principal</small>
                </div>
              </div>
              <p class="card-text">"Academix has made managing student data so easy. It's a lifesaver!"</p>
              <div class="text-warning star-rating">
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-half"></i>
              </div>
            </div>
          </div>
        </div>

        <!-- Feedback 2 -->
        <div class="col-md-3" data-aos="zoom-in" data-aos-delay="200">
          <div class="card h-100 shadow-sm feedback-card">
            <div class="card-body">
              <div class="d-flex align-items-center mb-3">
                <div class="flex-shrink-0">
                  <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
                    <i class="bi bi-person"></i>
                  </div>
                </div>
                <div class="flex-grow-1 ms-3">
                  <h5 class="card-title mb-0">Mr. Bulee</h5>
                  <small class="text-muted">Mathematics Teacher</small>
                </div>
              </div>
              <p class="card-text">"The timetable scheduler is extremely user-friendly. Highly recommend."</p>
              <div class="text-warning star-rating">
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
              </div>
            </div>
          </div>
        </div>

        <!-- Feedback 3 -->
        <div class="col-md-3" data-aos="zoom-in" data-aos-delay="300">
          <div class="card h-100 shadow-sm feedback-card">
            <div class="card-body">
              <div class="d-flex align-items-center mb-3">
                <div class="flex-shrink-0">
                  <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
                    <i class="bi bi-person"></i>
                  </div>
                </div>
                <div class="flex-grow-1 ms-3">
                  <h5 class="card-title mb-0">Mr. Nethmal</h5>
                  <small class="text-muted">Science Teacher</small>
                </div>
              </div>
              <p class="card-text">"I love the clean design and fast performance. Great for teachers!"</p>
              <div class="text-warning star-rating">
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star"></i>
              </div>
            </div>
          </div>
        </div>

        <!-- Feedback 4 -->
        <div class="col-md-3" data-aos="zoom-in" data-aos-delay="400">
          <div class="card h-100 shadow-sm feedback-card">
            <div class="card-body">
              <div class="d-flex align-items-center mb-3">
                <div class="flex-shrink-0">
                  <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
                    <i class="bi bi-person"></i>
                  </div>
                </div>
                <div class="flex-grow-1 ms-3">
                  <h5 class="card-title mb-0">BASBA S.</h5>
                  <small class="text-muted">Administrator</small>
                </div>
              </div>
              <p class="card-text">"Very efficient system. It has everything we need in one place."</p>
              <div class="text-warning star-rating">
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-half"></i>
                <i class="bi bi-star"></i>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>

  <!-- Call to Action -->
  <section class="py-5 bg-primary text-white text-center" data-aos="fade-up">
    <div class="container">
      <h2 class="mb-3">Features Of Our School Management System of Academix </h2>
      <p class="lead mb-4">Academix is a complete and feature-rich school management website for
       perfect educational perposes. This school management web site is for learning, administration, and 
       management activities of our  schools, colleges, universities, tuition centers, or training centers. 
       Our free school management system manages everything starting from admission to exams to result 
       in cards.</p>
    </div>
  </section>

  <!-- Footer -->
  <footer class="text-center py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h5>Contact Us</h5>
          <p><i class="bi bi-envelope me-2"></i> info@academix.edu</p>
          <p><i class="bi bi-telephone me-2"></i> (123) 456-7890</p>
        </div>
        <div class="col-md-4">
          <h5>Quick Links</h5>
          <ul class="list-unstyled">
            <li><a href="#" class="text-decoration-none">Home</a></li>
            <li><a href="#" class="text-decoration-none">Features</a></li>
            <li><a href="#" class="text-decoration-none">Testimonials</a></li>
          </ul>
        </div>
        <div class="col-md-4">
          <h5>Follow Us</h5>
          <div class="d-flex justify-content-center gap-3">
            <a href="#" class="text-decoration-none"><i class="bi bi-facebook fs-4"></i></a>
            <a href="#" class="text-decoration-none"><i class="bi bi-twitter fs-4"></i></a>
            <a href="#" class="text-decoration-none"><i class="bi bi-instagram fs-4"></i></a>
            <a href="#" class="text-decoration-none"><i class="bi bi-linkedin fs-4"></i></a>
          </div>
        </div>
      </div>
      <hr>
      <p class="mb-0">&copy; 2025 Academix. All rights reserved.</p>
    </div>
  </footer>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <!-- AOS Animation Library -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
  
  <!-- Custom Scripts -->
  <script>
    // Initialize AOS Animation
    document.addEventListener('DOMContentLoaded', function() {
      AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true
      });

      // Navbar scroll effect
      const navbar = document.querySelector('.navbar');
      window.addEventListener('scroll', function() {
        if (window.scrollY > 50) {
          navbar.classList.add('scrolled');
        } else {
          navbar.classList.remove('scrolled');
        }
      });

      // Smooth scroll for navigation
      document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
          e.preventDefault();
          const targetId = this.getAttribute('href');
          const targetElement = document.querySelector(targetId);
          
          if (targetElement) {
            window.scrollTo({
              top: targetElement.offsetTop - 80,
              behavior: 'smooth'
            });
          }
        });
      });

      // Counter animation for stats
      const counters = document.querySelectorAll('.counter');
      
      const options = {
        threshold: 1.0
      };
      
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            const countTo = parseInt(entry.target.getAttribute('data-count'));
            const counter = entry.target;
            let count = 0;
            const interval = setInterval(() => {
              count += Math.ceil(countTo / 100);
              counter.innerText = count;
              if (count >= countTo) {
                counter.innerText = countTo;
                clearInterval(interval);
              }
            }, 10);
            observer.unobserve(entry.target);
          }
        });
      }, options);
      
      counters.forEach(counter => {
        observer.observe(counter);
      });
    });
  </script>
</body>
</html>