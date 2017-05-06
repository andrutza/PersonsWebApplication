<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Persons</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css"/>">
</head>
<body>
	<h1>Persons:</h1>
	<table class="persons">
		<tr>
			<th>First name</th>
			<th>Last name</th>
			<th>Address</th>
			<th>Email</th>
			<th>Phone number</th>
			<th>Update operation</th>
			<th>Delete operation</th>
		</tr>
		   <c:forEach items="${personList}" var="person" >
		     <tr id="person_<c:out value="person.id"/>">
		       <td class="personFirstName">
		       		<c:out value="${person.firstName}" />
		       </td>
		       <td class="personLastName"><c:out value="${person.lastName}" /></td>
         	   <td class="personAddress"><c:out value="${person.address}" /></td>
         	   <td class="personEmail"><c:out value="${person.email}" /></td>
               <td class="personNumber"><c:out value="${person.number}" /></td>
               <td class="update">
	               <a href="<c:url value="/update?id=${person.id}"/>">Update person</a>
               </td>
               <td class="delete">
	               <a href="<c:url value="/delete?id=${person.id}"/>">Delete person</a>
               </td>
		     </tr>
		   </c:forEach>
	</table>
	<h2><a href="<c:url value="/back"/>">Back to home page</a></h2>

</body>
</html>