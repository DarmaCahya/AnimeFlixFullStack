<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Form</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-image: url('File/lost_in_a_dark-wallpaper-1600x900.jpg'); /* Ganti path/to/your/image.jpg dengan path ke gambar Anda */
            background-size: cover; /* Agar gambar menutupi seluruh latar belakang */
            background-position: center; /* Posisikan gambar di tengah */
            background-repeat: no-repeat; /* Hindari pengulangan gambar */
        }

        #username{
            position: absolute;
            top: 21.5%;
            left: 15%;
            font-size: 100%;
            border: 1px solid #646161;
        }

        #password{
            position: absolute;
            top:62%;
            left: 15%;
            font-size: 100%;
            border: 1px solid #646161;
        }

        #confirmPassword{
            position: absolute;
            top: 76.5%;
            left: 15%;
            font-size: 100%;
            border: 1px solid #646161;
        }

        #email{
            position: absolute;
            top: 35%;
            left: 15%;
            font-size: 100%;
            border: 1px solid #646161;
        }

        #phone{
            position: absolute;
            top: 48.5%;
            left: 15%;
            font-size: 100%;
            border: 1px solid #646161;
        }

        #showPassword{
            position: absolute;
            bottom: 32.5%;
            left: 40%;
            height: 2.5%;
            border: 1px solid #646161;
        }

        #showConfirmPassword{
            position: absolute;
            bottom: 18%;
            left: 40%;
            height: 2.5%;
            border: 1px solid #646161;
        }

        .signup-container {
            position: relative;
            left: -275px;
            top: -15px;
            height: 85vh;
            width: 23vw;
            border: 1px solid #000000;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: rgba(34, 32, 47, 0.9);  
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            background-color: #1F1D2A;
            
            opacity: 0.9;
            width: 70%;
            padding: 4.5%;
            border-radius: 8px;
            border: 2px solid #1F1D2A;
            box-sizing: border-box;
            margin-bottom: 5px; /* Memberi ruang antar input */
        }

        .password-input {
            width: calc(100% - 14px);
            /* Lebar input password dikurangi margin dan padding */
            padding: 8px;
            box-sizing: border-box;
            margin-right: 5px;
            display: inline-block;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .checkbox-group label {
            margin-bottom: 0;
            margin-left: -137px;
        }
        
        

        .signup-button,
        .login-button {
            background-color: #6A9CFC;
            font-size: 180%;
            font-family: 'Inter',serif;
            color: white;
            width: 45%;
            height: 8%;
            padding: 6%;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-bottom: 100px; 
            position: absolute;
            bottom: -8%;
            left: 30%;
            line-height: 12%;
        }

        .signup-button:hover,
        .login-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form method="post" action="/register">
        <div class="signup-container">
            <h2>Signup</h2>
            <style>
                h2{           
                font-size: 250%;
                font-weight: 100;
                font-family: 'Inria Serif',serif;
                color: #FFEFEF;
                opacity: 0.7;
                position:relative;
                top: 3%;
                left: 36%; }
            </style>
            <div class="form-group">
                <label for="username", style="color: #FFEFEF; font-size: 150%; opacity: 0.8;font-family: 'Inria Serif',serif; font-weight: 300; position: absolute; top: 140px; left: 80px;">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username", style="opacity: 1;color: #FFEFEF; ">
            </div>
            <div class="form-group">
                <label for="email", style="color: #FFEFEF; font-size: 150%; opacity: 0.8;font-family: 'Inria Serif',serif; font-weight: 300; position: absolute; top: 250px; left: 80px;">Email</label>
                <input type="text" id="email" name="email" placeholder="Enter your email", style="opacity: 1;color: #FFEFEF; ">
            </div>
            <div class="form-group">
                <label for="phone", style="color: #FFEFEF; font-size: 150%; opacity: 0.8;font-family: 'Inria Serif',serif; font-weight: 300; position: absolute; top: 360px; left: 80px;">No Handphone</label>
                <input type="text" id="phone" name="phone" placeholder="Enter your phone number", style="opacity: 1;color: #FFEFEF; ">
            </div>
            <div class="form-group">
                <label for="password", style="color: #FFEFEF; font-size: 150%; opacity: 0.8;font-family: 'Inria Serif',serif; font-weight: 300; position: absolute; top: 472px; left: 80px;">Password</label>
                <input type="password" id="password" name="password" class="password-input" placeholder="Enter your password", style="opacity: 1;color: #FFEFEF; ">
                <div class="checkbox-group">
                    <input type="checkbox" id="showPassword" name="showPassword">
                </div>
            </div>
            <div class="form-group">
                <label for="confirmPassword", style="color: #FFEFEF; font-size: 150%; opacity: 0.8;font-family: 'Inria Serif',serif; font-weight: 300; position: absolute; top: 585px; left: 80px;">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="password-input" placeholder="Confirm your password", style="opacity: 1;color: #FFEFEF; ">
                <div class="checkbox-group">
                    <input type="checkbox" id="showConfirmPassword" name="showConfirmPassword">
                </div>
            </div>
            <div class="form-group">
                <label for="usertype" style="color: #FFEFEF; font-size: 150%; opacity: 0.8;font-family: 'Inria Serif',serif; font-weight: 300; position: absolute; top: 700px; left: 80px;">User Type</label>
                <select id="usertype" name="usertype" style="opacity: 1; color: #FFEFEF; padding: 10px;">
                    <option value="ADMIN">ADMIN</option>
                    <option value="CUSTOMER">CUSTOMER</option>
                    <option value="PUBLISHER">PUBLISHER</option>
                </select>
            </div>
            <button class="signup-button" onclick="signup()">Signup</button>
        </div>
    </form>
    <script>
        function signup() {
            window.location.href = "/login";

        }
        
        document.getElementById('showPassword').addEventListener('change', function () {
            var passwordInput = document.getElementById('password');
            passwordInput.type = this.checked ? 'text' : 'password';
        });

        document.getElementById('showConfirmPassword').addEventListener('change', function () {
            var passwordInput = document.getElementById('confirmPassword');
            passwordInput.type = this.checked ? 'text' : 'password';
        });
    </script>
</body>
</html>
