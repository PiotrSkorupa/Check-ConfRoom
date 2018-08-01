<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check Conference Room</title>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-123135737-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-123135737-1');
    </script>

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
                <a class="btn btn-two" href="/login">
                    <span>LOGIN</span>
                </a>
            </div>

            <div class="container-1">
                <a class="btn btn-two" href="/conf">
                    <span>CONFERENCE ROOMS</span>
                </a>
            </div>

        </div>

        <div class="col">
            <div class="container-1">
                <a class="btn btn-two" href="/admin">
                    <span>ADMIN PANEL</span>
                </a>
            </div>

            <div class="container-1">
                <a class="btn btn-two">
                    <span>ABOUT</span>
                </a>
            </div>
        </div>
</div>
</body>
</html>
