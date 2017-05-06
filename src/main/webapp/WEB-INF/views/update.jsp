<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page session="false"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Update</title>
   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />" >
</head>
<body>
	<h1>Update person:</h1>
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
		<input id="editButton" type="submit" value="Edit"/>
	</sf:form>
	<h2><a href="<c:url value="/back"/>">Back to home page</a></h2>
</body>
</html>