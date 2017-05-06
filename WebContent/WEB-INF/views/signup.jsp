<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sign Up</title>
   	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />" >
</head>
<body>
	<h1>Sign Up:</h1>
	<sf:form method="POST" commandName="user">
		<sf:label path="username" cssErrorClass="error">Username</sf:label>:
		<sf:input path="username" cssErrorClass="error"/> <br><br>
		<sf:errors path="username" element="div" cssClass="errors"/> <br><br>
		<sf:label path="password" cssErrorClass="error">Password</sf:label>:
		<sf:password path="password" cssErrorClass="error"/>  <br><br>
		<sf:errors path="password" element="div" cssClass="errors"/> <br><br>
		<sf:label path="password" cssErrorClass="error">Confirm password</sf:label>:
		<sf:password name="confirmPassword" path="" cssErrorClass="error"/>  <br><br>
		<div class="confirmPassword">${message}</div>
		<sf:errors path="password" element="div" cssClass="errors"/> <br><br>
		<input id="signUpButton" type="submit" value="Sign Up"/>
	</sf:form>
	<h2><a href="<c:url value="/cancel"/>">Cancel</a></h2>
</body>
</html>