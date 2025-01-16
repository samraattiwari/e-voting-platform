<%@page import="cand.mgmt.entities.Candidate"%>
<%@page import="cand.mgmt.dao.CandidateImp"%>
<%@page import="cand.mgmt.dao.CandInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Candidate</title>
<link href="Css/style.css" type="text/css" rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
}

form {
	width: 50%;
	margin: auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease;
}

form:hover {
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
}

input, textarea {
	width: calc(100% - 20px);
	margin-bottom: 20px;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	transition: border-color 0.3s ease, background-color 0.3s ease;
}

input:focus, textarea:focus {
	border-color: #66afe9;
	background-color: #f0f8ff;
	outline: none;
}

#disable {
	background-color: lightgray;
}

legend {
	font-size: 20px;
	font-weight: bold;
}

.button {
	width: 100px;
	padding: 10px;
	font-size: 16px;
	color: white;
	background-color: #4CAF50;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.button:hover {
	background-color: #45a049;
}

#danger {
	background-color: #f44336;
}

#danger:hover {
	background-color: #da190b;
}
</style>
</head>
<body>

	<%
	String id = request.getParameter("id");
	int i = Integer.parseInt(id);

	CandInterface e3 = new CandidateImp();
	Candidate e2 = e3.getCandidate(i);
	%>

	<form action="updateCandidate" method="get">
		<fieldset>
			<legend>Update the Candidate Details</legend>
			<div>
				<input id="disable" type="number" name="id"
					value="<%=e2.getCandidate_id()%>" readonly="readonly"
					placeholder="Enter ID" /><br> <input type="number" name="age"
					value="<%=e2.getAge()%>" placeholder="Enter New Age" /><br>
				<input type="text" name="state" value="<%=e2.getState()%>"
					placeholder="Enter New State" /><br> <input type="text"
					name="city" value="<%=e2.getCity()%>"
					placeholder="Enter New Name" /><br> <input class="button"
					type="submit" value="Submit"> <input class="button"
					id="danger" type="reset" value="Reset">
			</div>
		</fieldset>
	</form>

</body>
</html>
