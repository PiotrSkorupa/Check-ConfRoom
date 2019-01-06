<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Save ConfRoom</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add-customer-style.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .error{color:red}
    </style>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
    body {
        background-image: url(/resources/images/b.jpg);
        background-repeat: no-repeat;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        background-position: center;
    }
    .myTable {
        width: 30%;
        text-align: left;
        background-color: transparent !important;
        border-collapse: collapse;
        opacity: 0.85;
        filter: alpha(opacity=50);
    }
    .myTable th {
        background-color: goldenrod;
        color: white;
        opacity: 0.85;
        filter: alpha(opacity=50);
    }
    .myTable td,
    .myTable th {
        padding: 10px;
        border: 1px solid goldenrod;
        opacity: 0.85;
        filter: alpha(opacity=50);
    }
</style>
<body>
<div>
    <div>
        <h2 style="color: #bb1312"><b>ConfRoom - admin panel </b></h2>
    </div>
</div>

<div>
    <h3 style="color: #bb1312"><b>Save User</b></h3>
    <%--@elvariable id="user" type="hello"--%>
    <form:form action="saveUser" modelAttribute="user" method="POST">

        <!-- need to associate this data with customer id -->
        <form:hidden path="userId"/>
        <table class="myTable">
            <tbody>
            <tr>
                <td><label>Login:</label></td>
                <td><form:input path="userName"/></td>
                    <form:errors path="userName" cssClass="error"/>

            </tr>
            <tr>
                <td><label>Password:</label></td>
                <td><form:input path="password" type="password"/></td>
                <form:errors path="password" cssClass="error"/>
            </tr>
            <tr>
                <td><label>Email:</label></td>
                <td><form:input path="email"/></td>
                <form:errors path="email" cssClass="error"/>
            </tr>
            <tr>
                <td><label>User Roles:</label></td>
                <td><form:select path="userRoles">
                    <form:option value="ROLE_USER">ROLE_USER</form:option>
                    <form:option value="ROLE_ADMIN">ROLE_ADMIN</form:option>
                    </form:select></td>
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
                <button class="btn btn-default" onclick="location.href='/check-confroom/admin/showUser'"
                        type="button">Back to List
                </button>
            </form>

    </p>
</div>
</body>
</html>
