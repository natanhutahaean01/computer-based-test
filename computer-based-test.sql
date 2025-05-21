-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 10:26 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pkm1`
--

-- --------------------------------------------------------

--
-- Table structure for table `bisnis`
--

CREATE TABLE `bisnis` (
  `id_bisnis` bigint(20) UNSIGNED NOT NULL,
  `nama_sekolah` varchar(255) NOT NULL,
  `jumlah_pendapatan` int(11) NOT NULL DEFAULT 500000,
  `perjanjian` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bisnis`
--

INSERT INTO `bisnis` (`id_bisnis`, `nama_sekolah`, `jumlah_pendapatan`, `perjanjian`, `created_at`, `updated_at`) VALUES
(1, 'SMP BUDHI DHARMA BALIGE', 10000000, 'perjanjian/1747722676_UAS_ D4TRPL_06_11423021_Andika Parlinggoman Tampubolon.pdf', '2025-05-19 23:31:19', '2025-05-19 23:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id_guru` bigint(20) UNSIGNED NOT NULL,
  `nama_guru` varchar(255) NOT NULL,
  `nip` bigint(20) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  `id_mata_pelajaran` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_operator` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id_guru`, `nama_guru`, `nip`, `status`, `id_mata_pelajaran`, `id_user`, `id_operator`, `created_at`, `updated_at`) VALUES
(1, 'Ritchan Hutahaean', 123456789123456789, 'Aktif', 1, 3, 1, '2025-05-19 23:34:46', '2025-05-19 23:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_siswa`
--

CREATE TABLE `jawaban_siswa` (
  `id_jawaban_siswa` bigint(20) UNSIGNED NOT NULL,
  `jawaban_siswa` varchar(255) NOT NULL,
  `id_soal` bigint(20) UNSIGNED NOT NULL,
  `id_siswa` bigint(20) UNSIGNED NOT NULL,
  `id_jawaban_soal` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_soal`
--

CREATE TABLE `jawaban_soal` (
  `id_jawaban_soal` bigint(20) UNSIGNED NOT NULL,
  `jawaban` varchar(255) NOT NULL,
  `benar` tinyint(1) NOT NULL DEFAULT 0,
  `id_soal` bigint(20) UNSIGNED NOT NULL,
  `id_tipe_soal` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jawaban_soal`
--

INSERT INTO `jawaban_soal` (`id_jawaban_soal`, `jawaban`, `benar`, `id_soal`, `id_tipe_soal`, `created_at`, `updated_at`) VALUES
(1, '1', 0, 1, 1, '2025-05-20 00:07:30', '2025-05-20 00:07:30'),
(2, '2', 1, 1, 1, '2025-05-20 00:07:30', '2025-05-20 00:07:30'),
(3, '3', 0, 1, 1, '2025-05-20 00:07:30', '2025-05-20 00:07:30'),
(4, '4', 0, 1, 1, '2025-05-20 00:07:30', '2025-05-20 00:07:30'),
(5, '5', 0, 1, 1, '2025-05-20 00:07:30', '2025-05-20 00:07:30'),
(6, 'True', 1, 2, 2, '2025-05-20 01:01:16', '2025-05-20 01:01:16'),
(7, 'False', 0, 2, 2, '2025-05-20 01:01:16', '2025-05-20 01:01:16'),
(9, '2', 1, 3, 3, '2025-05-20 01:02:12', '2025-05-20 01:02:12'),
(10, '1', 0, 4, 1, '2025-05-20 01:05:31', '2025-05-20 01:05:31'),
(11, '2', 1, 4, 1, '2025-05-20 01:05:31', '2025-05-20 01:05:31'),
(12, '3', 0, 4, 1, '2025-05-20 01:05:31', '2025-05-20 01:05:31'),
(13, '4', 0, 4, 1, '2025-05-20 01:05:31', '2025-05-20 01:05:31'),
(14, '5', 0, 4, 1, '2025-05-20 01:05:31', '2025-05-20 01:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` bigint(20) UNSIGNED NOT NULL,
  `nama_kelas` varchar(255) NOT NULL,
  `id_operator` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `id_operator`, `created_at`, `updated_at`) VALUES
(1, 'Kelas 9', 1, '2025-05-19 23:33:57', '2025-05-19 23:33:57'),
(2, 'Kelas 8', 1, '2025-05-19 23:34:04', '2025-05-19 23:34:04'),
(3, 'Kelas 7', 1, '2025-05-19 23:34:12', '2025-05-19 23:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum`
--

CREATE TABLE `kurikulum` (
  `id_kurikulum` bigint(20) UNSIGNED NOT NULL,
  `nama_kurikulum` varchar(255) NOT NULL,
  `id_operator` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kurikulum`
--

INSERT INTO `kurikulum` (`id_kurikulum`, `nama_kurikulum`, `id_operator`, `created_at`, `updated_at`) VALUES
(1, 'Kurikulum Merdeka', 1, '2025-05-19 23:33:27', '2025-05-19 23:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum_siswa`
--

CREATE TABLE `kurikulum_siswa` (
  `id_kurikulum_siswa` bigint(20) UNSIGNED NOT NULL,
  `id_kurikulum` bigint(20) UNSIGNED NOT NULL,
  `id_siswa` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kursus`
--

CREATE TABLE `kursus` (
  `id_kursus` bigint(20) UNSIGNED NOT NULL,
  `nama_kursus` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `id_guru` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kursus`
--

INSERT INTO `kursus` (`id_kursus`, `nama_kursus`, `password`, `image`, `image_url`, `id_guru`, `created_at`, `updated_at`) VALUES
(1, 'Matematika Kelas 9', '$2y$12$yLWIphBc3tTjSZohMbN6SOHv1gxSnjhJxwq9yLBckr/sKP0sExO.u', '1747723232.png', 'http://127.0.0.1:8000/images/1747723232.png', 1, '2025-05-19 23:40:33', '2025-05-19 23:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `kursus_siswa`
--

CREATE TABLE `kursus_siswa` (
  `id_kursus_siswa` bigint(20) UNSIGNED NOT NULL,
  `id_siswa` bigint(20) UNSIGNED NOT NULL,
  `id_kursus` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `latihan`
--

CREATE TABLE `latihan` (
  `id_latihan` bigint(20) UNSIGNED NOT NULL,
  `Topik` varchar(255) NOT NULL,
  `acak` enum('Aktif','Tidak Aktif') NOT NULL,
  `status_jawaban` enum('Aktif','Tidak Aktif') NOT NULL,
  `grade` int(11) NOT NULL,
  `id_guru` bigint(20) UNSIGNED NOT NULL,
  `id_kurikulum` bigint(20) UNSIGNED NOT NULL,
  `id_mata_pelajaran` bigint(20) UNSIGNED NOT NULL,
  `id_kelas` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `latihan`
--

INSERT INTO `latihan` (`id_latihan`, `Topik`, `acak`, `status_jawaban`, `grade`, `id_guru`, `id_kurikulum`, `id_mata_pelajaran`, `id_kelas`, `created_at`, `updated_at`) VALUES
(1, 'Matematika dasar', 'Aktif', 'Aktif', 100, 1, 1, 1, 1, '2025-05-20 01:04:40', '2025-05-20 01:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id_mata_pelajaran` bigint(20) UNSIGNED NOT NULL,
  `nama_mata_pelajaran` varchar(255) NOT NULL,
  `id_operator` bigint(20) UNSIGNED NOT NULL,
  `id_kurikulum` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`id_mata_pelajaran`, `nama_mata_pelajaran`, `id_operator`, `id_kurikulum`, `created_at`, `updated_at`) VALUES
(1, 'Matematika', 1, 1, '2025-05-19 23:33:45', '2025-05-19 23:33:45');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran_siswa`
--

CREATE TABLE `mata_pelajaran_siswa` (
  `id_mata_pelajaran_siswa` bigint(20) UNSIGNED NOT NULL,
  `id_siswa` bigint(20) UNSIGNED NOT NULL,
  `id_mata_pelajaran` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id_materi` bigint(20) UNSIGNED NOT NULL,
  `judul_materi` varchar(255) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `file` varchar(255) NOT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `tanggal_materi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_kursus` bigint(20) UNSIGNED NOT NULL,
  `id_guru` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id_materi`, `judul_materi`, `deskripsi`, `file`, `file_url`, `tanggal_materi`, `id_kursus`, `id_guru`, `created_at`, `updated_at`) VALUES
(1, 'Menghitung FPB', 'Matematika Menyenangkan', 'materi_files/deocZ3hGejzwZsBlRlm6R3DIWPpi2b1JcsKV5HNV.pdf', 'http://127.0.0.1:8000/storage/materi_files/deocZ3hGejzwZsBlRlm6R3DIWPpi2b1JcsKV5HNV.pdf', '2025-05-19 23:41:15', 1, 1, '2025-05-19 23:41:15', '2025-05-19 23:41:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_18_015604_create_permission_tables', 1),
(5, '2025_04_03_011406_create_operators_table', 1),
(6, '2025_04_03_014126_create_kelas_table', 1),
(7, '2025_04_03_015903_create_siswas_table', 1),
(8, '2025_04_03_020218_create_kurikulums_table', 1),
(9, '2025_04_03_020220_create_mata_pelajarans_table', 1),
(10, '2025_04_03_020256_create_guru_table', 1),
(11, '2025_04_03_020517_create_kurikulum_siswas_table', 1),
(12, '2025_04_03_020719_create_mata_pelajaran_siswas_table', 1),
(13, '2025_04_03_020821_create_kursuses_table', 1),
(14, '2025_04_03_020923_create_kursus_siswas_table', 1),
(15, '2025_04_03_021020_create_tipe_ujians_table', 1),
(16, '2025_04_03_021231_create_ujians_table', 1),
(17, '2025_04_03_021708_create_tipe_soals_table', 1),
(18, '2025_04_03_021709_create_latihan_table', 1),
(19, '2025_04_03_021709_create_soals_ujian_table', 1),
(20, '2025_04_03_022158_create_jawaban_soals_table', 1),
(21, '2025_04_03_024625_create_jawaban_siswas_table', 1),
(22, '2025_04_03_030946_tambahsoftdeletes', 1),
(23, '2025_04_03_031245_create_bisnis_table', 1),
(24, '2025_04_10_023421_create_tipe_persentase_table', 1),
(25, '2025_04_10_110347_create_tipe_nilai_table', 1),
(26, '2025_04_10_131530_create_persentase_table', 1),
(27, '2025_04_12_105539_create_nilai_table', 1),
(28, '2025_04_12_131525_create_materi_table', 1),
(29, '2025_04_30_091429_create_nilai_kursus_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` bigint(20) UNSIGNED NOT NULL,
  `nilai_total` decimal(5,0) NOT NULL DEFAULT 0,
  `id_kursus` bigint(20) UNSIGNED NOT NULL,
  `id_siswa` bigint(20) UNSIGNED NOT NULL,
  `id_tipe_nilai` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_kursus`
--

CREATE TABLE `nilai_kursus` (
  `id_nilai_kursus` bigint(20) UNSIGNED NOT NULL,
  `nilai_tipe_ujian` decimal(5,0) NOT NULL DEFAULT 0,
  `id_kursus` bigint(20) UNSIGNED NOT NULL,
  `id_siswa` bigint(20) UNSIGNED NOT NULL,
  `id_tipe_ujian` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `id_operator` bigint(20) UNSIGNED NOT NULL,
  `nama_sekolah` varchar(255) NOT NULL,
  `durasi` int(11) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`id_operator`, `nama_sekolah`, `durasi`, `status`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 'SMP BUDHI DHARMA BALIGE', 12, 'Aktif', 2, '2025-05-19 23:27:52', '2025-05-19 23:27:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'create Operator', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(2, 'view Operator', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(3, 'edit Operator', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(4, 'delete Operator', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(5, 'create Bisnis', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(6, 'view Bisnis', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(7, 'delete Bisnis', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(8, 'create Siswa', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(9, 'view Siswa', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(10, 'edit Siswa', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(11, 'delete Siswa', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(12, 'create Guru', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(13, 'view Guru', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(14, 'edit Guru', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(15, 'delete Guru', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(16, 'create Kelas', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(17, 'view Kelas', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(18, 'edit Kelas', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(19, 'create Kurikulum', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(20, 'view Kurikulum', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(21, 'edit Kurikulum', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(22, 'create Mapel', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(23, 'view Mapel', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(24, 'edit Mapel', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(25, 'delete Mapel', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(26, 'view Course', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(27, 'create Course', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(28, 'edit Course', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(29, 'delete Course', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(30, 'create latihanSoal', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(31, 'view latihanSoal', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(32, 'edit latihanSoal', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(33, 'delete latihanSoal', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(34, 'create Nilai', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(35, 'view Nilai', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23'),
(36, 'edit Nilai', 'web', '2025-05-19 23:26:23', '2025-05-19 23:26:23');

-- --------------------------------------------------------

--
-- Table structure for table `persentase`
--

CREATE TABLE `persentase` (
  `id_persentase` bigint(20) UNSIGNED NOT NULL,
  `persentase` decimal(5,0) NOT NULL DEFAULT 0,
  `id_tipe_persentase` bigint(20) UNSIGNED NOT NULL,
  `id_kursus` bigint(20) UNSIGNED NOT NULL,
  `id_tipe_ujian` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `persentase`
--

INSERT INTO `persentase` (`id_persentase`, `persentase`, `id_tipe_persentase`, `id_kursus`, `id_tipe_ujian`, `created_at`, `updated_at`) VALUES
(1, 20, 1, 1, 1, '2025-05-20 01:03:13', '2025-05-20 01:03:13'),
(2, 40, 2, 1, 2, '2025-05-20 01:03:13', '2025-05-20 01:03:13'),
(3, 40, 3, 1, 3, '2025-05-20 01:03:13', '2025-05-20 01:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'web', '2025-05-19 23:26:24', '2025-05-19 23:26:24', NULL),
(2, 'Operator', 'web', '2025-05-19 23:26:24', '2025-05-19 23:26:24', NULL),
(3, 'Guru', 'web', '2025-05-19 23:26:24', '2025-05-19 23:26:24', NULL),
(4, 'Siswa', 'web', '2025-05-19 23:26:24', '2025-05-19 23:26:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 2),
(9, 2),
(9, 3),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(13, 3),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(17, 3),
(17, 4),
(18, 2),
(19, 2),
(20, 2),
(20, 3),
(20, 4),
(21, 2),
(22, 2),
(23, 2),
(23, 3),
(23, 4),
(24, 2),
(25, 2),
(26, 3),
(26, 4),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(31, 4),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(35, 4),
(36, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4UHxxWCWXeNKcadslMPtYqjdPkdwzAYMO3xqwKns', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZTlZSnFzTzdiaHpUZGo0b0h5dW1Uczk4ZVFOdW9EN3NXekFab3BSQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9HdXJ1L0NvdXJzZSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1747732931),
('cRVGyAnp3DT8J3G6V7HBHlFPkbEkA3UBJBzncMU6', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYWd5aDFLUU45U25paVo2aGhsQzZCY1lmZG5oZ0U0S1luYjJGblZkOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9HdXJ1L1NvYWw/aWRfbGF0aWhhbj0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1747815395);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` bigint(20) UNSIGNED NOT NULL,
  `nama_siswa` varchar(255) NOT NULL,
  `nis` int(11) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_operator` bigint(20) UNSIGNED NOT NULL,
  `id_kelas` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `nis`, `status`, `id_user`, `id_operator`, `id_kelas`, `created_at`, `updated_at`) VALUES
(1, 'Natan hutahaean', 1234567890, 'Aktif', 4, 1, 1, '2025-05-19 23:35:33', '2025-05-19 23:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id_soal` bigint(20) UNSIGNED NOT NULL,
  `soal` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `nilai_per_soal` decimal(5,2) DEFAULT NULL,
  `id_ujian` bigint(20) UNSIGNED DEFAULT NULL,
  `id_tipe_soal` bigint(20) UNSIGNED DEFAULT NULL,
  `id_latihan` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `soal`, `image`, `image_url`, `nilai_per_soal`, `id_ujian`, `id_tipe_soal`, `id_latihan`, `created_at`, `updated_at`) VALUES
(1, '1 + 1 =', NULL, NULL, 33.33, 1, 1, NULL, '2025-05-20 00:07:30', '2025-05-20 01:02:12'),
(2, '1 + 1 = 2', NULL, NULL, 33.33, 1, 2, NULL, '2025-05-20 01:01:16', '2025-05-20 01:02:12'),
(3, '1 + 1 =', NULL, NULL, 33.33, 1, 3, NULL, '2025-05-20 01:01:45', '2025-05-20 01:02:12'),
(4, '1 + 1 =', NULL, NULL, 100.00, NULL, 1, 1, '2025-05-20 01:05:31', '2025-05-20 01:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_nilai`
--

CREATE TABLE `tipe_nilai` (
  `id_tipe_nilai` bigint(20) UNSIGNED NOT NULL,
  `nilai` decimal(5,0) NOT NULL DEFAULT 0,
  `id_tipe_ujian` bigint(20) UNSIGNED NOT NULL,
  `id_ujian` bigint(20) UNSIGNED NOT NULL,
  `id_siswa` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipe_persentase`
--

CREATE TABLE `tipe_persentase` (
  `id_tipe_persentase` bigint(20) UNSIGNED NOT NULL,
  `nama_persentase` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tipe_persentase`
--

INSERT INTO `tipe_persentase` (`id_tipe_persentase`, `nama_persentase`, `created_at`, `updated_at`) VALUES
(1, 'persentase_kuis', NULL, NULL),
(2, 'persentase_UTS', NULL, NULL),
(3, 'persentase_UAS', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tipe_soal`
--

CREATE TABLE `tipe_soal` (
  `id_tipe_soal` bigint(20) UNSIGNED NOT NULL,
  `nama_tipe_soal` enum('Pilihan Berganda','Benar Salah','Isian') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tipe_soal`
--

INSERT INTO `tipe_soal` (`id_tipe_soal`, `nama_tipe_soal`, `created_at`, `updated_at`) VALUES
(1, 'Pilihan Berganda', '2025-05-19 23:26:24', '2025-05-19 23:26:24'),
(2, 'Benar Salah', '2025-05-19 23:26:24', '2025-05-19 23:26:24'),
(3, 'Isian', '2025-05-19 23:26:24', '2025-05-19 23:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_ujian`
--

CREATE TABLE `tipe_ujian` (
  `id_tipe_ujian` bigint(20) UNSIGNED NOT NULL,
  `nama_tipe_ujian` enum('Kuis','Ujian Tengah Semester','Ujian Akhir Semester') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tipe_ujian`
--

INSERT INTO `tipe_ujian` (`id_tipe_ujian`, `nama_tipe_ujian`, `created_at`, `updated_at`) VALUES
(1, 'Kuis', '2025-05-19 23:26:24', '2025-05-19 23:26:24'),
(2, 'Ujian Tengah Semester', '2025-05-19 23:26:24', '2025-05-19 23:26:24'),
(3, 'Ujian Akhir Semester', '2025-05-19 23:26:24', '2025-05-19 23:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` bigint(20) UNSIGNED NOT NULL,
  `nama_ujian` varchar(255) NOT NULL,
  `acak` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  `status_jawaban` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  `grade` double NOT NULL,
  `password_masuk` varchar(255) NOT NULL,
  `password_keluar` varchar(255) NOT NULL,
  `waktu_mulai` timestamp NULL DEFAULT NULL,
  `waktu_selesai` timestamp NULL DEFAULT NULL,
  `durasi` int(11) NOT NULL,
  `tanggal_ujian` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_kursus` bigint(20) UNSIGNED NOT NULL,
  `id_guru` bigint(20) UNSIGNED NOT NULL,
  `id_tipe_ujian` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `nama_ujian`, `acak`, `status_jawaban`, `grade`, `password_masuk`, `password_keluar`, `waktu_mulai`, `waktu_selesai`, `durasi`, `tanggal_ujian`, `id_kursus`, `id_guru`, `id_tipe_ujian`, `created_at`, `updated_at`) VALUES
(1, 'Menghitung FPB', 'Aktif', 'Aktif', 100, '$2y$12$lMCJnsyqa0pwbq2RgGMQGuwJ6s4DdSsjiUxsfSE1K4KUj/B/WjMyS', '$2y$12$wltfcmzK9ffYNY1ZfSX.AuzuJTXhu5Z4F5SMF/R/qCq2dTgQSgHxa', '2025-05-23 07:30:00', '2025-05-23 10:30:00', 180, '2025-05-20 06:42:17', 1, 1, 2, '2025-05-19 23:42:17', '2025-05-19 23:42:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$12$jhGn0TgbxsIDdWKV0K4Lie7t0DDowfhkMMy61L4vTbTEc42jcbePe', NULL, '2025-05-19 23:26:24', '2025-05-19 23:26:24'),
(2, 'SMP BUDHI DHARMA BALIGE', 'smpbudhidharma@gmail.com', NULL, '$2y$12$RsE4bao.h9ZAAxwMmmzSCuF.doyEzxZ68NU3IEaQS4gvAp/GkC8ue', NULL, '2025-05-19 23:27:52', '2025-05-19 23:27:52'),
(3, 'Ritchan Hutahaean', 'ritchan@gmail.com', NULL, '$2y$12$CkKrGRTFBm0eqs8GmtJR4e9RqjCDRhdywxy4LZEayBFUweeljwmX6', NULL, '2025-05-19 23:34:46', '2025-05-19 23:34:46'),
(4, 'Natan hutahaean', 'natanhuta17@gmail.com', NULL, '$2y$12$VenXm/i55ehfhb6EcwdXD.U1r/5H6HsgP9yI.nMWXL7wauV1EtegW', NULL, '2025-05-19 23:35:33', '2025-05-19 23:35:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bisnis`
--
ALTER TABLE `bisnis`
  ADD PRIMARY KEY (`id_bisnis`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD UNIQUE KEY `guru_nip_unique` (`nip`),
  ADD KEY `guru_id_mata_pelajaran_foreign` (`id_mata_pelajaran`),
  ADD KEY `guru_id_user_foreign` (`id_user`),
  ADD KEY `guru_id_operator_foreign` (`id_operator`);

--
-- Indexes for table `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  ADD PRIMARY KEY (`id_jawaban_siswa`),
  ADD KEY `jawaban_siswa_id_soal_foreign` (`id_soal`),
  ADD KEY `jawaban_siswa_id_siswa_foreign` (`id_siswa`),
  ADD KEY `jawaban_siswa_id_jawaban_soal_foreign` (`id_jawaban_soal`);

--
-- Indexes for table `jawaban_soal`
--
ALTER TABLE `jawaban_soal`
  ADD PRIMARY KEY (`id_jawaban_soal`),
  ADD KEY `jawaban_soal_id_soal_foreign` (`id_soal`),
  ADD KEY `jawaban_soal_id_tipe_soal_foreign` (`id_tipe_soal`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `kelas_id_operator_foreign` (`id_operator`);

--
-- Indexes for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD PRIMARY KEY (`id_kurikulum`),
  ADD KEY `kurikulum_id_operator_foreign` (`id_operator`);

--
-- Indexes for table `kurikulum_siswa`
--
ALTER TABLE `kurikulum_siswa`
  ADD PRIMARY KEY (`id_kurikulum_siswa`),
  ADD KEY `kurikulum_siswa_id_kurikulum_foreign` (`id_kurikulum`),
  ADD KEY `kurikulum_siswa_id_siswa_foreign` (`id_siswa`);

--
-- Indexes for table `kursus`
--
ALTER TABLE `kursus`
  ADD PRIMARY KEY (`id_kursus`),
  ADD KEY `kursus_id_guru_foreign` (`id_guru`);

--
-- Indexes for table `kursus_siswa`
--
ALTER TABLE `kursus_siswa`
  ADD PRIMARY KEY (`id_kursus_siswa`),
  ADD KEY `kursus_siswa_id_siswa_foreign` (`id_siswa`),
  ADD KEY `kursus_siswa_id_kursus_foreign` (`id_kursus`);

--
-- Indexes for table `latihan`
--
ALTER TABLE `latihan`
  ADD PRIMARY KEY (`id_latihan`),
  ADD KEY `latihan_id_guru_foreign` (`id_guru`),
  ADD KEY `latihan_id_kelas_foreign` (`id_kelas`),
  ADD KEY `latihan_id_kurikulum_foreign` (`id_kurikulum`),
  ADD KEY `latihan_id_mata_pelajaran_foreign` (`id_mata_pelajaran`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id_mata_pelajaran`),
  ADD KEY `mata_pelajaran_id_operator_foreign` (`id_operator`),
  ADD KEY `mata_pelajaran_id_kurikulum_foreign` (`id_kurikulum`);

--
-- Indexes for table `mata_pelajaran_siswa`
--
ALTER TABLE `mata_pelajaran_siswa`
  ADD PRIMARY KEY (`id_mata_pelajaran_siswa`),
  ADD KEY `mata_pelajaran_siswa_id_siswa_foreign` (`id_siswa`),
  ADD KEY `mata_pelajaran_siswa_id_mata_pelajaran_foreign` (`id_mata_pelajaran`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `materi_id_kursus_foreign` (`id_kursus`),
  ADD KEY `materi_id_guru_foreign` (`id_guru`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `nilai_id_kursus_foreign` (`id_kursus`),
  ADD KEY `nilai_id_siswa_foreign` (`id_siswa`),
  ADD KEY `nilai_id_tipe_nilai_foreign` (`id_tipe_nilai`);

--
-- Indexes for table `nilai_kursus`
--
ALTER TABLE `nilai_kursus`
  ADD PRIMARY KEY (`id_nilai_kursus`),
  ADD KEY `nilai_kursus_id_kursus_foreign` (`id_kursus`),
  ADD KEY `nilai_kursus_id_siswa_foreign` (`id_siswa`),
  ADD KEY `nilai_kursus_id_tipe_ujian_foreign` (`id_tipe_ujian`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`id_operator`),
  ADD KEY `operator_id_user_foreign` (`id_user`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `persentase`
--
ALTER TABLE `persentase`
  ADD PRIMARY KEY (`id_persentase`),
  ADD KEY `persentase_id_tipe_persentase_foreign` (`id_tipe_persentase`),
  ADD KEY `persentase_id_kursus_foreign` (`id_kursus`),
  ADD KEY `persentase_id_tipe_ujian_foreign` (`id_tipe_ujian`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `siswa_nis_unique` (`nis`),
  ADD KEY `siswa_id_user_foreign` (`id_user`),
  ADD KEY `siswa_id_operator_foreign` (`id_operator`),
  ADD KEY `siswa_id_kelas_foreign` (`id_kelas`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `soal_id_ujian_foreign` (`id_ujian`),
  ADD KEY `soal_id_tipe_soal_foreign` (`id_tipe_soal`),
  ADD KEY `soal_id_latihan_foreign` (`id_latihan`);

--
-- Indexes for table `tipe_nilai`
--
ALTER TABLE `tipe_nilai`
  ADD PRIMARY KEY (`id_tipe_nilai`),
  ADD KEY `tipe_nilai_id_tipe_ujian_foreign` (`id_tipe_ujian`),
  ADD KEY `tipe_nilai_id_siswa_foreign` (`id_siswa`),
  ADD KEY `tipe_nilai_id_ujian_foreign` (`id_ujian`);

--
-- Indexes for table `tipe_persentase`
--
ALTER TABLE `tipe_persentase`
  ADD PRIMARY KEY (`id_tipe_persentase`);

--
-- Indexes for table `tipe_soal`
--
ALTER TABLE `tipe_soal`
  ADD PRIMARY KEY (`id_tipe_soal`);

--
-- Indexes for table `tipe_ujian`
--
ALTER TABLE `tipe_ujian`
  ADD PRIMARY KEY (`id_tipe_ujian`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `ujian_id_kursus_foreign` (`id_kursus`),
  ADD KEY `ujian_id_guru_foreign` (`id_guru`),
  ADD KEY `ujian_id_tipe_ujian_foreign` (`id_tipe_ujian`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bisnis`
--
ALTER TABLE `bisnis`
  MODIFY `id_bisnis` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  MODIFY `id_jawaban_siswa` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jawaban_soal`
--
ALTER TABLE `jawaban_soal`
  MODIFY `id_jawaban_soal` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kurikulum`
--
ALTER TABLE `kurikulum`
  MODIFY `id_kurikulum` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kurikulum_siswa`
--
ALTER TABLE `kurikulum_siswa`
  MODIFY `id_kurikulum_siswa` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kursus`
--
ALTER TABLE `kursus`
  MODIFY `id_kursus` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kursus_siswa`
--
ALTER TABLE `kursus_siswa`
  MODIFY `id_kursus_siswa` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `latihan`
--
ALTER TABLE `latihan`
  MODIFY `id_latihan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `id_mata_pelajaran` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mata_pelajaran_siswa`
--
ALTER TABLE `mata_pelajaran_siswa`
  MODIFY `id_mata_pelajaran_siswa` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nilai_kursus`
--
ALTER TABLE `nilai_kursus`
  MODIFY `id_nilai_kursus` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operator`
--
ALTER TABLE `operator`
  MODIFY `id_operator` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `persentase`
--
ALTER TABLE `persentase`
  MODIFY `id_persentase` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipe_nilai`
--
ALTER TABLE `tipe_nilai`
  MODIFY `id_tipe_nilai` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipe_persentase`
--
ALTER TABLE `tipe_persentase`
  MODIFY `id_tipe_persentase` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipe_soal`
--
ALTER TABLE `tipe_soal`
  MODIFY `id_tipe_soal` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipe_ujian`
--
ALTER TABLE `tipe_ujian`
  MODIFY `id_tipe_ujian` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_id_mata_pelajaran_foreign` FOREIGN KEY (`id_mata_pelajaran`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE CASCADE,
  ADD CONSTRAINT `guru_id_operator_foreign` FOREIGN KEY (`id_operator`) REFERENCES `operator` (`id_operator`) ON DELETE CASCADE,
  ADD CONSTRAINT `guru_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  ADD CONSTRAINT `jawaban_siswa_id_jawaban_soal_foreign` FOREIGN KEY (`id_jawaban_soal`) REFERENCES `jawaban_soal` (`id_jawaban_soal`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_siswa_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_siswa_id_soal_foreign` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id_soal`) ON DELETE CASCADE;

--
-- Constraints for table `jawaban_soal`
--
ALTER TABLE `jawaban_soal`
  ADD CONSTRAINT `jawaban_soal_id_soal_foreign` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id_soal`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_soal_id_tipe_soal_foreign` FOREIGN KEY (`id_tipe_soal`) REFERENCES `tipe_soal` (`id_tipe_soal`) ON DELETE CASCADE;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_id_operator_foreign` FOREIGN KEY (`id_operator`) REFERENCES `operator` (`id_operator`) ON DELETE CASCADE;

--
-- Constraints for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD CONSTRAINT `kurikulum_id_operator_foreign` FOREIGN KEY (`id_operator`) REFERENCES `operator` (`id_operator`) ON DELETE CASCADE;

--
-- Constraints for table `kurikulum_siswa`
--
ALTER TABLE `kurikulum_siswa`
  ADD CONSTRAINT `kurikulum_siswa_id_kurikulum_foreign` FOREIGN KEY (`id_kurikulum`) REFERENCES `kurikulum` (`id_kurikulum`) ON DELETE CASCADE,
  ADD CONSTRAINT `kurikulum_siswa_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE;

--
-- Constraints for table `kursus`
--
ALTER TABLE `kursus`
  ADD CONSTRAINT `kursus_id_guru_foreign` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE;

--
-- Constraints for table `kursus_siswa`
--
ALTER TABLE `kursus_siswa`
  ADD CONSTRAINT `kursus_siswa_id_kursus_foreign` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`) ON DELETE CASCADE,
  ADD CONSTRAINT `kursus_siswa_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE;

--
-- Constraints for table `latihan`
--
ALTER TABLE `latihan`
  ADD CONSTRAINT `latihan_id_guru_foreign` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE,
  ADD CONSTRAINT `latihan_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE,
  ADD CONSTRAINT `latihan_id_kurikulum_foreign` FOREIGN KEY (`id_kurikulum`) REFERENCES `kurikulum` (`id_kurikulum`) ON DELETE CASCADE,
  ADD CONSTRAINT `latihan_id_mata_pelajaran_foreign` FOREIGN KEY (`id_mata_pelajaran`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE CASCADE;

--
-- Constraints for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD CONSTRAINT `mata_pelajaran_id_kurikulum_foreign` FOREIGN KEY (`id_kurikulum`) REFERENCES `kurikulum` (`id_kurikulum`) ON DELETE CASCADE,
  ADD CONSTRAINT `mata_pelajaran_id_operator_foreign` FOREIGN KEY (`id_operator`) REFERENCES `operator` (`id_operator`) ON DELETE CASCADE;

--
-- Constraints for table `mata_pelajaran_siswa`
--
ALTER TABLE `mata_pelajaran_siswa`
  ADD CONSTRAINT `mata_pelajaran_siswa_id_mata_pelajaran_foreign` FOREIGN KEY (`id_mata_pelajaran`) REFERENCES `mata_pelajaran` (`id_mata_pelajaran`) ON DELETE CASCADE,
  ADD CONSTRAINT `mata_pelajaran_siswa_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE;

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `materi_id_guru_foreign` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE,
  ADD CONSTRAINT `materi_id_kursus_foreign` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_id_kursus_foreign` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_id_tipe_nilai_foreign` FOREIGN KEY (`id_tipe_nilai`) REFERENCES `tipe_nilai` (`id_tipe_nilai`) ON DELETE CASCADE;

--
-- Constraints for table `nilai_kursus`
--
ALTER TABLE `nilai_kursus`
  ADD CONSTRAINT `nilai_kursus_id_kursus_foreign` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_kursus_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_kursus_id_tipe_ujian_foreign` FOREIGN KEY (`id_tipe_ujian`) REFERENCES `tipe_ujian` (`id_tipe_ujian`) ON DELETE CASCADE;

--
-- Constraints for table `operator`
--
ALTER TABLE `operator`
  ADD CONSTRAINT `operator_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `persentase`
--
ALTER TABLE `persentase`
  ADD CONSTRAINT `persentase_id_kursus_foreign` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`) ON DELETE CASCADE,
  ADD CONSTRAINT `persentase_id_tipe_persentase_foreign` FOREIGN KEY (`id_tipe_persentase`) REFERENCES `tipe_persentase` (`id_tipe_persentase`) ON DELETE CASCADE,
  ADD CONSTRAINT `persentase_id_tipe_ujian_foreign` FOREIGN KEY (`id_tipe_ujian`) REFERENCES `tipe_ujian` (`id_tipe_ujian`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_id_kelas_foreign` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE,
  ADD CONSTRAINT `siswa_id_operator_foreign` FOREIGN KEY (`id_operator`) REFERENCES `operator` (`id_operator`) ON DELETE CASCADE,
  ADD CONSTRAINT `siswa_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `soal`
--
ALTER TABLE `soal`
  ADD CONSTRAINT `soal_id_latihan_foreign` FOREIGN KEY (`id_latihan`) REFERENCES `latihan` (`id_latihan`) ON DELETE CASCADE,
  ADD CONSTRAINT `soal_id_tipe_soal_foreign` FOREIGN KEY (`id_tipe_soal`) REFERENCES `tipe_soal` (`id_tipe_soal`) ON DELETE CASCADE,
  ADD CONSTRAINT `soal_id_ujian_foreign` FOREIGN KEY (`id_ujian`) REFERENCES `ujian` (`id_ujian`) ON DELETE CASCADE;

--
-- Constraints for table `tipe_nilai`
--
ALTER TABLE `tipe_nilai`
  ADD CONSTRAINT `tipe_nilai_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE,
  ADD CONSTRAINT `tipe_nilai_id_tipe_ujian_foreign` FOREIGN KEY (`id_tipe_ujian`) REFERENCES `tipe_ujian` (`id_tipe_ujian`) ON DELETE CASCADE,
  ADD CONSTRAINT `tipe_nilai_id_ujian_foreign` FOREIGN KEY (`id_ujian`) REFERENCES `ujian` (`id_ujian`) ON DELETE CASCADE;

--
-- Constraints for table `ujian`
--
ALTER TABLE `ujian`
  ADD CONSTRAINT `ujian_id_guru_foreign` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE,
  ADD CONSTRAINT `ujian_id_kursus_foreign` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id_kursus`) ON DELETE CASCADE,
  ADD CONSTRAINT `ujian_id_tipe_ujian_foreign` FOREIGN KEY (`id_tipe_ujian`) REFERENCES `tipe_ujian` (`id_tipe_ujian`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
