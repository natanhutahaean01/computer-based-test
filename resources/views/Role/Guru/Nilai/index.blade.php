<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guru | Nilai
    </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        /* General Styles */
        body {
            background-color: #f4f5f7;
            font-family: 'Arial', sans-serif;
            padding: 0;
            margin: 0;
            color: #333;
        }

        /* Header Styles */
        .header {
            background: linear-gradient(to right, #00bfae, #00796b);
            color: white;
            padding: 20px 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .header .logo img {
            max-width: 120px;
            border-radius: 8px;
        }

        .header .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
            position: relative;
        }

        .header .user-info img {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #ffffff;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .header .user-info img:hover {
            transform: scale(1.1);
        }

        .header .user-info span {
            font-size: 16px;
            font-weight: 600;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        /* Dropdown Menu Styles */
        .dropdown-menu {
            display: none;
            position: absolute;
            top: 60px;
            right: 0;
            background-color: #ffffff;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
            padding: 10px;
            border-radius: 8px;
            width: 150px;
            z-index: 1500;
        }

        .dropdown-menu.show {
            display: block;
        }

        .logout-btn {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 6px;
            text-align: center;
        }

        .logout-btn:hover {
            background-color: #e04040;
        }

        .sidebar {
            background: linear-gradient(to bottom, #00796b, #00bfae, #00796b);
            width: 260px;
            padding: 25px 15px;
            position: fixed;
            top: 80px;
            left: 0;
            bottom: 0;
            display: flex;
            flex-direction: column;
            gap: 20px;
            transition: all 0.3s ease;
            z-index: 900;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            padding: 12px 18px;
            color: white;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 17px;
            transition: all 0.3s ease;
        }

        .sidebar a i {
            margin-right: 15px;
            font-size: 22px;
        }

        .sidebar a.active {
            background-color: #00796b;
            color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .sidebar a:hover {
            background-color: #004d40;
            color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        /* Adjust the "Course" button to match other sidebar items */
        #dropdownButton {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            padding: 12px 18px;
            /* Same as other sidebar items */
            color: white;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 17px;
            transition: all 0.3s ease;
        }

        #dropdownButton i {
            font-size: 22px;
            /* Same icon size as other items */
        }

        #dropdownButton span {
            font-size: 17px;
            /* Same font size as other items */
        }


        /* Button Styles */
        .btn-add-top-right {
            position: absolute;
            top: 100px;
            right: 30px;
            background-color: #00bfae;
            color: white;
            padding: 12px 25px;
            border-radius: 25px;
            font-size: 16px;
            border: none;
            transition: background-color 0.3s ease;
            min-width: 150px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .btn-add-top-right:hover {
            background-color: #00796b;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
            background-color: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        table th,
        table td {
            padding: 18px 25px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #14A098;
            color: white;
            font-weight: 700;
            text-transform: uppercase;
        }

        table tr:hover {
            background-color: #f1f1f1;
            transform: scale(1.01);
            transition: all 0.3s ease;
        }

        table td {
            vertical-align: middle;
        }

        /* Main Content */
        .main-content {
            margin-left: 280px;
            padding: 100px 30px 30px;
            flex: 1;
            transition: all 0.3s ease-in-out;
            overflow-y: auto;
        }

        /* Main Content Box */
        .main-content-box {
            padding: 30px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                padding: 20px;
                top: 0;
                left: 0;
                height: auto;
                border-radius: 0;
            }

            .main-content {
                margin-left: 0;
                padding: 70px 20px 20px;
            }

            .btn-add-top-right {
                width: 100%;
                padding: 15px 0;
            }
        }
    </style>
</head>

<body>
    <!-- Header -->
    <div class="header">
        <img src="{{ asset('images/logo.png') }}" alt="Logo" class="img-fluid" style="max-height: 55px;">

        <div class="relative dropdown">
            <div class="flex items-center cursor-pointer" onclick="toggleDropdown()">
                <div class="flex flex-col items-center">
                    <span class="text-white">Welcome, Guru</span>
                    <span class="text-white font-semibold">{{ $user->name }}</span>
                </div>
                <i
                    class="fas fa-user rounded-full ml-4 text-3xl text-gray-700 bg-white p-2 w-12 h-12 flex items-center justify-center"></i>
            </div>
            <div id="dropdown-menu" class="dropdown-menu">
                <form action="{{ route('logout') }}" method="POST">
                    @csrf
                    <button type="submit" class="btn btn-danger w-100">Logout</button>
                </form>
            </div>
        </div>
    </div>

    <div class="flex flex-col md:flex-row">
        <!-- Sidebar -->
        <div class="sidebar">
            <a
                href="{{ route('Guru.Course.index') }}"class="d-flex align-items-center text-gray-700 p-2 rounded-lg hover:bg-gray-300">
                <i class="fas fa-book-open text-sm"></i>
                <span>Kursus</span>
            </a>
            <a
                href="{{ route('Guru.Latihan.index') }}"class="d-flex align-items-center text-gray-700 p-2 rounded-lg hover:bg-gray-300">
                <i class="fas fa-pen text-sm"></i>
                <span>Latihan Soal</span>
            </a>

            <a
                href="{{ route('Guru.Nilai.index') }}"class="flex items-center text-black p-2 rounded-lg shadow hover:bg-blue-500">
                <i class="fas fa-chart-line text-sm"></i>
                <span>Nilai</span>
            </a>
        </div>
        <!-- Main Content -->
        <div class="main-content">
            <main class="flex-1 bg-white p-6 md:p-8 rounded-lg shadow-md overflow-auto max-h-[calc(100vh-88px)]">
                <h2 class="text-2xl font-bold mb-6 text-blue-600 tracking-wide">
                    Course Information
                </h2>
                <div class="space-y-6">
                    @foreach ($courses as $course)
                        <div
                            class="p-5 border border-gray-200 rounded-lg shadow-sm flex flex-col sm:flex-row sm:items-center sm:justify-between hover:shadow-lg transition-shadow duration-300 bg-white">
                            <div class="flex items-center mb-4 sm:mb-0 sm:flex-1">
                                <img alt="Thumbnail image of the {{ $course->nama_kursus }} course"
                                    class="w-28 h-28 rounded-lg mr-5 object-cover flex-shrink-0" height="112"
                                    src="{{ asset('images/' . $course->image) }}" width="112" />

                                <div>
                                    <h3 class="text-2xl font-bold text-teal-700">
                                        <a href="{{ route('Guru.Persentase.create', ['id_kursus' => $course->id_kursus]) }}"
                                            class=" no-underline hover:underline">
                                            {{ $course->nama_kursus }}
                                        </a>
                                    </h3>
                                </div>
                            </div>
                            <div class="flex justify-end sm:flex-none">
                                <form action="{{ route('Guru.Persentase.edit', $course->id_kursus) }}" method="GET">
                                    <button type="submit"
                                        class="text-blue-600 flex items-center font-semibold hover:text-blue-800 focus:outline-none focus:ring-2 focus:ring-blue-400 rounded">
                                        <i class="fas fa-edit mr-2"></i> Edit
                                    </button>
                                </form>
                            </div>
                        </div>
                    @endforeach
                </div>
            </main>
        </div>
        <script>
            const dropdownButton = document.getElementById('dropdownButton');
            const dropdownMenu = document.getElementById('dropdownMenu');
            const dropdownIcon = document.getElementById('dropdownIcon');

            dropdownButton.addEventListener('click', () => {
                const isExpanded = dropdownButton.getAttribute('aria-expanded') === 'true';
                dropdownButton.setAttribute('aria-expanded', !isExpanded);

                if (dropdownMenu.style.maxHeight && dropdownMenu.style.maxHeight !== '0px') {
                    dropdownMenu.style.maxHeight = '0px';
                    dropdownMenu.style.paddingTop = '0';
                    dropdownMenu.style.paddingBottom = '0';
                    dropdownIcon.style.transform = 'rotate(0deg)';
                } else {
                    dropdownMenu.style.maxHeight = dropdownMenu.scrollHeight + 'px';
                    dropdownMenu.style.paddingTop = '0.5rem';
                    dropdownMenu.style.paddingBottom = '0.5rem';
                    dropdownIcon.style.transform = 'rotate(180deg)';
                }
            });

            // Close dropdown if clicked outside
            window.addEventListener('click', (e) => {
                if (!dropdownButton.contains(e.target) && !dropdownMenu.contains(e.target)) {
                    dropdownMenu.style.maxHeight = '0px';
                    dropdownMenu.style.paddingTop = '0';
                    dropdownMenu.style.paddingBottom = '0';
                    dropdownButton.setAttribute('aria-expanded', 'false');
                    dropdownIcon.style.transform = 'rotate(0deg)';
                }
            });

            // Initialize dropdown closed
            dropdownMenu.style.maxHeight = '0px';
            dropdownMenu.style.overflow = 'hidden';
            dropdownMenu.style.transition = 'max-height 0.3s ease, padding 0.3s ease';
        </script>
</body>

</html>
