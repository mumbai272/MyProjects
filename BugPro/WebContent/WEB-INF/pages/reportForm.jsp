<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form:form method="post" action="addReport.view" commandName="report">
<fieldset>
<h3>Report Bugs</h3><br/>
EmpId:<form:select path="reportedBy.empId" items="${NonCIS}"/><br/>
Desc<form:input path="bugDesc"/><form:errors path="bugDesc" /><br/>
Reported Date:<form:input path="reportedDate"/><form:errors path="reportedDate" /><br/>
<button type="submit">Report</button><br/>
<a href="index.jsp">Home</a>
</fieldset>
</form:form>

</body>
</html>