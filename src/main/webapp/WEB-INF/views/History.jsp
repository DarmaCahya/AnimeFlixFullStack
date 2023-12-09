<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>User Watch History</title>
</head>
<body>

    <h1>User Watch History</h1>

    <c:if test="${not empty userHistoryList}">
        <table border="1">
            <thead>
                <tr>
                    <th>Anime Title</th>
                    <th>Episode Title</th>
                    <th>Watched At</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="history" items="${userHistoryList}">
                    <tr>
                        <td>${history.animeEpisode.anime.title}</td>
                        <td>${history.animeEpisode.episodeTitle}</td>
                        <td>${history.watchedAt}</td>
                        <td><a href=/Home/nonton/${anime.animeId}/eps>Detail</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

</body>
</html>
