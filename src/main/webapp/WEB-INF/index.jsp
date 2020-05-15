<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>Home | Marc Real Estate </title>
	<meta charset="UTF-8">
	<meta name="description" content="Real estate website">
	<meta name="keywords" content="real estate, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
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
	<script src="js/jquery-3.2.1.min.js"></script>
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
				
				<li><c:choose><c:when test="${sessionScope.owner == null}"><a href="#">My Profile</a></c:when><c:otherwise><a href="#">${sessionScope.owner.getFullname()}</a></c:otherwise></c:choose>
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

	<!-- Hero Section end -->
	<section class="hero-section set-bg" data-setbg="img/hero-bg.jpg">
		<div class="container" >
		

			<div class="hero-warp" >
				<form class="main-search-form" action="search.do" id="myform">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="search-type" >
						<div class="st-item">
							<input type="radio" value="Apartment" name="propType" id="buy" checked>
							<label for="buy">Apartment</label>
						</div>
						<div class="st-item">
							<input type="radio" value="House" name="propType" id="rent">
							<label for="rent">House</label>
						</div>
						<div class="st-item">
							<input type="radio" value="Residential Land" name="propType" id="sell">
							<label for="sell">Residential Land</label>
						</div>
						<div class="st-item">
							<input type="radio" value="Office Space" name="propType" id="property">
							<label for="property">Office Space</label>
						</div>
						<div class="st-item">
							<input type="radio" value="Warehouse" name="propType" id="agents">
							<label for="agents">Warehouse</label>
						</div>                                                           
					</div>
					<div class="search-input">
						<input type="text" name="city" id="myinput" onkeypress="elastic()" placeholder="Search by City / Project Name" required>
                        <button type="submit" form="myform" class="site-btn ">Search</button>
					</div>
					<div class="form-group row">
                        <h5 class="text-danger ml-3 mr-2 my-1">Availability</h5>
                    <select name="availability">
                        <option></option>
                        <option value="Ready to move">Ready to move</option>
                        <option value="Under construction">Under construction</option>
                    </select>
                    <h5 class="text-danger ml-5 mr-2 my-1">Bedrooms</h5>
                    <select name="bedrooms">
                        <option></option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5+">5+</option>
                    </select>
                        <h5 class="text-danger ml-3 mr-2 my-1">Price Range</h5>
                    <input type="number" name="range1" value="0" placeholder="From">
                        <h5 class="text-danger ml-3 mr-2 my-1">To</h5> 
                        <input type="number"  value="0" name="range2" placeholder="To">
                    </div>
					<p class="text-danger">Extremely precise research</p>
				</form>
			</div>
		</div>
        
	</section>
	<!-- Hero Section end -->

	
	<!-- Property Section -->
	<section class="property-section">
		<div class="container">
			<div class="section-title">
				<br>
				<h2>Recently Added Properties</h2>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="property-item">
						<div class="pi-image">
							<img src="img/property/1.jpg" alt="">
							<div class="pi-badge new">New</div>
						</div>
						<h3>$469,000</h3>
						<h5>3 Bedrooms Townhouse</h5>
						<p></p>
						<a href="#" class="readmore-btn ">Find out more</a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="property-item">
						<div class="pi-image">
							<img src="img/property/2.jpg" alt="">
							<div class="pi-badge offer">Offer</div>
						</div>
						<h3>$369,000</h3>
						<h5>3 Bedrooms Townhouse</h5>
						<p></p>
						<a href="#" class="readmore-btn ">Find out more</a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="property-item">
						<div class="pi-image">
							<img src="img/property/3.jpg" alt="">
							<div class="pi-badge new">New</div>
						</div>
						<h3>$560,000</h3>
						<h5>3 Bedrooms Townhouse</h5>
						<p></p>
						<a href="#" class="readmore-btn ">Find out more</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Property Section end -->

	
	
	

	<!-- Footer Section -->
	<footer class="footer-section">
		<div class="container">
			<div class="row text-white">
				<div class="col-lg-4">
					<div class="footer-widger">
						<div class="about-widget">
							<div class="aw-text">
								<!--<img src="img/footer-logo.png" alt="">-->
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
	   <script type=text/javascript>
	        function elastic(){
	           
	            var x = document.getElementById("myinput").value
	            console.log(x)
	            
	            fetch(`http://localhost:9200/propertydetails/_search?q=(city:${x})`)
	            .then(res => res.json())
	            .then(data => {
	              
	                var xy = data.hits.hits.map(i => i._source.city)
	                
	                fetch(`http://localhost:9200/propertydetails/_search?q=(description:${x})`)
	                .then(res => res.json())
	                .then(data => {
	                    var xz = data.hits.hits.map(i => i._source.description)
	                    var xyz = xy.concat(xz);
	                    xyz.sort()
	//                    xyz.forEach(function(entry) {
	//                      console.log(entry)
	//                    })
	                    $("#myinput").autocomplete({source: xyz})
	                 })
	
	        
	            })
               
    }
    </script>
	
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>

	<script src="js/main.js"></script>
	
	</body>
</html>
