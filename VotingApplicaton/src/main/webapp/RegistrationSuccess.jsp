<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 800px;
            margin: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #007bff;
            text-align: center;
            font-weight: bold;
        }
        .message {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
        }
        .voter-id {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-top: 30px;
            padding: 10px;
            background-color: #f7f7f7;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .home-link, .reenter-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .home-link:hover, .reenter-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registration Successful</h1>
        <% 
            String voterId = request.getParameter("voterId");
            session.setAttribute("generatedVoterId", voterId);
        %>
        <div class="message">
            <p>Your Voter ID has been successfully generated: Remember this unique ID</p>
            <div class="voter-id"><%= voterId %></div>
        </div>
        <a class="home-link" href="welcome.jsp">Go to Home Page</a>
    </div>
</body>
</html>
