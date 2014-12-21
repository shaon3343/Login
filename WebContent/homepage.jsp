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
	if(currentUser==null){
		
			response.sendRedirect("login.jsp");
		
	}
	
/* 	UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser")); */
%>
Welcome <%= currentUser.getUsername()+ " !! <br> YOUR MAIL IS: " + currentUser.getEmail() + "<br>" + "Your Address is: "+currentUser.getAddress()%>

</center>



<form action="LoginServlet" method="POST">
<input type="hidden" id="check" value="l_out" name="check" />
<input type="submit" name="logout" id="logout" value="LOG OUT"/>
</form>



</body>

<script>


</script>
</html>