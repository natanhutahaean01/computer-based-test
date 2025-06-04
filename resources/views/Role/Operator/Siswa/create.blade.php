<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Operator | Siswa</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
        .alert-danger {
            color: #e74c3c;
            font-size: 14px;
            font-weight: 600;
            margin-top: 5px;
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

        /* Sidebar Styles */
        .sidebar {
            background: linear-gradient(to bottom,#00796b, #00bfae, #00796b);
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
        <h1 class="text-2xl font-bold text-white">
            <img src="{{ asset('images/logo.png') }}" alt="Logo" class="h-10">
        </h1>

        <div class="relative dropdown">
            <div class="flex items-center cursor-pointer" onclick="toggleDropdown()">
                <div class="flex flex-col items-center">
                    <span class="text-white">Welcome, Operator</span>
                    <span class="text-white font-semibold">{{ $user->name }}</span>
                </div>
                <i class="fas fa-user rounded-full ml-4 text-3xl text-gray-700 bg-white p-2 w-12 h-12 flex items-center justify-center"></i>
            </div>
            <div id="dropdown-menu" class="dropdown-menu">
                <form action="{{ route('logout') }}" method="POST">
                    @csrf
                    <button type="submit" class="logout-btn">
                        <span>Logout</span>
                    </button>
                </form>
            </div>
        </div>
    </div>

    <div class="flex flex-col md:flex-row">
        <!-- Sidebar -->
        <div class="sidebar">
            <ul>
                <li class="mb-4">
                    <a href="{{ route('Operator.Kurikulum.index') }}" class="flex items-center text-white p-2 rounded-lg hover:bg-blue-500">
                        <i class="fas fa-calendar-alt text-white mr-2"></i> Kurikulum
                    </a>
                </li>
                <li class="mb-4">
                    <a href="{{ route('Operator.MataPelajaran.index') }}" class="flex items-center text-white p-2 rounded-lg hover:bg-blue-500">
                        <i class="fas fa-book text-white mr-2"></i> Mata Pelajaran
                    </a>
                </li>
                <li class="mb-4">
                    <a href="{{ route('Operator.Kelas.index') }}" class="flex items-center text-white p-2 rounded-lg hover:bg-blue-500">
                        <i class="fas fa-home text-white mr-2"></i> Kelas
                    </a>
                </li>
                <li class="mb-4">
                    <a href="{{ route('Operator.Guru.index') }}" class="flex items-center text-white p-2 rounded-lg hover:bg-blue-500">
                        <i class="fas fa-chalkboard-teacher text-white mr-2"></i> Daftar Guru
                    </a>
                </li>
                <li class="mb-4">
                    <a href="{{ route('Operator.Siswa.index') }}" class="flex items-center text-black p-2 rounded-lg shadow hover:bg-blue-500">
                        <i class="fas fa-user-graduate text-black mr-2"></i> Daftar Siswa
                    </a>
                </li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-white p-4 rounded-lg shadow-md flex items-center gap-2 mt-8 mb-6">
                    <li class="breadcrumb-item">
                        <a href="{{ route('Operator.Siswa.store') }}"
                            class="text-teal-500 hover:text-teal-700 font-semibold">Siswa</a>
                    </li>
                    <li class="breadcrumb-item active text-gray-600" aria-current="page">Tambah Siswa</li>
                </ol>
            </nav>
            <div class="flex-1 p-4">

                <form id="importForm" action="{{ route('Operator.Siswa.import') }}" method="POST"
                    enctype="multipart/form-data" class="flex justify-end mb-4 w-full">
                    @csrf
                    <input type="file" id="fileInput" name="file" class="hidden" accept=".xlsx, .xls" />
                    <button type="button" id="importButton"
                        class="bg-blue-500 text-white px-4 py-2 rounded-lg flex items-center hover:bg-blue-400">
                        <i class="fas fa-upload mr-2"></i> Import File </button>
                </form>
                <div class="main-content-box">
                    <form action="{{ route('Operator.Siswa.store') }}" method="POST">
                        @csrf
                        <div class="mb-4">
                            <label class="block font-bold mb-2 text-blue-600">Kelas</label>
                            <select name="kelas" class="block w-full p-2 border border-gray-300 rounded-md" required>
                                <option value="">Pilih Kelas</option>
                                @foreach ($kelas as $k)
                                    <option value="{{ $k->id_kelas }}">{{ $k->nama_kelas }}</option>
                                @endforeach
                            </select>
                            @error('nama_kelas')
                                <span class="alert-danger">
                                    {{ $message }}
                                </span>
                            @enderror
                        </div>
                        <div class="mb-4">
                            <label class="block font-bold mb-2 text-blue-600">NISN</label>
                            <input type="number" name="nis"
                                class="block w-full p-2 border border-gray-300 rounded-md" required>
                            @error('nis')
                                <span class="alert-danger">
                                    {{ $message }}
                                </span>
                            @enderror
                        </div>
                        <div class="mb-4">
                            <label class="block font-bold mb-2 text-blue-600">Nama Siswa</label>
                            <input type="text" name="name"
                                class="block w-full p-2 border border-gray-300 rounded-md" required>
                            @error('name')
                                <span class="alert-danger">
                                    {{ $message }}
                                </span>
                            @enderror
                        </div>
                        <div class="mb-4">
                            <label class="block font-bold mb-2 text-blue-600">Email</label>
                            <input type="email" name="email"
                                class="block w-full p-2 border border-gray-300 rounded-md" required>
                            @error('email')
                                <span class="alert-danger">
                                    {{ $message }}
                                </span>
                            @enderror
                        </div>
                        <div class="mb-4">
                            <label class="block font-bold mb-2 text-blue-600">Password</label>
                            <input type="password" name="password"
                                class="block w-full p-2 border border-gray-300 rounded-md" required>
                            @error('password')
                                <span class="alert-danger">
                                    {{ $message }}
                                </span>
                            @enderror
                        </div>
                        <div class="mb-4">
                            <label class="block font-bold mb-2 text-blue-600">Konfirmasi Password</label>
                            <input type="password" name="password_confirmation"
                                class="block w-full p-2 border border-gray-300 rounded-md" required>
                            @error('password_confirmation')
                                <span class="alert-danger">
                                    {{ $message }}
                                </span>
                            @enderror
                        </div>
                        <div class="flex justify-end mt-4">
                            <button type="submit"
                                class="bg-green-500 text-white px-4 py-2 rounded-lg flex items-center hover:bg-green-400">
                                <span>Simpan</span>
                                <i class="fas fa-check ml-2"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        const importButton = document.getElementById('importButton');
        const fileInput = document.getElementById('fileInput');
        const importForm = document.getElementById('importForm');

        importButton.addEventListener('click', handleImportButtonClick);
        fileInput.addEventListener('change', handleFileInputChange);

        function handleImportButtonClick(event) {
            fileInput.click(); // Trigger file selection dialog
        }

        function handleFileInputChange(event) {
            const file = event.target.files[0];
            if (file) {
                // If a file is selected, submit the form
                importForm.submit();
            }
        }
    </script>
</body>

</html>
