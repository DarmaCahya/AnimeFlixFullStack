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

    <c:if test="${userType == 'ADMIN'}">
        <form method="get" action="/Dashboard">
            <button type="submit">Dashboard</button>
        </form>
    </c:if>


    <c:if test="${userType == 'PUBLISHER'}">
        <form method="get" action="/AnimeManager">
            <button type="submit">AnimeManager</button>
        </form>
    </c:if>

    <c:if test="${userType == 'CUSTOMER'}">
        <script>
             window.onload = function() {
                alert('Hai Customer, Selamat Datang di Website Kami!');
            };

            setTimeout(function() {
                window.location.href = "/Home";
            }, 200);
        </script>
    </c:if>

    <form method="post" action="/logout">
        <button type="submit">logout</button>
    </form>

    <form method="get" action="/Home">
        <button type="submit">Home</button>
    </form>

    <form method="get" action="/Home/nonton/1/eps">
        <button type="submit">Anime</button>
    </form>
</body>
</html>
