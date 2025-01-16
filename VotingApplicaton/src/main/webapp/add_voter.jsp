<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Section</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        h1 {
            text-align: center;
            color: #007bff;
        }

        h2 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }

        form {
            display: flex;
            flex-direction: column;
            margin-top: 15px;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
        }

        input {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="password"] {
            -webkit-text-security: disc; /* For better compatibility */
        }

        button {
            padding: 10px;
            margin-top: 15px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        input:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            outline: none;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Auto-focus the first input field
            document.getElementById("first-name").focus();
            
            // Format Aadhar number input
            const aadharInput = document.getElementById("aadharNo");
            aadharInput.addEventListener("input", function(e) {
                let value = e.target.value.replace(/\D/g, "");
                value = value.substring(0, 12);
                e.target.value = value;
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <h1>Voter Section</h1>
        <h2>Voter Details</h2>
        <form action="AddVoter" method="get">
            <label for="firstName">First Name:</label>
            <input type="text" id="first-name" name="firstName" required>
            
            <label for="lastName">Last Name:</label>
            <input type="text" id="last-name" name="lastName" required>
            
            <label for="aadharNo">Aadhar No:</label>
            <input type="text" id="aadharNo" name="aadharNo" pattern="\d{12}" title="Please enter a valid 12-digit Aadhar number" required>
            
            <label for="state">State:</label>
            <input type="text" id="state" name="state" required>
            
            <label for="city">City:</label>
            <input type="text" id="city" name="city" required>
            
            <label for="dob">Date Of Birth:</label>
            <input type="date" id="dob" name="dob" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <button type="submit">Submit</button>
        </form>
        <%
        String message = request.getParameter("message");
        if(message!=null)
            out.print("<p style='color:red;'>" + message + "</p>");
        %>
    </div>
    
               
    
</body>
</html>
