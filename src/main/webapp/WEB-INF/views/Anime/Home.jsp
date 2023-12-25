<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            width: 87%;
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

        .posters-container {
            display: flex;
            margin-left: 2%;
        }

        .poster {
            margin-right: 20px; /* Jarak antar poster */
        }

        .poster-img {
            width: 220px;
            height: 300px;
            object-fit: cover; /* Membuat gambar memenuhi area dengan mempertahankan aspek rasio */
        }

        .poster-text {
            text-align: center;
            margin-top: 10px;
        }

        .scroll-container {
            overflow-x: auto;
            display: flex;
            overflow: hidden;
        }
        h3{
            margin-bottom: 0;
            margin-left: 2%;
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
        <a href="Home/profile/" class="Login-button">
            <img src="https://i.ibb.co/275wkRK/sasuke.png" alt="Login Icon" style="width: 130px; height: 60px;" />
        </a>
    </header>

    <c:if test="${PesanAlert != null}">
        <script>
            // JavaScript code to show a pop-up message
            window.onload = function() {
                alert('Minimal sopan dek');
            };
        </script>
    </c:if>
    
    <h3>Default</h3><br>
    <div class="scroll-buttons">
        <button onclick="scrollPosters('defaultPosters', 'right')" style="position: absolute; margin-top: 7%; margin-left: 95%; width: 2%; height: 5%;">></button>
    </div>
        <div class="scroll-container posters-container" id="defaultPosters">
            <c:forEach var="anime" items="${animeList}">
                <div class="poster">
                    <a href="/Home/nonton/${anime.animeId}/eps">
                        <img src="${anime.thumbnail}" alt="Poster 1" class="poster-img">
                    </a> 
                    <p class="poster-text">${anime.title}</p>
                </div>
            </c:forEach>
        </div>

    <c:if test="${not empty animeListgenre}">
        <h3>${animeListgenre[0].genre}</h3><br>
    </c:if>
        <div class="scroll-buttons">
            <button onclick="scrollPosters('poster1', 'right')" style="position: absolute; margin-top: 7%; margin-left: 95%; width: 2%; height: 5%;">></button>
        </div>
        <div class="posters-container" id="poster1" style="width: 100%; overflow-x: auto; overflow: hidden;">
            <c:forEach var="anime" items="${animeListgenre}">
                <div class="poster" >
                    <a href="/Home/nonton/${anime.animeId}/eps">
                        <img src= ${anime.thumbnail} alt="Poster 1" class="poster-img">
                    </a> 
                    <p class="poster-text">${anime.title}</p>
                </div>
            </c:forEach>
        </div>

    <c:if test="${not empty animeListgenre2}">
        <h3>${animeListgenre2[0].genre}</h3><br>
    </c:if>
    <div class="scroll-buttons">
        <button onclick="scrollPosters('poster2', 'right')" style="position: absolute; margin-top: 7%; margin-left: 95%; width: 2%; height: 5%;">></button>
    </div>
    <div class="posters-container" id="poster2" style="width: 100%; overflow-x: auto; overflow: hidden;">
        <c:forEach var="anime" items="${animeListgenre2}">
                <div class="poster">
                    <a href="/Home/nonton/${anime.animeId}/eps">
                        <img src= ${anime.thumbnail} alt="Poster 1" class="poster-img">
                    </a>
                    <p class="poster-text">${anime.title}</p>
                </div>
            </c:forEach>
        </div>
    
    <c:if test="${not empty animeListgenre3}">
        <h3>${animeListgenre3[0].genre}</h3><br>
    </c:if>
    <div class="scroll-buttons">
        <button onclick="scrollPosters('poster3', 'right')" style="position: absolute; margin-top: 7%; margin-left: 95%; width: 2%; height: 5%;">></button>
    </div>
    <div class="posters-container" id="poster3" style="width: 100%; overflow-x: auto; overflow: hidden;">
            <c:forEach var="anime" items="${animeListgenre3}">
                <div class="poster">
                    <a href="/Home/nonton/${anime.animeId}/eps"></a>
                        <img src= ${anime.thumbnail} alt="Poster 1" class="poster-img">
                    </a>
                    <p class="poster-text">${anime.title}</p>
                </div>
            </c:forEach>
        </div>

 <script>
    function scrollPosters(containerId, direction) {
        const container = document.getElementById(containerId);
        const scrollAmount = 200; // Jarak geser (px)

        if (direction === 'right') {
            container.scrollLeft += scrollAmount;
            if (container.scrollLeft >= container.scrollWidth - container.clientWidth) {
                // Jika sudah mencapai ujung, kembali ke awal
                container.scrollLeft = 0;
            }
        } else if (direction === 'left') {
            container.scrollLeft -= scrollAmount;
            if (container.scrollLeft <= 0) {
                // Jika sudah mencapai ujung, kembali ke akhir
                container.scrollLeft = container.scrollWidth - container.clientWidth;
            }
        }
    }
</script>


</body>
</html>