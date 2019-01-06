<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <link rel="stylesheet" type="text/css" href="/resources/css/loadStyle.css">
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
            background-repeat: no-repeat;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        footer {
            background-color: #f2f2f2;
            padding: 25px;
        }

        input[type=email], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #eaeaea;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #f7eff3;
        }

        input[type=search], select {
            width: 20%;
            padding: 5px;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
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
            <a class="navbar-brand" href="${pageContext.request.contextPath}/check-confroom/conf">Confrooms</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath}/check-confroom/home">Home</a></li>
                <li><a href="#">About</a></li>
            </ul>

            <ul class="nav navbar-nav">
                <!-- Button trigger modal -->
                <iframe width="0" height="0" border="0" name="dummyframe" id="dummyframe"></iframe>
                <form action="${pageContext.request.contextPath}/check-confroom/conf/sendReport" target="dummyframe">
                    <button type="submit" class="btn btn-info" style="position: absolute; right: 10%;" data-toggle="modal"
                            data-target="#myModal" type="button" onclick="'/check-confroom/conf'">Send report via email
                    </button>
                </form>
                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>

                                <h4 class="modal-title" id="myModalLabel">Send report to:</h4>
                            </div>
                            <div class="modal-body">
                                <form:form action="${pageContext.request.contextPath}/check-confroom/conf/sendEmail"
                                           method="get">
                                    <input type="email" placeholder="enter email address here" id="email" name="email"/>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Send email</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                    </div>
                                </form:form>
                            </div>
                            <%
                                String email = request.getParameter("email");
                            %>
                        </div>
                    </div>
                </div>
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
        <form:form action="${pageContext.request.contextPath}/check-confroom/conf/confRoomList/" method="get">
            <input type="search" id="name" name="name"/>
            <button type="submit" class="btn btn-default">Search</button>
        </form:form>
        </form>
        <label for="Name">Search by floor:</label>
        <form
        <form:form action="${pageContext.request.contextPath}/check-confroom/conf/confRoomListByFloor/" method="get">
            <button type="submit" class="btn btn-default" name="floor" value="1">1</button>
            <button type="submit" class="btn btn-default" name="floor" value="2">2</button>
            <button type="submit" class="btn btn-default" name="floor" value="3">3</button>
            <button type="submit" class="btn btn-default" name="floor" value="4">4</button>
            <button type="submit" class="btn btn-default" name="floor" value="5">5</button>
            <button type="submit" class="btn btn-default" name="floor" value="6">6</button>
            <button type="submit" class="btn btn-default" name="floor" value="7">7</button>
            <button type="submit" class="btn btn-default" name="floor" value="8">8</button>
            <button class="btn btn-default" onclick="location.href='/check-confroom/conf'" type="button">All</button>
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
                <th>Floor</th>
                <th>Name</th>
                <th>VC</th>
                <th>Hdmi</th>
                <th>Lan</th>
                <th>Labels</th>
                <th>Remotes</th>
                <th>Instruction</th>
                <th>Sockets</th>
                <th>Pens&Sponges</th>
                <th>Floor condition</th>
                <th>Comments</th>
                <th>Last checked</th>
                <th>Checked by</th>
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
                    <td>${tempconfRoomModel.sockets ? '<i class="fa fa-check-circle-o" style="font-size:24px;color:green"></i>' : '<i class="fa fa-times-circle-o" style="font-size:24px;color:red"></i>'}</td>
                    <td>${tempconfRoomModel.markers ? '<i class="fa fa-check-circle-o" style="font-size:24px;color:green"></i>' : '<i class="fa fa-times-circle-o" style="font-size:24px;color:red"></i>'}</td>
                    <td>${tempconfRoomModel.floorCondition ? '<i class="fa fa-check-circle-o" style="font-size:24px;color:green"></i>' : '<i class="fa fa-times-circle-o" style="font-size:24px;color:red"></i>'}</td>
                    <td>${tempconfRoomModel.comments}</td>
                    <td><fmt:formatDate type="both" dateStyle="short" timeStyle="short"
                                        value="${tempconfRoomModel.lastmodified}"/></td>
                    <td>${tempconfRoomModel.checkedby}</td>

                    <td><a href="/check-confroom/conf/update?confRoomId=${tempconfRoomModel.id}"
                           class="btn btn-success">Update</a>
                        <security:authorize access="hasRole('ADMIN')">
                            <form:form action="/check-confroom/conf/delete?confRoomId=${tempconfRoomModel.id}"
                                       method="DELETE">
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
</br>
<div class="col">
    </form></a>
    <a class="w3-bar-item w3-button">
        <form>
            <button class="btn btn-primary btn-lg" style="position: absolute; right: 4%;"
                    onclick="location.href='/check-confroom/conf/saveConf'" type="button">Add new Conference Room
            </button>
        </form>
    </a>
</div>

<br>
<br>
<br>
<br>
</div>
</div><br><br><br><br>

<div class="w3-bottom w3-hide-medium">
    <div class="w3-bar w3-white w3-center w3-padding-large w3-opacity-min w3-hover-opacity-off">
        <a class="w3-bar-item w3-button">
            <form
            <form:form action="${pageContext.request.contextPath}/check-confroom/conf/confRoomList/" method="get">
                <input type="text" id="name" name="name"/>
                <button type="submit" class="btn btn-default">Search</button>
            </form:form>
            </form></a>
        <a class="w3-bar-item w3-button">
            <form
            <form:form action="${pageContext.request.contextPath}/check-confroom/conf/confRoomListByFloor/"
                       method="get">
                <button type="submit" class="btn btn-default" name="floor" value="1">1</button>
                <button type="submit" class="btn btn-default" name="floor" value="2">2</button>
                <button type="submit" class="btn btn-default" name="floor" value="3">3</button>
                <button type="submit" class="btn btn-default" name="floor" value="4">4</button>
                <button type="submit" class="btn btn-default" name="floor" value="5">5</button>
                <button type="submit" class="btn btn-default" name="floor" value="6">6</button>
                <button type="submit" class="btn btn-default" name="floor" value="7">7</button>
                <button type="submit" class="btn btn-default" name="floor" value="8">8</button>
                <button class="btn btn-basic" onclick="location.href='/check-confroom/conf'" type="button">All</button>
            </form:form>
            </form></a>
        <a class="w3-bar-item w3-button">
            <form>
                <button class="btn btn-info" onclick="location.href='/check-confroom/conf/downloadReport'"
                        type="button">Generate Report
                </button>
            </form>
        </a>
        <a class="w3-bar-item w3-button w3-hover-black w3-right"><a href="#" class="scrollup"><i
                class="fa fa-arrow-circle-o-up" style="font-size:48px;color:slategrey"></i></a></a>
    </div>
</div>


</body>
</html>
