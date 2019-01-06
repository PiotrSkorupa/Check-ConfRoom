<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="/resources/css/myBtn.css" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
		body {
			background-image: url(/resources/images/yumi.jpg);
			background-repeat:no-repeat;
			-webkit-background-size:cover;
			-moz-background-size:cover;
			-o-background-size:cover;
			background-size:cover;
			background-position:center;

		}
		input[type=submit] {
			padding:15px 25px;
			background:#ccc;
			border:0 none;
			cursor:pointer;
			-webkit-border-radius: 10px;
			border-radius: 10px;
		}
	</style>

<body onload='document.loginForm.username.focus();'>

<div class="col">

	<form name='login' action="<c:url value='/check-confroom/login' />" method='POST'>
		<div class="container-1">
	<input type="text" placeholder="Username" name="username"><br>
	<input type="password" placeholder="Password" name="password"><br>
		</div>

		<input style="alignment: center" name="submit" type="submit" value="Login" />
		<c:if test="${not empty error}"><div><span style="color:red;">${error}</span></div></c:if>
		<c:if test="${not empty message}"><div><span style="color:red;">${message}</span></div></c:if>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	<form action="/check-confroom/">
		<input style="alignment: center" name="submit" type="submit" value="Start Panel" />
	</form>
	</div>
</div>

</body>
</head>
</html>