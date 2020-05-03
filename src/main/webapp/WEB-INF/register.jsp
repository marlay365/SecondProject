<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Register | Marc Real Estate</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="img/favicon.ico"/>
<!--===============================================================================================-->
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
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<header class="header-section">
		<a href="index.html" class="site-logo">
			<h1 class="mb-0 site-logo"><a href="index" class="text-danger h2 mb-0">Marc Real Estate<span class="text-danger">.</span> </a></h1>
		</a>
		<nav class="header-nav">
			<ul class="main-menu">
				<li><a href="index" class="active">Home</a></li>
				<li><a href="lisprop">List a Property</a></li>
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

    <br><br><br><br><br><br><br>
    <section class="site-section bg-light" id="contact-section">
        <div class="container">
          <div class="row mb-5">
            <div class="col-12 text-center">
              <h2 class="text-black h1 site-section-heading">Create a New Account for Free</h2>
            </div>
          </div>
          <div class="row">
            <div class="col-md-7 mb-5">
  
              
              <form action="register.do" method="post" class="p-5 bg-white">
                
                <h2 class="h4 text-black mb-5">Register</h2>
                    
                <div class="row form-group">
                    <div class="text-danger">${requestScope.error}</div>
                </div>
                  
                <div class="row form-group">
                  
                  <div class="col-md-12">
                    <label class="text-black" for="fullname">Fullname</label> 
                    <input type="text" id="fullname" name="fullname" class="form-control" placeholder="Please enter your fullname">
                  </div>
                </div>
                  
                <div class="row form-group">
                  
                  <div class="col-md-12">
                    <label class="text-black" for="email">Email</label> 
                    <input type="text" id="email" name="email" class="form-control" placeholder="Please enter your email">
                  </div>
                </div>
                  
                <div class="row form-group">
                  
                  <div class="col-md-12">
                    <label class="text-black" for="password">Password</label> 
                    <input type="password" id="password" name="password" class="form-control" placeholder="password must include at least one number, one letter, and 6 characters">
                  </div>
                </div>
                  
                <div class="row form-group">
                  
                  <div class="col-md-12">
                    <label class="text-black" for="pass2">Confirm Password</label> 
                    <input type="password" id="pass2"  name="pass2" class="form-control" placeholder="Please confirm your password">
                  </div>
                </div>
  
                <div class="row form-group">
                  
                  <div class="col-md-12">
                    <label class="text-black" for="address">Address</label> 
                    <input type="text" id="address" name="address" class="form-control" placeholder="Please enter your address">
                  </div>
                </div>
                  
                 <div class="row form-group">
                  
                  <div class="col-md-12">
                    <label class="text-black" for="pnum">Phone Number</label> 
                    <input type="text" id="pnum" name="phoneNum" class="form-control" placeholder="Please enter your phone number">
                  </div>
                </div>
  
                <div class="row form-group">
                  <div class="col-md-12">
                    <input type="submit" value="Register" class="btn btn-primary btn-md text-white">
                  </div>
                </div>
  
              </form>
            </div>
              
            </div>
          </div>
      </section>



	<div id="dropDownSelect1"></div>
		<!-- Footer Section -->
		<footer class="footer-section">
			<div class="container">
				<div class="row text-white">
					<div class="col-lg-4">
						<div class="footer-widger">
							<div class="about-widget">
								<div class="aw-text">
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
				
				Copyright &copy;<script>document.write(new Date().getFullYear());</script> All Right Reserved | Built by <a href="#top" >MARC</a>
				
				</p>
				</div>
			  </div>
			  
			</div>
	</div>
			</div>
		</footer>
		<!-- Footer Section end -->

<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="js/map-custom.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

</body>
</html>
