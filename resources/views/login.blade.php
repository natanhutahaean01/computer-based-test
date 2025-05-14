
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Import font Poppins from Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
   body {
            font-family: 'Poppins', sans-serif;
        }

        .background-gradient {
            background: linear-gradient(135deg,black, #00bfae,black, #00796b,black);
        }

        .form-container {
            width: 100%;
            max-width: 400px;
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-button {
            background-color: #1d4ed8;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 5px;
            width: 100%;
            font-weight: 600;
        }

        .form-button:hover {
            background-color: #2563eb;
        }

        .terms-text {
            text-align: center;
            margin-top: 1rem;
            font-size: 0.875rem;
        }

        .terms-text a {
            color: #1d4ed8;
            text-decoration: underline;
        }
        .popup {
            display: none;
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            position: fixed;
            top: 20%;
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
        }

        .popup.show {
            display: block;
            opacity: 1;
        }

        .alert-danger {
            color: #e74c3c;
            font-size: 14px;
            font-weight: 600;
            margin-top: 5px;
        }
    </style>
</head>

<body class="background-gradient min-h-screen flex justify-center items-center">
    
    <div class="form-container">
        <div class="text-center mb-4">
            <img src="{{ asset('images/logo.png') }}" alt="QuizHub Logo" class="w-32 mx-auto">
        </div>
        <p class="text-center text-sm text-gray-600 mb-6">Selamat Datang</p>
        
        <!-- Login Form -->
        <form method="POST" action="{{ route('login') }}" id="login-form">
            @csrf
            <div class="form-group">
                <label for="email">Email *</label>
                <input type="email" id="email" name="identifier" class="form-control" placeholder="Email">
                @error('identifier')
                    <span class="alert-danger">
                        {{ $message }}
                    </span>
                @enderror
            </div>
            <div class="form-group">
                <label for="password">Password *</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                @error('password')
                    <span class="alert-danger">
                        {{ $message }}
                    </span>
                @enderror
            </div>
            <button type="submit" class="form-button">Masuk</button>
            <p class="terms-text">
                By signing in you are agreeing to our <a href="#" class="hover:underline">Terms</a> and <a href="#" class="hover:underline">privacy policy</a>
            </p>
        </form>
    </div>

    

    <!-- Popup for login success -->
    <div id="popup-success" class="popup">Login berhasil!</div>

    <script>
        document.getElementById("login-form").addEventListener("submit", function(event) {
            event.preventDefault(); // Prevent form from submitting immediately
        // Function to display popup after successful login
        function showPopup() {
            const popup = document.getElementById('popup-success');
            popup.classList.add('show');

            // Hide popup after 3 seconds
            setTimeout(() => {
                popup.classList.remove('show');
            }, 3000);
        }

        // If session contains success, show the popup
        @if (session('success'))
            showPopup();
        @endif
    </script>
</body>

</html>