<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guru | Course</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
                href="{{ route('Guru.Latihan.index') }}"class="flex items-center text-black p-2 rounded-lg shadow hover:bg-blue-500">
                <i class="fas fa-pen text-sm"></i>
                <span>Latihan Soal</span>
            </a>

            <a
                href="{{ route('Guru.Nilai.index') }}"class="d-flex align-items-center text-gray-700 p-2 rounded-lg hover:bg-gray-300">
                <i class="fas fa-chart-line text-sm"></i>
                <span>Nilai</span>
            </a>
        </div>
        <main class="main-content" role="main">
            <div class="flex justify-end mb-4">
                <a href="{{ route('Guru.Latihan.create') }}"
                    class="bg-green-500 text-white px-4 py-2 rounded-lg flex items-center">
                    <i class="fas fa-plus mr-2"></i> Tambahkan
                </a>
            </div>

            <section class="main-content-box" aria-labelledby="topik-latihan-title">
                <h1 id="topik-latihan-title" class="text-xl font-bold mb-6 text-blue-600 select-none">Topik Latihan</h1>
                <form class="space-y-5" aria-label="Filter latihan topics">
                    <div class="mb-4">
                        <label for="id_kurikulum" class="block font-bold mb-2">Pilih Kurikulum</label>
                        <select name="id_kurikulum" id="id_kurikulum"
                            class="block w-full p-2 border border-gray-300 rounded-md" required>
                            <option value="" disabled selected>Pilih kurikulum</option>
                            @foreach ($kurikulums as $k)
                                <option value="{{ $k->id_kurikulum }}"
                                    {{ old('id_kurikulum') == $k->id_kurikulum ? 'selected' : '' }}>
                                    {{ $k->nama_kurikulum }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="id_mata_pelajaran" class="block font-bold mb-2">Pilih Mata Pelajaran</label>
                        <select name="id_mata_pelajaran" id="id_mata_pelajaran"
                            class="block w-full p-2 border border-gray-300 rounded-md" required>
                            <option value="" disabled selected>Pilih Mata Pelajaran</option>
                            @foreach ($mataPelajarans as $mapel)
                                <option value="{{ $mapel->id_mata_pelajaran }}"
                                    data-kurikulum="{{ $mapel->id_kurikulum }}">
                                    {{ $mapel->nama_mata_pelajaran }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="kelas" class="block text-sm font-medium text-gray-700 select-none">Pilih
                            Kelas</label>
                        <select id="kelas" name="kelas"
                            class="mt-1 block w-full border border-gray-300 rounded-md p-2 focus:outline-none focus:ring-2 focus:ring-teal-400 focus:border-teal-400"
                            aria-describedby="kelasHelp">
                            <option value="">Pilih Kelas</option>
                            @foreach ($kelas as $class)
                                <option value="{{ $class->id_kelas }}">{{ $class->nama_kelas }}</option>
                            @endforeach
                        </select>
                    </div>
                </form>

                <div id="latihanContainer"
                    class="bg-gray-100 p-4 rounded-lg shadow-sm flex flex-col md:flex-row justify-between items-start md:items-center">
                    @foreach ($latihan as $item)
                        <div class="mapel-item p-4 rounded-lg cursor-pointer hover:shadow-lg transition-shadow"
                            data-kurikulum="{{ $item->id_kurikulum }}"
                            data-mata_pelajaran="{{ $item->id_mata_pelajaran }}" data-kelas="{{ $item->id_kelas }}">
                            <a href="{{ route('Guru.Soal.index', ['id_latihan' => $item->id_latihan]) }}"
                                class="text-2xl font-bold text-teal-700" text-lg hover:underline focus:outline-none
                                focus:ring-2 focus:ring-teal-400 rounded">
                                {{ $item->Topik }}
                            </a>
                        </div>


                        <div class="flex space-x-5 justify-end">
                            <form action="{{ route('Guru.Latihan.edit', $item->id_latihan) }}" method="GET">
                                <button type="submit" class="text-blue-500 flex items-center hover:text-blue-700">
                                    <i class="fas fa-edit mr-1"></i> Edit
                                </button>
                            </form>
                        </div>
                    @endforeach
                </div>
            </section>
        </main>

    </div>
 <!-- Modal -->
    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Berhasil Menambahkan Data</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    @if (session('success'))
                        {{ session('success') }}
                    @endif
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript to show modal if success message exists and auto-close after 3 seconds -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Menampilkan modal otomatis jika session success ada
        @if (session('success'))
            var myModal = new bootstrap.Modal(document.getElementById('successModal'));
            myModal.show();

            // Menutup modal setelah 3 detik
            setTimeout(function() {
                myModal.hide();
            }, 3000); // 3000ms = 3 detik
        @endif
        function toggleDropdown() {
            const menu = document.getElementById('dropdown-menu');
            const expanded = menu.classList.toggle('show');
            const userInfo = document.querySelector('.header .user-info');
            userInfo.setAttribute('aria-expanded', expanded);
        }

        // Close dropdown if clicked outside
        document.addEventListener('click', function(event) {
            const dropdown = document.getElementById('dropdown-menu');
            const userInfo = document.querySelector('.header .user-info');
            if (!userInfo.contains(event.target) && !dropdown.contains(event.target)) {
                dropdown.classList.remove('show');
                userInfo.setAttribute('aria-expanded', 'false');
            }
        });

        // Combined filtering function
        function filterLatihan() {
            const selectedKurikulum = document.getElementById('id_kurikulum').value;
            const selectedMapel = document.getElementById('id_mata_pelajaran').value;
            const selectedKelas = document.getElementById('kelas').value;
            const latihanItems = document.querySelectorAll('.mapel-item');

            latihanItems.forEach(item => {
                const itemKurikulum = item.getAttribute('data-kurikulum');
                const itemMapel = item.getAttribute('data-mata_pelajaran');
                const itemKelas = item.getAttribute('data-kelas');

                const matchKurikulum = selectedKurikulum === '' || itemKurikulum === selectedKurikulum;
                const matchMapel = selectedMapel === '' || itemMapel === selectedMapel;
                const matchKelas = selectedKelas === '' || itemKelas === selectedKelas;

                if (matchKurikulum && matchMapel && matchKelas) {
                    item.style.display = 'block'; // Show the item
                } else {
                    item.style.display = 'none'; // Hide the item
                }
            });
        }

        // Filter mata pelajaran options based on selected kurikulum
        document.getElementById('id_kurikulum').addEventListener('change', function() {
            const selectedKurikulum = this.value;
            const mapelOptions = document.querySelectorAll('#id_mata_pelajaran option');

            mapelOptions.forEach(option => {
                const itemKurikulum = option.getAttribute('data-kurikulum');
                if (selectedKurikulum === '' || itemKurikulum === selectedKurikulum) {
                    option.style.display = 'block'; // Show the option
                } else {
                    option.style.display = 'none'; // Hide the option
                }
            });

            // Trigger filtering after kurikulum change
            filterLatihan();
        });

        // Trigger the filter function when any selection is changed
        document.getElementById('id_kurikulum').addEventListener('change', filterLatihan);
        document.getElementById('id_mata_pelajaran').addEventListener('change', filterLatihan);
        document.getElementById('kelas').addEventListener('change', filterLatihan);
    </script>
</body>

</html>
