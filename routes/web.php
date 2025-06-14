<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OperatorController;
use App\Http\Controllers\BisnisController;
use App\Http\Controllers\AttemptController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\JawabanSiswaLatihanSoalController;
use App\Http\Controllers\JawabanSiswaQuizController;
use App\Http\Controllers\JawabanSiswaUjianController;
use App\Http\Controllers\KelasController;
use App\Http\Controllers\KurikulumController;
use App\Http\Controllers\LatihanSoalController;
use App\Http\Controllers\LatihanSoalSoalController;
use App\Http\Controllers\MataPelajaranController;
use App\Http\Controllers\ProfilController;
use App\Http\Controllers\SoalController;
use App\Http\Controllers\SiswaController;
use App\Http\Controllers\UjianController;
use App\Http\Controllers\GuruController;
use App\Http\Controllers\JawabanSoalUjianController;
use App\Http\Controllers\JawabanSoalQuizController;
use App\Http\Controllers\JawabanLatihanSoalController;
use App\Http\Controllers\NilaiController;
use App\Http\Controllers\MateriController;
use App\Http\Controllers\persentaseController;
use App\Http\Controllers\ListSiswaController;
use App\Http\Controllers\TahunAjaranController;
use App\Models\mata_pelajaran;  // Pastikan untuk mengimport model mata_pelajaran jika belum
use App\Models\Guru;
use App\Http\Middleware\CheckOperatorStatus;
use App\Models\TahunAjaran;

Route::get('/', [AuthenticatedSessionController::class, 'create'])->name('login');
Route::post('/', [AuthenticatedSessionController::class, 'store'])->name('login.store');

// Halaman dashboard
Route::get('/login', function () {
    return view('login');
})->middleware(['auth', 'verified'])->name('dashboard');


// Group route yang memerlukan autentikasi
Route::middleware('auth')->group(function () {
    // Route untuk profil pengguna
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::prefix('Admin')->name('Admin.')->middleware('role:Admin')->group(function () {
        Route::resource('/Akun', OperatorController::class)->parameters(['Akun' => 'user']);
        Route::get('/Akun/{user}/edit', [OperatorController::class, 'edit'])->name('Akun.edit');
        Route::get('Akun/{user}', [OperatorController::class, 'show'])->name('Admin.Akun.show');
        Route::resource('/Bisnis', BisnisController::class)->parameters(['Bisnis' => 'id_bisnis',]);
    });

    Route::prefix('Guru')->name('Guru.')->middleware('role:Guru')->group(function () {
        Route::get('/Guru/Course/{id_guru}', [CourseController::class, 'index'])->name('Guru.Course.index');
        Route::resource('/Course', CourseController::class);
        Route::resource('/Siswa', SiswaController::class);
        Route::resource('/Latihan', LatihanSoalController::class);
        Route::get('/Latihan/{id_latihan}/edit', [LatihanSoalController::class, 'edit'])->name('Guru.Latihan.edit');
        Route::resource('/LatihanSoalSoal', LatihanSoalSoalController::class);
        Route::resource('/Kelas', KelasController::class);
        Route::resource('/MataPelajaran', MataPelajaranController::class);
        Route::resource('/Ujian', UjianController::class);
        Route::get('/ListSiswa/{id_kursus}', [ListSiswaController::class, 'index'])->name('ListSiswa');
        Route::get('/nilai/export/{id_kursus}', [ListSiswaController::class, 'exportNilai'])->name('nilai.export');
        Route::get('/nilai/{id_kursus}', [App\Http\Controllers\NilaiController::class, 'index'])->name('Guru.nilai.index');
        Route::post('/calculate-nilai/{id_kursus}/{id_siswa}', [NilaiController::class, 'calculateNilai'])->name('Guru.nilai.calculate');
        Route::get('/nilai-breakdown/{id_kursus}/{id_siswa}', [App\Http\Controllers\NilaiController::class, 'getScoreBreakdown'])->name('Guru.nilai.breakdown');
        Route::resource('/Soal', SoalController::class);
        Route::resource('/Persentase', persentaseController::class);
        Route::get('/Soal/create/{type}', [SoalController::class, 'create'])->name('Guru.Soal.create');
        Route::get('/Soal/preview/{id}', [SoalController::class, 'preview'])->name('Soal.preview');
        Route::resource('/Kurikulum', KurikulumController::class);
        Route::resource('/Attempt', AttemptController::class);
        Route::resource('/Materi', MateriController::class);
        Route::resource('/JawabanSiswaLatihanSoal', JawabanSiswaLatihanSoalController::class);
        Route::resource('/JawabanSiswaUjian', JawabanSiswaUjianController::class);
        Route::resource('/Nilai', NilaiController::class);
        Route::post('/reset-recalculate-nilai/{id_kursus}', [ListSiswaController::class, 'resetAndRecalculateNilai']);
    });

    // Route untuk Operator
    Route::prefix('Operator')->name('Operator.')->middleware('role:Operator')->group(function () {
        Route::resource('/Guru', GuruController::class);
        Route::get('/Course/beranda', [CourseController::class, 'beranda'])->name('Course.beranda');
        Route::resource('/Course', CourseController::class);
        Route::get('/Guru/upload', [GuruController::class, 'upload'])->name('Guru.upload');
        Route::post('/Guru/import', [GuruController::class, 'import'])->name('Guru.import');

        Route::resource('/Siswa', SiswaController::class);
        Route::get('/Siswa/upload', [SiswaController::class, 'upload'])->name('Siswa.upload');
        Route::post('/Siswa/import', [SiswaController::class, 'import'])->name('Siswa.import');

        Route::resource('/Kelas', KelasController::class);
        Route::resource('/Kurikulum', KurikulumController::class);
        Route::resource('/MataPelajaran', MataPelajaranController::class);
        Route::get('/TahunAjaran/create/{id_operator}', [TahunAjaranController::class, 'create'])->name('Operator.TahunAjaran.create');
        Route::resource('/TahunAjaran', TahunAjaranController::class);
    });

    // Route untuk Siswa
    Route::prefix('Siswa')->name('Siswa.')->middleware('role:Siswa')->group(function () {
        Route::resource('/Course', CourseController::class);
        Route::resource('/JawabanSiswaQuiz', JawabanSiswaQuizController::class);
        Route::resource('/Ujian', UjianController::class);
        Route::resource('/JawabanSiswaUjian', JawabanSiswaUjianController::class);
        Route::resource('/LatihanSoal', LatihanSoalController::class);
        Route::resource('/JawabanSiswaLatihanSoal', JawabanSiswaLatihanSoalController::class);
        Route::resource('/MataPelajaran', MataPelajaranController::class);
        Route::resource('/Kurikulum', KurikulumController::class);
        Route::resource('/Kelas', KelasController::class);
        Route::resource('/Profil', ProfilController::class);
    });
});

Route::get('/clear-cache', function () {
    Artisan::call('optimize:clear');
    return 'Cache cleared!';
});


// Route untuk logout
Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])->name('logout');

Route::get('/get-guru/{mata_pelajaran}', function ($mata_pelajaran) {
    // Menemukan mata pelajaran berdasarkan ID
    $mataPelajaran = mata_pelajaran::find($mata_pelajaran);

    // Mendapatkan guru yang mengajar mata pelajaran tersebut
    $gurus = $mataPelajaran ? $mataPelajaran->gurus : [];

    // Mengembalikan data guru dalam format JSON
    return response()->json(['gurus' => $gurus]);
});
require __DIR__ . '/auth.php';
