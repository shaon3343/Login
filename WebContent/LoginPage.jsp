<%@page import="secureData.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	 UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));
	if(currentUser!=null){
		if(currentUser.isValid()==2){
			response.sendRedirect("UserLogged.jsp");
		}
	}
%>
<title>LOGIN PAGE</title>
</head>
<body>
	<form action="LoginServlet" >
	Please Enter your Email here : <br>
	<input type="text" name="email" id="email" /><br>
	Please Enter your Password here : <br>
	<input type="password" name="password" id="password" /><br>
<!--	Please Enter your Username here : <br>
	<input type="text" name="name" id="name" /><br> 	
		Please Enter your Address here : <br>
	<input type="text" name="address" id="address" /><br> -->
	
	<input type="submit" value="submit">
	</form>
</body>
</html>