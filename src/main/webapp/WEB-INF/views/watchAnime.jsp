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
    <c:if test="${not empty episodeList}">
        <ul>
            <%-- Loop through each episode in the episodeList --%>
            <c:forEach var="episode" items="${episodeList}">
                <li>${episode.episodeTitle} - Episode ${episode.episodeNumber}
                <form method="post" action=eps/${episode.episodeNumber}>
                    <button type="submit">Nonton</button>
                </form>
            </c:forEach>
        </ul>
    </c:if>
</body>
</html>
