<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Persons</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css"/>">
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script>	
				var contextPath = "<%=request.getContextPath() %>";

				function showAddForm() {
					var elem = document.getElementById('addDiv');
					elem.style.visibility = 'visible';
				}
	
				function invisibleErrors() {
					var firstName = document.getElementById('firstName');
					firstName.style.visibility = 'hidden';
					var lastName = document.getElementById('lastName');
					lastName.style.visibility = 'hidden';
					var address = document.getElementById('address');
					address.style.visibility = 'hidden';
					var email = document.getElementById('email');
					email.style.visibility = 'hidden';
					var number = document.getElementById('number');
					number.style.visibility = 'hidden';
				}
	
				function doAjaxGetAdd() {
					var request = $.ajax({
						url: "add",
						type: "GET",			
						dataType: "html"
					});

					request.done(function(msg) {
						alert( "Add");
						$("#addDiv").html(msg);			
					});

					request.fail(function(jqXHR, textStatus) {
						alert( "Request failed: " + textStatus );
					});
				}
			
				function doAjaxGetCancel() {
					var request = $.ajax({
						url: "back",
						type: "GET",			
						dataType: "html",
			        	     success: function(response){
			        	    	 window.location.href = ''; 
			        	     },
			        	     error: function(e){
			        	        alert('Error: ' + e);
			        	     }
					});
				}
			
		        function doAjaxPost() {
		        	 var firstName = $('#ifirstName').val();
		        	 var lastName = $('#ilastName').val();
		        	 var address = $('#iaddress').val();
		        	 var email = $('#iemail').val();
		        	 var number = $('#inumber').val();
		        	 invisibleErrors();
		        	 $.ajax({
		        		 type: "POST",
		        	     url: contextPath + "/add",
		        	     data: "firstName=" + firstName + "&lastName=" + lastName
		        	     + "&address=" + address + "&email=" + email + "&number=" + number,
		        	     success: function(response){
					         $(".errors").empty();	
		        	    	 if(response.status=="SUCCESS") {
		        	    		 var rowString = "";
		        	    		 rowString += "<tr> <td>" + response.result.firstName + "</td>";
		        	    		 rowString += "<td>" + response.result.lastName + "</td>";
		        	    		 rowString += "<td>" + response.result.address + "</td>";
		        	    		 rowString += "<td>" + response.result.email + "</td>";
		        	    		 rowString += "<td>" + response.result.number + "</td>";
		        	    		 rowString += "<td> <a href='<c:url value='/update?id="+response.result.id+"'/>'>Update person</a> </td>";
		        	    		 rowString += "<td> <a href='<c:url value='/delete?id="+response.result.id+"'/>'>Delete person</a> </td> </tr>";
		        	    		 $('#persons tr:last').after(rowString);
		        	    		 var elem = document.getElementById('addDiv');
		     					 elem.style.visibility = 'hidden';

		        	    	 } else if(response.status=="FAIL"){
				        	    	for(i =0 ; i < response.result.length ; i++){
				    					var elem = document.getElementById(response.result[i].field);
				    					elem.style.visibility = 'visible';
				        	    		$('#'+response.result[i].field).append(response.result[i].defaultMessage+'<br>');
				        	    	}
				        	    	showAddForm();
		        	    	 }

		        	     },
		        	     error: function(e){
		        	        alert('Error: ' + e);
		        	     }
		        	 });
	 	        }
	</script>
</head>
<body>
	<h1>
		Welcome to this application  
	</h1>
	<h2>Persons:</h2>
	<table id="persons">
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
	</table><br>
	<input type="button" value="Add persons" onclick="showAddForm()" /><br><br>
	<div id="addDiv" style="visibility: hidden">
		<sf:form method="POST" commandName="person" cssClass="addForm"><br>
			<h1>Add person:</h1>
			<sf:label path="firstName" cssErrorClass="error">First Name</sf:label>:
			<sf:input path="firstName" cssErrorClass="error" id="ifirstName"/> <br><br>
			<div class="errors" id="firstName" style="visibility: hidden"></div> <br>
			<sf:label path="lastName" cssErrorClass="error">Last Name</sf:label>:
			<sf:input path="lastName" cssErrorClass="error" id="ilastName"/>  <br><br>
			<div class="errors" id="lastName" style="visibility: hidden"> </div> <br>
			<sf:label path="address" cssErrorClass="error">Address</sf:label>:
			<sf:input path="address" cssErrorClass="error" id="iaddress"/>  <br><br>
			<div class="errors" id="address" style="visibility: hidden"> </div> <br>
			<sf:label path="email" cssErrorClass="error">Email</sf:label>:
			<sf:input path="email" cssErrorClass="error" id="iemail"/>  <br><br>
			<div class="errors" id="email" style="visibility: hidden"></div> <br>
			<sf:label path="number" cssErrorClass="error">Telephone number</sf:label>:
			<sf:input path="number" cssErrorClass="error" id="inumber"/>  <br><br>
			<div class="errors" id="number" style="visibility: hidden"> </div> <br>
			<input id="addButton" type="button" value="Add" onclick="doAjaxPost()"/><br><br>
			<input id="cancelButton" type="button" value="Cancel" onclick="doAjaxGetCancel()"/><br><br>
		</sf:form>
	</div><br><br>

	<a href="<c:url value="/logout" />" > Logout</a>
</body>
</html>