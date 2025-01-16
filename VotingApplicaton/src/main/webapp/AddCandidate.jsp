<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Candidate Section</title>
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
	border-radius: 10px;
	transition: transform 0.3s ease-in-out;
}

.container:hover {
	transform: scale(1.02);
}

h1 {
	text-align: center;
	color: #007bff;
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

input, select {
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	transition: all 0.3s ease;
}

input:focus, select:focus {
	border-color: #007bff;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

button {
	padding: 10px;
	margin-top: 15px;
	border: none;
	border-radius: 5px;
	background-color: #007bff;
	color: #fff;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
}

.warning {
	color: red;
	font-weight: bold;
	display: none;
	margin-top: 10px;
}
</style>
</head>
<body>

<	
	<div class="container">
		<h1>Candidate Section</h1>
		<form action="addcandidate" method="get" id="candidate-form">
			<label for="first-name">First Name:</label> <input type="text"
				id="first-name" name="first-name" required> <label
				for="last-name">Last Name:</label> <input type="text" id="last-name"
				name="last-name" required> <label for="age">Age:</label> <input
				type="number" id="age" name="age" required> <label
				for="candidate-id">Candidate ID:</label> <input type="text"
				id="candidate-id" name="candidate-id" required disabled> <label
				for="party-name">Party Name:</label> <input type="text"
				id="party-name" name="party-name" required> <label
				for="state">State:</label> <select id="state" name="state" required
				disabled>
				<option value="">Select State</option>
				<option value="Maharashtra">Maharashtra</option>
				<option value="Delhi">Delhi</option>
				<option value="Karnataka">Karnataka</option>
				<option value="Tamil Nadu">Tamil Nadu</option>
				<option value="West Bengal">West Bengal</option>
				<option value="Telangana">Telangana</option>
				<option value="Gujarat">Gujarat</option>
				<option value="Rajasthan">Rajasthan</option>
				<option value="Uttar Pradesh">Uttar Pradesh</option>
			</select> <label for="city">City:</label> <select id="city" name="city"
				required disabled>
				<option value="">Select City</option>
				<option value="Mumbai">Mumbai</option>
				<option value="Delhi">Delhi</option>
				<option value="Bengaluru">Bengaluru</option>
				<option value="Chennai">Chennai</option>
				<option value="Kolkata">Kolkata</option>
				<option value="Hyderabad">Hyderabad</option>
				<option value="Pune">Pune</option>
				<option value="Ahmedabad">Ahmedabad</option>
				<option value="Jaipur">Jaipur</option>
				<option value="Lucknow">Lucknow</option>
			</select>

			<p id="warning-message" class="warning">You are underage</p>

			<button type="submit" disabled>Submit</button>
		</form>
	</div>
	<script>
		document.getElementById('age').addEventListener('input', function() {
			const age = parseInt(this.value, 10);
			const isUnderage = age < 35;
			const formElements = document.querySelectorAll('#candidate-form input, #candidate-form select, #candidate-form button');
			const warningMessage = document.getElementById('warning-message');

			formElements.forEach(element => {
				if (element.id !== 'age') {
					element.disabled = isUnderage;
				}
			});

			warningMessage.style.display = isUnderage ? 'block' : 'none';
		});
	</script>
</body>
</html>