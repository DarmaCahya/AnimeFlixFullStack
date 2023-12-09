<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>All Genres</title>
</head>
<body>

    <h1>All Genres</h1>

    <c:if test="${not empty allGenres}">
        <ul>
            <c:forEach var="genre" items="${allGenres}">
                <li>${genre} - <a href=/Home/genre/${genre}>klik sini</a></li>
            </c:forEach>
        </ul>
    </c:if>

</body>
</html>
