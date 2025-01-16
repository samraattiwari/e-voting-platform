<%@page import="cand.mgmt.entities.Candidate"%>
<%@ page import="java.util.List" %>
<%@ page import="cand.mgmt.dao.CandidateImp" %>
<%@ page import="cand.mgmt.dao.CandInterface" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Election Results</title>
    <link href="Css/style.css" type="text/css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .winner-message {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .winner-details {
            text-align: left;
            margin-bottom: 20px;
        }
        .winner-details .winner-name {
            font-weight: bold;
        }
        .back-link {
            margin-top: 20px;
        }
        .back-link a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .back-link a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="winner-message">Winner(s)!</div>
        <div class="winner-details">
            <% 
                // Fetch candidates with maximum vote count from database
                CandInterface candidateDao = new CandidateImp();
                List<Candidate> winners = candidateDao.getCandidatesWithMaxVoteCount();

                if (winners != null && !winners.isEmpty()) {
                    for (Candidate winner : winners) {
            %>
            <div>
                <span class="winner-name">Candidate Name:</span> <%= winner.getFirst_name() %> <%= winner.getLast_name() %><br>
                <span class="winner-name">Party:</span> <%= winner.getParty_name() %><br>
                <span class="winner-name">Vote Count:</span> <%= winner.getVoteCount() %>
            </div>
            <hr>
            <% 
                    }
                } else {
            %>
            <div>
                No winners found or vote counts are tied.
            </div>
            <% } %>
        </div>
        <div class="back-link">
            <a href="welcome.jsp">Back to HomePage</a>
        </div>
    </div>
</body>
</html>
