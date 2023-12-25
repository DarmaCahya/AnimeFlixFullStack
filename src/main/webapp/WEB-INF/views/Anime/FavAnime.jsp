<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>User Anime Like</title>
</head>
<body>

    <h1>User Anime Like</h1>
    <c:if test="${not empty ListFav}">
        <table border="1">
            <thead>
                <tr>
                    <th>Anime Title</th>
                    <th>Episode Number</th>
                    <th>Episode Title</th>
                    
                    <th>Link to Anime</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="List" items="${ListFav}">
                    <tr>
                        <td>${List.animeEpisode.anime.title}</td>
                        <td>${List.animeEpisode.episodeNumber}</td>
                        <td>${List.animeEpisode.episodeTitle}</td>
                        
                        <td>
                            <form method="post" action="../nonton/${List.animeEpisode.anime.animeId}/eps/${List.animeEpisode.episodeNumber}">
                                <button type="submit">Nonton</button>
                            </form> 
                        </td>
                    </tr>
                </c:forEach>
                
            </tbody>
        </table>
    </c:if>
    

</body>
</html>
