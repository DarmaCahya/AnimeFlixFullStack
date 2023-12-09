<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Watch Anime</title>
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

    <h1>Watch Anime Episodes</h1>

    <!-- ... -->

    <c:if test="${not empty AnimeDetail}">
        <h3>${AnimeDetail.title}</h3><br>
    </c:if>

    <c:if test="${not empty episode}">
        <ul>
            <li>${episode.episodeTitle} - Episode ${episode.episodeNumber}</li>
            <iframe width="560" height="315" src=${episode.videoUrl} title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        </ul>

        <form method="post" action=${episode.episodeNumber}/like class="like-form">
            <button type="submit">Like</button>
        </form>

        <form method="delete" action=${episode.episodeNumber}/like class="unlike-form">
            <button type="submit">Unlike</button>
        </form>

        <form method="post" action="${episode.episodeNumber}/comment" class="comment-form">
            <textarea name="comment" placeholder="Tambahkan komentar" rows="4" cols="50"></textarea>
            <br>
            <button type="submit">Tambah Komentar</button>
        </form>

        <button id="refresh-comments">Refresh Komentar</button>

        <h4>Daftar Komentar:</h4>
        <div id="comment-list">
            <c:forEach var="comment" items="${episode.comments}">
                <p>${comment.user.username} - ${comment.comment} - ${comment.commentedAt}</p>
            </c:forEach>
        </div>
    </c:if>
</body>
</html>
