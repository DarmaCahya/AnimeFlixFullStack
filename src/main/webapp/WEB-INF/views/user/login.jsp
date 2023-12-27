<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-image: url("File/lost_in_a_dark-wallpaper-1600x900.jpg");
            background-size: cover; /* Agar gambar menutupi seluruh latar belakang */
            background-position: center; /* Posisikan gambar di tengah */
            background-repeat: no-repeat; /* Hindari pengulangan gambar */
        }
        
        h2{
            font-size: 350%;
            font-weight: 100;
            font-family: 'Inria Serif',serif;
            color: #FFEFEF;
            opacity: 0.7;
            position:relative;
            top: 5%;
            left: 36%; 
        }

        p{
            font-size: 130%;
            font-weight: 100;
            font-family: 'Inria Serif',serif;
            color: #FFEFEF;
            opacity: 0.7;
            position:relative;
            top: 65%;
            left: 20%; 
        }

        #username{
            position: absolute;
            top: 35%;
            left: 15%;
            font-size: 100%;
            border: 1px solid #646161;
        }

        #password{
            position: absolute;
            top: 57%;
            left: 15%;
            font-size: 100%;
            border: 1px solid #646161;
        }

        #showPassword{
            position: absolute;
            bottom: 36.5%;
            left: 74%;
            /* height: 3%; */
            border: 1px solid #646161;
            font-size: 100px;
            width: fit-content;
            transform: scale(2);
        }

        .login-container {
            position: relative;
            left: -275px;
            top: -15px;
            height: 70vh;
            width: 23vw;
            padding: 20px;
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
            padding: 5%;
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
            margin-left: -17px;
        }

        .login-button,
        .signup-button {
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
            bottom: 4%;
            left: 30%;
            line-height: 12%;
            
        }

        .login-button:hover,
        .signup-button:hover {
            background-color: #45a049;
        }

        #showPassword {
            margin-top: 5px;
        }

        p{
            color: white;
        }
        .register-button{
            color: white;
        }
        .register-button:hover{
            color: #342879;
        }
    </style>
</head>
<body>
    <form method="post" action="/login">
    <div class="login-container">
        <h2>Login</h2>
        <p>Dont't have an account?<a class="register-button" href="register"> Register</a></p>
        <div class="form-group">
            <label for="username1", style="color: #FFEFEF; font-size: 200%; opacity: 0.8;font-family: 'Inria Serif',serif; font-weight: 300; position: absolute; top: 190px; left: 80px;">Username</label>
            
            <input type="text" id="username" name="username" placeholder="Enter your Username", style="opacity: 1;color: #FFEFEF; ">
            
        </div>
        <div class="form-group">
            <label for="password", style="color: #FFEFEF; font-size: 200%;opacity: 0.8;font-family: 'Inria Serif', serif;font-weight: 300; position: absolute; top: 350px; left: 80px;">Password</label>
            <input type="password" id="password" name="password" class="password-input" placeholder="Enter your Password", style="opacity: 1;color: #FFEFEF;"">
            <div class="checkbox-group">
                <input type="checkbox" id="showPassword" name="showPassword">
            </div>
        </div>
        <button class="login-button" type="submit" value="Submit" >Login</button>

        
        <c:if test="${not empty errorMessage}">
            <script>
                // JavaScript code to show a pop-up message
                window.onload = function() {
                    alert('Fuck you, ${errorMessage}!');
                };
            </script>
        </c:if>

        <c:if test="${not empty logoutMessage}">
            <script>
                // JavaScript code to show a pop-up message
                window.onload = function() {
                    alert('${logoutMessage}');
                };
            </script>
        </c:if>
    </div>
    </form>
    
    <script>
        document.getElementById('showPassword').addEventListener('change', function () {
            var passwordInput = document.getElementById('password');
            passwordInput.type = this.checked ? 'text' : 'password';
        });

        function login(){
            var form = document.getElementById('loginForm');

        // Add an event listener for the form submission
            form.addEventListener('submit', function(event) {
                event.preventDefault(); // Prevent the default form submission

                    // Retrieve the values of username and password
                var username = document.getElementById('username').value;
                var password = document.getElementById('password').value;

                if(username.length === 0 || password.length === 0){
                    document.getElementById('errorMessage').innerText = "Please enter username and password";
                    event.preventDefault();
                }
                    // Display the values (for demonstration purposes)
                console.log('Username:', username);
                console.log('Password:', password);
            });
        }

    </script>

</body>
</html>