<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Conference Rooms</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="/static/fontawesome/fontawesome-all.css" rel="stylesheet">
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop() > 100) {
                    $('.scrollup').fadeIn();
                } else {
                    $('.scrollup').fadeOut();
                }
            });
            $('.scrollup').click(function () {
                $("html, body").animate({
                    scrollTop: 0
                }, 600);
                return false;
            });
        });
    </script>
    <style>
        body {
            background-repeat:no-repeat;
            -webkit-background-size:cover;
            -moz-background-size:cover;
            -o-background-size:cover;
            background-size:cover;
            background-position:center;
            background-attachment:fixed;
        }
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        footer {
            background-color: #f2f2f2;
            padding: 25px;
        }
    </style>
</head>
<body>
<% String login = request.getUserPrincipal().getName();%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/conf">Confrooms</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li><a href="#">About</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><form:form action="${pageContext.request.contextPath}/logout" method="post">
                    <span class="glyphicon glyphicon-log-out"></span>
                    <input type="submit" class="navbar" value="Logout <% out.print(login); %>">
                </form:form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="jumbotron">
    <div class="container text-center">
        <h2>Conference Rooms</h2>

        <p>
            <label for="Name">Search by name:</label>
        <form
        <form:form action="${pageContext.request.contextPath}/conf/confRoomList/" method="get">
            <input type="search" id="name" name="name"/>
            <button type="submit" class="btn btn-default">Search</button>
        </form:form>
        </form>
        </p>

        <p>
            <label for="Name">Search by floor:</label>
        <form
        <form:form action="${pageContext.request.contextPath}/conf/confRoomListByFloor/" method="get">
            <button type="submit" class="btn btn-default" name="floor" value="1">1</button>
            <button type="submit" class="btn btn-default" name="floor" value="2">2</button>
            <button type="submit" class="btn btn-default" name="floor" value="3">3</button>
            <button type="submit" class="btn btn-default" name="floor" value="4">4</button>
            <button type="submit" class="btn btn-default" name="floor" value="5">5</button>
            <button type="submit" class="btn btn-default" name="floor" value="6">6</button>
            <button type="submit" class="btn btn-default" name="floor" value="7">7</button>
            <button type="submit" class="btn btn-default" name="floor" value="8">8</button>
            <button class="btn btn-default" onclick="location.href='/conf'" type="button">All</button>
        </form:form>

        </form>
        </p>
    </div>
</div>

<div class="container-fluid bg-3 text-center">
    <div>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <table class="table table-hover">
            <tr>
                <th>floor</th>
                <th>name</th>
                <th>skypeVc</th>
                <th>hdmi</th>
                <th>lan</th>
                <th>labels</th>
                <th>remotes</th>
                <th>instruction</th>
                <th>comments</th>
                <th>last checked</th>
                <th>checked by</th>
            </tr>

            <jsp:useBean id="confRoomModel" scope="request" type="java.util.List"/>
            <c:forEach var="tempconfRoomModel" items="${confRoomModel}">
                <tr>
                    <td>${tempconfRoomModel.floor}</td>
                    <td style="font-style: oblique">${tempconfRoomModel.name}</td>
                    <td>${tempconfRoomModel.skypeVc ? '<i class="fa fa-check-circle-o" style="font-size:24px;color:green"></i>' : '<i class="fa fa-times-circle-o" style="font-size:24px;color:red"></i>'}</td>
                    <td>${tempconfRoomModel.hdmi ? '<i class="fa fa-check-circle-o" style="font-size:24px;color:green"></i>' : '<i class="fa fa-times-circle-o" style="font-size:24px;color:red"></i>'}</td>
                    <td>${tempconfRoomModel.lan ? '<i class="fa fa-check-circle-o" style="font-size:24px;color:green"></i>' : '<i class="fa fa-times-circle-o" style="font-size:24px;color:red"></i>'}</td>
                    <td>${tempconfRoomModel.labels ? '<i class="fa fa-check-circle-o" style="font-size:24px;color:green"></i>' : '<i class="fa fa-times-circle-o" style="font-size:24px;color:red"></i>'}</td>
                    <td>${tempconfRoomModel.remotes ? '<i class="fa fa-check-circle-o" style="font-size:24px;color:green"></i>' : '<i class="fa fa-times-circle-o" style="font-size:24px;color:red"></i>'}</td>
                    <td>${tempconfRoomModel.instruction ? '<i class="fa fa-check-circle-o" style="font-size:24px;color:green"></i>' : '<i class="fa fa-times-circle-o" style="font-size:24px;color:red"></i>'}</td>
                    <td>${tempconfRoomModel.comments}</td>
                    <td><fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short"
                                         value = "${tempconfRoomModel.lastmodified}" /></td>
                    <td>${tempconfRoomModel.checkedby}</td>

                    <td><a href="/conf/update?confRoomId=${tempconfRoomModel.id}" class="btn btn-success">Update</a>
                        <security:authorize access="hasRole('ADMIN')">
                        <form:form action="/conf/delete?confRoomId=${tempconfRoomModel.id}" method="DELETE">
                            <button onclick="if (!(confirm('Are you sure you want to delete this confRoom?'))) return false"
                                    type="submit" class="btn btn-danger">DELETE
                            </button>
                        </form:form>
                        </security:authorize>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </div>

</div>
<br><br>
</div>
<p>Click <a href="${pageContext.request.contextPath}/home">here</a> to go Home</p>
</br>
<p>Click <a href="${pageContext.request.contextPath}/conf/saveConf">here</a> to add new Conference Room</p>

<button class="btn btn-default" onclick="location.href='/conf/downloadReport'" type="button">Generate Report</button>
<br>
<br>
<br>
<br>
</div>
</div><br><br><br><br>

<div class="w3-bottom w3-hide-medium">
    <div class="w3-bar w3-white w3-center w3-padding-large w3-opacity-min w3-hover-opacity-off">
        <a class="w3-bar-item w3-button"><form
            <form:form action="${pageContext.request.contextPath}/conf/confRoomList/" method="get">
                <input type="search" id="name" name="name"/>
                <button type="submit" class="btn btn-default">Search</button>
            </form:form>
            </form></a>
        <a class="w3-bar-item w3-button" ><form
            <form:form action="${pageContext.request.contextPath}/conf/confRoomListByFloor/" method="get">
                <button type="submit" class="btn btn-default" name="floor" value="1">1</button>
                <button type="submit" class="btn btn-default" name="floor" value="2">2</button>
                <button type="submit" class="btn btn-default" name="floor" value="3">3</button>
                <button type="submit" class="btn btn-default" name="floor" value="4">4</button>
                <button type="submit" class="btn btn-default" name="floor" value="5">5</button>
                <button type="submit" class="btn btn-default" name="floor" value="6">6</button>
                <button type="submit" class="btn btn-default" name="floor" value="7">7</button>
                <button type="submit" class="btn btn-default" name="floor" value="8">8</button>
                <button class="btn btn-default" onclick="location.href='/conf'" type="button">All</button>
            </form:form>
            </form></a>
        <a class="w3-bar-item w3-button w3-hover-black w3-right"><a href="#" class="scrollup"><i class="fa fa-arrow-circle-o-up" style="font-size:48px;color:slategrey"></i></a></a>
    </div>
</div>
</body>
</html>
