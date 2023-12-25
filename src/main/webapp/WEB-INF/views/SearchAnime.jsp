<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Anime List</title>
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
            top: -50px;
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
            width: 87.3%;
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

        h2{
            font-size: 100px;
            color: #333;
            margin: 0;
        }

        p {
            font-size: 20px;
            color: #666;
            margin: 10px 0;
        }

        a {
            color: #3498db;
            text-decoration: none;
        }

        .containerNotFound {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .container{
            margin-left: 2%;
        }

        .posters-container {
            display: flex;
            flex-wrap: wrap;
            margin-right: 2%;
            gap: 25px;
        }


        .poster-img {
            width: 220px;
            height: 300px;
            object-fit: cover; /* Membuat gambar memenuhi area dengan mempertahankan aspek rasio */
        }

        .text-poster {
            text-align: center;
            margin-top: 10px;
            margin-bottom: 15%;
        }

    </style>
</head>
<body>
    <header>
        <a href="/Home" class="logo">
            <img src="https://i.ibb.co/RzzSCg2/flix.png" alt="AnimeFlix Logo" style="width: 130px; height: 65px;" />
        </a>
        <nav>
            <a href="/Home/genre/">Genre</a>
            <a href="/Home/history/">History</a>
        </nav>
        <form action="/Home/search/" method="get" class="search-box"> 
            <select name="searchType" id="searchType">
                <option value="genre">Genre</option>
                <option value="title">Title</option>
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

    <div>
        <div class="container">
            <c:if test="${not empty animeList}">
                <h1>Anime Found</h1>
                <div class="scroll-container posters-container" id="defaultPosters">
                    <c:forEach var="anime" items="${animeList}">
                        <div class="poster">
                            <a href="/Home/nonton/${anime.animeId}/eps">
                                <img src="${anime.thumbnail}" alt="Poster 1" class="poster-img">
                            </a> 
                            <div class="text-poster">
                                <p class="poster-text">${anime.title}</p>
                                <p class="poster-text">Genre: ${anime.genre}</p>
                                <p class="poster-text">Year: ${anime.releaseYear}</p>    
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <c:if test="${empty animeList}">
                <div class="scroll-container posters-container" id="defaultPosters">
                    <div class="containerNotFound">
                        <h2>404</h2>
                        <p>Anime Not Found</p>
                        <p>We couldn't find the anime you're looking for.</p>
                        <p>It might be hiding in another dimension!</p>
                        <p><a href="/Home">Go back home</a></p>
                    </div>
                </div>
            </c:if>
        </div>        
    </div>

</body>
</html>
