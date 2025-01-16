<%@ page import="cand.mgmt.dao.*, cand.mgmt.entities.Voter, cand.mgmt.utils.Utils, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Voter List</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f2f5;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        position: relative;
    }

    table {
        width: 90%;
        margin: 20px auto; /* Center align the table */
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    caption {
        margin: 20px;
        font-size: 24px;
        font-weight: bold;
        color: #333;
        text-align: center;
        text-decoration: underline;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 15px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
        color: #333;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #e0e7ff;
    }

    .home-link {
        position: absolute;
        top: 20px;
        right: 20px;
        padding: 10px 15px;
        text-decoration: none;
        color: white;
        background-color: #007bff;
        border-radius: 5px;
        font-weight: bold;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .home-link:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }
</style>
</head>
<body>

<%
VoterInt voterDao = new VoterImpl();
List<Voter> voterList = voterDao.getAllDetails();
%>

<a class="home-link" href="welcome.jsp">Go to Home Page</a>

<table>
    <caption>Voter List</caption>
    <thead>
        <tr>
            <th>Voter ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Aadhar No</th>
            <th>Age</th>
            <th>State</th>
            <th>City</th>
            <th>Has Voted</th>
            <th>Date of Birth</th>
        </tr>
    </thead>
    <tbody>
        <%
        for (Voter voter : voterList) {
        %>
        <tr>
            <td><%=voter.getVoterId()%></td>
            <td><%=voter.getFirstName()%></td>
            <td><%=voter.getLastName()%></td>
            <td><%=voter.getAadharNo()%></td>
            <td><%=voter.getAge()%></td>
            <td><%=voter.getState()%></td>
            <td><%=voter.getCity()%></td>
            <td><%=voter.isHasVoted()%></td>
            <td><%=voter.getDob()%></td>
        </tr>
        <%
        }
        %>
    </tbody>
</table>

</body>
</html>
