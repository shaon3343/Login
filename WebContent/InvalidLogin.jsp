<%@page import="secureData.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>INVALID LOGIN </title>
</head>
<body>
<center>
<%
	UserBean current = (UserBean)(session.getAttribute("currentSessionUser"));
	if(current.isValid()==0){
		
	
%>

SORRY You are not Registered !! Please Register first . 
<%  
		
	}
%>
</center>
</body>
</html>