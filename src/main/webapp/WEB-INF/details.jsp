<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Save Details</title>
</head>
<body>
	<h1>Welcome ${sessionScope.user.getUsername()}</h1>
	
	<h2>Save your Details</h2>
	
	${error}
	
	<form action="display.do" method="post">
		
		Address <input type="text" name="address" required><br><br>
		Phone Number <input type="text" name="phoneNumber"><br><br>
		Date of Birth <input type="text" name="dob"><br>
		Subjects <br><input type="checkbox" id="checkbox1" name="subjects" value="Java core">
				 <label for="checkbox1"> Java Core</label><br>
				 <input type="checkbox" id="checkbox2" name="subjects" value="Spring">
				 <label for="checkbox2"> Spring</label><br>
				 <input type="checkbox" id="checkbox3" name="subjects" value="Spring MVC">
				 <label for="checkbox3"> Spring MVC</label><br>
				 <input type="checkbox" id="checkbox4" name="subjects" value="Maven">
				 <label for="checkbox4"> Maven</label><br>
				 <input type="checkbox" id="checkbox5" name="subjects" value="Hibernate">
				 <label for="checkbox5"> Hibernate</label><br><br>
		
		Gender 	 <br><input type="radio" id="radio1" name="gender" value="Male">
				  <label for="radio1">Male</label>
				   <input type="radio" id="radio2" name="gender" value="Female">
				   <label for="radio2">Female</label><br><br>
		Describe yourself <br> <textarea name="description" rows="6" cols="50"></textarea><br><br>
		
		<input type="submit" value="Save Details"> ${info}
				
	</form>

</body>
</html>