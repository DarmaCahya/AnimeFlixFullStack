<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Page Not Found</title>
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
        width: 100%;
        border-radius: 0;
        border: 2px solid #1f1d2a;
        box-sizing: border-box;
        margin-bottom: 5px;
        right: 70%;
      }

      #searchInput {
        background-color: #242524;
        opacity: 0.9;
        width: 100%;
        padding: 7px;
        border-radius: 0;
        border: none;
        color: #fff;
      }

      .search-button {
        top: 10%;
        right: 100%;
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
        top: 3.5%;
        right: 3%;
      }

      nav a:hover {
        color: #504f4c;
      }

      
        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        h1 {
            font-size: 100px;
            color: #333;
            margin: 0;
        }

        p {
            font-size: 20px;
            color: #666;
            margin: 10px 0;
        }

        a {
            color: #3498db;
            text-decoration: none;
        }

    </style>
  </head>
  <body>
    <header>
      <a href="/Home" class="logo">
        <img src="https://i.ibb.co/RzzSCg2/flix.png" alt="AnimeFlix Logo" style="width: 130px; height: 65px" />
      </a>
      <nav>
        <a href="/Home/genre/">Genre</a>
        <a href="/Home/history/">History</a>
      </nav>
      <form action="/Home/search/" method="get" class="search-box">
        <select name="searchType" id="searchType">
          <option value="genre">Genre</option>
          <option value="title">Title</option>
        </select>

        <div class="search-container">
          <input type="text" placeholder="Search..." id="searchInput" name="Cari" />
          <button type="submit" class="search-button">
            <img src="https://i.ibb.co/rb6kTcJ/Screenshot-1.png" alt="Search Icon" style="width: 40%" />
          </button>
        </div>
      </form>
      <a href="/Home/profile/" class="Login-button">
        <img src="https://i.ibb.co/275wkRK/sasuke.png" alt="Login Icon" style="width: 130px; height: 60px" />
      </a>
    </header>

    <div class="container">
        <h1>${erorrcode}</h1>
        <p>${errorMessage}</p>
        <p><a href=${erorrRoute}>Go back</a></p>
    </div>
  </body>
</html>
