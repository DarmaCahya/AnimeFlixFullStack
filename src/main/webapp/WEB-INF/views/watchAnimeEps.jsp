<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Watch Anime</title>
</head>
<body>

    <h1>Watch Anime Episodes</h1>
    <c:if test="${not empty AnimeDetail}">
        <h3>${AnimeDetail.title}</h3><br>
    </c:if>

    <%-- Check if the episodeList is not empty --%>
    <c:if test="${not empty episode}">
        <ul>
            <li>${episode.episodeTitle} - Episode ${episode.episodeNumber}</li>
            <iframe width="560" height="315" src=${episode.videoUrl} title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        </ul>
    </c:if>
    <form method="post" action="">
        <button type="submit">Like</button>
    </form>
    <c:if test="${not empty errorMessage}">
        <h3>${errorMessage}</h3>
    </c:if>
</body>
</html>
