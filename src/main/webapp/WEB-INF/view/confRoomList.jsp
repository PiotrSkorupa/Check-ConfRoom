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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
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
                    <td>${tempconfRoomModel.name}</td>
                    <td>${tempconfRoomModel.skypeVc ? 'Yes' : 'No'}</td>
                    <td>${tempconfRoomModel.hdmi ? 'Yes' : 'No'}</td>
                    <td>${tempconfRoomModel.lan ? 'Yes' : 'No'}</td>
                    <td>${tempconfRoomModel.labels ? 'Yes' : 'No'}</td>
                    <td>${tempconfRoomModel.remotes ? 'Yes' : 'No'}</td>
                    <td>${tempconfRoomModel.instruction ? 'Yes' : 'No'}</td>
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
</div>
</div><br><br>
<footer class="container-fluid text-center">
    <p>¯\(`_`)/¯</p>
</footer>

</body>
</html>
