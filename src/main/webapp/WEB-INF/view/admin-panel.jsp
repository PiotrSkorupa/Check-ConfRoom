<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin panel</title>
    <h2>Admin panel </h2>

</head>
<body>
<input type="button" value="Conf Room Panel"
       onclick="window.location.href='conf';return false;"
       class="add-button">
<security:authorize access="hasRole('ADMIN')">
<input type="button" value="User Panel"
       onclick="window.location.href='admin/showUser';return false;"
       class="add-button">
</security:authorize>
<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <span class="glyphicon glyphicon-log-out"></span>
    <input type="submit" class="navbar" value="Logout">
</form:form>
</body>
</html>
