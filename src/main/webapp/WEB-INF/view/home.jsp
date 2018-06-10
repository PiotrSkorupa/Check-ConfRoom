<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
<h1>Welcome

<% String login = request.getUserPrincipal().getName();
out.print(login + "!");
%>

</h1>

</br>
<div class="main">
    <div class="main-menu">
        <ul>
            <li><a href="/about">About</a></li>
            <li><a href="/conf">Conf Room Panel</a></li>
            <li><a href="/admin">Admin Panel</a></li>
            <li><a href="/">Start</a></li>
            </br>
            <li>
                <form:form action="${pageContext.request.contextPath}/logout" method="post">
                    <span class="glyphicon glyphicon-log-out"></span>
                    <input type="submit" class="navbar" value="Logout">
                </form:form>
            </li>
        </ul>
    </div>
</div>

</body>
</html>
