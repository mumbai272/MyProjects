<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body><%@include file="header.jsp" %>
	
		<table align="center">
			<tr>
				<td><img alt="" src="images/14.jpg"></td>
				<td>
					<!-- <h2>Login Page</h2> --> <img src="images/16.jpg" /> <form:form
						commandName="user" action="check.do?bid=${sessionScope.bid}"
						method="post" >

						<table>


							<tr align="center">
								<td style="color: maroon;"><c:if test="${not empty msg}">${msg}</c:if>
								</td>
							</tr>
							<tr>
								<td>Username:</td>
								<td><form:input path="uname" /></td>
								<td style="color: red;"><form:errors path="uname" /></td>
							</tr>
							<tr>
								<td>Password:</td>
								<td><form:password path="pwd" /></td>
								<td style="color: red;"><form:errors path="pwd" /></td>
							</tr>
						</table>
						<button type="submit">login</button>
						<br />
Not registered?Register<a href="register.do?bid=${sessionScope.bid}"
							style="color: blue">here</a>
					</form:form></td>
			</tr>
		</table>

</body>
</html>