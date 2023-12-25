<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Anime by Genre</title>
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
            font-size: 35px;
            margin-left: 3%;
        }

        .posters-container {
            display: flex;
        }

        .poster {
            margin-right: 30px; /* Jarak antar poster */
        }

        .poster-img {
            width: 220px;
            height: 300px;
            margin: 0;
            object-fit: cover; /* Membuat gambar memenuhi area dengan mempertahankan aspek rasio */
        }

        .poster-list{
            list-style-type: none;
            padding: 0;
            display: flex;
            margin-left: 3%;
        }

        li {
            list-style-type: none;
            margin-bottom: 25px;
            text-align: center;
        }
        p{
            margin-top: 10px;
            color: white;
            text-decoration: none;
        }

        .posters-list .poster:last-child {
            margin-right: 0;
        }

        p:hover{
            color: #504f4c;
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

    <div>
        <h1>Anime by Genre - ${genre}</h1>
        <div class="scroll-container posters-container" id="defaultPosters">
            <c:if test="${not empty animeList}">
                <ul class="poster-list">
                    <c:forEach var="anime" items="${animeList}">
                        <li class="poster">
                            <a href="/Home/nonton/${anime.animeId}/eps">
                                <img src="${anime.thumbnail}" alt="Poster" class="poster-img">
                                <p class="poster-text">${anime.title}</p>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
    </div>
    

</body>
</html>
