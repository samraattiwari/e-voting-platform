<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Voter ID Validation</title>
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
            max-width: 500px;
            width: 100%;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #007bff;
            margin-bottom: 30px;
        }
        .message {
            margin-top: 20px;
            font-size: 18px;
        }
        .error {
            color: red;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #0056b3;
        }
        
        .back-button-container {
        text-align: center;
        margin-top: 20px;
    }
    </style>
</head>
<body>
    <div class="container">
        <h1>Voter ID Validation</h1>
        <% 
            String reenteredVoterId = request.getParameter("voterId");
            String generatedVoterId = (String) session.getAttribute("generatedVoterId");

            if (reenteredVoterId != null && reenteredVoterId.equals(generatedVoterId)) {
        %>
        <div class="message">
            <p>Voter ID validation successful. You can now proceed to vote.</p>
            <a class="button" href="Voting.jsp">Click to Vote</a>
        </div>
        <% } else { %>
        <div class="message error">
            <p>Invalid Voter ID. Please try again.</p>
        </div>
        <a class="button" href="ReenterVoterId.jsp">Reenter Voter ID</a>
        <% } %>
    </div>
    <div class="back-button-container">
            <a href="add_voter.jsp" class="button">Regenerate Id</a>
        </div>
</body>
</html>
