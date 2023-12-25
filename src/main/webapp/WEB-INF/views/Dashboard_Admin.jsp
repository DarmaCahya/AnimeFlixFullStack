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
            margin-left: 17%;
            position: fixed;
            padding: 1px 16px;
            width: 100%;
            height: 10000%;
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

        .back-button {
            cursor: pointer;
            padding: 10px 15px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: #2980b9;
        }

        .back-button span {
            margin-right: 5px;
        }

    </style>
</head>

<body>
    <div class="header1">
        <form method="post" action="./">
            <button class="back-button">Back</button>
        </form>
        <h1>AnimeFlix</h1>
    </div>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <a href="../Dashboard">Dashboard</a>
            <a href="./Dashboard/ListCustomer">List Customer</a>
            <a href="./Dashboard/ListPublisher">List Publisher</a>
            <a href="./Dashboard/ListAnime">List Anime</a>
            <div class="button">
                <form method="post" action="/logout">
                    <button type="submit" class="logout-button">logout</button>
                </form>
            </div>
        </div>

        <!-- Content -->
        <div class="content">
            <h2>Main Content</h2>
            <p>This is the main content area. You can add your page content here.</p>
            <h2>
            <table border="1">
                <thead>
                    <tr>
                        <td>Banyak User</td>
                        <td>Banyak Admin</td>
                        <td>Banyak Customer</td>
                        <td>Banyak Publisher</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${banyakuser}</td>
                        <td>${adminCount}</td>
                        <td>${customerCount}</td>
                        <td>${publisherCount}</td>
                    </tr>
                </tbody>
            </table>  
            </h2>  
        </div>
    </div>
    <script>
        
    </script>
</body>
</html>
