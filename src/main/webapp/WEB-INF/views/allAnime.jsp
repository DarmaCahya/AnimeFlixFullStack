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
            display: inline-block;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            margin-right: 15px;
        }

        .search-box {
            display: inline-block;
            position: absolute;
            left: 76%;
            bottom: 92%;
            top: 50px;
        }

        #searchInput {
            background-color: #242524;
            opacity: 0.9;
            width: 135%;
            padding: 7px;
            border-radius: 0;
            border: 2px solid #1F1D2A;
            box-sizing: border-box;
            margin-bottom: 5px;
            color: #fff;
            right: 70%;
        }

        .search-button {
            position: absolute;
            top: 45%;
            right: -52px;
            transform: translateY(-50%);
            border: none;
            background-color: transparent;
            cursor: pointer;
        }

        .Login-button {
            display: inline-block;
            width: 65px;
            height: 60px;
            border-radius: 50%;
            overflow: hidden;
            position: absolute;
            top: 33px;
            right: 70px;
        }
        
        .posters-container {
            display: flex;
            overflow-x: auto; /* Mengaktifkan scrolling horizontal */
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


    </style>
</head>
<body>

    <header>
        <a href="home.html" class="logo">
            <img src="https://i.ibb.co/RzzSCg2/flix.png" alt="AnimeFlix Logo" style="width: 130px; height: 65px;" />
        </a>
        <nav>
            <a href="genre.html" style="position: absolute; top: 48px; font-size: 16px; color: #a29999;left: 200px;font-size: 22px;">Genre</a>
            <a href="history.html" style="position: absolute; top: 48px; font-size: 16px; color: #a29999;left: 310px;font-size: 22px;">History</a>
        </nav>
        <div class="search-box">
            <input type="text" placeholder="Search..." id="searchInput" />
            <a href="search.html">
                <button class="search-button">
                    <img src="https://i.ibb.co/rb6kTcJ/Screenshot-1.png" alt="Search Icon" style="width: 20px; height: 23px;" />
                </button>
            </a>
        </div>
        <a href="profile.html" class="Login-button">
            <img src="https://i.ibb.co/275wkRK/sasuke.png" alt="Login Icon" style="width: 130px; height: 60px;" />
        </a>
    </header>
    <h3>Default</h3><br>
        <div class="posters-container">
            
            <c:forEach var="anime" items="${animeList}">
                <div class="poster">
                    <img src= ${anime.thumbnail} alt="Poster 1" class="poster-img">
                    <p class="poster-text">${anime.title}</p>
                </div>
            </c:forEach>
        </div>
    <c:if test="${not empty animeListgenre}">
        <h3>${animeListgenre[0].genre}</h3><br>
    </c:if>
        <div class="posters-container">
            
            <c:forEach var="anime" items="${animeListgenre}">
                <div class="poster">
                    <img src= ${anime.thumbnail} alt="Poster 1" class="poster-img">
                    <p class="poster-text">${anime.title}</p>
                </div>
            </c:forEach>
        </div>

    <c:if test="${not empty animeListgenre2}">
        <h3>${animeListgenre2[0].genre}</h3><br>
    </c:if>
        <div class="posters-container">
            
            <c:forEach var="anime" items="${animeListgenre2}">
                <div class="poster">
                    <img src= ${anime.thumbnail} alt="Poster 1" class="poster-img">
                    <p class="poster-text">${anime.title}</p>
                </div>
            </c:forEach>
        </div>
    
    <c:if test="${not empty animeListgenre3}">
        <h3>${animeListgenre3[0].genre}</h3><br>
    </c:if>
        <div class="posters-container">
            
            <c:forEach var="anime" items="${animeListgenre3}">
                <div class="poster">
                    <img src= ${anime.thumbnail} alt="Poster 1" class="poster-img">
                    <p class="poster-text">${anime.title}</p>
                </div>
            </c:forEach>
        </div>
        
    <iframe width="560" height="315" src="https://www.youtube.com/embed/QczGoCmX-pI?si=t-cOk0C6w02vsjWe" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    

    <script>
        function searchFunction() {
            var searchInput = document.getElementById('searchInput').value;
            console.log('Search Query:', searchInput);
            // Add your search logic here
        }
    
        document.getElementById("searchInput").addEventListener("keydown", function(event) {
            if (event.key === "Enter") {
                // Redirect to search.html
                window.location.href = "search.html";
            }
        });
    </script>
    
</body>
</html>