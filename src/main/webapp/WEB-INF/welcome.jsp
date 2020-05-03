<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
              <h2 class="text-black h1 site-section-heading">Welcome ${sessionScope.owner.getFullname()}</h2>
            </div>
          </div>
          <div class="row">
            <div class="col-md-7 mb-5">
  				
  		<form action="saveproperties.do" method="post" id="listp">
	        <h3>List a Property</h3><br>
			<h5 class="text-black">You are:*</h5> 
	        <div class="form-check m-1  form-check-inline">
	          <input class="form-check-input" type="radio" name="ownerType" id="inlineRadio1" value="Owner">
	          <label class="form-check-label" for="inlineRadio1">Owner</label>
	        </div>
	        <div class="form-check form-check-inline">
	          <input class="form-check-input" type="radio" name="ownerType" id="inlineRadio2" value="Dealer">
	          <label class="form-check-label" for="inlineRadio2">Dealer</label>
	        </div>
			<h5 class="text-black"><br>List property for:*</h5> 
			<div class="form-group">
	        <select class="form-control m-1 col-md-3" name="listing">
	          <option value="Sell">Sale</option>
	          <option value="Rent">Rent</option>
	        </select>
	      </div>
	        
			<h5>Property Type:*</h5>
	         <div class="form-check m-1  form-check-inline">
	          <input class="form-check-input" type="radio" name="propertyType" id="inlineRadio1" value="Apartment">
	          <label class="form-check-label" for="inlineRadio1">Aparment</label>
	        </div>
	        
	        <div class="form-check form-check-inline">
	          <input class="form-check-input" type="radio" name="propertyType" id="inlineRadio2" value="House">
	          <label class="form-check-label" for="inlineRadio2">House</label>
	        </div>
	        
	        <div class="form-check form-check-inline">
	          <input class="form-check-input" type="radio" name="propertyType" id="inlineRadio3" value="Residential Land">
	          <label class="form-check-label" for="inlineRadio3">Residential Land</label>
	        </div>
	        
	        <div class="form-check form-check-inline">
	          <input class="form-check-input" type="radio" name="propertyType" id="inlineRadio4" value="Office Space">
	          <label class="form-check-label" for="inlineRadio4">Office Space</label>
	        </div>
	        
	        <div class="form-check form-check-inline">
	          <input class="form-check-input" type="radio" name="propertyType" id="inlineRadio5" value="Warehouse">
	          <label class="form-check-label" for="inlineRadio5">Warehouse</label>
	        </div>
	
			<h5><br>Where is the Property Located ?*</h5>
	        
	        <div class="form-group m-1 col-md-6">
	            <label for="inputAddress">Address</label>
	            <input type="text" class="form-control" name ="address" id="inputAddress" placeholder="1234 Main St" required>
	        </div>
	        <div class="form-row">
	            <div class="form-group ml-3 col-md-3">
	              <label for="inputCity">City</label>
	              <input type="text" name="city" class="form-control" id="inputCity" required>
	            </div>
	            <div class="form-group col-md-3">
	              <label for="inputState">State</label>
	              <select name="state" id="inputState" class="form-control">
	                <option value="AL">Alabama</option>
	                <option value="AK">Alaska</option>
	                <option value="AZ">Arizona</option>
	                <option value="AR">Arkansas</option>
	                <option value="CA">California</option>
	                <option value="CO">Colorado</option>
	                <option value="CT">Connecticut</option>
	                <option value="DE">Delaware</option>
	                <option value="DC">District Of Columbia</option>
	                <option value="FL">Florida</option>
	                <option value="GA">Georgia</option>
	                <option value="HI">Hawaii</option>
	                <option value="ID">Idaho</option>
	                <option value="IL">Illinois</option>
	                <option value="IN">Indiana</option>
	                <option value="IA">Iowa</option>
	                <option value="KS">Kansas</option>
	                <option value="KY">Kentucky</option>
	                <option value="LA">Louisiana</option>
	                <option value="ME">Maine</option>
	                <option value="MD">Maryland</option>
	                <option value="MA">Massachusetts</option>
	                <option value="MI">Michigan</option>
	                <option value="MN">Minnesota</option>
	                <option value="MS">Mississippi</option>
	                <option value="MO">Missouri</option>
	                <option value="MT">Montana</option>
	                <option value="NE">Nebraska</option>
	                <option value="NV">Nevada</option>
	                <option value="NH">New Hampshire</option>
	                <option value="NJ">New Jersey</option>
	                <option value="NM">New Mexico</option>
	                <option value="NY">New York</option>
	                <option value="NC">North Carolina</option>
	                <option value="ND">North Dakota</option>
	                <option value="OH">Ohio</option>
	                <option value="OK">Oklahoma</option>
	                <option value="OR">Oregon</option>
	                <option value="PA">Pennsylvania</option>
	                <option value="RI">Rhode Island</option>
	                <option value="SC">South Carolina</option>
	                <option value="SD">South Dakota</option>
	                <option value="TN">Tennessee</option>
	                <option value="TX">Texas</option>
	                <option value="UT">Utah</option>
	                <option value="VT">Vermont</option>
	                <option value="VA">Virginia</option>
	                <option value="WA">Washington</option>
	                <option value="WV">West Virginia</option>
	                <option value="WI">Wisconsin</option>
	                <option value="WY">Wyoming</option>
	            </select>				
	    
	            </div>
	            <div class="form-group col-md-3">
	              <label for="inputZip">Zip</label>
	              <input type="text" class="form-control" name="zipcode"  id="inputZip" required><br>
	            </div>
	        </div>
	
	            <h5>Give us some more Information about the property ?</h5> 
	
			<div class="wrap-input100 validate-input">
	            
	            <div class="form-group my-2 row">
	                <div class="col-sm-4">
	                  <input required type="number" min="0" name="squareFootage" class="form-control" id="inputEmail3" placeholder="Square Footage">
	                </div>
	                <label for="inputEmail3" class="col-sm-2 col-form-label">sq.ft.</label>
	            </div>
	            
	            <label for="bedroom"><br>Bedrooms / rooms:*</label>
	            <select id="bedroom" name="bedrooms">
	                <option value="1">1</option>
	                <option value="2">2</option>
	                <option value="3">3</option>
	                <option value="4">4</option>
	                <option value="5+">5+</option>
	            </select>
	            <label for="bathroom">Bathrooms:*</label>
	            <select id="bathroom" name="bathrooms">
	            <option value="1">1</option>
	                <option value="2">2</option>
	                <option value="3">3</option>
	                <option value="4">4</option>
	                <option value="5+">5+</option>
	            </select> <br><br>
	            Furnishing:*
	            <select name="furnished">
	            <option value="furnished">Furnished</option>
	                <option value="semifurnished">Semifurnished</option>
	                <option value="unfurnished">Unfurnished</option>
	            </select> <br><br>
	            Total Floors:*
	            <select name="floorsNum">
	            <option value="1">1</option>
	                <option value="2">2</option>
	                <option value="3">3</option>
	                <option value="4">4</option>
	                <option value="5+">5+</option>
	            </select><br><br>
	            Availability:*
	            <select name="availability">
	                <option value="ready to move">Ready to move</option>
	                <option value="under construction">Under construction</option>
	            </select>
	            <h5><br><br>Add some details about pricing...<br></h5>
	           <br> Ownership:*
	            <select name="ownershipType">
	                <option value="freehold">Freehold</option>
	                <option value="leasehold">Leasehold</option>
	                <option value="co-operative society">Co-operative Society</option>
	                <option value="power of attorney">Power of Attorney</option>
	            </select> <br><br>
	            
	            <div class="form-group row">
	                <div class="col-sm-4">
	                  <input type="number" min="0" name="price" class="form-control" id="price" placeholder="Price" required>
	                </div>
	                <label for="price" class="col-sm-2 col-form-label">$</label><br>
	            </div>
	           
	
	            <h6>Amenitities:* </h6><br>
	                <input type="checkbox" id="checkbox1" name="amenities" value="Swimming Pool">
	                     <label for="checkbox1"> Swimming Pool</label>
	                     <input type="checkbox" id="checkbox2" name="amenities" value="Gym">
	                     <label for="checkbox2"> Gym</label>
	                     <input type="checkbox" id="checkbox3" name="amenities" value="Free Cable TV">
	                     <label for="checkbox3"> Free Cable TV</label>
	                     <input type="checkbox" id="checkbox4" name="amenities" value="Wifi">
	                     <label for="checkbox4"> Free Wifi</label>
	                     <input type="checkbox" id="checkbox5" name="amenities" value="Others">
	                     <label for="checkbox4"> Others</label><br><br>
	            
	            <div class="form-group my-2 row">
	                <div class="col-sm-6">
	                  <input required type="text" max="80" name="description" class="form-control" id="inputdesc" placeholder="max 80 characters">
	                </div>
	                <label for="inputdesc" class="col-form-label">Describe your Property</label>
	            </div>
	            
	            <button onsubmit="success()" type="submit" form="listp" class="btn btn-primary">List Property</button>
	            ${requestScope.error}
	        </div>
		</form>
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
									<a href="#" class="site-btn ">we are hiring</a>
								</div>
							</div>
						</div>
					</div>
				
	
	
	 <div class="row pt-5 mt-5 text-center">
			  <div class="col-md-12">
				<div class="border-top pt-5">
				<p>
				
				Copyright &copy;<script>document.write(new Date().getFullYear());</script> All Right Reserved | Built by <a href="#top">Delva MARC</a></p>
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
	

	<script src="js/main.js"></script>
	<script>
		function success(){
			alert("Your property has been successfully listed.")
		}
	</script>

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