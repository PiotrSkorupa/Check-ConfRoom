<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <%--@elvariable id="confRoom" type="hello.model.ConfRoomModel"--%>
    <form:form action="save" modelAttribute="confRoom" method="POST">

        <!-- need to associate this data with customer id -->
        <form:hidden path="id"/>
        <table>
            <tbody>
            <tr>
                <td><label>Floor:</label></td>
                <td><form:input path="floor"/></td>

            </tr>
            <tr>
                <td><label>Hdmi:</label></td>
                <td><form:input path="hdmi"/></td>
            </tr>
            <tr>
                <td><label>Instruction:</label></td>
                <td><form:input path="instruction"/></td>
            </tr>
            <tr>
                <td><label>labels:</label></td>
                <td><form:input path="labels"/></td>
            </tr>
            <tr>
                <td><label>lan:</label></td>
                <td><form:input path="lan"/></td>
            </tr>
            <tr>
                <td><label>name:</label></td>
                <td><form:input path="name"/></td>
            </tr>
            <tr>
                <td><label>remotes:</label></td>
                <td><form:input path="remotes"/></td>
            </tr>
            <tr>
                <td><label>skype_vc:</label></td>
                <td><form:input path="skypeVc"/></td>
            </tr>
            <tr>
                <td><label>comments:</label></td>
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
        <a href="${pageContext.request.contextPath}/list">Back to List</a>
    </p>
</div>
</body>
















</html>
