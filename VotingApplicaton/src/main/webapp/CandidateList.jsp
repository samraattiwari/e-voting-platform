<%@ page import="cand.mgmt.entities.Candidate" %>
<%@ page import="java.util.List" %>
<%@ page import="cand.mgmt.dao.CandidateImp" %>
<%@ page import="cand.mgmt.dao.CandInterface" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Candidate List</title>
    <link href="Css/style.css" type="text/css" rel="stylesheet">
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
            border-radius: 5px;
            display: inline-block;
            margin-right: 10px; /* Added margin-right for button spacing */
            transition: background-color 0.3s;
        }

        .button:nth-child(1) {
            background-color: #ff3333; /* Red background for delete button */
        }

        .button:nth-child(2) {
            background-color: #4caf50; /* Green background for update button */
        }

        .button:hover {
            opacity: 0.8; /* Reduced opacity on hover for button effect */
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
            <caption>Candidate List</caption>
            <thead>
                <tr>
                    <th>CandidateId</th>
                    <th>FirstName</th>
                    <th>LastName</th>
                    <th>State</th>
                    <th>City</th>
                    <th>Age</th>
                    <th>PartyName</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                CandInterface e3 = new CandidateImp();
                List<Candidate> candidateList = e3.getAllCandidates();
                for (Candidate candidate : candidateList) { %>
                    <tr>
                        <td><%= candidate.getCandidate_id() %></td>
                        <td><%= candidate.getFirst_name() %></td>
                        <td><%= candidate.getLast_name() %></td>
                        <td><%= candidate.getState() %></td>
                        <td><%= candidate.getCity() %></td>
                        <td><%= candidate.getAge() %></td>
                        <td><%= candidate.getParty_name() %></td>
                        <td>
                            <a class="button" href="deleteCandidate?id=<%= candidate.getCandidate_id() %>">Delete</a>
                            <a class="button" href="UpdateCandidate.jsp?id=<%= candidate.getCandidate_id() %>">Update</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        
        <a class="back-link" href="adminDashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
