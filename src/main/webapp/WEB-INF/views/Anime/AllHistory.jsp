<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>User Watch History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #0d0c0c;
            color: #fff;
        }

        header {
            background-color: #0d0c0c;
            color: #fff;
            padding: 10px;
            border-bottom: 2px solid #333;
            height: 74px;
        }

        .logo {
            display: inline-block;
            margin-right: 20px;
            color: #ffffff;
            text-decoration: none;
            position: relative;
            left: 20px;
        }

        nav {
            display: flex;
            height: 5px;
        }

        nav a {
            position: relative;
            color: #fff;
            text-decoration: none;
            margin-right: 2%;
            font-size: 25px;
            color: #a29999;
            top: -46px;
            left: 180px;
        }

        .search-box {
            display: inline-block;
            position: absolute;
            right: 8%;
            top: 3%;
        }

        .search-container {
            display: flex;
            background-color: #242524;
            opacity: 0.9;
            width: 87%;
            border-radius: 0;
            border: 2px solid #1f1d2a;
            box-sizing: border-box;
            margin-bottom: 5px;
            right: 70%;
            padding: 3%;
        }

        #searchInput {
            background-color: #242524;
            opacity: 0.9;
            width: 95%;
            border-radius: 0;
            border: none;
            color: #fff;
            padding: 4%;
        }

        .search-button {
            position: absolute;
            right: 6%;
            top: 40%;
            border: none;
            background-color: transparent;
            cursor: pointer;
            transition: all 0.25s;
        }

        .search-button:hover {
            opacity: 0.6;
            transition: all 0.25s;
        }

        .Login-button {
            display: inline-block;
            width: 65px;
            height: 60px;
            border-radius: 50%;
            overflow: hidden;
            position: absolute;
            top: 2%;
            right: 3%;
        }
        
        nav a:hover {
        color: #504f4c;
        }

        h1{
            margin-left:4%;
        }
        .container{
            margin-left: 3%;
        }
        th{
            font-size: 22px;
            text-align: center;
        }
        td{
            font-size: 18px;
            text-align: center;
        }
        table {
            border-collapse: collapse;
            width: 70%;
        }

        .nonton-button{
            padding: 6px;
            margin-top: 20px;
            width: 50%;
        }

    </style>
</head>
<body>
    <header>
        <a href="/Home" class="logo">
            <img src="https://i.ibb.co/RzzSCg2/flix.png" alt="AnimeFlix Logo" style="width: 130px; height: 65px;" />
        </a>
        
        <c:if test="${userType == 'ADMIN'}">
            <form class="form-button" method="get" action="/Dashboard">
                <button class="button-tambahan"  type="submit">Dashboard</button>
            </form>
        </c:if>

        <c:if test="${userType == 'PUBLISHER'}">
            <form class="form-button" method="get" action="/AnimeManager">
                <button class="button-tambahan" type="submit">Anime Manager</button>
            </form>
        </c:if>
        <nav>
            <a href="/Home/genre/">Genre</a>
            <a href="/Home/history/">History</a>
            <a href="/Home/Favorite/">Favorite</a>
        </nav>
    
        <form action="/Home/search/" method="get" class="search-box">
            <select name="searchType" id="searchType">
                <option value="title">Title</option>
                <option value="genre">Genre</option>
            </select>
            <input type="text" placeholder="Search..." id="searchInput" name="Cari" />
            <button type="submit" class="search-button">
                <img src="https://i.ibb.co/rb6kTcJ/Screenshot-1.png" alt="Search Icon" style="width: 20px; height: 23px;" />
            </button>
        </form>
        <a href="/Home/profile/" class="Login-button">
            <img src="https://i.ibb.co/275wkRK/sasuke.png" alt="Login Icon" style="width: 130px; height: 60px;" />
        </a>
    </header>

    <h1>User Watch History</h1>
    <div class="container">
        <c:if test="${not empty userHistoryList}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Anime Title</th>
                        <th>Episode Number</th>
                        <th>Episode Title</th>
                        <th>Watched At</th>
                        <th>Link to Anime</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="history" items="${userHistoryList}">
                        <tr>
                            <td>${history.animeEpisode.anime.title}</td>
                            <td>${history.animeEpisode.episodeNumber}</td>
                            <td>${history.animeEpisode.episodeTitle}</td>
                            <td>${history.watchedAt}</td>
                            <td>
                                <form method="post" action="../nonton/${history.animeEpisode.anime.animeId}/eps/${history.animeEpisode.episodeNumber}">
                                    <button type="submit">Nonton</button>
                                </form> 
                            </td>
                        </tr>
                    </c:forEach>
                    
                </tbody>
            </table>
        </c:if>
    </div>
</body>
</html>
