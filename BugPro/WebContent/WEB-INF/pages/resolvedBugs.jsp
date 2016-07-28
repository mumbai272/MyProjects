<%@page import="com.mindtree.entity.Employee"%>
<%@page import="com.mindtree.entity.Bugs"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Resolved Bugs</h3><br/>
	<br />
	<table border="1">
		<tr>
			<th>BId</th>
			<th>BugDescription</th>
			<th>ReportedDate</th>
			<th>ReportedBy</th>
			<th>ResolvedBy</th>
			<th>ResolvedDate</th>
		</tr>
		<%List<Bugs> list=(List<Bugs>)request.getAttribute("rbugs");
		for(int i=0;i<list.size();i++){
		Bugs b=list.get(i);
		Employee e=(Employee)b.getReportedBy();
		Employee e1=(Employee)b.getResolvedBy();%>
		<tr>
			<td><%=b.getBugId() %></td>
			<td><%=b.getBugDesc() %></td>
			<td><%=b.getReportedDate() %></td>
			<td><%=e.getName()%></td>
			<td><%=e1.getName()%></td>
			<td><%=b.getResolvedDate() %></td>
			
		</tr>


		<% }%>
	</table><br/>
	<a href="index.jsp">Home</a>

</body>
</html>