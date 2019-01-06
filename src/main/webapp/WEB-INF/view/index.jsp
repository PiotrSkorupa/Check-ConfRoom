<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII" isErrorPage="true"%>
<html>
<head>
    <title>Check Conference Room</title>
</head>
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
</style>
<body>
        <div class="col">
            <div class="container-1">
                <a class="btn btn-two" href="/check-confroom/login">
                    <span>LOGIN</span>
                </a>
            </div>

            <div class="container-1">
                <a class="btn btn-two" href="/check-confroom/conf">
                    <span>CONFERENCE ROOMS</span>
                </a>
            </div>

        </div>

        <div class="col">
            <div class="container-1">
                <a class="btn btn-two" href="/check-confroom/admin">
                    <span>ADMIN PANEL</span>
                </a>
            </div>

            <div class="container-1">
                <a class="btn btn-two" href="/check-confroom/error">
                    <span>ABOUT</span>
                </a>
            </div>
        </div>
</div>
</body>
</html>
