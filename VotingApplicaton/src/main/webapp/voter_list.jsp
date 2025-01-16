<%@ page import="cand.mgmt.dao.*, cand.mgmt.entities.Voter, java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Voter List</title>
    <link href="css/style.css" type="text/css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f8fd; /* Light background */
            margin: 0;
            padding: 20px; /* Added padding */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 90%; /* Adjusted width */
            margin: 20px auto; /* Centered with margin */
        }

        table {
            width: 100%; /* Full width of container */
            border: 2px solid #e0e0e0;
            border-collapse: collapse;
            margin-top: 20px; /* Increased margin top */
            background-color: #ffffff; /* White background */
        }

        th, td {
            padding: 15px; /* Adjusted padding */
            text-align: center;
            border: 1px solid #ccc;
        }

        caption {
            margin: 20px auto;
            font-size: 24px;
            font-weight: bold;
            text-decoration: underline;
            color: #333;
        }

        .button {
            padding: 10px 15px;
            text-decoration: none;
            color: white;
            background-color: #ff3333; /* Red background */
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #cc0000; /* Darker red on hover */
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            font-size: 18px;
            color: #ffffff; /* White text */
            background-color: #007bff; /* Blue background */
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.3s;
        }

        .back-link:hover {
            background-color: #0056b3; /* Darker blue on hover */
            transform: scale(1.05); /* Slightly scale on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <table>
            <caption>Voter List</caption>
            <thead>
                <tr>
                    <th>VoterId</th>
                    <th>FirstName</th>
                    <th>LastName</th>
                    <th>AadharNo</th>
                    <th>Age</th>
                    <th>State</th>
                    <th>City</th>
                    <th>Has Voted</th>
                    <th>DOB</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                VoterInt voterDao = new VoterImpl();
                List<Voter> voterList = voterDao.getAllDetails();
                for (Voter voter : voterList) { %>
                    <tr>
                        <td><%= voter.getVoterId() %></td>
                        <td><%= voter.getFirstName() %></td>
                        <td><%= voter.getLastName() %></td>
                        <td><%= voter.getAadharNo() %></td>
                        <td><%= voter.getAge() %></td>
                        <td><%= voter.getState() %></td>
                        <td><%= voter.getCity() %></td>
                        <td><%= voter.isHasVoted() %></td>
                        <td><%= voter.getDob() %></td>
                        <td><a class="button" href="deleteVoter?id=<%= voter.getVoterId() %>">Delete</a></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        
        <a class="back-link" href="adminDashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
