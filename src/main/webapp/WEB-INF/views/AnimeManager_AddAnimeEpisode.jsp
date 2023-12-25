<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- ... (bagian head tetap sama) ... -->
    <style>
        body {
            display: flex;
            flex-direction: column;
            height: 100vh;
            margin: 0;
            background-color: rgb(37, 33, 33);
        }

        .header1 {
            padding-top: 1%;
            padding-left: 1%;
            order: 1;
            position: sticky;
            top: 0;
            background-color: rgb(37, 33, 33);
        }
        

        h1 {
            font-size: 300%;
            font-weight: 100;
            font-family: 'Inria Serif', serif;
            color: #FFEFEF;
            opacity: 0.7;
            position: relative;
            margin: 1%;
            margin-left: 0%;
        }

        p{
            font-size: 100%;
            font-weight: 100%;
            font-family: 'Inria Serif', serif;
            color: #FFEFEF;
            opacity: 0.7;
            position: relative;
            margin: 1%;
            margin-left: 0%;
        }

        .container {
            display: flex;
            order: 2; 
        }

        /* Sidebar Styling */
        .sidebar {
            margin: 0;
            position: fixed;
            padding: 0;
            width:20%;
            height: 100%;
            background-color: rgb(37, 33, 33);
        }

        .sidebar a {
            display: block;
            font-size: 120%;
            left: 100px;
            color: rgb(238, 222, 222);
            padding: 16px;
            text-decoration: none;
            position: sticky;
        }

        /* Content Styling */
        .content {
            margin-left: 20%; /* Adjust the margin to match the sidebar width */
            padding: 1px 16px;
            width: 80%;
            overflow: auto;
            flex-grow: 1;
            box-sizing: content-box;
            background-color: #FFEFEF;
        }


        .button {
            position: fixed;
            margin: 0;
            order: 3; 
            padding-top: 1%;
            padding-left: 2%;
        }

        .sidebar a.active {
        background-color: #04AA6D;
        color: white;
        }

        .sidebar a:hover:not(.active) {
            background-color: #555;
            color: white;
        }
        .logout-button {
            background-color: rgb(78, 71, 71);
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            width: 400%;
            cursor: pointer;
            font-size: 15px;
        }
        .logout-button:hover{
            background-color: #555;
            color: #fff;

        }
        td {
        text-align: center;
        }
    </style>
</head>

<body>
    <div class="header1">
        <form method="get" action="Home">
            <button class="back-button">Back</button>
        </form>
        <h1>AnimeFlix</h1>
    </div>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <a href="../AnimeManager">Dashboard</a>
            <a href="./ListAnime">List Anime</a>
            <a href="./TambahAnime">TambahAnime</a>
            <a href="./TambahAnimeEpisode">TambahAnimeEpisode</a>
            <div class="button">
                <form method="post" action="/logout">
                    <button type="submit" class="logout-button">logout</button>
                </form>
            </div>
        </div>


            
    <!-- Content -->
    <div class="content">
        <h2>Main Content</h2>
        <form method="post" action="./TambahAnimeEpisode"> <!-- Adjust the action attribute accordingly -->

            <label for="episode_title">Episode Title:</label>
            <input type="text" id="episode_title" name="episode_title" required><br>
        
            <label for="video_url">Video URL:</label>
            <input type="text" id="video_url" name="video_url" required><br>
        
            <label for="anime_id">Anime ID:</label>
            <select id="anime_id" name="anime_id" required>
                <c:forEach var="anime" items="${animeList}">
                    <option value="${anime.animeId}">${anime.animeId} - ${anime.title}</option>
                </c:forEach>
            </select><br>
        
            <label for="requires_subscription">Requires Subscription:</label>
            <select id="requires_subscription" name="requires_subscription" required>
                <option value="true">True</option>
                <option value="false">False</option>
            </select><br>
        
            <label for="episode_number">Episode Number:</label>
            <input type="text" id="episode_number" name="episode_number" required><br>
        
            <button type="submit">Submit</button>
        </form>

        
    </div>

    </div>

    <script>
        
    </script>
</body>
</html>
