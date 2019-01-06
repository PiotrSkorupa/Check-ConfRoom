<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>User List</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
    body {
        background-image: url(/resources/images/d.jpg);
        background-repeat: no-repeat;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        background-position: center;
    }

    table {
        background-color: #BBBBBB;
        opacity: 0.85;
        filter: alpha(opacity=50);
    }
</style>

<body>

<div class="container">
    <div>
        <h2>ConfRoom - Admin Panel </h2>
    </div>
</div>
<div>
    <div>
        <table class="table table-hover">
            <tr>
                <th>Login</th>
                <th>Email</th>
                <th>User Roles</th>
                <th>Option</th>
            </tr>
            <!-- put new button: Add user -->
            <input type="button" value="Add user"
                   onclick="window.location.href='saveUser';return false;"
                   class="btn btn-info">

            <jsp:useBean id="userList" scope="request" type="java.util.List"/>
            <c:forEach var="tempUser" items="${userList}">

                <tr>
                    <td>${tempUser.userName}</td>
                    <td>${tempUser.email}</td>
                    <td>${tempUser.userRoles}</td>
                    <td>
                        <a href="/check-confroom/admin/updateUser?userId=${tempUser.userId}"
                                class="btn btn-success">Update
                        </a>

                        <form:form action="/check-confroom/admin/deleteUser?userId=${tempUser.userId}" method="DELETE">
                            <button class="btn btn-danger"
                                    onclick="if (!(confirm('Are you sure you want to delete this user?'))) return false"
                                    type="submit">DELETE
                            </button>
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </div>
    <form>
        <button class="btn btn-default" onclick="location.href='/check-confroom/admin'"
                type="button">Back to List
        </button>
    </form>


</div>
<br><br>

</body>
</html>
