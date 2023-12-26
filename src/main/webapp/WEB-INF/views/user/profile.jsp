<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.codewitharjun.fullstackbackend.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        body,html{
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #0d0c0c;
            color: #fff;
            height: 90%;
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
            right: 0.2%;
            top: 14%;
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

        .container {
            display: flex;
            text-align: left;
            flex-direction: column;
            height: 100%;
        }

        table {
            border-collapse: collapse;
            width:30%;
            margin: 0;
        }

        td {
            padding: 10px;
            margin: 0;
        }

        td strong {
            margin-right: 8px; 
            width: 20%;
        }

        td input{
            width: 85%;
            padding: 10px;
        }
        button {
            margin: 10px;
            padding: 5px 10px;
            cursor: pointer;
            margin-left: 10%;
        }
        
        .table-container{
            margin-left: 3%;
        }
        h1{
            margin-left: 3%;
        }

        .button-container{
            margin-top: 2%;
            margin-left: 3%;
            height: 50%;
        }

        #saveBtn{
            width: 8%;
            height: 10%;
            margin-top: 1%;
            margin-bottom: 2%;
        }
        #subscribeBtn{
            margin: 0;
            margin-top: 0.5%;
            width: 8%;
            height: 10%;
        }
        #cancelSubscribeBtn{
            margin: 0;
            margin-left: 2%;
            margin-top: 0.5%;
            width: 8%;
            height: 10%;
        }

        #logoutBtn{
            margin: 0;
            width: 18.5%;
            height: 45px;
        }

        #EditBtn{
            margin: 0;
            width: 18.5%;
            height: 45px;
            margin-bottom: 2%;
        }

        .textStatus{
            font-size: 20px;
            margin-left: 4%;
            margin-bottom: 1%;
            font-style: italic;
        }
    </style>
</head>
<body>
    <c:if test="${Message != null}">
        <script>
            // JavaScript code to show a pop-up message
            window.onload = function() {
                alert('${Message}');
                
            };
            <c:set var="Message" value="${null}" />
        </script>
    </c:if>
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

    <c:if test="${user ne null}">
        <h1>User Profile</h1>
        <div class="container">
            <div class="table-container">
                <table>
                    <tr>
                        <td><strong>Username</strong></td>
                        <td><strong>${user.username}</strong></td>
                    </tr>
                    <tr>
                        <td><strong>Email</strong></td>
                        <td><strong>${user.email}</strong></td>
                    </tr>
                <c:if test="${userType == 'CUSTOMER'}">

                    <tr>
                        <td><strong>Nama Customer</strong></td>
                        <td><strong>${fkCustomer.namaCustomer}</strong></td>
                    </tr>

                    <tr>
                        <td><strong>Jenis Kelamin</strong></td>
                        <td><strong>${fkCustomer.jenisKelamin}</strong></td>
                    </tr>
                </c:if>
                </table>    
            </div>

            <div class="button-container">
                <c:if test="${userType == 'CUSTOMER'}">
                    <div class="textStatus" id="subscriptionStatus" style="margin-bottom: 0.5%;"></div>
                    <button id="subscribeBtn" onclick="subscribeUser()" style="margin-bottom: 2%;">Subscribe</button>
                    <button id="cancelSubscribeBtn" onclick="cancelSubscribe()">Cancel Subscribe</button>
                </c:if>

                <form method="get" action="/Home/profile/editProfile">
                    <button id="EditBtn">Edit Profile</button>
                </form>

                <c:if test="${userType == 'CUSTOMER'}">
                    <form method="get" action="/Home/profile/payment/riwayat">
                        <button id="EditBtn" type="submit">Riwayat Payment</button>
                    </form>    
                </c:if>

                <form method="post" action="/logout">
                    <button id="logoutBtn" type="submit">logout</button>
                </form>

                
            </div>
        </div>
    </c:if>

    <!-- Subscribe/Cancel Subscribe JavaScript Functions -->
    <!-- Fetch Subscription Status on Page Load -->
    <script>
         $(document).ready(function () {
                // Make an AJAX request to fetch subscription status
                $.get("/user/subscribe", function (data) {
                    $("#subscriptionStatus").text(data.message);
                });
            });


            function subscribeUser() {
                // Display a confirmation dialog
                var isConfirmed = confirm("Apakah kamu pengen subscribe?");

                if (isConfirmed) {
                    window.location.href = "/Home/profile/payment"; 
                } else {
                    // User clicked "No," do nothing or provide feedback
                    alert("Yahh gk jadi Subscribe");
                }
            }
    
        function cancelSubscribe() {
            $.ajax({
                type: "DELETE",
                url: "/user/subscribe",
                success: function (data) {
                    $("#subscriptionStatus").text(data.message);
                    // Show a pop-up with the success message
                    alert(data.message);
                },
                error: function (error) {
                    console.log(error);
                    // Show a pop-up with the error message
                    alert("Error: " + error.responseJSON.message);
                }
            });
        }
    </script>

</body>
</html>
