<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>List | Marc Real Estate</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Favicon -->
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700,700i,900%7cRoboto:400,400i,500,500i,700,700i&display=swap" rel="stylesheet">

 
	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/slicknav.min.css"/>
	
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">

    <link rel="stylesheet" href="css/jquery.fancybox.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="css/style.css"/>

</head>
<body>

<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section -->
	<header class="header-section">
		<a href="index.html" class="site-logo">
			<h1 class="mb-0 site-logo"><a href="index" class="text-danger h2 mb-0">Marc Real Estate<span class="text-danger">.</span> </a></h1>
		</a>
		<nav class="header-nav">
			<ul class="main-menu">
				<li><a href="index" class="active">Home</a></li>
				<li><a href="listprop">List a Property</a></li>
				<li><a href="#">About Us</a></li>
				<li><a href="contact">Customer Service</a></li>
				
				<li><c:choose><c:when test="${sessionScope.owner == null }"><a href="#">My Profile</a></c:when><c:otherwise><a href="#">${sessionScope.owner.getFullname()}</a></c:otherwise></c:choose>
					<ul class="sub-menu">
						<li><a href="seelist">See Listings</a></li>
						<li><a href="profile">View Profile</a></li>
						<li><a href="postprop.do">List a Property</a></li>
						<li><a href="logout.do">Logout</a></li>
					</ul>
				</li>
				
			</ul>
			<div class="header-right">
				<div class="user-panel">
					<button type="button" class="btn btn-primary" >
						<a href="login">Log in</a>
					  </button>
	
					  <button type="button" class="btn btn-primary">
						<a href="register">Register</a>
					  </button>
				</div>
			</div>
			
		</nav>
	</header>
	<!-- Header Section end -->
	
	<br><br><br><br><br><br><br>
    <section class="site-section bg-light" id="contact-section">
        <div class="container">
          <div class="row mb-5">
            <div class="col-12 text-center">
              <h2 class="text-black h1 site-section-heading">My Properties</h2>
            </div>
          </div>
          <div class="row">
            <div class="col-md-7 mb-5">
            	<div>
					<p>${requestScope.noResult}</p>
					<c:forEach items="${list}" var="details">
						<p><a href="search?id=${details.id}" target="_blank">${details.description}</a></p>
						<p>Property Type: ${details.propertyType}</p>
						<p>Size: ${details.squareFootage} sq.ft.</p>
						<p>Furnished: ${details.furnished}</p>
						<p>City: ${details.city}</p>
						<p>Availability: ${details.availability}</p>
						<p>Price: $ ${details.price}</p><br>
					</c:forEach>
				</div>
            </div>
          </div>
         </div>
      </section>

	  <!-- Footer Section -->
	<footer class="footer-section">
		<div class="container">
			<div class="row text-white">
				<div class="col-lg-4">
					<div class="footer-widger">
						<div class="about-widget">
							<div class="aw-text">
								<img src="img/footer-logo.png" alt="">
								<p> </p>
								<a href="#" class="site-btn ">We are hiring</a>
							</div>
						</div>
					</div>
				</div>
			


 <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <div class="border-top pt-5">
            <p>
            
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All Right Reserved | Built by <a href="#top">MARC</a>
            
            </p>
            </div>
          </div>
          
        </div>
</div>
		</div>
	</footer>
	<!-- Footer Section end -->
	
	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>