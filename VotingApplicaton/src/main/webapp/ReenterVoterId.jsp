<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reenter Voter ID</title>
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
        }
        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .input-group {
            width: 100%;
            margin-bottom: 20px;
        }
        .input-group label {
            display: block;
            font-size: 18px;
            margin-bottom: 10px;
        }
        .input-group input {
            width: 100%;
            padding: 15px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .submit-btn {
            padding: 15px 30px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .submit-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Reenter Voter ID</h1>
        <form action="VoteValidation.jsp" method="post">
            <div class="input-group">
                <label for="voterId">Voter ID:</label>
                <input type="text" id="voterId" name="voterId" required>
            </div>
            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </div>
</body>
</html>
