<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .success-message {
            font-size: 48px;
            color: #4CAF50;
            margin-bottom: 30px;
        }
        .thank-you-message {
            font-size: 36px;
            margin-bottom: 40px;
        }
        .back-to-home {
            margin-top: 40px;
        }
        .back-to-home a {
            padding: 15px 30px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            font-size: 24px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .back-to-home a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-message">Your vote is counted!</div>
        <div class="thank-you-message">Thanks for voting!</div>
        <div class="back-to-home">
            <a href="welcome.jsp">Back to HomePage</a>
        </div>
    </div>
</body>
</html>
