<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- ... (bagian head tetap sama) ... -->
    <style>
        body,html{
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #0d0c0c;
            color: #fff;
            height: 100%;
            overflow: hidden;
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

        .sidebar {
            margin: 0;
            position: fixed;
            padding: 0;
            width:20%;
            height: 100%;
            background-color: #0d0c0c;
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

        .content {
            margin-top: 0%;
            margin-left: 17%;
            position: fixed;
            padding: 1px 16px;
            width: 100%;
            height: 1000%;
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

        .content {
            margin-top: 0; 
            padding: 20px;
            overflow-y: auto; 
            height: calc(100vh - 60px); 
        }
        table {
            width:80%;
            border-collapse: collapse;
            margin-top: 20px;
            text-align: center;
        }

        th, td {
            border: 2px solid #000000;
            padding: 8px;
            text-align: left;
            color: black;
            text-align: center;
        }

        th {
            background-color: #fff8f8;
        }

    </style>
</head>

<body>
    <header>
        <a href="/Home" class="logo">
            <img src="https://i.ibb.co/RzzSCg2/flix.png" alt="AnimeFlix Logo" style="width: 130px; height: 65px;" />
        </a>
        <a href="/Home/profile/" class="Login-button">
            <img src="https://i.ibb.co/275wkRK/sasuke.png" alt="Login Icon" style="width: 130px; height: 60px;" />
        </a>
    </header>

    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <a href="../Dashboard">Dashboard</a>
            <a href="./ListCustomer">List Customer</a>
            <a href="./ListPublisher">List Publisher</a>
            <a href="./ListAnime">List Anime</a>
            <div class="button">
                <form method="post" action="/logout">
                    <button type="submit" class="logout-button">logout</button>
                </form>
            </div>
        </div>
        <c:if test="${not empty pesan}">
            <script>
                // JavaScript code to show a pop-up message
                window.onload = function() {
                    alert('${pesan}!');
                };
            </script>
        </c:if>

        <div class="content">
            <p>This is the main content area. You can add your page content here.</p>
            <c:if test="${not empty banyakuser}">
                <tr><h3>Banyak User</h3></tr>
                <tr><h3>${banyakuser}</h3></tr>
            </c:if>
            <table border="1">
                <thead>
                    <tr>
                        <td>id</td>
                        <th>Nama</th>
                        <th>Email</th>
                        <th>password</th>
                        <th>Alert</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.password}</td>  
                            <td>
                                <form method="post" action="./ListCustomer/${user.id}">
                                    <button type="submit">Kasih paham</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                    
                </tbody>
            </table>
            
        </div>
    </div>

    <script>
        
    </script>
</body>
</html>
