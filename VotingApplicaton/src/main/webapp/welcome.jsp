<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Election System</title>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f0f2f5; /* Light background color */
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #004080; /* Dark blue header background */
            padding: 10px 20px;
            color: #fff;
        }

        .header-title {
            font-size: 1.5em;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        nav ul li {
            margin: 0 10px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #ff9800; /* Orange on hover */
        }

        .hero {
            background-color: #a3cdf7; /* Light blue hero background */
            color: #08034e;
            text-align: center;
            padding: 50px 20px;
        }

        .hero-text h1 {
            font-size: 2em;
        }

        .services {
            padding: 30px 5%;
            text-align: center;
            background-color: #e0e7ff; /* Light blue background color for services section */
        }

        .service-cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background-color: #ffffff; /* White background for cards */
            padding: 20px;
            width: 45%;
            margin: 10px;
            height: 300px; /* Ensure the card is square */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-radius: 15px; /* Rounded corners */
        }

        .inner-div {
            background-color: #d4eaff; /* Light background for inner divs */
            padding: 15px;
            margin: 10px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 90%;
            border-radius: 10px; /* Rounded corners */
        }

        .card h3 {
            margin-bottom: 20px;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        .cta-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50; /* Green button background */
            color: #fff;
            text-decoration: none;
            transition: background-color 0.3s ease;
            border-radius: 5px;
        }

        .cta-button:hover {
            background-color: #45a049; /* Darker green on hover */
        }

        footer {
            background-color: #004080; /* Dark blue footer background */
            color: #fff;
            text-align: center;
            padding: 20px;
        }

        footer p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <div class="header-title">
                मतदाता सेवा पोर्टल<br>
                VOTERS SERVICE PORTAL
            </div>
            <nav>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="adminLogin.jsp">Admin</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <section class="hero">
            <div class="hero-text">
                <h1>Welcome to Voter Services</h1>
            </div>
        </section>
        <section class="services">
            <h2>Our Services</h2>
            <div class="service-cards">
                <div class="card">
                    <div class="inner-div">
                        <h3>Register to Vote</h3>
                        <a class="cta-button" href="add_voter.jsp">Click to Register</a>
                    </div>
                </div>
   
                <div class="card">
                    <div class="inner-div">
                        <h3>If Registered then only click to vote</h3>
                        <a class="cta-button" href="ReenterVoterId.jsp">Click to Vote</a>
                    </div>
                </div>
                <div class="card">
                    <div class="inner-div">
                        <h3>See the Candidate List</h3>
                        <a class="cta-button" href="CandViewList.jsp">Click to See List</a>
                    </div>
                </div>
                <div class="card">
                    <div class="inner-div">
                        <h3>See the Election Results</h3>
                        <a class="cta-button" href="result.jsp">Click to See Results</a>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Election Commission of India. All rights reserved.</p>
        <p>Address: Nirvachan Sadan, Ashoka Road, New Delhi-110001</p>
        <p>Phone: 011-23052220</p>
        <p>Email: contact@eci.gov.in</p>
    </footer>
</body>
</html>
