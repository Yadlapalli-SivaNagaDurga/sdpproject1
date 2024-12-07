<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donor Registration - Reduce Food Wastage</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/donorregistration.css"> <!-- Linking external CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            max-width: 400px; /* Reduced form width */
            margin-left: auto;
            margin-right: auto;
        }
        .footer {
            background-color: #343a40;
            color: white;
            padding: 10px 0;
        }
        .text-danger {
            font-size: 0.875rem;
        }
        .is-invalid {
            border-color: red;
        }
        .invalid-feedback {
            display: block;
            color: red;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg custom-navbar">
        <a class="navbar-brand" href="foodwastage.jsp">FoodWastage</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item mr-2">
                    <a class="nav-link" href="home.jsp">Home</a>
                </li>
                <li class="nav-item mr-2">
                    <a class="nav-link" href="about.jsp">About Us</a>
                </li>
                <li class="nav-item mr-2">
                    <a class="nav-link" href="contact.jsp">Contact Us</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="jumbotron text-center">
            <h1>Welcome to the Donor Registration</h1>
            <p>Join us in our mission to reduce food wastage!</p>
        </div>
        
        <!-- Donor Registration Form -->
        <div class="form-container">
            <h2>Donor Registration Form</h2>
            <form action="/registerDonor" method="post" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                    <div id="nameError" class="invalid-feedback"></div>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                    <div id="emailError" class="invalid-feedback"></div>
                </div>
                <div class="form-group">
                    <label for="contact">Contact</label>
                    <input type="text" class="form-control" id="contact" name="contact" required pattern="^[0-9]{10}$">
                    <div id="contactError" class="invalid-feedback"></div>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required minlength="6">
                    <div id="passwordError" class="invalid-feedback"></div>
                </div>
                <div class="form-group">
                    <label for="location">Location</label>
                    <input type="text" class="form-control" id="location" name="location" required>
                    <div id="locationError" class="invalid-feedback"></div>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Register</button>
            </form>
            <hr>
            <h5 class="text-center">Already Registered?</h5>
            <a href="donorlogin.jsp" class="btn btn-secondary btn-block">Login</a>
        </div>
    </div>

    <footer class="footer text-center mt-5">
        <p>&copy; 2024 FoodWastage. All Rights Reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script>
        function validateForm() {
            let isValid = true;

            // Reset previous errors
            resetErrors();

            // Validate Name
            let name = document.getElementById("name").value;
            if (name.trim() === "") {
                document.getElementById("nameError").innerText = "Name is required.";
                document.getElementById("name").classList.add("is-invalid");
                isValid = false;
            }

            // Validate Email
            let email = document.getElementById("email").value;
            const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                document.getElementById("emailError").innerText = "Please enter a valid email.";
                document.getElementById("email").classList.add("is-invalid");
                isValid = false;
            }

            // Validate Contact (10 digits)
            let contact = document.getElementById("contact").value;
            const contactPattern = /^[0-9]{10}$/;
            if (!contactPattern.test(contact)) {
                document.getElementById("contactError").innerText = "Please enter a valid 10-digit contact number.";
                document.getElementById("contact").classList.add("is-invalid");
                isValid = false;
            }

            // Validate Password (minimum 6 characters)
            let password = document.getElementById("password").value;
            if (password.length < 6) {
                document.getElementById("passwordError").innerText = "Password must be at least 6 characters long.";
                document.getElementById("password").classList.add("is-invalid");
                isValid = false;
            }

            // Validate Location
            let location = document.getElementById("location").value;
            if (location.trim() === "") {
                document.getElementById("locationError").innerText = "Location is required.";
                document.getElementById("location").classList.add("is-invalid");
                isValid = false;
            }

            return isValid;
        }

        function resetErrors() {
            // Clear all error messages and remove invalid styling
            const errorMessages = document.querySelectorAll(".invalid-feedback");
            errorMessages.forEach((msg) => msg.innerText = "");

            const invalidFields = document.querySelectorAll(".is-invalid");
            invalidFields.forEach((field) => field.classList.remove("is-invalid"));
        }
    </script>
</body>
</html>
