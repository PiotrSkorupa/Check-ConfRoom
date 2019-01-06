<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Save ConfRoom</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add-customer-style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
    body {
        background-image: url(/resources/images/a.jpg);
        background-repeat: no-repeat;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        background-position: center;
    }
    .myTable {
        width: 40%;
        text-align: left;
        background-color: transparent !important;
        border-collapse: collapse;
        opacity: 0.8;
        filter: alpha(opacity=50);
    }
    .myTable th {
        background-color: goldenrod;
        color: white;
        opacity: 0.8;
        filter: alpha(opacity=50);
    }
    .myTable td,
    .myTable th {
        padding: 8px;
        border: 1px solid goldenrod;
        opacity: 0.8;
        filter: alpha(opacity=50);
    }
    .error {
        color:red
    }

</style>
<body>
<div>
    <div>
        <h2><b>ConfRoom - Admin Panel </b></h2>
    </div>
</div>

<div>
    <h3><b>Save ConfRoom</b></h3>

    <%--@elvariable id="confRoom" type="checkConfroom.model.ConfRoomModel"--%>
    <form:form action="save" modelAttribute="confRoom" method="POST">

        <form:hidden path="id" />
        <form:hidden path="checkedby" value = "<%=request.getUserPrincipal().getName() %>" />
        <table class="myTable">
            <tbody>
            <tr>
                <td><label>Floor:</label></td>
                <td><form:input path="floor"/></td>

            </tr>
            <tr>
                <td><label>Name:</label></td>
                <td><form:input path="name"/></td>
            </tr>
            <tr>
                <td><label>SkypeVC:</label></td>
                <td><form:checkbox path="skypeVc"/></td>
            </tr>
            <tr>
                <td><label>HDMI:</label></td>
                <td><form:checkbox path="hdmi"/></td>
            </tr>
            <tr>
                <td><label>LAN:</label></td>
                <td><form:checkbox path="lan"/></td>
            </tr>
            <tr>
                <td><label>Labels:</label></td>
                <td><form:checkbox path="labels"/></td>
            </tr>
            <tr>
                <td><label>Remotes:</label></td>
                <td><form:checkbox path="remotes"/></td>
            </tr>
            <tr>
                <td><label>Instructions:</label></td>
                <td><form:checkbox path="instruction"/></td>
            </tr>
            <tr>
                <td><label>Sockets:</label></td>
                <td><form:checkbox path="sockets"/></td>
            </tr>
            <tr>
                <td><label>Pens&Sponges:</label></td>
                <td><form:checkbox path="markers"/></td>
            </tr>
            <tr>
                <td><label>Floor condition:</label></td>
                <td><form:checkbox path="floorCondition"/></td>
            </tr>
            <tr>
                <td><label>Comments:</label></td>
                <td><form:input path="comments"/></td>
            </tr>
            <tr>
                <td><label></label></td>
                <td><input type="submit" value="Save" class="save"></td>
            </tr>
            </tbody>
        </table>
    </form:form>

    <div style="clear: both;"></div>
    <p>
            <form>
                <button class="btn btn-default" onclick="location.href='/check-confroom/conf'"
                        type="button">Back to List
                </button>
            </form>
    </p>
</div>
</body>
</html>
