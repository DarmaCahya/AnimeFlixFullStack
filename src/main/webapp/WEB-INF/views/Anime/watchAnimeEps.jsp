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
            align-items: center;
            justify-content: center;
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
            margin-left: 4%;
        }

        ul {
            list-style-type: none;
            padding: 0;
            align-items: center;
            width: 50%;
            margin-bottom: 0;
        }

        li {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            margin-left: 10%;
        }

        iframe {
            align-items: center;
            width: 100%;
            height: 600px;  
            border: 1px solid #ddd; 
            margin-left: 10%;
            margin-top: 3%;
            margin-bottom: 3%;
        }


        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
        }

        button {
            padding: 8px 16px;
            margin-top: 5px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
        }

        #refresh-comments {
            margin-top: 10px;
        }

        #comment-list {
            margin-top: 20px;
        }

        #comment-list p {
            margin-bottom: 5px;
        }

        .like-button{
            display:flex;
            flex-wrap: wrap;
            align-items: center;
            margin-left: 5%;
        }

        .like, .unlike {
            padding: 10px 20px; 
            margin: 0 10px; 
        }

        .like {
            background-color: blue;
        }

        .unlike {
            background-color: red; 
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            // Fungsi untuk memuat kembali daftar komentar
            function refreshComments() {
                var url = "${episode.episodeNumber}/comments"; // Ganti dengan URL yang benar

                $.ajax({
                    type: "POST",
                    url: url,
                    success: function (response) {
                        // Ganti isi dari div "comment-list" dengan daftar komentar yang baru
                        $("#comment-list").html(response);

                        // Tambahkan logika lain sesuai kebutuhan
                    },
                    error: function (error) {
                        // Tampilkan pesan error dalam popup jika diperlukan
                        alert("Refresh Halaman untuk melihat Komentar Terbaru");

                        // Tambahkan logika lain sesuai kebutuhan
                    }
                });
            }

            $(".like-form").submit(function (event) {
                event.preventDefault();

                var form = $(this);
                var url = form.attr("action");

                $.ajax({
                    type: "POST",
                    url: url,
                    success: function (response) {
                        // Tampilkan pesan respons dalam popup
                        alert(response);
                    },
                    error: function (error) {
                        // Tampilkan pesan error dalam popup jika diperlukan
                        alert("Error: " + error.statusText);

                        // Tambahkan logika lain sesuai kebutuhan
                    }
                });
            });

            $(".unlike-form").submit(function (event) {
                event.preventDefault();

                var form = $(this);
                var url = form.attr("action");

                $.ajax({
                    type: "DELETE",  // Ubah metode menjadi DELETE
                    url: url,
                    success: function (response) {
                        // Tampilkan pesan respons dalam popup
                        alert(response);
                    },
                    error: function (error) {
                        // Tampilkan pesan error dalam popup jika diperlukan
                        alert("Error: " + error.statusText);

                        // Tambahkan logika lain sesuai kebutuhan
                    }
                });
            });

            $(".comment-form").submit(function (event) {
                event.preventDefault();

                var form = $(this);
                var url = form.attr("action");
                var commentText = form.find("textarea[name='comment']").val();

                $.ajax({
                    type: "POST",
                    url: url,
                    data: { comment: commentText },
                    success: function (response) {
                        // Tampilkan pesan respons dalam popup
                        //alert(response);

                        // Tambahkan logika lain sesuai kebutuhan
                        refreshComments();
                    },
                    error: function (error) {
                        // Tampilkan pesan error dalam popup jika diperlukan
                        alert("Error: " + error.statusText);

                        // Tambahkan logika lain sesuai kebutuhan
                    }
                });
            });

            // Tombol refresh komentar
            $("#refresh-comments").click(function () {
                refreshComments();
            });
        });
    </script>
</head>
<body>
    <header>
        <a href="/Home" class="logo">
            <img src="https://i.ibb.co/RzzSCg2/flix.png" alt="AnimeFlix Logo" style="width: 130px; height: 65px;" />
        </a>
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

    <h1>Watch Anime ${animeDetail.title}</h1>
    
    <c:if test="${not empty episode}">
        <ul>
            <li>Episode ${episode.episodeNumber}</li>
            <iframe width="800" height="600" src=${episode.videoUrl} title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        </ul>

        <div class="like-button">
            <form method="post" action=${episode.episodeNumber}/like class="like-form">
                <button class="like" type="submit">Like</button>
            </form>
    
            <form method="delete" action=${episode.episodeNumber}/like class="unlike-form">
                <button class="unlike" type="submit">Unlike</button>
            </form>
        </div>

        <form method="post" action="${episode.episodeNumber}/comment" class="comment-form">
            <textarea name="comment" placeholder="Tambahkan komentar" rows="4" cols="50"></textarea>
            <br>
            <button type="submit">Tambah Komentar</button>
        </form>

        <h4>Daftar Komentar:</h4>
        <div id="comment-list">
            <c:forEach var="comment" items="${episode.comments}">
                <p>${comment.user.username} - ${comment.comment} - ${comment.commentedAt}</p>
            </c:forEach>
        </div>
    </c:if>
</body>
</html>
