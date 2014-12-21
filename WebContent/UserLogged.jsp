<%@page import="secureData.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/angular.min.js"></script>
<script src="jquery-1.11.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>USER LOGGED IN</title>
</head>
<body>
<center>
<%
	UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));
%>
Welcome <%= currentUser.getUsername()+ " !! <br> YOUR MAIL IS: " + currentUser.getEmail() + "<br>" + "Your Address is: "+currentUser.getAddress()%>

</center>

<center>
	<!--  Angular JS Start  -->
			<div ng-app="" ng-controller="myCtrl">
		
		First Name: <input type="text" ng-model="fName"><br>
		Last Name: <input type="text" ng-model="lName"><br>
		<br>
		Full Name: {{fName + " " + lName}}
		
		
		<h2> Example of ng-init</h2>
		<div ng-init="quantity=1;cost=5">
		
		<p>Total in dollar: {{ quantity * cost }}</p>
		
		</div>
		
		
		<div ng-controller="listPeople">
		TOTAL REGESTERED USER IN DATABASE: <script>  data= $.parseJSON(data);
													console.log(data.length) </script> <br>
			<select name="allPeople" id="allPeople" >
				  <option ng-repeat="x in names"> {{x.username}} </option> 
				
			<!-- 	<option ng-bind="names"></option> -->
			</select>
		</div>
		
		</div>
		<script src="myCtrl.js">
		
		</script>
		
		
		
		<script>
		
 function listPeople($scope,$http) {
/*     $http.get("http://www.w3schools.com/website/Customers_JSON.php")
    .success(function(response) {$scope.names = response;}); */
    
    $http.get("http://localhost:8080/LoginExample/users/").success(function(response){$scope.names=response});
   
} 
</script>

<!--  Angular JS End  -->
</center>

<form action="LoginServlet" method="POST">
<input type="hidden" id="check" value="l_out" name="check" />
<input type="submit" name="logout" id="logout" value="LOG OUT"/>
</form>



</body>

<script>


</script>
</html>