<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 22/03/2018
  Time: 01:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Access denied</title>
    <h2>Access denied - u are not authorized to access this resource. </h2>

</head>
<body>
<a href="${pageContext.request.contextPath}/">Back to Home page</a>
</body>
</html>
