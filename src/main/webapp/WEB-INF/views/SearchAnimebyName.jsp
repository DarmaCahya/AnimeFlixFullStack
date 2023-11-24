<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Anime List</title>
</head>
<body>

    <h1>Anime List</h1>

    <c:if test="${not empty animeList}">
        <ul>
            <c:forEach var="anime" items="${animeList}">
                <li>${anime.title} - ${anime.genre} - ${anime.releaseYear}</li>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${empty animeList}">
        <p>No anime found.</p>
    </c:if>

</body>
</html>
