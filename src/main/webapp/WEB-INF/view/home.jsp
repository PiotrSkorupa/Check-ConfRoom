<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/css/myBtn.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    body {
        background-image: url(/resources/images/yumi.jpg);
        background-repeat: no-repeat;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        background-position: center;
    }
    h3 {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 20px;
        color: #cf1007;
        position: fixed;
        top: 1em;
        left: 1em;
    }
</style>
<body>

<h3><% String login = request.getUserPrincipal().getName();
    out.print("Hello " +login + "!");%>
</h3>


<div class="col">
    <div class="container-1">
        <a class="btn btn-two" href="/check-confroom/conf">
            <span>Conference Rooms Panel</span>
        </a>
    </div>

    <div class=" container-1">
        <a class="btn btn-two" href="/check-confroom/admin">
            <span>Admin Panel</span>
        </a>
    </div>

    <div class="container-1">
        <a class="btn btn-two" href="/check-confroom/">
            <span>Start Panel</span>
        </a>
    </div>

    <div class="container-5">
        <a class="btn btn-four" href="/check-confroom/login?logout">
            <span>LOGOUT</span>
        </a>
    </div>
</div>

</body>
</html>
