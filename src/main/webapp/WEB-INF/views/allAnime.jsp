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
            text-align: center;
        }

        .logo {
            display: inline-block;
            margin-right: 20px;
            color: #ff0000;
            text-decoration: none;
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
            left: 75%;
            bottom: 92%;
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
        }

        .search-button {
            position: absolute;
            top: 50%;
            right: 5px;
            transform: translateY(-50%);
            border: none;
            background-color: transparent;
            cursor: pointer;
        }

        .Login-button {
            display: inline-block;
            width: 60px;
            height: 45px;
            border-radius: 50%;
            overflow: hidden;
            position: absolute;
            top: 10px;
            right: 50px;
        }

    </style>
</head>
<body>

    <header>
        <a href="home.html" class="logo">
            <img src="https://i.ibb.co/RzzSCg2/flix.png" alt="AnimeFlix Logo" style="width: 130px; height: 60px;" />
        </a>
        <nav>
            <a href="genre.html" style="position: absolute; right: 1240px; top: 30px; font-size: 16px; color: #a29999;">Genre</a>
            <a href="history.html" style="position: absolute; right: 1150px; top: 30px; font-size: 16px; color: #a29999;">History</a>
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

    <c:forEach var="anime" items="${animeList}">
        <div class="posters-container">
            <div class="poster1">
                <img src="https://i.ibb.co/k6Xt04B/gambar1.jpg" alt="Poster 1" >
                <p class="poster-text" style="text-align: center; position: absolute; top: 340px; left: 90px;">${anime.title}</p>
            </div>
        </div>
    </c:forEach>
    

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