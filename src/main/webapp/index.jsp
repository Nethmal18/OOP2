<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Academix - Smart School System</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    /* Fullscreen Video Background */
    .video-bg {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      object-fit: cover;
      z-index: -1;
    }

    /* Overlay for better text visibility */
    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      background-color: rgba(0, 0, 0, 0.5); /* dim overlay */
      z-index: 0;
    }

    /* Hero Section */
    .hero {
      position: relative;
      z-index: 1;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      color: #fff;
    }

    .hero h1 {
      font-size: 4rem;
      font-weight: bold;
    }

    .hero p {
      font-size: 1.5rem;
    }

    .btn-custom {
      padding: 12px 30px;
      font-size: 1.2rem;
    }

    /* Smooth animation on load */
    .fade-in {
      animation: fadeIn 2s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>

  <!-- Background Video -->
  <video autoplay muted loop class="video-bg">
    <source src="gift/gift.mp4" type="video/mp4">
  </video>

  <!-- Overlay -->
  <div class="overlay"></div>

  <!-- Hero Content -->
  <div class="hero fade-in">
    <div class="container">
      <h1>Welcome to Academix</h1>
      <p class="lead">A Smart School Management System</p>
      <a href="home.jsp" class="btn btn-primary btn-lg btn-custom mt-4">Explore</a>
    </div>
  </div>

  <!-- Bootstrap JS (optional) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
