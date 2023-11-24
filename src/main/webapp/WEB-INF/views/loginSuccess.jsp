<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Success</title>
</head>
<body>

    <h1>Login Successful</h1>

    <p>Welcome, ${username}!</p>
    
    <p>User Type: ${userType}</p>


    <form method="post" action="/logout">
        <button type="submit">logout</button>
    </form>

</body>
</html>
