<%@page import="cand.mgmt.entities.Candidate"%>
<%@page import="java.util.List"%>
<%@page import="cand.mgmt.dao.CandidateImp"%>
<%@page import="cand.mgmt.dao.CandInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Voting Page</title>
    <link href="Css/style.css" type="text/css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            width: 80%;
            max-width: 1000px;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        caption {
            margin: 20px 0;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        .submit-container {
            text-align: center;
            margin-top: 20px;
        }
        .submit-btn {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <%
    CandInterface e3 = new CandidateImp();
    List<Candidate> candidateList = e3.getAllCandidates();
    %>

    <form action="SubmitVote" method="post">
        <table>
            <caption>Select the candidate and submit</caption>
            <tr>
                <th>Select</th>
                <th>CandidateId</th>
                <th>FirstName</th>
                <th>LastName</th>
                <th>State</th>
                <th>City</th>
                <th>Age</th>
                <th>PartyName</th>
            </tr>

            <%
            for (Candidate candidate : candidateList) {
            %>

            <tr>
                <td><input type="radio" name="candidateId" value="<%=candidate.getCandidate_id()%>"></td>
                <td><%=candidate.getCandidate_id()%></td>
                <td><%=candidate.getFirst_name()%></td>
                <td><%=candidate.getLast_name()%></td>
                <td><%=candidate.getState()%></td>
                <td><%=candidate.getCity()%></td>
                <td><%=candidate.getAge()%></td>
                <td><%=candidate.getParty_name()%></td>
            </tr>

            <%
            }
            %>
        </table>
        <div class="submit-container">
            <button type="submit" class="submit-btn">Submit Vote</button>
        </div>
    </form>
</div>

</body>
</html>
