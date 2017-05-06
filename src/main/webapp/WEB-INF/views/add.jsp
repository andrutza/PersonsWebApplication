<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add</title>
   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />" >
</head>
<body>
	<h1>Add person:</h1>
	<sf:form method="POST" commandName="person">
		<sf:label path="firstName" cssErrorClass="error">First Name</sf:label>:
		<sf:input path="firstName" cssErrorClass="error"/> <br><br>
		<sf:errors path="firstName" element="div" cssClass="errors"/> <br><br>
		<sf:label path="lastName" cssErrorClass="error">Last Name</sf:label>:
		<sf:input path="lastName" cssErrorClass="error"/>  <br><br>
		<sf:errors path="lastName" element="div" cssClass="errors"/> <br><br>
		<sf:label path="address" cssErrorClass="error">Address</sf:label>:
		<sf:input path="address" cssErrorClass="error"/>  <br><br>
		<sf:errors path="address" element="div" cssClass="errors"/> <br><br>
		<sf:label path="email" cssErrorClass="error">Email</sf:label>:
		<sf:input path="email" cssErrorClass="error"/>  <br><br>
		<sf:errors path="email" element="div" cssClass="errors"/> <br><br>
		<sf:label path="number" cssErrorClass="error">Telephone number</sf:label>:
		<sf:input path="number" cssErrorClass="error"/>  <br><br>
		<sf:errors path="number" element="div" cssClass="errors"/> <br><br>
		<input id="addButton" type="submit" value="Add"/>
	</sf:form>
	<h2><a href="<c:url value="/back"/>">Back to home page</a></h2>
</body>
</html>