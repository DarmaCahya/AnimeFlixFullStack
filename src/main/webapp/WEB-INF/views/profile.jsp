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
</head>
<body>

    <h1>User Profile</h1>

    <c:if test="${user ne null}">
        <table>
            <tr>
                <td><strong>Username:</strong></td>
                <td>${user.username}</td>
            </tr>
            <tr>
                <td><strong>Email:</strong></td>
                <td>${user.email}</td>
            </tr>
        </table>
        
        <!-- Display Subscription Status -->
        <div id="subscriptionStatus"></div>

        <!-- Fetch Subscription Status on Page Load -->
        <script>
            $(document).ready(function () {
                // Make an AJAX request to fetch subscription status
                $.get("/user/subscribe", function (data) {
                    $("#subscriptionStatus").text(data.message);
                });
            });
        </script>

        <!-- Subscribe Button -->
        <button id="subscribeBtn" onclick="subscribeUser()">Subscribe</button>

        <!-- Cancel Subscribe Button -->
        <button id="cancelSubscribeBtn" onclick="cancelSubscribe()">Cancel Subscribe</button>
    </c:if>

    <form method="post" action="/logout">
        <button type="submit">logout</button>
    </form>

    <!-- Subscribe/Cancel Subscribe JavaScript Functions -->
    <script>
        function subscribeUser() {
            $.ajax({
                type: "POST",
                url: "/user/subscribe",
                contentType: "application/json",
                data: JSON.stringify({ "duration": 1 }),
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
