<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Login Form</title>
</head>
<body>

<h2>Login Form</h2>

<form method="post" action="/login">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>

    <button type="submit">Login</button>
    <c:if test="${not empty errorMessage}">
        <p>Fuck you, ${errorMessage}!</p>
    </c:if>

    <c:if test="${not empty logoutMessage}">
        <div class="alert alert-success">${logoutMessage}</div>
    </c:if>
    
</form>

</body>
</html>

