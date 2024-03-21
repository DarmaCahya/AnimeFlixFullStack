<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Watch Anime</title>
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

        .container{
            display: flex;
            margin: 0;
            width: 100%;
            height: 80%;
        }

        p{
            margin: 0;
            font-size: 25px;
            margin-top: 2%;
            margin-left: 1%;
        }

        h2{
            margin-bottom: 1%;
            font-size: 35px;
        }

        .anime-thumbnail {
            height: 90%;
            margin-top: 10%; 
            margin-left: 3%;
            object-fit: cover;
            width: 100%;
        }

        .bagian-kiri{
            margin: 0;
            margin-left: 3%;
            width: 25%;
            box-sizing: border-box;
        }

        .bagian-kanan{
            width: 70%;
            margin-left: 2%;
            box-sizing: border-box;
            padding: 20px;
        }

        .episode-list {
            list-style-type: none;
            padding: 0;
            margin-bottom: 4%;
        }

        .episode-item {
            border: 1px solid #ddd;
            background-color: rgb(41, 39, 36);
            margin-bottom: 15px;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            width: 85%;
            margin-left: 5%;
        }

        .watch-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
        }

        .watch-button:hover{
            background-color: #504f4c;
        }

        .eps-anime{
            font-size: 25px;
            margin-left: 3%;
            margin-top: 0.5%;
            height: 20px;
        }

        h1{
            margin-left: 4%;
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

    <c:if test="${not empty AnimeDetail}">
        <div class="container">
            <div class="bagian-kiri">
                <img src="${AnimeDetail.thumbnail}" alt="Anime Thumbnail" class="anime-thumbnail">
            </div>
    
            <div class="bagian-kanan">
                <h2>
                    Informasi Anime
                </h2>
                <p>Judul Anime : ${AnimeDetail.title}</p>
                <p>Genre : ${AnimeDetail.genre}</p>
                <p>Publisher : ${AnimeDetail.publisher.nama}</p>
                <p>Release Year : ${AnimeDetail.releaseYear}</p>
                <p>Description : ${AnimeDetail.description}</p>
            </div>
        </div>
    </c:if>

    <div>
        <h1>Episode List</h1>
        <c:if test="${not empty episodeList}">
            <ul class="episode-list">
                <c:forEach var="episode" items="${episodeList}">
                    <li class="episode-item">
                        <p class="eps-anime">Episode ${episode.episodeNumber} - ${episode.episodeTitle}</p>
                        <form method="post" action="eps/${episode.episodeNumber}">
                            <button type="submit" class="watch-button">Nonton</button>
                        </form>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
    </div>
    
</body>
</html>
