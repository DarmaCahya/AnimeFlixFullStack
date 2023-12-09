<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Anime by Genre</title>
</head>
<body>

    <h1>Anime by Genre - ${genre}</h1>

    <c:if test="${not empty animeList}">
        <ul>
            <c:forEach var="anime" items="${animeList}">
                <li>${anime.title} - <a href=/Home/nonton/${anime.animeId}/eps>Detail</a></li>
                <!-- Add more details as needed -->
            </c:forEach>
        </ul>
    </c:if>

</body>
</html>
