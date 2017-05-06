<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<html>
<body>
	<sf:form method="POST" commandName="person" cssClass="addForm"><br>
		<h1>Add person:</h1>
		<sf:label path="firstName" cssErrorClass="error">First Name</sf:label>:
		<sf:input path="firstName" cssErrorClass="error" id="firstName"/> <br><br>
		<sf:errors path="firstName" element="div" cssClass="errors"/> <br><br>
		<sf:label path="lastName" cssErrorClass="error">Last Name</sf:label>:
		<sf:input path="lastName" cssErrorClass="error" id="lastName"/>  <br><br>
		<sf:errors path="lastName" element="div" cssClass="errors"/> <br><br>
		<sf:label path="address" cssErrorClass="error">Address</sf:label>:
		<sf:input path="address" cssErrorClass="error" id="address"/>  <br><br>
		<sf:errors path="address" element="div" cssClass="errors"/> <br><br>
		<sf:label path="email" cssErrorClass="error">Email</sf:label>:
		<sf:input path="email" cssErrorClass="error" id="email"/>  <br><br>
		<sf:errors path="email" element="div" cssClass="errors"/> <br><br>
		<sf:label path="number" cssErrorClass="error">Telephone number</sf:label>:
		<sf:input path="number" cssErrorClass="error" id="number"/>  <br><br>
		<sf:errors path="number" element="div" cssClass="errors"/> <br><br>
		<input id="addButton" type="button" value="Add" onclick="doAjaxPost()"/><br><br>
		<input id="cancelButton" type="button" value="Cancel" onclick="doAjaxGetCancel()"/><br><br>
	</sf:form>

</body>
</html>