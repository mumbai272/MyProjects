<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration page</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body><%@include file="header.jsp"%>

	<table align="center">
		<tr>
			<td><img src="images/9.png" />
			</td>
			<td>
				<!-- 				<h2>Registration page</h2> --> <img alt=""
				src="images/12.png"> <form:form commandName="user"
					action="adduser.do?bid=${sessionScope.bid}" method="post">
					<table>
						<tr>
							<td style="text-align: right;">Username :</td>
							<td><form:input path="uname" />
							</td>
							<td><form:errors path="uname" />
							</td>
						</tr>
						<tr>
							<td style="text-align: right;">Password :</td>
							<td><form:input path="pwd" />
							</td>
							<td><form:errors path="pwd" />
							</td>
						</tr>
						
						<tr>
							<td style="text-align: right;">Role :</td>
							<td><form:select items="${roles}" path="role" />
							</td>
							<td><form:errors path="role" />
							</td>
						</tr>
						<tr>
							<td><h4>Personal Details</h4></td>
						</tr>
						<tr>
							<td style="text-align: right;">Name :</td>
							<td><form:input path="name" />
							</td>
							<td><form:errors path="name" />
							</td>
						</tr>
						<tr>
							<td style="text-align: right;">Email Id :</td>
							<td><form:input path="emailId" /></td>
							<td><form:errors path="emailId" /></td>

						</tr>
						<tr>
							<td style="text-align: right;">Address :</td>
							<td><form:textarea path="address" /></td>
							<td><form:errors path="address" /></td>

						</tr>
						<tr>
							<td style="text-align: right;">PhoneNo :</td>
							<td><form:input path="phoneNo"/></td>
							<td><form:errors path="phoneNo" /></td>
						</tr>
					</table>
					<button type="submit">Register</button>
					<br />
				</form:form></td>
	</table>

</body>
</html>