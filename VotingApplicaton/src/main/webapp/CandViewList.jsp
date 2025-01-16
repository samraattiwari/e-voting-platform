<%@page import="cand.mgmt.entities.Candidate"%>
<%@page import="java.util.List"%>
<%@page import="cand.mgmt.dao.CandidateImp"%>
<%@page import="cand.mgmt.dao.CandInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate List</title>
<link href="Css/style.css" type="text/Css" rel="stylesheet">

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f2f5;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .container {
        max-width: 1000px;
        margin: 40px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        color: #333;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #e0e7ff;
    }

    .button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #4CAF50;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .button:hover {
        background-color: #45a049;
    }

    .back-button-container {
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div class="container">
        <%
        CandInterface e3 = new CandidateImp();
        List<Candidate> candidateList = e3.getAllCandidates();
        %>

        <table>
            <thead>
                <tr>
                    <th>Candidate ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>State</th>
                    <th>City</th>
                    <th>Age</th>
                    <th>Party Name</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (Candidate candidate : candidateList) {
                %>
                <tr>
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
            </tbody>
        </table>

        <div class="back-button-container">
            <a href="welcome.jsp" class="button">Back to HomePage</a>
        </div>
    </div>
</body>
</html>
