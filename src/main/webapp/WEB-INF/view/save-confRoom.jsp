<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Save ConfRoom</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add-customer-style.css">
    <style>
        .error{color:red}
    </style>
</head>
<body>
<div id="wrapper">
    <div id="header">
        <h2>ConfRoom - admin panel </h2>
    </div>
</div>

<div id="container">
    <h3>Save ConfRoom</h3>

    <%--@elvariable id="confRoom" type="checkConferenceRoomApp.model.ConfRoomModel"--%>
    <form:form action="save" modelAttribute="confRoom" method="POST">

        <form:hidden path="id" />
        <form:hidden path="checkedby" value = "<%=request.getUserPrincipal().getName() %>" />
        <table>
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
        <a href="${pageContext.request.contextPath}/conf">Back to List</a>
    </p>
</div>
</body>
















</html>
