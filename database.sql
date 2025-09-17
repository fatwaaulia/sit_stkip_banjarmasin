-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 17, 2025 at 01:09 AM
-- Server version: 8.0.30
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sit_stkip_banjarmasin`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` tinyint NOT NULL,
  `nama_aplikasi` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_perusahaan` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `favicon` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `maps` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `ts_2_tanggal_awal` date DEFAULT NULL,
  `ts_2_tanggal_akhir` date DEFAULT NULL,
  `ts_1_tanggal_awal` date DEFAULT NULL,
  `ts_1_tanggal_akhir` date DEFAULT NULL,
  `ts_tanggal_awal` date DEFAULT NULL,
  `ts_tanggal_akhir` date DEFAULT NULL,
  `buka_pendaftaran_mahasiswa` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `nama_aplikasi`, `nama_perusahaan`, `deskripsi`, `logo`, `favicon`, `no_hp`, `alamat`, `maps`, `ts_2_tanggal_awal`, `ts_2_tanggal_akhir`, `ts_1_tanggal_awal`, `ts_1_tanggal_akhir`, `ts_tanggal_awal`, `ts_tanggal_akhir`, `buka_pendaftaran_mahasiswa`, `created_at`, `updated_at`) VALUES
(1, 'STKIP ISM Banjarmasin', 'Humasoft Studio Teknologi', 'Kampus Visioner STKIP ISM Banjarmasin', 'logo.png', 'favicon.png', '0', 'Jl. Malkon Temon Jl. Sultan Adam No.12, RT.23, Surgi Mufti, Kec. Banjarmasin Utara, Kota Banjarmasin, Kalimantan Selatan 70122', '', '2024-09-08', '2025-03-04', '2025-03-05', '2025-07-23', '2025-07-24', '2026-03-17', 'Buka', '2024-09-17 13:06:51', '2025-09-09 18:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `dosen_pendamping`
--

CREATE TABLE `dosen_pendamping` (
  `id` bigint NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen_pendamping`
--

INSERT INTO `dosen_pendamping` (`id`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(2, 'Dosen Pembimbing Skripsi 2024/2025 Ganjil', 'https://www.researchgate.net/profile/Aceng-Wahid/publication/346397070_Analisis_Metode_Waterfall_Untuk_Pengembangan_Sistem_Informasi/links/5fbfa91092851c933f5d76b6/Analisis-Metode-Waterfall-Untuk-Pengembangan-Sistem-Informasi.pdf', '', '2025-09-01 10:09:28', '2025-09-10 05:44:32', 4, 1),
(3, 'sk skripsi', '', '1757992605_cc5df18fb93477af738b.pdf', '2025-09-16 10:16:45', '2025-09-16 10:16:45', 28, 0),
(4, 'Dosen Pembimbing Akademik', '', '', '2025-09-16 11:01:48', '2025-09-16 11:01:48', 32, 0),
(5, 'DOSEN PEMBIMBING AKADEMIK', '', '1757995317_99e5309fc3ec880c6046.pdf', '2025-09-16 11:01:57', '2025-09-16 11:01:57', 33, 0),
(6, 'Dosen Pembimbing Skripsi', '', '', '2025-09-16 11:02:09', '2025-09-16 11:02:09', 32, 0),
(7, 'DOSEN PEMBIMBING AKADEMIK', '', '1757995357_893936256c9f7f2b8a4d.pdf', '2025-09-16 11:02:37', '2025-09-16 11:02:37', 28, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_kegiatan`
--

CREATE TABLE `jadwal_kegiatan` (
  `id` bigint NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_kegiatan`
--

INSERT INTO `jadwal_kegiatan` (`id`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(2, 'Jadwal MBKM 2024 - 2025 Ganjil', 'https://www.researchgate.net/profile/Aceng-Wahid/publication/346397070_Analisis_Metode_Waterfall_Untuk_Pengembangan_Sistem_Informasi/links/5fbfa91092851c933f5d76b6/Analisis-Metode-Waterfall-Untuk-Pengembangan-Sistem-Informasi.pdf', '', '2025-09-01 10:09:28', '2025-09-09 08:48:46', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_kuliah`
--

CREATE TABLE `jadwal_kuliah` (
  `id` bigint NOT NULL,
  `id_program_studi` bigint NOT NULL,
  `jenjang_program_studi` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `singkatan_program_studi` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_kuliah`
--

INSERT INTO `jadwal_kuliah` (`id`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`) VALUES
(4, 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 'jadwal perkuliahan 2025', '', '1757992057_376a750965a2f0873973.pdf', '2025-09-16 10:07:37', '2025-09-16 10:07:37'),
(5, 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 'Jadwal Perkuliahan Tahun Akademik 2025-2026', '', '1757992515_3fe72daba5901660f458.pdf', '2025-09-16 10:15:15', '2025-09-16 10:15:15'),
(6, 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 'jadwal perkuliahan semester ganjil TA 2025-2026', '', '1757992615_bcd9f4557ff98151e3a6.pdf', '2025-09-16 10:16:55', '2025-09-16 10:16:55');

-- --------------------------------------------------------

--
-- Table structure for table `kalender_akademik`
--

CREATE TABLE `kalender_akademik` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kalender_akademik`
--

INSERT INTO `kalender_akademik` (`id`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`) VALUES
(1, 'Kalender Akademik Semester Ganjil Tahun 2024-2025', 'https://www.youtube.com/', '', '2025-08-20 06:07:59', '2025-08-31 06:31:22'),
(2, 'Kalender Akademik Semester Genap Tahun 2024-2025', 'https://www.youtube.com/', '', '2025-08-28 21:04:31', '2025-08-31 06:31:15'),
(3, 'Kalender Akademik Semester Ganjil Tahun 2025-2026', 'https://www.youtube.com/watch?v=sWeVcbGhBv0&list=RDsWeVcbGhBv0&start_radio=1', '', '2025-08-28 21:05:03', '2025-08-31 06:31:07');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_dana_masuk`
--

CREATE TABLE `kategori_dana_masuk` (
  `id` bigint NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_dana_masuk`
--

INSERT INTO `kategori_dana_masuk` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Mahasiswa', '2025-08-29 22:42:15', '2025-08-29 22:42:15'),
(2, 'Kementerian/ Yayasan', '2025-08-29 22:42:15', '2025-08-29 22:42:15'),
(3, 'PT Sendiri', '2025-08-29 22:42:15', '2025-08-29 22:42:15'),
(4, 'Sumber Lain (Dalam dan Luar Negeri)', '2025-08-29 22:42:15', '2025-08-29 22:42:15'),
(5, 'Dana Penelitian dan PKM', '2025-08-29 22:42:15', '2025-08-29 22:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_penyusutan_inventaris`
--

CREATE TABLE `kategori_penyusutan_inventaris` (
  `id` bigint NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_penyusutan_inventaris`
--

INSERT INTO `kategori_penyusutan_inventaris` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Tanah', '2025-08-27 00:45:46', '2025-08-27 00:45:46'),
(2, 'Bangunan', '2025-08-27 00:45:46', '2025-08-27 00:45:46'),
(3, 'Inventaris Kantor', '2025-08-27 00:45:46', '2025-08-27 00:45:46'),
(4, 'Perpustakaan', '2025-08-27 00:45:46', '2025-08-27 00:45:46'),
(5, 'Laboratorium', '2025-08-27 00:45:46', '2025-08-27 00:45:46');

-- --------------------------------------------------------

--
-- Table structure for table `keuangan`
--

CREATE TABLE `keuangan` (
  `id` bigint NOT NULL,
  `jenis` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_kategori_dana` bigint NOT NULL,
  `nama_kategori_dana` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nominal` int NOT NULL,
  `id_sumber_dana` int NOT NULL,
  `nama_sumber_dana` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `catatan` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keuangan`
--

INSERT INTO `keuangan` (`id`, `jenis`, `id_kategori_dana`, `nama_kategori_dana`, `nominal`, `id_sumber_dana`, `nama_sumber_dana`, `catatan`, `tanggal`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(9, 'Masuk', 1, 'Mahasiswa', 1000000, 1, 'SPP', 'Pembayaran SPP mahasiswa', '2025-08-02 13:59:00', '2025-09-16 14:01:04', '2025-09-16 14:01:04', 41, 0),
(10, 'Masuk', 1, 'Mahasiswa', 200000, 3, 'Lain-lain', 'Pembayaran biaya PMB a.n Yully Yana Istikomah PGSD TA 2025/2026', '2025-08-08 14:03:00', '2025-09-16 14:04:39', '2025-09-16 14:04:39', 41, 0);

-- --------------------------------------------------------

--
-- Table structure for table `laporan_pertanggungjawaban`
--

CREATE TABLE `laporan_pertanggungjawaban` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_promosi`
--

CREATE TABLE `laporan_promosi` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lkpt`
--

CREATE TABLE `lkpt` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_keuangan`
--

CREATE TABLE `log_keuangan` (
  `id` bigint NOT NULL,
  `id_keuangan` bigint NOT NULL,
  `pesan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_login`
--

CREATE TABLE `log_login` (
  `id` bigint NOT NULL,
  `id_user` bigint NOT NULL,
  `id_role` tinyint NOT NULL,
  `nama_user` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_login`
--

INSERT INTO `log_login` (`id`, `id_user`, `id_role`, `nama_user`, `username`, `ip_address`, `status`, `created_at`, `updated_at`) VALUES
(28, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-06-08 22:28:56', '2025-06-08 22:28:56'),
(29, 2, 2, 'Admin', 'admin', '::1', 'Failed', '2025-06-11 11:35:59', '2025-06-11 11:35:59'),
(30, 2, 2, 'Admin', 'admin', '::1', 'Failed', '2025-06-11 11:36:07', '2025-06-11 11:36:07'),
(31, 2, 2, 'Admin', 'admin', '::1', 'Failed', '2025-06-11 11:36:10', '2025-06-11 11:36:10'),
(32, 0, 0, '', 'adminqqq', '::1', 'Failed', '2025-06-11 11:55:55', '2025-06-11 11:55:55'),
(33, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-11 11:55:59', '2025-06-11 11:55:59'),
(34, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-11 11:56:05', '2025-06-11 11:56:05'),
(35, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-11 12:08:44', '2025-06-11 12:08:44'),
(36, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-12 18:10:22', '2025-06-12 18:10:22'),
(37, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-13 05:07:33', '2025-06-13 05:07:33'),
(38, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-06-13 10:09:02', '2025-06-13 10:09:02'),
(39, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-06-13 10:41:06', '2025-06-13 10:41:06'),
(40, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-14 11:24:37', '2025-06-14 11:24:37'),
(41, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-14 19:52:28', '2025-06-14 19:52:28'),
(42, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-14 19:55:24', '2025-06-14 19:55:24'),
(43, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-14 20:29:17', '2025-06-14 20:29:17'),
(44, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-15 05:29:10', '2025-06-15 05:29:10'),
(45, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-15 09:00:16', '2025-06-15 09:00:16'),
(46, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-15 14:06:13', '2025-06-15 14:06:13'),
(47, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-15 14:06:26', '2025-06-15 14:06:26'),
(48, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-15 14:10:48', '2025-06-15 14:10:48'),
(49, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-06-23 10:22:34', '2025-06-23 10:22:34'),
(50, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-23 11:15:56', '2025-06-23 11:15:56'),
(51, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-06-23 11:20:02', '2025-06-23 11:20:02'),
(52, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-06-29 05:04:31', '2025-06-29 05:04:31'),
(53, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-01 12:21:50', '2025-07-01 12:21:50'),
(54, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-01 15:25:20', '2025-07-01 15:25:20'),
(55, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-01 15:25:26', '2025-07-01 15:25:26'),
(56, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-01 15:25:32', '2025-07-01 15:25:32'),
(57, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-01 18:07:04', '2025-07-01 18:07:04'),
(58, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-05 19:43:47', '2025-07-05 19:43:47'),
(59, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-07 10:20:40', '2025-07-07 10:20:40'),
(60, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-07 19:48:54', '2025-07-07 19:48:54'),
(61, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-07 20:24:10', '2025-07-07 20:24:10'),
(62, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-12 10:36:44', '2025-07-12 10:36:44'),
(63, 0, 0, '', 'started@gmail.com', '::1', 'Failed', '2025-07-12 11:10:29', '2025-07-12 11:10:29'),
(64, 0, 0, '', 'fatwaaulia@gmail.com', '::1', 'Failed', '2025-07-12 11:10:33', '2025-07-12 11:10:33'),
(65, 3, 3, 'Fatwa Aulia', 'fatwaaulia.fy@gmail.com', '::1', 'Success', '2025-07-12 11:11:21', '2025-07-12 11:11:21'),
(66, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-12 11:23:56', '2025-07-12 11:23:56'),
(67, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-12 13:33:55', '2025-07-12 13:33:55'),
(68, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-07-13 07:49:15', '2025-07-13 07:49:15'),
(69, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-14 07:16:53', '2025-07-14 07:16:53'),
(70, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-16 18:11:50', '2025-07-16 18:11:50'),
(71, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-17 07:55:58', '2025-07-17 07:55:58'),
(72, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-17 16:31:01', '2025-07-17 16:31:01'),
(73, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-18 14:04:04', '2025-07-18 14:04:04'),
(74, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-18 15:57:55', '2025-07-18 15:57:55'),
(75, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-18 15:58:56', '2025-07-18 15:58:56'),
(76, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-19 05:03:57', '2025-07-19 05:03:57'),
(77, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-19 09:52:13', '2025-07-19 09:52:13'),
(78, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-19 13:22:44', '2025-07-19 13:22:44'),
(79, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-19 16:13:59', '2025-07-19 16:13:59'),
(80, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-19 21:35:57', '2025-07-19 21:35:57'),
(81, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-19 21:36:04', '2025-07-19 21:36:04'),
(82, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-20 08:40:19', '2025-07-20 08:40:19'),
(83, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-20 12:22:04', '2025-07-20 12:22:04'),
(84, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-07-26 18:58:00', '2025-07-26 18:58:00'),
(85, 0, 0, '', 'supereadmin', '::1', 'Failed', '2025-07-26 18:58:09', '2025-07-26 18:58:09'),
(86, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-26 18:58:12', '2025-07-26 18:58:12'),
(87, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-27 05:31:44', '2025-07-27 05:31:44'),
(88, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-27 13:03:23', '2025-07-27 13:03:23'),
(89, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-30 09:13:20', '2025-07-30 09:13:20'),
(90, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-07-31 11:13:42', '2025-07-31 11:13:42'),
(91, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-08-01 13:29:05', '2025-08-01 13:29:05'),
(92, 3, 2, 'Fatwa Aulia', 'fatwaaulia.fy@gmail.com', '::1', 'Success', '2025-08-01 13:35:39', '2025-08-01 13:35:39'),
(93, 0, 0, '', 'admin', '::1', 'Failed', '2025-08-02 04:53:11', '2025-08-02 04:53:11'),
(94, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-08-02 04:53:17', '2025-08-02 04:53:17'),
(95, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-15 09:49:06', '2025-08-15 09:49:06'),
(96, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-15 19:42:12', '2025-08-15 19:42:12'),
(97, 0, 0, '', 'superadmin', '::1', 'Failed', '2025-08-16 13:35:21', '2025-08-16 13:35:21'),
(98, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-16 13:35:31', '2025-08-16 13:35:31'),
(99, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-17 12:21:12', '2025-08-17 12:21:12'),
(100, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-17 12:35:29', '2025-08-17 12:35:29'),
(101, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-17 12:39:05', '2025-08-17 12:39:05'),
(102, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-17 12:52:23', '2025-08-17 12:52:23'),
(103, 0, 0, '', 'keuangan', '::1', 'Failed', '2025-08-17 12:52:34', '2025-08-17 12:52:34'),
(104, 0, 0, '', 'keuangan', '::1', 'Failed', '2025-08-17 12:52:47', '2025-08-17 12:52:47'),
(105, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-17 12:52:50', '2025-08-17 12:52:50'),
(106, 0, 0, '', 'keuangan', '::1', 'Failed', '2025-08-17 12:55:32', '2025-08-17 12:55:32'),
(107, 0, 0, '', 'keuangan', '::1', 'Failed', '2025-08-17 12:55:37', '2025-08-17 12:55:37'),
(108, 3, 2, 'Keuangan', 'keuangan', '::1', 'Success', '2025-08-17 12:56:14', '2025-08-17 12:56:14'),
(109, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-17 12:59:12', '2025-08-17 12:59:12'),
(110, 3, 2, 'Keuangan', 'keuangan', '::1', 'Success', '2025-08-17 13:20:27', '2025-08-17 13:20:27'),
(111, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-17 20:44:08', '2025-08-17 20:44:08'),
(112, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-18 05:42:21', '2025-08-18 05:42:21'),
(113, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-18 13:09:06', '2025-08-18 13:09:06'),
(114, 4, 3, 'Akademik', 'akademik', '::1', 'Failed', '2025-08-18 20:37:48', '2025-08-18 20:37:48'),
(115, 4, 3, 'Akademik', 'akademik', '::1', 'Success', '2025-08-18 20:37:56', '2025-08-18 20:37:56'),
(116, 1, 1, 'Admin', 'admin', '::1', 'Failed', '2025-08-19 05:35:19', '2025-08-19 05:35:19'),
(117, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-19 05:35:22', '2025-08-19 05:35:22'),
(118, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-19 13:37:51', '2025-08-19 13:37:51'),
(119, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-19 16:14:45', '2025-08-19 16:14:45'),
(120, 3, 2, 'Keuangan', 'keuangan', '::1', 'Success', '2025-08-19 19:07:40', '2025-08-19 19:07:40'),
(121, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-19 19:07:55', '2025-08-19 19:07:55'),
(122, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-20 05:39:41', '2025-08-20 05:39:41'),
(123, 4, 3, 'Akademik', 'akademik', '::1', 'Success', '2025-08-20 05:40:53', '2025-08-20 05:40:53'),
(124, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-20 05:43:40', '2025-08-20 05:43:40'),
(125, 0, 0, '', 'superadmin', '::1', 'Failed', '2025-08-20 08:13:31', '2025-08-20 08:13:31'),
(126, 0, 0, '', 'superadmin', '::1', 'Failed', '2025-08-20 08:13:47', '2025-08-20 08:13:47'),
(127, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-20 08:13:54', '2025-08-20 08:13:54'),
(128, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-20 08:16:07', '2025-08-20 08:16:07'),
(129, 0, 0, '', 'superadmin', '::1', 'Failed', '2025-08-20 16:40:48', '2025-08-20 16:40:48'),
(130, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-20 16:40:53', '2025-08-20 16:40:53'),
(131, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-20 19:39:16', '2025-08-20 19:39:16'),
(132, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-21 05:49:35', '2025-08-21 05:49:35'),
(133, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-21 21:29:59', '2025-08-21 21:29:59'),
(134, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-22 05:36:38', '2025-08-22 05:36:38'),
(135, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-22 16:01:24', '2025-08-22 16:01:24'),
(136, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-23 08:31:10', '2025-08-23 08:31:10'),
(137, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-23 12:04:31', '2025-08-23 12:04:31'),
(138, 0, 0, '', 'superadmin', '::1', 'Failed', '2025-08-24 05:56:30', '2025-08-24 05:56:30'),
(139, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-24 05:56:37', '2025-08-24 05:56:37'),
(140, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-27 05:20:39', '2025-08-27 05:20:39'),
(141, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-27 10:57:40', '2025-08-27 10:57:40'),
(142, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-28 16:19:08', '2025-08-28 16:19:08'),
(143, 5, 5, 'Fatwa Aulia', '362055401093', '::1', 'Success', '2025-08-28 16:52:11', '2025-08-28 16:52:11'),
(144, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-28 17:18:29', '2025-08-28 17:18:29'),
(145, 5, 5, 'Fatwa Aulia', '362055401093', '::1', 'Success', '2025-08-28 17:18:45', '2025-08-28 17:18:45'),
(146, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-28 17:47:20', '2025-08-28 17:47:20'),
(147, 5, 5, 'Fatwa Aulia', '362055401093', '::1', 'Success', '2025-08-28 17:48:05', '2025-08-28 17:48:05'),
(148, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-28 18:05:15', '2025-08-28 18:05:15'),
(149, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-28 18:30:28', '2025-08-28 18:30:28'),
(150, 5, 5, 'Fatwa Aulia', '362055401093', '::1', 'Success', '2025-08-28 18:30:41', '2025-08-28 18:30:41'),
(151, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-28 18:33:16', '2025-08-28 18:33:16'),
(152, 5, 5, 'Fatwa Aulia', '362055401093', '::1', 'Success', '2025-08-28 20:32:28', '2025-08-28 20:32:28'),
(153, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-28 20:43:18', '2025-08-28 20:43:18'),
(154, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-29 05:34:05', '2025-08-29 05:34:05'),
(155, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-29 07:11:49', '2025-08-29 07:11:49'),
(156, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-29 07:15:19', '2025-08-29 07:15:19'),
(157, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-29 07:19:33', '2025-08-29 07:19:33'),
(158, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-29 13:11:31', '2025-08-29 13:11:31'),
(159, 3, 2, 'Keuangan', 'keuangan', '::1', 'Failed', '2025-08-29 13:41:47', '2025-08-29 13:41:47'),
(160, 3, 2, 'Keuangan', 'keuangan', '::1', 'Success', '2025-08-29 13:41:53', '2025-08-29 13:41:53'),
(161, 4, 3, 'Akademik', 'akademik', '::1', 'Success', '2025-08-29 14:07:47', '2025-08-29 14:07:47'),
(162, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-29 19:01:36', '2025-08-29 19:01:36'),
(163, 5, 5, 'Fatwa Aulia', '362055401093', '::1', 'Success', '2025-08-29 19:12:33', '2025-08-29 19:12:33'),
(164, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-29 20:12:26', '2025-08-29 20:12:26'),
(165, 3, 2, 'Keuangan', 'keuangan', '::1', 'Success', '2025-08-29 20:24:05', '2025-08-29 20:24:05'),
(166, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-29 20:35:14', '2025-08-29 20:35:14'),
(167, 5, 5, 'Fatwa Aulia', '362055401093', '::1', 'Success', '2025-08-29 21:07:43', '2025-08-29 21:07:43'),
(168, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-29 21:10:58', '2025-08-29 21:10:58'),
(169, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-30 05:26:07', '2025-08-30 05:26:07'),
(170, 3, 2, 'Keuangan', 'keuangan', '::1', 'Success', '2025-08-30 05:26:21', '2025-08-30 05:26:21'),
(171, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-30 06:33:42', '2025-08-30 06:33:42'),
(172, 0, 0, '', 'superadmin', '::1', 'Failed', '2025-08-30 16:36:01', '2025-08-30 16:36:01'),
(173, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-30 16:36:05', '2025-08-30 16:36:05'),
(174, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-08-31 05:49:02', '2025-08-31 05:49:02'),
(175, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-08-31 10:34:13', '2025-08-31 10:34:13'),
(176, 4, 3, 'Waka Akademik', 'wakaakademik', '::1', 'Success', '2025-08-31 10:56:12', '2025-08-31 10:56:12'),
(177, 10, 6, 'Staff Akademik', 'staffakademik', '::1', 'Success', '2025-08-31 17:01:28', '2025-08-31 17:01:28'),
(178, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-08-31 17:58:30', '2025-08-31 17:58:30'),
(179, 5, 5, 'Fatwa Aulia', '362055401093', '::1', 'Failed', '2025-08-31 20:41:09', '2025-08-31 20:41:09'),
(180, 5, 5, 'Fatwa Aulia', '362055401093', '::1', 'Success', '2025-08-31 20:41:26', '2025-08-31 20:41:26'),
(181, 5, 5, 'Fatwa Aulia', '362055401093', '::1', 'Failed', '2025-08-31 20:41:38', '2025-08-31 20:41:38'),
(182, 0, 0, '', '', '', 'Failed', '2025-08-31 20:45:05', '2025-08-31 20:45:05'),
(183, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-08-31 21:54:48', '2025-08-31 21:54:48'),
(184, 12, 4, 'Bambang', '12345', '::1', 'Success', '2025-08-31 22:51:51', '2025-08-31 22:51:51'),
(185, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-08-31 22:51:59', '2025-08-31 22:51:59'),
(186, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-09-01 07:07:28', '2025-09-01 07:07:28'),
(187, 12, 4, 'Bambang', '12345', '::1', 'Success', '2025-09-01 08:02:00', '2025-09-01 08:02:00'),
(188, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-09-01 08:09:39', '2025-09-01 08:09:39'),
(189, 3, 2, 'Keuangan', 'keuangan', '::1', 'Failed', '2025-09-01 08:48:21', '2025-09-01 08:48:21'),
(190, 3, 2, 'Keuangan', 'keuangan', '::1', 'Success', '2025-09-01 08:48:26', '2025-09-01 08:48:26'),
(191, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-09-01 08:48:47', '2025-09-01 08:48:47'),
(192, 4, 3, 'Waka Akademik', 'wakaakademik', '::1', 'Success', '2025-09-01 08:49:36', '2025-09-01 08:49:36'),
(193, 10, 6, 'Staf Akademik', 'stafakademik', '::1', 'Failed', '2025-09-01 08:51:40', '2025-09-01 08:51:40'),
(194, 10, 6, 'Staf Akademik', 'stafakademik', '::1', 'Success', '2025-09-01 08:52:42', '2025-09-01 08:52:42'),
(195, 13, 7, 'Pimpinan', 'pimpinan', '::1', 'Success', '2025-09-01 09:04:58', '2025-09-01 09:04:58'),
(196, 14, 8, 'Kaprodi', 'kaprodi', '::1', 'Failed', '2025-09-01 09:14:14', '2025-09-01 09:14:14'),
(197, 14, 8, 'Kaprodi', 'kaprodi', '::1', 'Success', '2025-09-01 09:14:38', '2025-09-01 09:14:38'),
(198, 15, 9, 'Waka Kemahasiswaan Dan Kerja Sama', 'wakakemahasiswaan', '::1', 'Success', '2025-09-01 09:23:44', '2025-09-01 09:23:44'),
(199, 16, 10, 'LPM', 'lpm', '::1', 'Success', '2025-09-01 09:28:39', '2025-09-01 09:28:39'),
(200, 15, 9, 'Waka Kemahasiswaan Dan Kerja Sama', 'wakakemahasiswaan', '::1', 'Success', '2025-09-01 09:29:25', '2025-09-01 09:29:25'),
(201, 16, 10, 'LPM', 'lpm', '::1', 'Success', '2025-09-01 09:31:59', '2025-09-01 09:31:59'),
(202, 17, 11, 'LPPM', 'lppm', '::1', 'Success', '2025-09-01 09:34:46', '2025-09-01 09:34:46'),
(203, 18, 12, 'Staf Administrasi', 'stafadministrasi', '::1', 'Success', '2025-09-01 09:42:02', '2025-09-01 09:42:02'),
(204, 19, 13, 'Pustakawan', 'pustakawan', '::1', 'Success', '2025-09-01 09:45:00', '2025-09-01 09:45:00'),
(205, 20, 14, 'Biro Alumni', 'biroalumni', '::1', 'Success', '2025-09-01 09:47:03', '2025-09-01 09:47:03'),
(206, 21, 15, 'UPT PLP', 'uptplp', '::1', 'Success', '2025-09-01 09:49:25', '2025-09-01 09:49:25'),
(207, 22, 16, 'Tendik', 'tendik', '::1', 'Success', '2025-09-01 09:51:18', '2025-09-01 09:51:18'),
(208, 10, 6, 'Staf Akademik', 'stafakademik', '::1', 'Success', '2025-09-01 10:02:03', '2025-09-01 10:02:03'),
(209, 10, 6, 'Staf Akademik', 'stafakademik', '::1', 'Success', '2025-09-01 10:02:19', '2025-09-01 10:02:19'),
(210, 14, 8, 'Kaprodi', 'kaprodi', '::1', 'Success', '2025-09-01 10:03:04', '2025-09-01 10:03:04'),
(211, 4, 3, 'Waka Akademik', 'wakaakademik', '::1', 'Success', '2025-09-01 10:03:50', '2025-09-01 10:03:50'),
(212, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-09-01 10:11:44', '2025-09-01 10:11:44'),
(213, 24, 4, 'Mulyadi', '1234', '::1', 'Success', '2025-09-01 10:31:14', '2025-09-01 10:31:14'),
(214, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-01 10:53:44', '2025-09-01 10:53:44'),
(215, 4, 3, 'Waka Akademik', 'wakaakademik', '103.179.182.177', 'Success', '2025-09-01 11:07:43', '2025-09-01 11:07:43'),
(216, 3, 2, 'Keuangan', 'keuangan', '103.179.182.177', 'Success', '2025-09-01 11:07:55', '2025-09-01 11:07:55'),
(217, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-01 11:15:06', '2025-09-01 11:15:06'),
(218, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-01 11:21:16', '2025-09-01 11:21:16'),
(219, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5e00:30a6::77c0:10a6', 'Success', '2025-09-01 12:00:52', '2025-09-01 12:00:52'),
(220, 27, 4, 'Novi Suma Setyawati', '1111128501', '2404:c0:4c0b::533a:4669', 'Success', '2025-09-01 12:01:58', '2025-09-01 12:01:58'),
(221, 28, 4, 'Maulodha, M.Pd', '1129099003', '182.8.129.251', 'Success', '2025-09-01 12:02:12', '2025-09-01 12:02:12'),
(222, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-01 12:04:09', '2025-09-01 12:04:09'),
(223, 30, 4, 'fatwa', '123', '103.179.182.177', 'Success', '2025-09-01 12:06:02', '2025-09-01 12:06:02'),
(224, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c202:e9a8:c955:a603:a765:3394', 'Success', '2025-09-01 13:03:38', '2025-09-01 13:03:38'),
(225, 35, 4, 'YULIANA NURHAYATI, M.Pd.', '1109079302', '2404:c0:c202:e9a8:8480:6aa1:46b1:6ebf', 'Success', '2025-09-01 13:20:33', '2025-09-01 13:20:33'),
(226, 33, 4, 'Novi Nurdian', '1109119201', '2404:c0:c202:b0d7:7cc1:95a:b707:a3ff', 'Success', '2025-09-01 16:59:35', '2025-09-01 16:59:35'),
(227, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-01 20:35:36', '2025-09-01 20:35:36'),
(228, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-02 07:02:51', '2025-09-02 07:02:51'),
(229, 1, 1, 'Superadmin', 'superadmin', '2001:448a:5050:5a21:ec92:b6cc:cc5e:2471', 'Success', '2025-09-02 07:43:51', '2025-09-02 07:43:51'),
(230, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-02 12:45:34', '2025-09-02 12:45:34'),
(231, 36, 17, 'Admin Utama', 'adminutama', '103.179.182.177', 'Success', '2025-09-02 14:10:37', '2025-09-02 14:10:37'),
(232, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-02 14:10:54', '2025-09-02 14:10:54'),
(233, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a09:bac2:39cd:1d0f::2e5:2c', 'Success', '2025-09-02 14:17:37', '2025-09-02 14:17:37'),
(234, 1, 1, 'Superadmin', 'superadmin', '180.253.163.165', 'Success', '2025-09-02 16:26:24', '2025-09-02 16:26:24'),
(235, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-03 13:45:11', '2025-09-03 13:45:11'),
(236, 37, 16, 'Muhammad Juanda', '63710104108310004', '140.213.58.71', 'Success', '2025-09-03 14:05:46', '2025-09-03 14:05:46'),
(237, 1, 1, 'Superadmin', 'superadmin', '182.8.131.193', 'Success', '2025-09-03 20:06:31', '2025-09-03 20:06:31'),
(238, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-03 20:23:16', '2025-09-03 20:23:16'),
(239, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-04 07:40:52', '2025-09-04 07:40:52'),
(240, 1, 1, 'Superadmin', 'superadmin', '182.8.129.47', 'Success', '2025-09-04 11:42:25', '2025-09-04 11:42:25'),
(241, 0, 0, '', 'maulidha', '182.8.129.47', 'Failed', '2025-09-04 12:01:35', '2025-09-04 12:01:35'),
(242, 0, 0, '', '1129099009', '182.8.129.47', 'Failed', '2025-09-04 12:01:48', '2025-09-04 12:01:48'),
(243, 0, 0, '', 'maulidha', '182.8.129.47', 'Failed', '2025-09-04 12:02:12', '2025-09-04 12:02:12'),
(244, 0, 0, '', 'maulidha', '182.8.129.47', 'Failed', '2025-09-04 12:02:28', '2025-09-04 12:02:28'),
(245, 0, 0, '', 'maulidhastkip', '182.8.129.47', 'Failed', '2025-09-04 12:02:57', '2025-09-04 12:02:57'),
(246, 0, 0, '', 'maulidamaulidha', '182.8.129.47', 'Failed', '2025-09-04 12:03:11', '2025-09-04 12:03:11'),
(247, 0, 0, '', 'maulidhaismbjm', '182.8.129.47', 'Failed', '2025-09-04 12:03:57', '2025-09-04 12:03:57'),
(248, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:08:41', '2025-09-04 12:08:41'),
(249, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:08:48', '2025-09-04 12:08:48'),
(250, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-04 12:08:59', '2025-09-04 12:08:59'),
(251, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:09:04', '2025-09-04 12:09:04'),
(252, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:09:09', '2025-09-04 12:09:09'),
(253, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:09:22', '2025-09-04 12:09:22'),
(254, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:09:30', '2025-09-04 12:09:30'),
(255, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:09:36', '2025-09-04 12:09:36'),
(256, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:09:48', '2025-09-04 12:09:48'),
(257, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:09:51', '2025-09-04 12:09:51'),
(258, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:10:09', '2025-09-04 12:10:09'),
(259, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:13:25', '2025-09-04 12:13:25'),
(260, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:13:32', '2025-09-04 12:13:32'),
(261, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:13:46', '2025-09-04 12:13:46'),
(262, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:13:50', '2025-09-04 12:13:50'),
(263, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:14:01', '2025-09-04 12:14:01'),
(264, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:14:22', '2025-09-04 12:14:22'),
(265, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:14:37', '2025-09-04 12:14:37'),
(266, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:14:44', '2025-09-04 12:14:44'),
(267, 0, 0, '', 'maulidha@stkipism', '182.8.129.47', 'Failed', '2025-09-04 12:15:10', '2025-09-04 12:15:10'),
(268, 0, 0, '', 'maulidha@stkipism', '182.8.129.47', 'Failed', '2025-09-04 12:16:22', '2025-09-04 12:16:22'),
(269, 0, 0, '', 'maulidha@stkipism', '182.8.129.47', 'Failed', '2025-09-04 12:17:41', '2025-09-04 12:17:41'),
(270, 0, 0, '', 'maulidha@stkipism', '182.8.129.47', 'Failed', '2025-09-04 12:17:44', '2025-09-04 12:17:44'),
(271, 0, 0, '', 'maulidha', '182.8.129.47', 'Failed', '2025-09-04 12:18:44', '2025-09-04 12:18:44'),
(272, 0, 0, '', 'yuliananurhayati', '182.8.129.47', 'Failed', '2025-09-04 12:18:45', '2025-09-04 12:18:45'),
(273, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:19:19', '2025-09-04 12:19:19'),
(274, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:19:23', '2025-09-04 12:19:23'),
(275, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:19:37', '2025-09-04 12:19:37'),
(276, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-04 12:19:49', '2025-09-04 12:19:49'),
(277, 0, 0, '', 'yuliananurhayati', '182.8.129.47', 'Failed', '2025-09-04 12:20:17', '2025-09-04 12:20:17'),
(278, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Success', '2025-09-04 12:20:21', '2025-09-04 12:20:21'),
(279, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '182.8.129.47', 'Success', '2025-09-04 12:27:05', '2025-09-04 12:27:05'),
(280, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '103.179.182.177', 'Success', '2025-09-04 12:45:31', '2025-09-04 12:45:31'),
(281, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-04 12:47:53', '2025-09-04 12:47:53'),
(282, 0, 0, '', '113093', '182.8.129.47', 'Failed', '2025-09-04 12:58:49', '2025-09-04 12:58:49'),
(283, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '182.8.129.47', 'Success', '2025-09-04 12:59:11', '2025-09-04 12:59:11'),
(284, 33, 4, 'Novi Nurdian', '1109119201', '182.8.129.47', 'Success', '2025-09-04 13:06:33', '2025-09-04 13:06:33'),
(285, 28, 4, 'Maulidha, M.Pd', '1129099003', '103.179.182.177', 'Failed', '2025-09-04 13:07:28', '2025-09-04 13:07:28'),
(286, 28, 4, 'Maulidha, M.Pd', '1129099003', '103.179.182.177', 'Success', '2025-09-04 13:07:34', '2025-09-04 13:07:34'),
(287, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-04 13:16:48', '2025-09-04 13:16:48'),
(288, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '182.8.129.47', 'Success', '2025-09-04 13:38:50', '2025-09-04 13:38:50'),
(289, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-04 13:51:41', '2025-09-04 13:51:41'),
(290, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '103.179.182.177', 'Success', '2025-09-04 13:52:45', '2025-09-04 13:52:45'),
(291, 40, 4, 'Muhammad Agus Safrian Nur', '0158768669130093', '36.83.16.152', 'Success', '2025-09-04 13:58:19', '2025-09-04 13:58:19'),
(292, 40, 4, 'Muhammad Agus Safrian Nur', '0158768669130093', '36.83.16.152', 'Success', '2025-09-04 14:04:16', '2025-09-04 14:04:16'),
(293, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-04 14:08:35', '2025-09-04 14:08:35'),
(294, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-04 14:16:29', '2025-09-04 14:16:29'),
(295, 33, 4, 'Novi Nurdian', '1109119201', '182.8.129.47', 'Success', '2025-09-04 14:21:39', '2025-09-04 14:21:39'),
(296, 32, 4, 'Armin Fani', '1112098702', '114.10.143.47', 'Success', '2025-09-04 14:26:11', '2025-09-04 14:26:11'),
(297, 0, 0, '', '300324212011', '182.8.129.47', 'Failed', '2025-09-04 14:32:14', '2025-09-04 14:32:14'),
(298, 0, 0, '', 'halimachairia', '182.8.129.47', 'Failed', '2025-09-04 14:32:45', '2025-09-04 14:32:45'),
(299, 0, 0, '', 'zulparis1987', '114.10.142.143', 'Failed', '2025-09-04 14:36:04', '2025-09-04 14:36:04'),
(300, 0, 0, '', 'zulparis1987', '114.10.142.143', 'Failed', '2025-09-04 14:40:19', '2025-09-04 14:40:19'),
(301, 41, 16, 'Halima Chairia', '6371015011800013', '103.179.182.177', 'Success', '2025-09-04 14:41:38', '2025-09-04 14:41:38'),
(302, 0, 0, '', 'halimachairia', '182.8.129.47', 'Failed', '2025-09-04 14:43:38', '2025-09-04 14:43:38'),
(303, 0, 0, '', 'halimachairia', '182.8.129.47', 'Failed', '2025-09-04 14:44:05', '2025-09-04 14:44:05'),
(304, 0, 0, '', 'halimachairia', '182.8.129.47', 'Failed', '2025-09-04 14:44:28', '2025-09-04 14:44:28'),
(305, 0, 0, '', 'halimachairia', '182.8.129.47', 'Failed', '2025-09-04 14:45:59', '2025-09-04 14:45:59'),
(306, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.129.47', 'Success', '2025-09-04 14:49:59', '2025-09-04 14:49:59'),
(307, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.129.47', 'Success', '2025-09-04 14:53:52', '2025-09-04 14:53:52'),
(308, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-04 15:06:52', '2025-09-04 15:06:52'),
(309, 0, 0, '', 'tatiahatta27@gmail.com', '114.122.211.37', 'Failed', '2025-09-04 15:35:01', '2025-09-04 15:35:01'),
(310, 0, 0, '', 'tatiahatta27@gmail.com', '114.122.211.37', 'Failed', '2025-09-04 15:52:33', '2025-09-04 15:52:33'),
(311, 0, 0, '', 'tatiahatta27@gmail.com', '114.122.211.37', 'Failed', '2025-09-04 15:52:39', '2025-09-04 15:52:39'),
(312, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-04 16:54:03', '2025-09-04 16:54:03'),
(313, 42, 17, 'Admin 2', 'admin2', '103.179.182.177', 'Success', '2025-09-04 17:03:52', '2025-09-04 17:03:52'),
(314, 0, 0, '', 'tatia2711', '114.122.211.37', 'Failed', '2025-09-04 18:42:25', '2025-09-04 18:42:25'),
(315, 0, 0, '', 'tatia2711', '114.122.211.37', 'Failed', '2025-09-04 18:43:14', '2025-09-04 18:43:14'),
(316, 43, 4, 'Tati Akhbaryah, S.S., S.Pd., M.Pd.', '0', '114.122.211.37', 'Success', '2025-09-04 18:43:52', '2025-09-04 18:43:52'),
(317, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-05 06:46:33', '2025-09-05 06:46:33'),
(318, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '2404:c0:c202:b6e:b431:56e2:106:fa24', 'Success', '2025-09-06 11:07:02', '2025-09-06 11:07:02'),
(319, 1, 1, 'Superadmin', 'superadmin', '182.8.131.193', 'Success', '2025-09-06 14:03:30', '2025-09-06 14:03:30'),
(320, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-07 18:26:17', '2025-09-07 18:26:17'),
(321, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-08 09:31:38', '2025-09-08 09:31:38'),
(322, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-09 06:00:03', '2025-09-09 06:00:03'),
(323, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-09 07:18:26', '2025-09-09 07:18:26'),
(324, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-09 08:51:36', '2025-09-09 08:51:36'),
(325, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-09 12:40:49', '2025-09-09 12:40:49'),
(326, 0, 0, '', '6303074807850001', '2400:9800:bc1:d055:ffc5:8612:a6a9:8cd5', 'Failed', '2025-09-09 15:13:47', '2025-09-09 15:13:47'),
(327, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-09 18:53:16', '2025-09-09 18:53:16'),
(328, 0, 0, '', 'halimachairia', '2404:c0:c203:312d:caa4:88df:b29f:828d', 'Failed', '2025-09-09 20:13:17', '2025-09-09 20:13:17'),
(329, 41, 16, 'Halima Chairia', '6371015011800013', '2404:c0:c203:312d:caa4:88df:b29f:828d', 'Failed', '2025-09-09 20:14:11', '2025-09-09 20:14:11'),
(330, 41, 16, 'Halima Chairia', '6371015011800013', '2404:c0:c203:312d:caa4:88df:b29f:828d', 'Failed', '2025-09-09 20:14:22', '2025-09-09 20:14:22'),
(331, 41, 16, 'Halima Chairia', '6371015011800013', '2404:c0:c203:312d:caa4:88df:b29f:828d', 'Failed', '2025-09-09 20:15:16', '2025-09-09 20:15:16'),
(332, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-10 05:49:08', '2025-09-10 05:49:08'),
(333, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.129.47', 'Failed', '2025-09-10 09:37:30', '2025-09-10 09:37:30'),
(334, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.129.47', 'Failed', '2025-09-10 09:37:45', '2025-09-10 09:37:45'),
(335, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.129.47', 'Failed', '2025-09-10 09:38:02', '2025-09-10 09:38:02'),
(336, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-10 12:21:40', '2025-09-10 12:21:40'),
(337, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-11 09:31:39', '2025-09-11 09:31:39'),
(338, 0, 0, '', 'nazemi6879@gmail.com', '114.122.213.156', 'Failed', '2025-09-11 15:45:05', '2025-09-11 15:45:05'),
(339, 0, 0, '', 'abdulaziz', '39.194.3.187', 'Failed', '2025-09-11 16:04:35', '2025-09-11 16:04:35'),
(340, 33, 4, 'Novi Nurdian', '1109119201', '182.8.129.175', 'Success', '2025-09-11 16:27:49', '2025-09-11 16:27:49'),
(341, 0, 0, '', 'nurulfitriyani241979@gmail.com', '39.194.3.193', 'Failed', '2025-09-11 16:33:51', '2025-09-11 16:33:51'),
(342, 0, 0, '', 'nurulfitriyani241979@gmail.com', '39.194.3.193', 'Failed', '2025-09-11 16:34:00', '2025-09-11 16:34:00'),
(343, 0, 0, '', 'nurulfitriyani241979@gmail.com', '39.194.3.193', 'Failed', '2025-09-11 16:34:42', '2025-09-11 16:34:42'),
(344, 0, 0, '', 'nurulfitriyani241979@gmail.com', '39.194.3.193', 'Failed', '2025-09-11 16:35:38', '2025-09-11 16:35:38'),
(345, 0, 0, '', 'nurul', '39.194.3.193', 'Failed', '2025-09-11 16:36:12', '2025-09-11 16:36:12'),
(346, 0, 0, '', 'nurulfitriyani241979@gmail.com', '39.194.3.193', 'Failed', '2025-09-11 16:36:26', '2025-09-11 16:36:26'),
(347, 0, 0, '', 'nurulfitriyani241979@gmail.com', '114.79.44.243', 'Failed', '2025-09-11 16:37:56', '2025-09-11 16:37:56'),
(348, 0, 0, '', 'nurulfitriyani241979@gmail.com', '114.79.44.243', 'Failed', '2025-09-11 16:38:04', '2025-09-11 16:38:04'),
(349, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '114.79.44.243', 'Success', '2025-09-11 16:40:35', '2025-09-11 16:40:35'),
(350, 28, 4, 'Maulidha, M.Pd', '1129099003', '140.213.66.202', 'Success', '2025-09-11 16:45:08', '2025-09-11 16:45:08'),
(351, 0, 0, '', 'tatiahatta27@gmail.com', '114.122.213.5', 'Failed', '2025-09-11 16:50:51', '2025-09-11 16:50:51'),
(352, 0, 0, '', 'tatiahatta27@gmail.com', '114.122.213.5', 'Failed', '2025-09-11 16:51:04', '2025-09-11 16:51:04'),
(353, 0, 0, '', '081347693805', '114.122.213.5', 'Failed', '2025-09-11 16:51:26', '2025-09-11 16:51:26'),
(354, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5ea7:33f1::13a7:33f1', 'Success', '2025-09-11 16:52:45', '2025-09-11 16:52:45'),
(355, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-11 17:52:11', '2025-09-11 17:52:11'),
(356, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-11 18:07:26', '2025-09-11 18:07:26'),
(357, 27, 4, 'Novi Suma Setyawati', '1111128501', '114.122.211.244', 'Failed', '2025-09-11 18:24:02', '2025-09-11 18:24:02'),
(358, 27, 4, 'Novi Suma Setyawati', '1111128501', '114.122.211.244', 'Failed', '2025-09-11 18:24:34', '2025-09-11 18:24:34'),
(359, 27, 4, 'Novi Suma Setyawati', '1111128501', '114.122.211.244', 'Failed', '2025-09-11 18:26:11', '2025-09-11 18:26:11'),
(360, 27, 4, 'Novi Suma Setyawati', '1111128501', '114.122.211.244', 'Failed', '2025-09-11 18:27:52', '2025-09-11 18:27:52'),
(361, 27, 4, 'Novi Suma Setyawati', '1111128501', '114.122.211.244', 'Failed', '2025-09-11 18:28:14', '2025-09-11 18:28:14'),
(362, 0, 0, '', 'novisuma', '114.122.211.244', 'Failed', '2025-09-11 18:28:46', '2025-09-11 18:28:46'),
(363, 27, 4, 'Novi Suma Setyawati', '1111128501', '114.122.211.244', 'Failed', '2025-09-11 18:29:06', '2025-09-11 18:29:06'),
(364, 1, 1, 'Superadmin', 'superadmin', '2404:c0:c201:612b:d86b:441b:8c9f:7f44', 'Success', '2025-09-11 18:42:58', '2025-09-11 18:42:58'),
(365, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '140.213.10.10', 'Failed', '2025-09-11 18:51:43', '2025-09-11 18:51:43'),
(366, 27, 4, 'Novi Suma Setyawati', '1111128501', '114.122.211.244', 'Failed', '2025-09-11 18:51:48', '2025-09-11 18:51:48'),
(367, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '140.213.10.10', 'Failed', '2025-09-11 18:51:56', '2025-09-11 18:51:56'),
(368, 27, 4, 'Novi Suma Setyawati', '1111128501', '114.122.211.244', 'Success', '2025-09-11 18:52:05', '2025-09-11 18:52:05'),
(369, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '140.213.10.10', 'Failed', '2025-09-11 18:52:10', '2025-09-11 18:52:10'),
(370, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '140.213.10.10', 'Failed', '2025-09-11 18:52:13', '2025-09-11 18:52:13'),
(371, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '140.213.10.10', 'Failed', '2025-09-11 18:53:02', '2025-09-11 18:53:02'),
(372, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '140.213.10.10', 'Failed', '2025-09-11 18:53:11', '2025-09-11 18:53:11'),
(373, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '140.213.10.10', 'Failed', '2025-09-11 18:54:15', '2025-09-11 18:54:15'),
(374, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '140.213.10.10', 'Failed', '2025-09-11 18:54:23', '2025-09-11 18:54:23'),
(375, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5ef6:959d::56f6:959d', 'Failed', '2025-09-11 18:54:26', '2025-09-11 18:54:26'),
(376, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5ef6:959d::56f6:959d', 'Failed', '2025-09-11 18:54:31', '2025-09-11 18:54:31'),
(377, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5ef6:959d::56f6:959d', 'Failed', '2025-09-11 18:54:34', '2025-09-11 18:54:34'),
(378, 41, 16, 'Halima Chairia', '6371015011800013', '2404:c0:c203:312d:edc8:1829:bb09:b9a9', 'Failed', '2025-09-11 18:54:43', '2025-09-11 18:54:43'),
(379, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '140.213.10.10', 'Failed', '2025-09-11 18:54:56', '2025-09-11 18:54:56'),
(380, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '140.213.10.10', 'Failed', '2025-09-11 18:55:08', '2025-09-11 18:55:08'),
(381, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5ee7:6a40::67:6a40', 'Failed', '2025-09-11 18:55:12', '2025-09-11 18:55:12'),
(382, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5ee7:6a40::67:6a40', 'Failed', '2025-09-11 18:55:17', '2025-09-11 18:55:17'),
(383, 0, 0, '', 'agus@stkipismbjm.ac.id', '103.129.151.70', 'Failed', '2025-09-11 18:58:27', '2025-09-11 18:58:27'),
(384, 0, 0, '', 'agus@stkipismbjm.ac.id', '103.129.151.70', 'Failed', '2025-09-11 18:58:40', '2025-09-11 18:58:40'),
(385, 0, 0, '', 'agus@stkipismbjm.ac.id', '103.129.151.70', 'Failed', '2025-09-11 18:58:57', '2025-09-11 18:58:57'),
(386, 0, 0, '', 'agus', '103.129.151.70', 'Failed', '2025-09-11 18:59:07', '2025-09-11 18:59:07'),
(387, 0, 0, '', 'agus', '103.129.151.70', 'Failed', '2025-09-11 18:59:13', '2025-09-11 18:59:13'),
(388, 0, 0, '', 'agus@stkipismbjm.ac.id', '103.129.151.70', 'Failed', '2025-09-11 18:59:23', '2025-09-11 18:59:23'),
(389, 0, 0, '', 'tatiahatta27@gmail.com', '2404:c0:c201:16ba:f17e:b590:bac6:f72e', 'Failed', '2025-09-11 19:01:19', '2025-09-11 19:01:19'),
(390, 0, 0, '', '081347693805', '2404:c0:c201:16ba:f17e:b590:bac6:f72e', 'Failed', '2025-09-11 19:01:37', '2025-09-11 19:01:37'),
(391, 0, 0, '', '081347693805', '2404:c0:c201:16ba:f17e:b590:bac6:f72e', 'Failed', '2025-09-11 19:02:53', '2025-09-11 19:02:53'),
(392, 0, 0, '', 'tatiahatta27@gmail.com', '2404:c0:c201:16ba:f17e:b590:bac6:f72e', 'Failed', '2025-09-11 19:03:19', '2025-09-11 19:03:19'),
(393, 0, 0, '', 'tatiahatta27@gmail.com', '2404:c0:c201:16ba:f17e:b590:bac6:f72e', 'Failed', '2025-09-11 19:03:29', '2025-09-11 19:03:29'),
(394, 41, 16, 'Halima Chairia', '6371015011800013', '103.179.182.177', 'Success', '2025-09-11 19:06:16', '2025-09-11 19:06:16'),
(395, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:06:45', '2025-09-11 19:06:45'),
(396, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:06:54', '2025-09-11 19:06:54'),
(397, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:07:15', '2025-09-11 19:07:15'),
(398, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:07:24', '2025-09-11 19:07:24'),
(399, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-11 19:08:53', '2025-09-11 19:08:53'),
(400, 42, 17, 'Admin 2', 'admin2', '103.179.182.177', 'Success', '2025-09-11 19:09:49', '2025-09-11 19:09:49'),
(401, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-11 19:14:08', '2025-09-11 19:14:08'),
(402, 27, 4, 'Novi Suma Setyawati', '1111128501', '114.122.211.244', 'Success', '2025-09-11 19:17:40', '2025-09-11 19:17:40'),
(403, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:19:55', '2025-09-11 19:19:55'),
(404, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:20:11', '2025-09-11 19:20:11'),
(405, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:20:26', '2025-09-11 19:20:26'),
(406, 0, 0, '', 'wakilketuabidangkerjasamadankemahasiswaan', '2404:c0:c201:612b:6d1c:2d31:906b:b138', 'Failed', '2025-09-11 19:23:36', '2025-09-11 19:23:36'),
(407, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '2404:c0:c201:612b:6d1c:2d31:906b:b138', 'Success', '2025-09-11 19:23:57', '2025-09-11 19:23:57'),
(408, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:25:52', '2025-09-11 19:25:52'),
(409, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:26:00', '2025-09-11 19:26:00'),
(410, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:27:50', '2025-09-11 19:27:50'),
(411, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:28:27', '2025-09-11 19:28:27'),
(412, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Failed', '2025-09-11 19:31:04', '2025-09-11 19:31:04'),
(413, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '146.75.160.27', 'Failed', '2025-09-11 19:39:42', '2025-09-11 19:39:42'),
(414, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '146.75.160.27', 'Failed', '2025-09-11 19:39:51', '2025-09-11 19:39:51'),
(415, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5eb7:8583::3837:8583', 'Failed', '2025-09-11 19:41:07', '2025-09-11 19:41:07'),
(416, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5eee:12bb::f36e:12bb', 'Failed', '2025-09-11 19:42:01', '2025-09-11 19:42:01'),
(417, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5eee:12bb::f36e:12bb', 'Failed', '2025-09-11 19:42:09', '2025-09-11 19:42:09'),
(418, 37, 16, 'Muhammad Juanda', '63710104108310004', '2404:c0:c203:409e:d069:9f43:b97d:1552', 'Success', '2025-09-11 19:49:03', '2025-09-11 19:49:03'),
(419, 0, 0, '', 'norhayati@stkipism', '2404:c0:c203:7574:64ef:2a4a:41b9:a94d', 'Failed', '2025-09-11 19:57:50', '2025-09-11 19:57:50'),
(420, 0, 0, '', 'norhayati@stkipism', '2404:c0:c203:7574:64ef:2a4a:41b9:a94d', 'Failed', '2025-09-11 19:58:00', '2025-09-11 19:58:00'),
(421, 0, 0, '', 'norhayati@stkipismbjm.ac.id', '2404:c0:c203:7574:64ef:2a4a:41b9:a94d', 'Failed', '2025-09-11 20:04:52', '2025-09-11 20:04:52'),
(422, 1, 1, 'Superadmin', 'superadmin', '2404:c0:c201:612b:2a59:dcef:da1e:c43a', 'Success', '2025-09-11 20:20:37', '2025-09-11 20:20:37'),
(423, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5ea5:a71c::d5a5:a71c', 'Failed', '2025-09-11 20:23:20', '2025-09-11 20:23:20'),
(424, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '140.213.10.10', 'Failed', '2025-09-11 20:27:26', '2025-09-11 20:27:26'),
(425, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a09:bac3:399c:2723::3e6:79', 'Failed', '2025-09-11 22:00:09', '2025-09-11 22:00:09'),
(426, 1, 1, 'Superadmin', 'superadmin', '39.194.5.96', 'Success', '2025-09-12 05:08:47', '2025-09-12 05:08:47'),
(427, 0, 0, '', 'agus@stkipismbjm.ac.id', '140.213.183.90', 'Failed', '2025-09-12 09:40:23', '2025-09-12 09:40:23'),
(428, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.129.47', 'Failed', '2025-09-12 10:08:17', '2025-09-12 10:08:17'),
(429, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.129.47', 'Failed', '2025-09-12 10:08:36', '2025-09-12 10:08:36'),
(430, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5e8c:4c05::9a0c:4c05', 'Failed', '2025-09-12 10:20:46', '2025-09-12 10:20:46'),
(431, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5ebd:70c3::acbd:70c3', 'Failed', '2025-09-12 10:21:28', '2025-09-12 10:21:28'),
(432, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5ebd:70c3::acbd:70c3', 'Failed', '2025-09-12 10:21:30', '2025-09-12 10:21:30'),
(433, 1, 1, 'Superadmin', 'superadmin', '114.122.213.26', 'Success', '2025-09-12 11:59:51', '2025-09-12 11:59:51'),
(434, 0, 0, '', 'zulparis1@gmail.com', '114.10.143.47', 'Failed', '2025-09-12 12:01:58', '2025-09-12 12:01:58'),
(435, 29, 4, 'Zulparis', '1111078702', '114.10.143.47', 'Failed', '2025-09-12 12:02:43', '2025-09-12 12:02:43'),
(436, 29, 4, 'Zulparis', '1111078702', '114.10.143.47', 'Failed', '2025-09-12 12:02:49', '2025-09-12 12:02:49'),
(437, 46, 4, 'Abdul Aziz', '1110079002', '114.122.211.226', 'Success', '2025-09-12 12:05:02', '2025-09-12 12:05:02'),
(438, 1, 1, 'Superadmin', 'superadmin', '114.122.213.26', 'Success', '2025-09-12 12:20:26', '2025-09-12 12:20:26'),
(439, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '114.122.210.100', 'Success', '2025-09-12 12:23:06', '2025-09-12 12:23:06'),
(440, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-12 13:39:35', '2025-09-12 13:39:35'),
(441, 0, 0, '', '1111078602', '114.10.143.47', 'Failed', '2025-09-12 13:59:05', '2025-09-12 13:59:05'),
(442, 0, 0, '', 'zulparis1987', '114.10.143.47', 'Failed', '2025-09-12 13:59:28', '2025-09-12 13:59:28'),
(443, 48, 4, 'Norhayati K', '1234', '114.122.209.204', 'Success', '2025-09-12 14:22:23', '2025-09-12 14:22:23'),
(444, 0, 0, '', 'nazemi6879@gmail.com', '114.122.212.12', 'Failed', '2025-09-12 14:28:17', '2025-09-12 14:28:17'),
(445, 49, 16, 'Noor Ermiliyawati Nazemi', '6371044111040002', '114.122.212.12', 'Success', '2025-09-12 14:28:45', '2025-09-12 14:28:45'),
(446, 49, 16, 'Noor Ermiliyawati Nazemi', '6371044111040002', '114.122.212.12', 'Success', '2025-09-12 14:32:29', '2025-09-12 14:32:29'),
(447, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '114.10.142.210', 'Failed', '2025-09-12 14:39:31', '2025-09-12 14:39:31'),
(448, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '114.10.142.210', 'Failed', '2025-09-12 14:39:38', '2025-09-12 14:39:38'),
(449, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '114.10.142.210', 'Failed', '2025-09-12 14:39:46', '2025-09-12 14:39:46'),
(450, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5ed9:9460::df59:9460', 'Failed', '2025-09-12 14:39:50', '2025-09-12 14:39:50'),
(451, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '114.10.142.210', 'Success', '2025-09-12 14:41:15', '2025-09-12 14:41:15'),
(452, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '114.79.44.193', 'Failed', '2025-09-12 14:47:57', '2025-09-12 14:47:57'),
(453, 0, 0, '', 'nurulfitriyani241979@gmail.com', '114.79.44.193', 'Failed', '2025-09-12 14:48:29', '2025-09-12 14:48:29'),
(454, 0, 0, '', 'nurulfitriyani', '114.79.44.193', 'Failed', '2025-09-12 14:49:01', '2025-09-12 14:49:01'),
(455, 0, 0, '', 'nurulfitriyani', '114.79.44.193', 'Failed', '2025-09-12 14:49:07', '2025-09-12 14:49:07'),
(456, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '114.79.44.193', 'Failed', '2025-09-12 14:49:39', '2025-09-12 14:49:39'),
(457, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '114.79.44.193', 'Failed', '2025-09-12 14:49:44', '2025-09-12 14:49:44'),
(458, 0, 0, '', 'nurulfitriyani241979@gmail.com', '114.79.44.193', 'Failed', '2025-09-12 14:50:13', '2025-09-12 14:50:13'),
(459, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-12 16:32:44', '2025-09-12 16:32:44'),
(460, 41, 16, 'Halima Chairia', '6371015011800013', '103.179.182.177', 'Success', '2025-09-12 16:33:32', '2025-09-12 16:33:32'),
(461, 49, 16, 'Noor Ermiliyawati Nazemi', '6371044111040002', '114.122.212.12', 'Success', '2025-09-12 17:40:40', '2025-09-12 17:40:40'),
(462, 41, 16, 'Halima Chairia', '6371015011800013', '2404:c0:c203:312d:f91d:fbf:7f82:b5e3', 'Success', '2025-09-12 18:10:10', '2025-09-12 18:10:10'),
(463, 41, 16, 'Halima Chairia', '6371015011800013', '2404:c0:c203:312d:f91d:fbf:7f82:b5e3', 'Success', '2025-09-12 18:27:17', '2025-09-12 18:27:17'),
(464, 1, 1, 'Superadmin', 'superadmin', '103.179.182.177', 'Success', '2025-09-13 07:27:12', '2025-09-13 07:27:12'),
(465, 1, 1, 'Superadmin', 'superadmin', '36.75.56.114', 'Success', '2025-09-13 10:31:34', '2025-09-13 10:31:34'),
(466, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5e00:4e78::d590:2e78', 'Failed', '2025-09-13 19:57:58', '2025-09-13 19:57:58'),
(467, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '140.213.67.207', 'Failed', '2025-09-13 20:01:12', '2025-09-13 20:01:12'),
(468, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '140.213.67.207', 'Failed', '2025-09-13 20:01:23', '2025-09-13 20:01:23'),
(469, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '140.213.67.207', 'Failed', '2025-09-13 20:01:34', '2025-09-13 20:01:34'),
(470, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '140.213.67.207', 'Failed', '2025-09-13 20:01:43', '2025-09-13 20:01:43');
INSERT INTO `log_login` (`id`, `id_user`, `id_role`, `nama_user`, `username`, `ip_address`, `status`, `created_at`, `updated_at`) VALUES
(471, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '140.213.67.207', 'Success', '2025-09-13 20:01:56', '2025-09-13 20:01:56'),
(472, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5e00:44de::198:b4de', 'Failed', '2025-09-13 20:04:34', '2025-09-13 20:04:34'),
(473, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5e00:44de::198:b4de', 'Failed', '2025-09-13 20:04:55', '2025-09-13 20:04:55'),
(474, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a04:4e41:5e00:44de::198:b4de', 'Success', '2025-09-13 20:05:17', '2025-09-13 20:05:17'),
(475, 1, 1, 'Superadmin', 'superadmin', '39.194.5.96', 'Success', '2025-09-13 20:25:05', '2025-09-13 20:25:05'),
(476, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '2404:c0:c201:612b:bc7d:744e:fd7f:9d4f', 'Success', '2025-09-13 21:12:36', '2025-09-13 21:12:36'),
(477, 27, 4, 'Novi Suma Setyawati', '1111128501', '2404:c0:4c0b::5c21:c579', 'Success', '2025-09-13 21:41:33', '2025-09-13 21:41:33'),
(478, 0, 0, '', 'agus@stkipismbjm.ac.id', '103.129.151.70', 'Failed', '2025-09-14 04:58:13', '2025-09-14 04:58:13'),
(479, 46, 4, 'Abdul Aziz', '1110079002', '39.194.1.145', 'Failed', '2025-09-14 05:31:04', '2025-09-14 05:31:04'),
(480, 46, 4, 'Abdul Aziz', '1110079002', '39.194.1.145', 'Failed', '2025-09-14 05:31:24', '2025-09-14 05:31:24'),
(481, 46, 4, 'Abdul Aziz', '1110079002', '39.194.1.145', 'Failed', '2025-09-14 05:31:53', '2025-09-14 05:31:53'),
(482, 46, 4, 'Abdul Aziz', '1110079002', '39.194.1.145', 'Failed', '2025-09-14 05:32:14', '2025-09-14 05:32:14'),
(483, 0, 0, '', 'azis', '39.194.1.145', 'Failed', '2025-09-14 05:35:09', '2025-09-14 05:35:09'),
(484, 46, 4, 'Abdul Aziz', '1110079002', '39.194.1.145', 'Failed', '2025-09-14 05:35:28', '2025-09-14 05:35:28'),
(485, 0, 0, '', 'agus@stkipismbjm.ac.id', '103.129.151.70', 'Failed', '2025-09-14 05:49:35', '2025-09-14 05:49:35'),
(486, 37, 16, 'Muhammad Juanda', '63710104108310004', '39.194.5.146', 'Success', '2025-09-14 05:51:27', '2025-09-14 05:51:27'),
(487, 49, 16, 'Noor Ermiliyawati Nazemi', '6371044111040002', '114.122.208.211', 'Success', '2025-09-14 06:11:50', '2025-09-14 06:11:50'),
(488, 1, 1, 'Superadmin', 'superadmin', '39.194.5.96', 'Success', '2025-09-14 06:45:00', '2025-09-14 06:45:00'),
(489, 0, 0, '', 'tatiahatta27@gmail.com', '114.122.210.124', 'Failed', '2025-09-14 07:10:27', '2025-09-14 07:10:27'),
(490, 28, 4, 'Maulidha, M.Pd', '1129099003', '140.213.66.62', 'Failed', '2025-09-14 07:35:07', '2025-09-14 07:35:07'),
(491, 28, 4, 'Maulidha, M.Pd', '1129099003', '140.213.66.62', 'Failed', '2025-09-14 07:35:15', '2025-09-14 07:35:15'),
(492, 28, 4, 'Maulidha, M.Pd', '1129099003', '140.213.66.62', 'Failed', '2025-09-14 07:35:28', '2025-09-14 07:35:28'),
(493, 28, 4, 'Maulidha, M.Pd', '1129099003', '140.213.66.62', 'Failed', '2025-09-14 07:35:41', '2025-09-14 07:35:41'),
(494, 1, 1, 'Superadmin', 'superadmin', '39.194.5.96', 'Success', '2025-09-14 07:45:39', '2025-09-14 07:45:39'),
(495, 32, 4, 'arminfani@stkipismbjm.ac.id', '1112098702', '2404:c0:c203:f416:d65f:74e6:2181:dbc5', 'Failed', '2025-09-14 07:47:04', '2025-09-14 07:47:04'),
(496, 32, 4, 'arminfani@stkipismbjm.ac.id', '1112098702', '2404:c0:c203:f416:d65f:74e6:2181:dbc5', 'Failed', '2025-09-14 07:47:15', '2025-09-14 07:47:15'),
(497, 32, 4, 'arminfani@stkipismbjm.ac.id', '1112098702', '2404:c0:c203:f416:d65f:74e6:2181:dbc5', 'Failed', '2025-09-14 07:47:29', '2025-09-14 07:47:29'),
(498, 32, 4, 'arminfani@stkipismbjm.ac.id', '1112098702', '2404:c0:c203:f416:d65f:74e6:2181:dbc5', 'Success', '2025-09-14 07:47:57', '2025-09-14 07:47:57'),
(499, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '39.194.3.193', 'Failed', '2025-09-14 08:26:32', '2025-09-14 08:26:32'),
(500, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '39.194.3.193', 'Failed', '2025-09-14 08:26:38', '2025-09-14 08:26:38'),
(501, 0, 0, '', 'nurulfitriyani241979@gmail.com', '39.194.3.193', 'Failed', '2025-09-14 08:26:53', '2025-09-14 08:26:53'),
(502, 0, 0, '', 'nurul', '39.194.3.193', 'Failed', '2025-09-14 08:27:04', '2025-09-14 08:27:04'),
(503, 46, 4, 'Abdul Aziz', '1110079002', '114.122.213.87', 'Failed', '2025-09-14 10:06:01', '2025-09-14 10:06:01'),
(504, 46, 4, 'Abdul Aziz', '1110079002', '114.122.213.87', 'Failed', '2025-09-14 10:06:31', '2025-09-14 10:06:31'),
(505, 46, 4, 'Abdul Aziz', '1110079002', '114.122.213.87', 'Failed', '2025-09-14 10:06:38', '2025-09-14 10:06:38'),
(506, 46, 4, 'Abdul Aziz', '1110079002', '114.122.213.87', 'Failed', '2025-09-14 10:06:47', '2025-09-14 10:06:47'),
(507, 1, 1, 'Superadmin', 'superadmin', '39.194.5.96', 'Success', '2025-09-14 10:57:18', '2025-09-14 10:57:18'),
(508, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a02:26f7:dfcc:da94:0:5800:0:5', 'Success', '2025-09-14 14:11:30', '2025-09-14 14:11:30'),
(509, 1, 1, 'Superadmin', 'superadmin', '39.194.5.96', 'Success', '2025-09-14 14:33:45', '2025-09-14 14:33:45'),
(510, 1, 1, 'Superadmin', 'superadmin', '165.232.175.245', 'Success', '2025-09-14 20:52:35', '2025-09-14 20:52:35'),
(511, 1, 1, 'Superadmin', 'superadmin', '39.194.5.96', 'Success', '2025-09-14 21:32:16', '2025-09-14 21:32:16'),
(512, 27, 4, 'Novi Suma Setyawati', '1111128501', '114.122.198.29', 'Success', '2025-09-15 07:12:09', '2025-09-15 07:12:09'),
(513, 27, 4, 'Novi Suma Setyawati', '1111128501', '182.8.129.47', 'Success', '2025-09-15 07:14:39', '2025-09-15 07:14:39'),
(514, 49, 16, 'Noor Ermiliyawati Nazemi', '6371044111040002', '2404:c0:c202:aa37:9856:2432:403c:1648', 'Success', '2025-09-15 07:39:08', '2025-09-15 07:39:08'),
(515, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a02:26f7:dfcd:46c0::f', 'Success', '2025-09-15 07:41:37', '2025-09-15 07:41:37'),
(516, 46, 4, 'Abdul Aziz', '1110079002', '182.8.129.47', 'Failed', '2025-09-15 07:56:48', '2025-09-15 07:56:48'),
(517, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '2404:c0:c202:aa37:80ed:acce:32d6:b737', 'Success', '2025-09-15 07:56:57', '2025-09-15 07:56:57'),
(518, 28, 4, 'Maulidha, M.Pd', '1129099003', '140.213.133.64', 'Failed', '2025-09-15 08:02:22', '2025-09-15 08:02:22'),
(519, 28, 4, 'Maulidha, M.Pd', '1129099003', '140.213.133.64', 'Failed', '2025-09-15 08:02:26', '2025-09-15 08:02:26'),
(520, 28, 4, 'Maulidha, M.Pd', '1129099003', '140.213.133.64', 'Failed', '2025-09-15 08:02:30', '2025-09-15 08:02:30'),
(521, 28, 4, 'Maulidha, M.Pd', '1129099003', '140.213.133.64', 'Failed', '2025-09-15 08:02:40', '2025-09-15 08:02:40'),
(522, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.129.47', 'Success', '2025-09-15 08:25:12', '2025-09-15 08:25:12'),
(523, 1, 1, 'Superadmin', 'superadmin', '39.194.5.96', 'Success', '2025-09-15 08:42:11', '2025-09-15 08:42:11'),
(524, 46, 4, 'Abdul Aziz', '1110079002', '2404:c0:4c90::66e9:21e7', 'Failed', '2025-09-15 08:44:21', '2025-09-15 08:44:21'),
(525, 46, 4, 'Abdul Aziz', '1110079002', '2404:c0:4c90::66e9:21e7', 'Success', '2025-09-15 08:44:49', '2025-09-15 08:44:49'),
(526, 33, 4, 'Novi Nurdian', '1109119201', '2404:c0:c202:aa37:148e:8b89:5adf:8754', 'Failed', '2025-09-15 08:48:04', '2025-09-15 08:48:04'),
(527, 33, 4, 'Novi Nurdian', '1109119201', '2404:c0:c202:aa37:148e:8b89:5adf:8754', 'Failed', '2025-09-15 08:48:11', '2025-09-15 08:48:11'),
(528, 33, 4, 'Novi Nurdian', '1109119201', '2404:c0:c202:aa37:148e:8b89:5adf:8754', 'Failed', '2025-09-15 08:48:18', '2025-09-15 08:48:18'),
(529, 33, 4, 'Novi Nurdian', '1109119201', '2404:c0:c202:aa37:148e:8b89:5adf:8754', 'Failed', '2025-09-15 08:48:31', '2025-09-15 08:48:31'),
(530, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-15 08:48:32', '2025-09-15 08:48:32'),
(531, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-15 08:48:43', '2025-09-15 08:48:43'),
(532, 33, 4, 'Novi Nurdian', '1109119201', '2404:c0:c202:aa37:148e:8b89:5adf:8754', 'Failed', '2025-09-15 08:48:46', '2025-09-15 08:48:46'),
(533, 33, 4, 'Novi Nurdian', '1109119201', '2404:c0:c202:aa37:148e:8b89:5adf:8754', 'Failed', '2025-09-15 08:48:51', '2025-09-15 08:48:51'),
(534, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-15 08:50:47', '2025-09-15 08:50:47'),
(535, 1, 1, 'Superadmin', 'superadmin', '157.245.56.245', 'Success', '2025-09-15 08:56:16', '2025-09-15 08:56:16'),
(536, 28, 4, 'Maulidha, M.Pd', '1129099003', '157.245.56.245', 'Success', '2025-09-15 08:58:45', '2025-09-15 08:58:45'),
(537, 1, 1, 'Superadmin', 'superadmin', '157.245.56.245', 'Success', '2025-09-15 08:58:55', '2025-09-15 08:58:55'),
(538, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c202:aa37:a862:61b:180d:bf7', 'Failed', '2025-09-15 08:59:16', '2025-09-15 08:59:16'),
(539, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c202:aa37:a862:61b:180d:bf7', 'Failed', '2025-09-15 08:59:35', '2025-09-15 08:59:35'),
(540, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c202:aa37:a862:61b:180d:bf7', 'Success', '2025-09-15 08:59:47', '2025-09-15 08:59:47'),
(541, 48, 4, 'Norhayati K', '1234', '2404:c0:c202:aa37:15a2:c6ab:d80d:876b', 'Success', '2025-09-15 09:00:33', '2025-09-15 09:00:33'),
(542, 49, 16, 'Noor Ermiliyawati Nazemi', '6371044111040002', '2404:c0:c202:aa37:15db:d6c4:3f90:a309', 'Success', '2025-09-15 09:02:27', '2025-09-15 09:02:27'),
(543, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '2404:c0:c202:aa37:80ed:acce:32d6:b737', 'Success', '2025-09-15 09:02:39', '2025-09-15 09:02:39'),
(544, 46, 4, 'Abdul Aziz', '1110079002', '2404:c0:c202:aa37:10bf:36b8:1543:7418', 'Success', '2025-09-15 09:02:41', '2025-09-15 09:02:41'),
(545, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c202:aa37:d069:9f43:b97d:1552', 'Failed', '2025-09-15 09:03:31', '2025-09-15 09:03:31'),
(546, 33, 4, 'Novi Nurdian', '1109119201', '2404:c0:c202:aa37:148e:8b89:5adf:8754', 'Success', '2025-09-15 09:03:37', '2025-09-15 09:03:37'),
(547, 37, 16, 'Muhammad Juanda', '63710104108310004', '2404:c0:c202:aa37:d069:9f43:b97d:1552', 'Success', '2025-09-15 09:03:58', '2025-09-15 09:03:58'),
(548, 28, 4, 'Maulidha, M.Pd', '1129099003', '157.245.56.245', 'Success', '2025-09-15 09:04:15', '2025-09-15 09:04:15'),
(549, 1, 1, 'Superadmin', 'superadmin', '157.245.56.245', 'Success', '2025-09-15 09:05:06', '2025-09-15 09:05:06'),
(550, 40, 4, 'Muhammad Agus Safrian Nur', '0158768669130093', '140.213.183.69', 'Success', '2025-09-15 09:07:20', '2025-09-15 09:07:20'),
(551, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-15 09:11:15', '2025-09-15 09:11:15'),
(552, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-15 09:11:27', '2025-09-15 09:11:27'),
(553, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Failed', '2025-09-15 09:11:49', '2025-09-15 09:11:49'),
(554, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Success', '2025-09-15 09:13:48', '2025-09-15 09:13:48'),
(555, 29, 4, 'Zulparis', '1111078702', '182.8.129.47', 'Success', '2025-09-15 09:26:56', '2025-09-15 09:26:56'),
(556, 0, 0, '', 'dyandra1503', '2404:c0:c202:aa37:a45a:8e1d:8d5:39c5', 'Failed', '2025-09-15 09:46:44', '2025-09-15 09:46:44'),
(557, 0, 0, '', 'dyandra1503', '2404:c0:c202:aa37:a45a:8e1d:8d5:39c5', 'Failed', '2025-09-15 09:46:57', '2025-09-15 09:46:57'),
(558, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '2404:c0:c202:aa37:f0b0:c5cd:a397:2db8', 'Success', '2025-09-15 09:48:13', '2025-09-15 09:48:13'),
(559, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '182.8.129.47', 'Success', '2025-09-15 09:55:57', '2025-09-15 09:55:57'),
(560, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '182.8.129.47', 'Success', '2025-09-15 12:37:22', '2025-09-15 12:37:22'),
(561, 1, 1, 'Superadmin', 'superadmin', '139.162.51.138', 'Success', '2025-09-15 12:38:19', '2025-09-15 12:38:19'),
(562, 1, 1, 'Superadmin', 'superadmin', '182.8.129.47', 'Success', '2025-09-15 12:50:40', '2025-09-15 12:50:40'),
(563, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '182.8.129.47', 'Success', '2025-09-15 12:51:40', '2025-09-15 12:51:40'),
(564, 33, 4, 'Novi Nurdian', '1109119201', '182.8.129.47', 'Success', '2025-09-15 13:03:49', '2025-09-15 13:03:49'),
(565, 32, 4, 'arminfani@stkipismbjm.ac.id', '1112098702', '182.8.129.47', 'Success', '2025-09-15 13:10:31', '2025-09-15 13:10:31'),
(566, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '139.162.113.228', 'Success', '2025-09-15 13:23:34', '2025-09-15 13:23:34'),
(567, 1, 1, 'Superadmin', 'superadmin', '139.162.113.228', 'Success', '2025-09-15 13:24:03', '2025-09-15 13:24:03'),
(568, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '2404:c0:c202:aa37:d470:ff01:e6f8:80f2', 'Success', '2025-09-15 14:52:48', '2025-09-15 14:52:48'),
(569, 0, 0, '', 'dyandra1503', '2404:c0:c202:aa37:d577:f170:48d3:38f1', 'Failed', '2025-09-15 14:59:13', '2025-09-15 14:59:13'),
(570, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '2404:c0:c202:aa37:d577:f170:48d3:38f1', 'Failed', '2025-09-15 15:00:14', '2025-09-15 15:00:14'),
(571, 0, 0, '', 'noufysabilal@yahoo.co.id', '2404:c0:c202:aa37:d577:f170:48d3:38f1', 'Failed', '2025-09-15 15:00:32', '2025-09-15 15:00:32'),
(572, 0, 0, '', 'dyandra1503', '2404:c0:c202:aa37:d577:f170:48d3:38f1', 'Failed', '2025-09-15 15:00:50', '2025-09-15 15:00:50'),
(573, 0, 0, '', 'nurul', '2404:c0:c202:aa37:d577:f170:48d3:38f1', 'Failed', '2025-09-15 15:01:37', '2025-09-15 15:01:37'),
(574, 0, 0, '', 'dyandra1503', '2404:c0:c202:aa37:d577:f170:48d3:38f1', 'Failed', '2025-09-15 15:01:55', '2025-09-15 15:01:55'),
(575, 0, 0, '', 'dyandra1503', '182.8.129.47', 'Failed', '2025-09-15 15:06:51', '2025-09-15 15:06:51'),
(576, 0, 0, '', 'dyandra1503', '182.8.129.47', 'Failed', '2025-09-15 15:07:24', '2025-09-15 15:07:24'),
(577, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '2404:c0:c202:aa37:d577:f170:48d3:38f1', 'Failed', '2025-09-15 15:09:13', '2025-09-15 15:09:13'),
(578, 0, 0, '', 'dyandra1503', '2404:c0:c202:aa37:d577:f170:48d3:38f1', 'Failed', '2025-09-15 15:09:36', '2025-09-15 15:09:36'),
(579, 0, 0, '', 'dyandra1503', '182.8.129.47', 'Failed', '2025-09-15 15:15:31', '2025-09-15 15:15:31'),
(580, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '182.8.129.47', 'Failed', '2025-09-15 15:15:59', '2025-09-15 15:15:59'),
(581, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '2404:c0:c202:aa37:d577:f170:48d3:38f1', 'Success', '2025-09-15 15:16:11', '2025-09-15 15:16:11'),
(582, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '114.122.208.71', 'Success', '2025-09-15 16:21:21', '2025-09-15 16:21:21'),
(583, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '2404:c0:c201:3358:d470:ff01:e6f8:80f2', 'Success', '2025-09-15 20:31:30', '2025-09-15 20:31:30'),
(584, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '39.194.1.199', 'Success', '2025-09-15 22:04:42', '2025-09-15 22:04:42'),
(585, 33, 4, 'Novi Nurdian', '1109119201', '182.8.129.47', 'Success', '2025-09-16 08:04:50', '2025-09-16 08:04:50'),
(586, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '2404:c0:c202:aa37:9929:288e:8d15:25a1', 'Success', '2025-09-16 08:39:18', '2025-09-16 08:39:18'),
(587, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.129.47', 'Success', '2025-09-16 08:56:43', '2025-09-16 08:56:43'),
(588, 1, 1, 'Superadmin', 'superadmin', '182.8.129.47', 'Success', '2025-09-16 09:13:57', '2025-09-16 09:13:57'),
(589, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.129.47', 'Success', '2025-09-16 09:19:08', '2025-09-16 09:19:08'),
(590, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '2404:c0:c202:aa37:f4ba:f318:55b2:db83', 'Success', '2025-09-16 09:33:08', '2025-09-16 09:33:08'),
(591, 32, 4, 'arminfani@stkipismbjm.ac.id', '1112098702', '114.10.142.184', 'Success', '2025-09-16 09:43:04', '2025-09-16 09:43:04'),
(592, 46, 4, 'Abdul Aziz', '1110079002', '2404:c0:4c90::67b0:94a2', 'Success', '2025-09-16 09:46:03', '2025-09-16 09:46:03'),
(593, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '182.8.129.47', 'Success', '2025-09-16 09:48:40', '2025-09-16 09:48:40'),
(594, 32, 4, 'Armin Fani', '1112098702', '114.10.142.184', 'Success', '2025-09-16 09:54:28', '2025-09-16 09:54:28'),
(595, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '182.8.129.47', 'Success', '2025-09-16 10:05:33', '2025-09-16 10:05:33'),
(596, 32, 4, 'Armin Fani', '1112098702', '114.10.142.184', 'Success', '2025-09-16 10:05:46', '2025-09-16 10:05:46'),
(597, 40, 4, 'Muhammad Agus Safrian Nur', '0158768669130093', '140.213.66.194', 'Success', '2025-09-16 10:06:33', '2025-09-16 10:06:33'),
(598, 32, 4, 'Armin Fani', '1112098702', '114.10.142.184', 'Success', '2025-09-16 10:10:22', '2025-09-16 10:10:22'),
(599, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '182.8.129.47', 'Success', '2025-09-16 10:12:58', '2025-09-16 10:12:58'),
(600, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c202:aa37:e408:90a6:8f7e:769c', 'Success', '2025-09-16 10:43:27', '2025-09-16 10:43:27'),
(601, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '2404:c0:c202:aa37:603d:aa3d:ea82:c500', 'Failed', '2025-09-16 11:14:42', '2025-09-16 11:14:42'),
(602, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '2404:c0:c202:aa37:603d:aa3d:ea82:c500', 'Success', '2025-09-16 11:14:59', '2025-09-16 11:14:59'),
(603, 0, 0, '', 'juandapustaka@gmail.com', '2404:c0:c202:aa37:d069:9f43:b97d:1552', 'Failed', '2025-09-16 11:18:28', '2025-09-16 11:18:28'),
(604, 37, 16, 'Muhammad Juanda', '63710104108310004', '2404:c0:c202:aa37:d069:9f43:b97d:1552', 'Success', '2025-09-16 11:18:43', '2025-09-16 11:18:43'),
(605, 27, 4, 'Novi Suma Setyawati', '1111128501', '182.8.129.47', 'Success', '2025-09-16 11:20:16', '2025-09-16 11:20:16'),
(606, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '2404:c0:c202:aa37:bdc0:8b38:1549:dc4b', 'Success', '2025-09-16 11:40:13', '2025-09-16 11:40:13'),
(607, 27, 4, 'Novi Suma Setyawati', '1111128501', '182.8.129.47', 'Success', '2025-09-16 11:49:33', '2025-09-16 11:49:33'),
(608, 0, 0, '', 'tatiahatta27@gmail.com', '2404:c0:4ca0::3a90:c4c8', 'Failed', '2025-09-16 12:23:20', '2025-09-16 12:23:20'),
(609, 0, 0, '', 'tatiahatta27@gmail.com', '103.167.13.111', 'Failed', '2025-09-16 12:35:53', '2025-09-16 12:35:53'),
(610, 29, 4, 'Zulparis', '1111078702', '2404:c0:c202:aa37:c901:9707:374b:11e', 'Success', '2025-09-16 13:39:32', '2025-09-16 13:39:32'),
(611, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '114.79.44.140', 'Failed', '2025-09-16 13:46:31', '2025-09-16 13:46:31'),
(612, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '114.79.44.140', 'Success', '2025-09-16 13:46:45', '2025-09-16 13:46:45'),
(613, 1, 1, 'Superadmin', 'superadmin', '182.8.131.22', 'Success', '2025-09-16 16:52:55', '2025-09-16 16:52:55'),
(614, 1, 1, 'Superadmin', 'superadmin', '114.122.209.116', 'Success', '2025-09-16 18:43:33', '2025-09-16 18:43:33'),
(615, 27, 4, 'Novi Suma Setyawati', '1111128501', '2404:c0:4c0b::595f:927d', 'Success', '2025-09-16 18:47:30', '2025-09-16 18:47:30'),
(616, 37, 16, 'Muhammad Juanda', '63710104108310004', '114.122.209.253', 'Success', '2025-09-16 18:49:39', '2025-09-16 18:49:39'),
(617, 41, 16, 'Halima Chairia', '6371015011800013', '39.194.5.104', 'Success', '2025-09-16 19:06:42', '2025-09-16 19:06:42'),
(618, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '114.122.209.195', 'Success', '2025-09-16 19:07:58', '2025-09-16 19:07:58'),
(619, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '2404:c0:c201:3358:f578:d5a8:54c5:e8f0', 'Success', '2025-09-16 19:23:15', '2025-09-16 19:23:15'),
(620, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '114.79.44.140', 'Success', '2025-09-16 19:24:23', '2025-09-16 19:24:23'),
(621, 48, 4, 'Norhayati K', '1234', '182.8.161.17', 'Success', '2025-09-16 19:48:49', '2025-09-16 19:48:49'),
(622, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '114.122.208.207', 'Success', '2025-09-16 21:31:16', '2025-09-16 21:31:16'),
(623, 1, 1, 'Superadmin', 'superadmin', '182.8.130.11', 'Success', '2025-09-16 22:09:26', '2025-09-16 22:09:26'),
(624, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '140.213.204.117', 'Success', '2025-09-16 22:36:03', '2025-09-16 22:36:03'),
(625, 1, 1, 'Superadmin', 'superadmin', '139.162.113.228', 'Success', '2025-09-17 04:55:19', '2025-09-17 04:55:19'),
(626, 28, 4, 'Maulidha, M.Pd', '1129099003', '::1', 'Success', '2025-09-17 05:56:50', '2025-09-17 05:56:50'),
(627, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '::1', 'Success', '2025-09-17 06:37:08', '2025-09-17 06:37:08'),
(628, 28, 4, 'Maulidha, M.Pd', '1129099003', '::1', 'Success', '2025-09-17 07:21:12', '2025-09-17 07:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_praktik_lapangan`
--

CREATE TABLE `mahasiswa_praktik_lapangan` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa_praktik_lapangan`
--

INSERT INTO `mahasiswa_praktik_lapangan` (`id`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(6, '2024/2025 ganjil', 'https://mail.google.com/mail/u/0/?usp=installed_webapp', '', '2025-09-07 08:57:28', '2025-09-07 08:57:28', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_dana`
--

CREATE TABLE `master_dana` (
  `id` smallint NOT NULL,
  `jenis` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_kategori_dana` bigint NOT NULL,
  `nama_kategori_dana` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_dana`
--

INSERT INTO `master_dana` (`id`, `jenis`, `id_kategori_dana`, `nama_kategori_dana`, `nama`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Masuk', 1, 'Mahasiswa', 'SPP', '2025-08-30 06:00:48', '2025-08-30 05:47:42', 0, 0),
(2, 'Masuk', 1, 'Mahasiswa', 'Sumbangan Lainnya', '2025-08-30 06:00:55', '2025-08-30 05:49:01', 0, 0),
(3, 'Masuk', 1, 'Mahasiswa', 'Lain-lain', '2025-08-30 06:01:02', '2025-08-30 05:49:17', 0, 0),
(4, 'Masuk', 2, 'Kementerian/ Yayasan', 'Anggaran Rutin', '2025-08-30 06:01:38', '2025-08-30 05:49:33', 0, 0),
(5, 'Masuk', 2, 'Kementerian/ Yayasan', 'Anggaran Pembangunan', '2025-08-30 06:01:43', '2025-08-30 05:49:46', 0, 0),
(6, 'Masuk', 2, 'Kementerian/ Yayasan', 'Hibah Penelitian', '2025-08-30 06:01:47', '2025-08-30 05:50:03', 0, 0),
(7, 'Masuk', 2, 'Kementerian/ Yayasan', 'Hibah PKM', '2025-08-30 06:01:52', '2025-08-30 05:50:20', 0, 0),
(8, 'Masuk', 2, 'Kementerian/ Yayasan', 'Lain-lain', '2025-08-30 06:01:57', '2025-08-30 05:50:36', 0, 0),
(9, 'Masuk', 3, 'PT Sendiri', 'Jasa Layanan Profesi dan Keahl', '2025-08-30 06:02:01', '2025-08-30 05:51:13', 0, 0),
(10, 'Masuk', 3, 'PT Sendiri', 'Produk Institusi', '2025-08-30 06:02:05', '2025-08-30 05:51:26', 0, 0),
(11, 'Masuk', 3, 'PT Sendiri', 'Kerjasama Kelembagaan (Pemerin', '2025-08-30 06:02:08', '2025-08-30 05:51:38', 0, 0),
(12, 'Masuk', 3, 'PT Sendiri', 'Lain-lain', '2025-08-30 06:02:17', '2025-08-30 05:51:55', 0, 0),
(13, 'Masuk', 4, 'Sumber Lain (Dalam dan Luar Negeri)', 'Hibah', '2025-08-30 06:02:13', '2025-08-30 05:52:07', 0, 0),
(14, 'Masuk', 4, 'Sumber Lain (Dalam dan Luar Negeri)', 'Dana Lestari dan Filantropis', '2025-08-30 06:02:20', '2025-08-30 05:52:24', 0, 0),
(15, 'Masuk', 4, 'Sumber Lain (Dalam dan Luar Negeri)', 'Lain-lain', '2025-08-30 06:02:25', '2025-08-30 05:52:44', 0, 0),
(16, 'Masuk', 5, 'Dana Penelitian dan PKM', 'Dana Penelitian', '2025-08-30 06:02:30', '2025-08-30 05:52:58', 0, 0),
(17, 'Masuk', 5, 'Dana Penelitian dan PKM', 'Dana PKM', '2025-08-30 06:02:34', '2025-08-30 05:53:10', 0, 0),
(18, 'Keluar', 11, 'Grup 1', 'Dana Operasional Proses Pembelajaran', '2025-08-30 06:02:38', '2025-08-30 05:56:47', 0, 0),
(19, 'Keluar', 11, 'Grup 1', 'Dana Penelitian', '2025-08-30 06:05:29', '2025-08-30 06:05:29', 3, 0),
(20, 'Keluar', 11, 'Grup 1', 'Dana Pengabdian Kepada Masyarakat', '2025-08-30 06:05:56', '2025-08-30 06:05:56', 3, 0),
(21, 'Keluar', 11, 'Grup 1', 'Investasi Prasarana', '2025-08-30 06:06:05', '2025-08-30 06:06:05', 3, 0),
(22, 'Keluar', 11, 'Grup 1', 'Investasi Sarana', '2025-08-30 06:06:17', '2025-08-30 06:06:17', 3, 0),
(23, 'Keluar', 11, 'Grup 1', 'Investasi SDM', '2025-08-30 06:06:26', '2025-08-30 06:06:26', 3, 0),
(24, 'Keluar', 11, 'Grup 1', 'Lain-lain', '2025-08-30 06:06:37', '2025-08-30 06:06:37', 3, 0),
(25, 'Keluar', 12, 'Grup 2', 'Dana Penelitian', '2025-08-30 06:06:37', '2025-08-30 06:06:37', 3, 0),
(26, 'Keluar', 12, 'Grup 2', 'Dana PKM', '2025-08-30 06:06:37', '2025-08-30 06:06:37', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_mahasiswa`
--

CREATE TABLE `pembayaran_mahasiswa` (
  `id` bigint NOT NULL,
  `id_tagihan_mahasiswa` bigint NOT NULL,
  `jenis_tagihan_mahasiswa` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `id_tahun_akademik` bigint NOT NULL,
  `tahun_akademik` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe_tahun_akademik` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `id_mahasiswa` bigint NOT NULL,
  `nama_mahasiswa` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_identitas_mahasiswa` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `id_program_studi` bigint NOT NULL,
  `jenjang_program_studi` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `singkatan_program_studi` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tahap` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `jumlah_bayar` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_by` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran_mahasiswa`
--

INSERT INTO `pembayaran_mahasiswa` (`id`, `id_tagihan_mahasiswa`, `jenis_tagihan_mahasiswa`, `id_tahun_akademik`, `tahun_akademik`, `tipe_tahun_akademik`, `id_mahasiswa`, `nama_mahasiswa`, `nomor_identitas_mahasiswa`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `tahap`, `tanggal_bayar`, `jumlah_bayar`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(8, 12, 'SPP', 18, '2025/2026', 'Ganjil', 40, 'Mamad', '1234567890', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '1', '2025-09-06', 200000, '2025-09-08 12:31:16', '2025-09-08 12:31:16', '1', ''),
(9, 12, 'SPP', 18, '2025/2026', 'Ganjil', 40, 'Mamad', '1234567890', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2', '2025-09-08', 300000, '2025-09-08 12:35:21', '2025-09-08 12:35:21', '1', ''),
(10, 13, 'LDKM', 18, '2025/2026', 'Ganjil', 40, 'Mamad', '1234567890', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '1', '2025-09-08', 200000, '2025-09-08 12:59:54', '2025-09-08 12:59:54', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `pencatatan_surat`
--

CREATE TABLE `pencatatan_surat` (
  `id` bigint NOT NULL,
  `jenis` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_surat` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `perihal` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `pencatatan_surat` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pencatatan_surat`
--

INSERT INTO `pencatatan_surat` (`id`, `jenis`, `nomor_surat`, `perihal`, `tautan`, `pencatatan_surat`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'MASUK', 'SK/MP2025/00123', 'Surat Kunjungan Presiden', 'https://mail.google.com/mail/u/0/?usp=installed_webapp', '', '2025-09-04 10:34:03', '2025-09-04 10:34:03', 33, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pengajaran`
--

CREATE TABLE `pengajaran` (
  `id` bigint NOT NULL,
  `kode` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_mata_kuliah` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `sks` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `hari` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `ruangan` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_program_studi` bigint NOT NULL,
  `jenjang_program_studi` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `singkatan_program_studi` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_akademik` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `dosen_pengampu` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengajaran`
--

INSERT INTO `pengajaran` (`id`, `kode`, `nama_mata_kuliah`, `sks`, `hari`, `jam_mulai`, `jam_selesai`, `ruangan`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `tahun_akademik`, `dosen_pengampu`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(6, 'KI24104', 'Introduction to Writing', '4-2', 'Senin', '08:30:00', '10:10:00', 'PB1', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '2024/2025', 'Armin Fani', '2025-09-14 16:43:05', '2025-09-14 16:53:44', 32, 32),
(8, 'KD24101', 'BAHASA INDONESIA', '2', 'Selasa', '08:30:00', '10:00:00', 'A', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2025-2026', 'Novi Nurdian', '2025-09-16 10:31:54', '2025-09-16 10:31:54', 33, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pengembangan_kompetensi`
--

CREATE TABLE `pengembangan_kompetensi` (
  `id` bigint NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengembangan_kompetensi`
--

INSERT INTO `pengembangan_kompetensi` (`id`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'iawiai', 'https://www.researchgate.net/profile/Aceng-Wahid/publication/346397070_Analisis_Metode_Waterfall_Untuk_Pengembangan_Sistem_Informasi/links/5fbfa91092851c933f5d76b6/Analisis-Metode-Waterfall-Untuk-Pengembangan-Sistem-Informasi.pdf', '', '2025-09-03 14:17:57', '2025-09-03 14:17:57', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `penyusutan_inventaris`
--

CREATE TABLE `penyusutan_inventaris` (
  `id` bigint NOT NULL,
  `id_kategori` bigint NOT NULL,
  `nama_kategori` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_barang` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `unit` int NOT NULL,
  `tahun_perolehan` year NOT NULL,
  `umur_ekonomis` int NOT NULL,
  `harga_perolehan` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyusutan_inventaris`
--

INSERT INTO `penyusutan_inventaris` (`id`, `id_kategori`, `nama_kategori`, `nama_barang`, `unit`, `tahun_perolehan`, `umur_ekonomis`, `harga_perolehan`, `created_at`, `updated_at`) VALUES
(1, 2, 'Bangunan', 'Bangunan STIKIP', 1, '2011', 30, 7700000000, '2025-08-27 06:16:31', '2025-08-27 07:53:19'),
(3, 1, 'Tanah', 'Sertifikat HGB No.10 L=1.580 m²', 1, '2008', 0, 309680000, '2025-08-27 07:37:57', '2025-08-27 07:54:31'),
(4, 1, 'Tanah', 'Sertifikat HGB No.11 L= 4.244 m²', 1, '2008', 0, 831824000, '2025-08-27 07:39:16', '2025-08-27 07:54:41'),
(5, 2, 'Bangunan', 'Rumah Di Malkontemon', 1, '2012', 30, 518100000, '2025-08-27 07:55:38', '2025-08-27 07:55:38'),
(6, 2, 'Bangunan', 'Pagar Malkontemon II', 1, '2012', 10, 210000000, '2025-08-27 07:56:08', '2025-08-27 07:56:08'),
(7, 2, 'Bangunan', 'Paving Blok dan Taman Halaman', 1, '2013', 10, 200000000, '2025-08-27 07:56:53', '2025-08-27 07:56:53'),
(8, 2, 'Bangunan', 'Pigura STKIP Islam SM', 1, '2017', 10, 26040000, '2025-08-27 07:57:16', '2025-08-27 07:57:16'),
(9, 3, 'Inventaris Kantor', 'Komputer', 1, '2011', 4, 4495000, '2025-08-27 07:58:47', '2025-08-27 07:58:47'),
(10, 3, 'Inventaris Kantor', 'UPS ICA', 1, '2011', 4, 450000, '2025-08-27 07:59:31', '2025-08-27 07:59:31'),
(11, 3, 'Inventaris Kantor', 'Meja Kerja Besar', 1, '2011', 5, 450000, '2025-08-27 08:26:36', '2025-08-27 08:26:36'),
(12, 3, 'Inventaris Kantor', 'Meja Kerja Kecil', 1, '2011', 5, 300000, '2025-08-27 08:26:58', '2025-08-27 08:26:58'),
(13, 3, 'Inventaris Kantor', 'Kursi Lipat', 2, '2011', 4, 400000, '2025-08-27 08:27:34', '2025-08-27 08:27:34'),
(14, 3, 'Inventaris Kantor', 'Kursi Putar Besar', 1, '2011', 5, 450000, '2025-08-27 09:23:46', '2025-08-27 09:23:46'),
(15, 3, 'Inventaris Kantor', 'Kursi Putar Kecil', 1, '2011', 5, 200000, '2025-08-27 09:24:20', '2025-08-27 09:24:20'),
(16, 3, 'Inventaris Kantor', 'Meja Kecil', 1, '2011', 4, 200000, '2025-08-27 09:43:44', '2025-08-27 09:43:44'),
(17, 3, 'Inventaris Kantor', 'Meja', 1, '2012', 4, 450000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(18, 3, 'Inventaris Kantor', 'White Board', 1, '2012', 4, 1450000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(19, 3, 'Inventaris Kantor', 'Kursi', 10, '2012', 4, 2900000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(20, 3, 'Inventaris Kantor', 'Kipas Angin', 1, '2012', 4, 400000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(21, 3, 'Inventaris Kantor', 'Meja Kerja', 5, '2013', 5, 2750000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(22, 3, 'Inventaris Kantor', 'TV 29\" + lemari', 1, '2014', 4, 1000000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(23, 3, 'Inventaris Kantor', 'AC 2PK', 1, '2016', 5, 6300000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(24, 3, 'Inventaris Kantor', 'AC 1,5PK', 1, '2016', 5, 4750000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(25, 3, 'Inventaris Kantor', 'Meja Kursi', 1, '2016', 4, 2000000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(26, 3, 'Inventaris Kantor', 'Mesin Air', 1, '2016', 5, 420000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(27, 3, 'Inventaris Kantor', 'Laptop', 1, '2016', 5, 7000000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(28, 3, 'Inventaris Kantor', 'Meja Kerja 1/2 biro + laci', 2, '2017', 5, 3900000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(29, 3, 'Inventaris Kantor', 'Meja Kerja 1/2 biro kaki besi', 2, '2017', 5, 1600000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(30, 3, 'Inventaris Kantor', 'Kursi Direktur', 2, '2017', 5, 3000000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(31, 3, 'Inventaris Kantor', 'Kursi Indachi', 2, '2017', 5, 1500000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(32, 3, 'Inventaris Kantor', 'Karpet', 12, '2017', 4, 4400000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(33, 3, 'Inventaris Kantor', 'Kursi chitose vista', 2, '2017', 4, 1060000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(34, 3, 'Inventaris Kantor', 'kursi lipat chitose', 5, '2017', 4, 1427000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(35, 3, 'Inventaris Kantor', 'Komputer Full Spec', 1, '2017', 5, 13350000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(36, 3, 'Inventaris Kantor', 'Komputer', 1, '2017', 5, 7700000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(37, 3, 'Inventaris Kantor', 'Printer Epson L 310', 1, '2017', 5, 1750000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(38, 3, 'Inventaris Kantor', 'Printer Epson L565', 1, '2017', 5, 3725000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(39, 3, 'Inventaris Kantor', 'LCD Proyektor Infocus in 114x', 1, '2017', 5, 5350000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(40, 3, 'Inventaris Kantor', 'Dispenser', 1, '2017', 3, 1448000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(41, 3, 'Inventaris Kantor', 'HP Asus Zenfone 4max', 1, '2017', 4, 2349000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(42, 3, 'Inventaris Kantor', 'Furniture protection book', 4, '2019', 4, 396000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(43, 3, 'Inventaris Kantor', 'Meja', 4, '2019', 5, 4404000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(44, 3, 'Inventaris Kantor', 'Kursi', 2, '2019', 5, 2316000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(45, 3, 'Inventaris Kantor', 'Kursi', 1, '2019', 5, 2968000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(46, 3, 'Inventaris Kantor', 'Kursi', 1, '2019', 5, 1910000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(47, 3, 'Inventaris Kantor', 'Komputer A10 Asus U221 (set)', 1, '2019', 5, 6847000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(48, 3, 'Inventaris Kantor', 'Komputer A10 Lenovo 520-241KL', 1, '2019', 5, 14700000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(49, 3, 'Inventaris Kantor', 'Printer Epson Lx-310', 1, '2019', 5, 2100000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(50, 3, 'Inventaris Kantor', 'Laptop NB Asus A442UQ 17-7500', 1, '2019', 5, 10300000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(51, 3, 'Inventaris Kantor', 'Bak sampah', 2, '2019', 4, 50000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(52, 3, 'Inventaris Kantor', 'Brankas Fantasi', 1, '2019', 10, 10000000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(53, 3, 'Inventaris Kantor', 'Komputer PC HP A10 20-C320L', 2, '2019', 5, 9200000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(54, 3, 'Inventaris Kantor', 'Printer Epson L405', 1, '2019', 5, 3000000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(55, 3, 'Inventaris Kantor', 'Mesin Air', 1, '2019', 5, 933500, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(56, 3, 'Inventaris Kantor', 'Kompor Gas (set)', 1, '2019', 4, 640000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(57, 3, 'Inventaris Kantor', 'Lemari', 1, '2019', 5, 1000000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(58, 3, 'Inventaris Kantor', 'Mesin Air', 1, '2019', 5, 1127000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(59, 3, 'Inventaris Kantor', 'Horden', 18, '2019', 4, 1370000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(60, 3, 'Inventaris Kantor', 'Kipas Angin Miyako KDB-18', 2, '2019', 4, 722000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(61, 3, 'Inventaris Kantor', 'Seperangkat Sound System', 1, '2019', 5, 2900000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(62, 3, 'Inventaris Kantor', 'Papan Pengumuman / Mading', 1, '2019', 4, 1000000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(63, 3, 'Inventaris Kantor', 'Horden', 3, '2019', 4, 189500, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(64, 3, 'Inventaris Kantor', 'Lampu Belajar', 1, '2019', 4, 66500, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(65, 3, 'Inventaris Kantor', 'Scanner Barcode Stand Eppos', 1, '2019', 5, 2150000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(66, 3, 'Inventaris Kantor', 'Kipas Angin Miyako KDB-18', 6, '2019', 4, 2124000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(67, 3, 'Inventaris Kantor', 'Kipas Angin Miyako KDB-18', 3, '2019', 4, 1074000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(68, 3, 'Inventaris Kantor', 'Kipas Angin Miyako KDB-18', 2, '2019', 4, 708000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(69, 3, 'Inventaris Kantor', 'Kipas Angin Maspion', 6, '2019', 4, 2130000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(70, 3, 'Inventaris Kantor', 'kursi lipat chitose', 10, '2019', 5, 2900000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(71, 3, 'Inventaris Kantor', 'D810 VWA', 1, '2019', 4, 850000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(72, 3, 'Inventaris Kantor', 'Meja Kursi MT 122', 7, '2019', 5, 2800000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(73, 3, 'Inventaris Kantor', 'Kursi 4005 Jaring', 8, '2019', 5, 4400000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(74, 3, 'Inventaris Kantor', 'Galon', 4, '2019', 4, 200000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(75, 3, 'Inventaris Kantor', 'Hardisk', 1, '2020', 4, 650000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(76, 3, 'Inventaris Kantor', 'Printer Epson L-3110', 1, '2020', 5, 2360000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(77, 3, 'Inventaris Kantor', 'Wall Fan (kipas angin)', 2, '2020', 4, 390000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(78, 3, 'Inventaris Kantor', 'Stepler jilid kangaro DS-2352OH', 1, '2020', 4, 787500, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(79, 3, 'Inventaris Kantor', 'Peralatan radio digital', 1, '2020', 5, 10876302, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(80, 3, 'Inventaris Kantor', 'AC Sharp 1/2 PK', 1, '2021', 4, 3417000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(81, 3, 'Inventaris Kantor', 'Gitar akustik', 1, '2021', 4, 6115400, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(82, 3, 'Inventaris Kantor', 'Kursi savello omega 6 (roda)', 2, '2021', 4, 1525000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(83, 3, 'Inventaris Kantor', 'Kursi savello omega V (kaki)', 3, '2021', 4, 1975000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(84, 3, 'Inventaris Kantor', 'AC Sharp 1/2 PK', 4, '2022', 5, 16205000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(85, 3, 'Inventaris Kantor', 'Printer Epson LX-310 domatric', 1, '2022', 5, 3300000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(86, 3, 'Inventaris Kantor', 'AC Sharp 1/2 PK', 2, '2023', 4, 7225000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(87, 3, 'Inventaris Kantor', 'Keyboard', 1, '2023', 5, 6880500, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(88, 3, 'Inventaris Kantor', 'Bass elektrik', 1, '2023', 5, 2840500, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(89, 4, 'Perpustakaan', 'Buku Perpus', 1, '2016', 5, 48295000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(90, 4, 'Perpustakaan', 'Rak buku', 3, '2016', 4, 4200000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(91, 4, 'Perpustakaan', 'Meja', 8, '2016', 4, 8800000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(92, 4, 'Perpustakaan', 'locker', 1, '2016', 5, 2250000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(93, 4, 'Perpustakaan', 'papan pengumuman', 1, '2016', 4, 500000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(94, 4, 'Perpustakaan', 'mebler', 1, '2016', 5, 5000000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(95, 4, 'Perpustakaan', 'mimbar', 1, '2016', 5, 1000000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(96, 4, 'Perpustakaan', 'Karpet', 6, '2019', 4, 1800000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(97, 4, 'Perpustakaan', 'Lemari', 1, '2019', 5, 1750000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(98, 4, 'Perpustakaan', 'Meja + Kaca', 4, '2019', 5, 1800000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(99, 4, 'Perpustakaan', 'Printer Cannon G3010', 1, '2019', 5, 3415000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(100, 4, 'Perpustakaan', 'Scanner Barcode Auto', 1, '2019', 5, 2850000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(101, 4, 'Perpustakaan', 'Buku Perpus', 16, '2020', 5, 7142112, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(102, 4, 'Perpustakaan', 'Kereta buku', 1, '2020', 5, 950000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(103, 4, 'Perpustakaan', 'Dispenser', 1, '2020', 5, 820000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(104, 4, 'Perpustakaan', 'Galon', 1, '2020', 2, 50000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(105, 4, 'Perpustakaan', 'Peralatan rekaman/handycamp', 1, '2021', 4, 3804100, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(106, 4, 'Perpustakaan', 'Buku Perpus', 15, '2022', 5, 7488000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(107, 5, 'Laboratorium', 'karpet', 1, '2022', 5, 15675000, '2025-08-27 12:25:32', '2025-08-27 12:25:32'),
(108, 5, 'Laboratorium', 'sound system microteaching', 1, '2022', 5, 2620000, '2025-08-27 12:25:32', '2025-08-27 12:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `perencanaan_pimpinan`
--

CREATE TABLE `perencanaan_pimpinan` (
  `id` bigint NOT NULL,
  `kategori` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_legalisir`
--

CREATE TABLE `permintaan_legalisir` (
  `id` bigint NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permintaan_legalisir`
--

INSERT INTO `permintaan_legalisir` (`id`, `nama`, `email`, `no_hp`, `tautan`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fatwa Aulia', 'fatwaaulia.fy@gmail.com', '082345566500', 'https://mail.google.com/mail/u/0/?usp=installed_webapp', 'Selesai', '2025-09-08 07:45:03', '2025-09-08 08:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `perpustakaan`
--

CREATE TABLE `perpustakaan` (
  `id` bigint NOT NULL,
  `kategori` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perpustakaan`
--

INSERT INTO `perpustakaan` (`id`, `kategori`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(2, 'BUKU RUSAK', 'buku rusak tahun 2024', 'https://id.quora.com/', '', '2025-09-04 09:12:05', '2025-09-04 09:19:23', 1, 1),
(3, 'BUKU', 'buku tersedia tahun 2024', 'https://mail.google.com/mail/u/0/?usp=installed_webapp', '', '2025-09-04 09:18:16', '2025-09-04 09:18:51', 1, 1),
(4, 'PENGAJUAN BUKU BARU', 'Pengajuan buku baru untuk 2026', 'https://hpanel.hostinger.com/', '', '2025-09-04 10:30:01', '2025-09-04 10:30:01', 37, 0),
(5, 'KEGIATAN PERPUSTAKAAN', 'Laporan Kegiatan Perpustakaan 02 Maret 2025', 'https://translate.google.com/?sl=en&tl=id&text=teknologi%20rekayasa%20perangkatan%20lunak%20terapan%20sistem&op=translate', '', '2025-09-07 09:08:53', '2025-09-07 09:08:53', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(105) COLLATE utf8mb4_general_ci NOT NULL,
  `json_pertanyaan` mediumtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pertanyaan`
--

INSERT INTO `pertanyaan` (`id`, `judul`, `slug`, `json_pertanyaan`, `created_at`, `updated_at`) VALUES
(2, 'Refleksi Kamis_11 September 2025', 'refleksi-kamis-11-september-2025', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\"}}', '2025-09-11 19:45:20', '2025-09-13 21:43:51'),
(3, 'Refleksi PKKMB STKIP ISM_13 September 2025', 'refleksi-pkkmb-13-september-2025', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\"}}', '2025-09-13 21:14:00', '2025-09-13 21:43:34');

-- --------------------------------------------------------

--
-- Table structure for table `program_studi`
--

CREATE TABLE `program_studi` (
  `id` bigint NOT NULL,
  `jenjang` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `singkatan` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program_studi`
--

INSERT INTO `program_studi` (`id`, `jenjang`, `nama`, `singkatan`, `created_at`, `updated_at`) VALUES
(1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '2025-08-19 06:00:41', '2025-08-19 06:07:10'),
(2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2025-08-19 06:01:15', '2025-08-19 06:07:21'),
(3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '2025-08-19 06:01:58', '2025-08-19 06:07:30');

-- --------------------------------------------------------

--
-- Table structure for table `responden`
--

CREATE TABLE `responden` (
  `id` bigint NOT NULL,
  `id_pertanyaan` bigint NOT NULL,
  `id_user` bigint NOT NULL,
  `nama_role_user` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_user` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `jenjang_program_studi` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `singkatan_program_studi` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `json_jawaban` mediumtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `responden`
--

INSERT INTO `responden` (`id`, `id_pertanyaan`, `id_user`, `nama_role_user`, `nama_user`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `json_jawaban`, `created_at`, `updated_at`) VALUES
(5, 1, 35, 'Dosen', 'Yuliana Nurhayati, M.Pd.', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"okew\"},\"2\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus?\",\"jawaban\":\"asekk lroemleml aldjaiowjdoiajoiwdiao joidjwoiaj dio jdioaj iwdojaoi jdioaj ido jaiowd jwiaod jasekk lroemleml aldjaiowjdoiajoiwdiao joidjwoiaj dio jdioaj iwdojaoi jdioaj ido jaiowd jwiaod jasekk lroemleml aldjaiowjdoiajoiwdiao joidjwoiaj dio jdioaj iwdojaoi jdioaj ido jaiowd jwiaod jasekk lroemleml aldjaiowjdoiajoiwdiao joidjwoiaj dio jdioaj iwdojaoi jdioaj ido jaiowd jwiaod jasekk lroemleml aldjaiowjdoiajoiwdiao joidjwoiaj dio jdioaj iwdojaoi jdioaj ido jaiowd jwiaod jasekk lroemleml aldjaiowjdoiajoiwdiao joidjwoiaj dio jdioaj iwdojaoi jdioaj ido jaiowd jwiaod j\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"askndjad\"},\"4\":{\"pertanyaan\":\"Apa issue pendidikan yang Anda amati hari ini? Apa tanggapan Anda?\",\"jawaban\":\"oijoij\"},\"5\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus?\",\"jawaban\":\"oidjqodj\"},\"6\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah\\u00a0jam\\u00a0istirahat?\",\"jawaban\":\"oji\"}}', '2025-09-09 20:01:06', '2025-09-09 20:01:06'),
(6, 1, 37, 'Tendik', 'Muhammad Juanda', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"bagusss\"},\"2\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus?\",\"jawaban\":\"asekkk\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"yoii emn asek lo yaaa\"},\"4\":{\"pertanyaan\":\"Apa issue pendidikan yang Anda amati hari ini? Apa tanggapan Anda?\",\"jawaban\":\"indonesiaaa emaasssss\"},\"5\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus?\",\"jawaban\":\"gogogogooo\"},\"6\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah\\u00a0jam\\u00a0istirahat?\",\"jawaban\":\"bismillahhh\"}}', '2025-09-09 20:06:16', '2025-09-09 20:06:16'),
(7, 2, 37, 'Tendik', 'Muhammad Juanda', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"08.15 wita\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"13.00 wita\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Pelaksanaan kegiatan PKKMB\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Pembuatan presensi, cetak kegiatan PKKMB, gladi kotor PKKMB, berkomunikasi dengan MC setelah kegiatan gladi kotor, membuat nama meja untuk kegiatan PKKMB,.\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Berdampak, karena melatih untuk apa yang sudah d agendakan segera dikerjakan.\"}}', '2025-09-11 19:57:15', '2025-09-11 19:57:15'),
(8, 2, 46, 'Dosen', 'Abdul Aziz', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"08.45\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"13.00\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"koordinasi\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"membuat Power point operator PKKMB dan kegiatan PKM\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Iya,\"}}', '2025-09-12 12:07:06', '2025-09-12 12:07:06'),
(9, 2, 48, 'Dosen', 'Norhayati K', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"08.48\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"13.00\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Hari ini saya belajar tentang permasalahan\\/ faktor anak yang mengalami speech delay, serta mempelajari solusi dari permasalahan tersebut\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Membaca\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Iya saya rasa memiliki dampak untuk peningkatan layanan terhadap mahasiswa\"}}', '2025-09-12 14:28:15', '2025-09-12 14:28:15'),
(10, 2, 49, 'Tendik', 'Noor Ermiliyawati Nazemi', '', '', '', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"9.30\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"13.30\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Tetaplah optimis sekalipun saya berada di sumber badai\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Menperbaiki data di neofeeder dan konsultasi terkait PISN dengan waka akademik dan kurikulum\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Saya hanya mengikuti instruksi\"}}', '2025-09-12 14:31:09', '2025-09-12 14:31:09'),
(11, 2, 41, 'Tendik', 'Halima Chairia', '', '', '', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"08.24 WITA\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"13.30 WITA\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Bagaimana cara menyelesaikan suatu pekerjaan dgn cepat & tepat\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Melayani mahasiswa yg melakukan pembayaran, membuat laporan pengeluaran & penerimaan harian, membantu dosen dlm hal administrasi\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Iya\"}}', '2025-09-12 18:15:24', '2025-09-12 18:15:24'),
(12, 2, 35, 'Dosen', 'Yuliana Nurhayati, M.Pd.', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"Pukul 09.00\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"13.00\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Hari ini belajar koordinasi tim\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Persiapan gladi resik pkkmb 2025\\/2026\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Masih dalam proses mewujudkan beberapa kegiatan yg berdampak.\"}}', '2025-09-13 21:14:40', '2025-09-13 21:14:40'),
(13, 3, 35, 'Dosen', 'Yuliana Nurhayati, M.Pd.', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Alhamdulillah, kegiatan PKKMB 2025\\/2026 berjalan lancar, sukses, dan sesuai dengan yang diharapkan.\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Insyaallah membantu memberikan dalam artian memimpin kegiatan ini agar berjalan sesuai dengan konsep yg sudah direncanakan bersama Tim PKKMB dan  arahan dari pembina  Bapak Iwan Perdana, Ph.D. serta tereksekusi dengan baik bersama seluruh kawan2 yang ikut membantu dengan senang hati.\"}}', '2025-09-13 21:20:29', '2025-09-13 21:20:29'),
(14, 2, 27, 'Dosen', 'Novi Suma Setyawati', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"08.35\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"Tidak makan keluar kampus karena pesan makan online\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Belajar berkoordinasi dengan baik dan menyiapkan segala sesuatu dengan matang untuk kegiatan PKKMB\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Rapat dan koordinasi kegiatan PKKMB, bimbingan skripsi mahasiswa\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Dengan memastikan waktu yang dijanjikan dengan mahasiswa yang mau bimbingan tidak menunda dan menepati janji untuk bertemu walaupun pada saat yang bersamaan dihadapkan dengan pekerjaan yang lain yang sama pentingnya untuk segera diselesaikan.\"}}', '2025-09-13 22:01:00', '2025-09-13 22:01:00'),
(15, 3, 27, 'Dosen', 'Novi Suma Setyawati', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Alhamdulillah pelaksanaan PKKMB berjalan lancar dan agak berbeda dengan sebelumnya karena pengisi acara banyak melibatkan mahasiswa terutama MC dan menggunakan 2 bahasa, dan ada UKM Tari yang sukses membawakan tariannya, karena tujuannya memang untuk menonjolkan kelebihan Mahasiswa yang ada di STKIP ISM agar para mahasiswa baru lebih semangat untuk berkuliah di STKIP ISM\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Berperan sebagai divisi dokumentasi Saya berusaha untuk melakukan yang terbaik dengan menangkap moment-moment penting pada saat kegiatan karena itu akan menjadi bagian sejarah dari STKIP ISM. Saya menggunakan bantuan fotograper untuk hal tersebut agar hasilnya bagus.\"}}', '2025-09-13 22:10:01', '2025-09-13 22:10:01'),
(16, 3, 37, 'Tendik', 'Muhammad Juanda', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Pelaksanaan PKKMB alhamdulillah berjalan baik dan lancar, semua terkoordinasi dengan baik\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Iya memberikan  alasannya konsep kegiatan dengan MC dua bahasa yang baru tahun ini ada,\"}}', '2025-09-14 05:55:39', '2025-09-14 05:55:39'),
(17, 2, 32, 'Dosen', 'arminfani@stkipismbjm.ac.id', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"8:30\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"13:00\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Tentang Bahasa Inggris\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Mengajar\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Iya\"}}', '2025-09-14 07:52:45', '2025-09-14 07:52:45'),
(18, 3, 32, 'Dosen', 'arminfani@stkipismbjm.ac.id', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Menurut saya berjalam dengan baik dan lancar\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Iya, karena sya sudah berusaha mengkoordinasikan pelaksanaan dilapangan supaya bisa berjalan dengan baik.\"}}', '2025-09-14 07:59:20', '2025-09-14 07:59:20'),
(19, 2, 25, 'Dosen', 'Muhammad Supian Sauri', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"08.20\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"13.30\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Membaca\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Membuat materi perkuliahan\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Iya\"}}', '2025-09-14 14:12:30', '2025-09-14 14:12:30'),
(20, 3, 25, 'Dosen', 'Muhammad Supian Sauri', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Sangat bagus\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Iya, saya membantu dalam merapikan mahasiswa\"}}', '2025-09-14 14:13:27', '2025-09-14 14:13:27'),
(21, 3, 49, 'Tendik', 'Noor Ermiliyawati Nazemi', '', '', '', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"PKKMB STIKIP ISM BERJALAN lancar sesuai dengan rencana\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"ya saya memberikan pelayanan terbaik sesuai arahan kepada mahasiswa-mahasiswa baru dan tamu-tamu undangan yang berhadir\"}}', '2025-09-15 07:40:54', '2025-09-15 07:40:54'),
(22, 2, 31, 'Dosen', 'Rizki Nugerahani Ilise', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"08.25\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"13.30\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Membuat jurnal harian\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Membaca laporan revisi mahasiswa dalam tugas akhirnya\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Menurut saya sangat berdampak, responbility yang harus ada dalam setiap diri akan memberikan nilai positif terhadap institusi dan menambah citra baik bagi diri sendiri.\"}}', '2025-09-15 08:00:04', '2025-09-15 08:00:04'),
(23, 3, 31, 'Dosen', 'Rizki Nugerahani Ilise', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Pelaksanaan PKKMB tahun akademik 2025\\/2026 sangat kereenn menurut saya, acara dibuat santai oleh para panitia dan dibuat meriah oleh rekan-rekan mahasiswa. Mahasiswa dan para sivitas akademika bergembira bersama dengan menyanyikan lagu hits \\\"tabola bale\\\" yang dibawakan oleh Ni Widya Wahyuni mahasiswa semester 7 program studi PAUD. Suasana bertambah ceria ketika peserta berdendang ria mengikuti lagu tersebut.\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Alhamdulillah dapat berkontribusi dengan menjamu para tamu undangan dan para peserta PKKMB STKIP Islam Sabilal Muhtadin\"}}', '2025-09-15 08:04:44', '2025-09-15 08:04:44'),
(24, 3, 41, 'Tendik', 'Halima Chairia', '', '', '', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Acara PKKMB berjalan lancar dan meriah, semua pihak yg hadir mengkitu kegiatan dr awal smp akhir\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Iya, dalam pelaksanaan PKKMB kali ini sy dipercayakan memegang divisi keunngan dan diperbantukan di divisi konsumsi yg mana kedua divisi tsb sangat berperan utk kelancaran acara\"}}', '2025-09-15 08:29:45', '2025-09-15 08:29:45'),
(25, 2, 34, 'Dosen', 'Vebrianti Umar, M.Pd', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"8.36\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"Tidak keluar dari kampus jam istirahat\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Pengecekan NIM Mahasiswa akhir\\r\\npengecekan nilai IPS\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Membuat surat pernyataan dan pengantar untuk yudisium\\r\\nmembuat SK Yudisium\\r\\nMembuat SK penetapan mahasiswa baru\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Ya\"}}', '2025-09-15 09:04:05', '2025-09-15 09:04:05'),
(26, 3, 46, 'Dosen', 'Abdul Aziz', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Sangat luar biasa, dari panitia sampai peserta sangat bersemangat terhadap pelaksanaan PKKMB STKIP ISM 13 September 2025.\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Alhamdulillah, saya diberikan kepercayaan dan kesempatan untuk menjadi operator. Saya mencoba memberikan kontribusi terbaik sebagai operator, dengan mempersiapkan slide operator dan juga bahkan saya membantu kawan kawan panitian untuk membuatkan twibbonize yang digunakan untuk para peserta calon mahasiswa di sosmednya.\"}}', '2025-09-15 09:06:24', '2025-09-15 09:06:24'),
(27, 2, 33, 'Dosen', 'Novi Nurdian', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"08.35\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"saya istirahat makan siang di kampus\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"persiapan dalam sebuah acara sangat penting untuk dilakukan.\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"gladhi kotor PKKMB 2025\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"SANGAT BERDAMPAK, DENGAN BEGITU SAYA HARUS MEMPERSIAPKAN SEGALA HAL SETIAP KALI PERKULIAHAN AGAR BERJALAN DENGAN OPTIMAL\"}}', '2025-09-15 09:06:32', '2025-09-15 09:06:32'),
(28, 3, 48, 'Dosen', 'Norhayati K', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Menurut saya acara pelaksanaan PKKMB di STKIP ISM 13 september 2024 merupakan acara sangat baik dari segi acara, pemateri yang sangat baik menyampaikan meteri, dan manajemen waktu yang baik\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Iya, saya berkontribusi bertugas mengarahkan tamu undangan menuju kursi yang sudah di sediakan\"}}', '2025-09-15 09:07:34', '2025-09-15 09:07:34'),
(29, 3, 34, 'Dosen', 'Vebrianti Umar, M.Pd', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"PKKMB tahun ini begitu luar biasa, semua telah telaksana dengan sangat baik.\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Ya, saya diberikan amanah oleh ketua pelaksana untuk menyampaikan pengenalan civitas akademika dan sistem perkuliahan di kampus. Alhamdulillah saya sudah melaksanakan sesuai arahan.\"}}', '2025-09-15 09:09:08', '2025-09-15 09:09:08'),
(30, 3, 33, 'Dosen', 'Novi Nurdian', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Keren, dengan materi yang menjunjung tinggi nilai budaya lokal, dapat membentuk karakter mahasiswa baru agar lebih mencintai budaya banjar dengan khasanah ilmu yang didapat selama perkuliahan,\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"iya, saya datang lebih pagi dan saya telah siap untuk bertugas sesuai arahan panitia yakni mengantarkan tamu undangan ke tempat duduknya.\"}}', '2025-09-15 09:09:30', '2025-09-15 09:09:30'),
(31, 2, 40, 'Dosen', 'Muhammad Agus Safrian Nur', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"08.40\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"13.30\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"mailing\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"sertifikat acara PKKMB\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Belum\"}}', '2025-09-15 09:10:59', '2025-09-15 09:10:59'),
(32, 3, 40, 'Dosen', 'Muhammad Agus Safrian Nur', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Secara sepenuhnya kegiatan terlaksana sesuai jadwal.\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"kontribusi saya dalam kegiatan PKKMB 2025 berperan sebagai crew belakang layar memastikan Soundsystem membantu jalannya kegiatan.\"}}', '2025-09-15 09:15:22', '2025-09-15 09:15:22'),
(33, 2, 28, 'Dosen', 'Maulidha, M.Pd', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"08.45 WITA\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"13.00 WITA\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Gladi kotor PKKMB diruang micro teaching belajar  tentang pelaksanaan pengorganisasian kegiatan kampus\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"foto bersama, gladi kotor PKKMB, Konsultasi mahasiswa,\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"ya, membantu mahasiswa dalam proses merampungkan dan merevisi skripsi yang akan dikumpulkannya.\"}}', '2025-09-15 09:21:53', '2025-09-15 09:21:53'),
(34, 3, 28, 'Dosen', 'Maulidha, M.Pd', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"kegiatan berjalan dengan lancar, mahasiswa perperan aktif dalam kegiatan, panitia yang luar biasa dalam merancang tema dan kegiatan-kegiatan yang dilaksanakan dalam kegiatan\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"ya, membantu optimal bagian yang memerlukan bantuan, seperti jaga meja regisntrasi dan membantu persiapan memasang perlengkapan PKKMB.\"}}', '2025-09-15 09:27:18', '2025-09-15 09:27:18'),
(35, 2, 29, 'Dosen', 'Zulparis', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"Saya datang ke kampus pukul 8:30\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"Pada hari kamis tanggal 11 september 2025 saya tidak keluar mencari makan diluar, tetapi makan di kampus\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Pada hari kamis saya melist keperluan untuk kegiatan pkkmb\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Menyusun data calon mahasiswa baru\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Dampak apa yang saya kerjakan pada hari ini ialah bagaimana bekerja sesuai dengan intruksi\"}}', '2025-09-15 09:34:31', '2025-09-15 09:34:31'),
(36, 3, 29, 'Dosen', 'Zulparis', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Pelaksanaan kegiatan PKKMB STKIP Islam Sabilal Muhtadin Banjarmasin berjalan dengan baik sesuai dengan perencanaan\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Saya memberikan kontribusi pada saat kegiatan PKKMB ialah bagaimana saya melist semua perlengkapan yang oleh kegiatan PKKMB\"}}', '2025-09-15 09:37:31', '2025-09-15 09:37:31'),
(37, 2, 39, 'Tendik', 'Nurul Fitriyani, SE., MA.', '', '', '', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\",\"jawaban\":\"08.30\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\",\"jawaban\":\"01.30\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\",\"jawaban\":\"Belajar mencari cara menekan harga agar anggaran tercukupi\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\",\"jawaban\":\"Melihat situs LLDIKTI apakah ada surat masuk, membantu teman2 dosen dan tendik mengenai no surat keluar terkait kegiatan STKIP-ISM\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\",\"jawaban\":\"Ya\"}}', '2025-09-15 15:22:59', '2025-09-15 15:22:59'),
(38, 3, 39, 'Tendik', 'Nurul Fitriyani, SE., MA.', '', '', '', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Kegiatan PKKMB berjalan dengan tertib dan lancar\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Ya, saya telah hadir sebelum pelaksanaan acara PKKMB, saya mempersiapkan segala sesuatu yang berhubungan dengan tugas saya sebagai divisi konsumsi\"}}', '2025-09-15 15:24:56', '2025-09-15 15:24:56');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` tinyint NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `nama`, `slug`) VALUES
(1, 'Superadmin', 'superadmin'),
(2, 'Keuangan', 'keuangan'),
(3, 'Waka Akademik', 'waka-akademik'),
(4, 'Dosen', 'dosen'),
(5, 'Mahasiswa', 'mahasiswa'),
(6, 'Staf Akademik', 'staf-akademik'),
(7, 'Ketua', 'ketua'),
(8, 'Kaprodi', 'kaprodi'),
(9, 'Waka Kemahasiswaan dan Kerja Sama', 'waka-kemahasiswaan-kerjasama'),
(10, 'LPM', 'lpm'),
(11, 'LPPM', 'lppm'),
(12, 'Staf Administrasi', 'staf-administrasi'),
(13, 'Pustakawan', 'pustakawan'),
(14, 'Biro Alumni', 'biro-alumni'),
(15, 'UTP PLP', 'upt-plp'),
(16, 'Tendik', 'tendik'),
(17, 'Admin Utama', 'admin-utama');

-- --------------------------------------------------------

--
-- Table structure for table `spmi`
--

CREATE TABLE `spmi` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `standar_pt`
--

CREATE TABLE `standar_pt` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_mahasiswa`
--

CREATE TABLE `status_mahasiswa` (
  `id` bigint NOT NULL,
  `id_mahasiswa` bigint NOT NULL,
  `nama_mahasiswa` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_identitas_mahasiswa` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `id_program_studi` bigint NOT NULL,
  `jenjang_program_studi` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `singkatan_program_studi` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_tahun_akademik` bigint NOT NULL,
  `tahun_akademik` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe_tahun_akademik` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `id_tahun_akademik_selesai_cuti` bigint NOT NULL,
  `tahun_akademik_selesai_cuti` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe_tahun_akademik_selesai_cuti` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_peringatan`
--

CREATE TABLE `surat_peringatan` (
  `id` int NOT NULL,
  `nomor_surat` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tingkat_sp` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `perihal` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `catatan` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `surat_peringatan`
--

INSERT INTO `surat_peringatan` (`id`, `nomor_surat`, `tingkat_sp`, `perihal`, `catatan`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'SK/MP2025/00123', 'SP 1', 'Dosen Merokok Dalam Kelas', '-', 'https://mail.google.com/mail/u/0/?usp=installed_webapp', '', '2025-09-03 20:56:34', '2025-09-03 20:57:31', 34, 34);

-- --------------------------------------------------------

--
-- Table structure for table `surat_tugas_penelitian`
--

CREATE TABLE `surat_tugas_penelitian` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `surat_tugas_penelitian`
--

INSERT INTO `surat_tugas_penelitian` (`id`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(6, 'Surat Tugas Penelitian Di Desa Kebondalem', 'https://hpanel.hostinger.com/', '', '2025-09-07 10:46:15', '2025-09-07 10:46:15', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan_mahasiswa`
--

CREATE TABLE `tagihan_mahasiswa` (
  `id` bigint NOT NULL,
  `kategori` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `jenis` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `json_id_mahasiswa` mediumtext COLLATE utf8mb4_general_ci NOT NULL,
  `id_tahun_akademik` bigint NOT NULL,
  `tahun_akademik` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe_tahun_akademik` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `periode_mulai_tahun_akademik` date NOT NULL,
  `periode_selesai_tahun_akademik` date NOT NULL,
  `json_biaya` mediumtext COLLATE utf8mb4_general_ci NOT NULL,
  `biaya_yudisium_wisuda` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_by` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `id` bigint NOT NULL,
  `tahun_akademik` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `periode_mulai` date NOT NULL,
  `periode_selesai` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tahun_akademik`
--

INSERT INTO `tahun_akademik` (`id`, `tahun_akademik`, `tipe`, `periode_mulai`, `periode_selesai`, `created_at`, `updated_at`) VALUES
(4, '2018/2019', 'Ganjil', '2018-09-01', '2019-01-31', '2025-09-05 06:28:15', '2025-09-05 06:28:15'),
(5, '2018/2019', 'Genap', '2019-02-16', '2019-07-18', '2025-09-05 06:28:57', '2025-09-05 06:28:57'),
(6, '2019/2020', 'Ganjil', '2019-09-01', '2020-01-31', '2025-09-05 06:30:03', '2025-09-05 06:30:03'),
(7, '2019/2020', 'Genap', '2020-10-06', '2020-07-18', '2025-09-05 06:30:42', '2025-09-05 06:30:42'),
(8, '2020/2021', 'Ganjil', '2020-09-01', '2021-01-31', '2025-09-05 06:31:35', '2025-09-05 06:32:30'),
(9, '2020/2021', 'Genap', '2021-02-16', '2021-07-18', '2025-09-05 06:32:04', '2025-09-05 06:32:04'),
(10, '2021/2022', 'Ganjil', '2021-09-01', '2022-01-31', '2025-09-05 06:33:14', '2025-09-05 06:33:14'),
(11, '2021/2022', 'Genap', '2022-02-16', '2022-07-18', '2025-09-05 06:33:40', '2025-09-05 06:33:40'),
(12, '2022/2023', 'Ganjil', '2022-09-01', '2023-01-31', '2025-09-05 06:34:17', '2025-09-05 06:34:17'),
(13, '2022/2023', 'Genap', '2023-02-16', '2023-07-18', '2025-09-05 06:34:41', '2025-09-05 06:34:41'),
(14, '2023/2024', 'Ganjil', '2023-09-01', '2024-01-31', '2025-09-05 06:35:13', '2025-09-05 06:35:13'),
(15, '2023/2024', 'Genap', '2024-02-16', '2024-07-18', '2025-09-05 06:35:39', '2025-09-05 06:35:39'),
(16, '2024/2025', 'Ganjil', '2024-09-01', '2025-01-31', '2025-09-05 06:36:32', '2025-09-05 06:36:32'),
(17, '2024/2025', 'Genap', '2025-02-16', '2025-07-18', '2025-09-05 06:37:07', '2025-09-05 06:37:07'),
(18, '2025/2026', 'Ganjil', '2025-09-01', '2026-01-31', '2025-09-05 06:37:52', '2025-09-05 06:37:52');

-- --------------------------------------------------------

--
-- Table structure for table `tarif_spp`
--

CREATE TABLE `tarif_spp` (
  `id` int NOT NULL,
  `kode` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `biaya` int NOT NULL,
  `biaya_uts` int NOT NULL,
  `biaya_uas` int NOT NULL,
  `biaya_ldkm` int NOT NULL,
  `biaya_mbkm` int NOT NULL,
  `biaya_bimbingan_skripsi` int NOT NULL,
  `biaya_seminar_proposal` int NOT NULL,
  `biaya_sidang_skripsi` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tarif_spp`
--

INSERT INTO `tarif_spp` (`id`, `kode`, `nama`, `biaya`, `biaya_uts`, `biaya_uas`, `biaya_ldkm`, `biaya_mbkm`, `biaya_bimbingan_skripsi`, `biaya_seminar_proposal`, `biaya_sidang_skripsi`, `created_at`, `updated_at`) VALUES
(6, '1', '2018/2019', 0, 0, 0, 0, 0, 850000, 450000, 450000, '2025-09-04 15:04:44', '2025-09-04 15:12:14'),
(8, '3', '2018/2019', 1000000, 0, 0, 0, 0, 850000, 450000, 450000, '2025-09-12 18:29:58', '2025-09-16 09:25:03'),
(9, '4', '2019/2020', 2500000, 0, 0, 0, 0, 850000, 450000, 450000, '2025-09-16 09:24:33', '2025-09-16 09:24:33'),
(10, '5', '2020/2021', 2500000, 0, 0, 0, 0, 850000, 450000, 450000, '2025-09-16 09:27:58', '2025-09-16 09:27:58'),
(12, '7', '2021/2022', 1250000, 0, 0, 0, 150000, 950000, 450000, 450000, '2025-09-16 09:31:54', '2025-09-16 09:31:54'),
(13, '8', '2021/2022', 2500000, 0, 0, 0, 150000, 950000, 450000, 450000, '2025-09-16 09:32:46', '2025-09-16 09:32:46'),
(15, '10', '2022/2023', 2500000, 0, 0, 0, 150000, 950000, 450000, 450000, '2025-09-16 09:38:13', '2025-09-16 09:38:13'),
(16, '11', '2022/2023', 900000, 0, 0, 0, 150000, 950000, 450000, 450000, '2025-09-16 09:38:53', '2025-09-16 09:38:53'),
(18, '13', '2023/2024', 1500000, 0, 0, 0, 150000, 950000, 450000, 450000, '2025-09-16 09:42:02', '2025-09-16 09:42:02'),
(19, '14', '2023/2024', 2500000, 0, 0, 0, 150000, 950000, 450000, 450000, '2025-09-16 12:41:50', '2025-09-16 12:50:41'),
(20, '15', '2023/2024', 0, 250000, 250000, 150000, 150000, 950000, 450000, 450000, '2025-09-16 12:48:45', '2025-09-16 12:48:45'),
(21, '16', '2024/2025', 2000000, 0, 0, 1500000, 150000, 950000, 450000, 450000, '2025-09-16 12:50:18', '2025-09-16 12:50:18'),
(22, '17', '2024/2025', 2500000, 0, 0, 150000, 150000, 950000, 450000, 450000, '2025-09-16 12:51:45', '2025-09-16 12:51:45'),
(23, '18', '2024/2025', 2700000, 0, 0, 150000, 150000, 950000, 450000, 450000, '2025-09-16 12:53:06', '2025-09-16 12:53:06'),
(24, '19', '2025/2026', 2200000, 0, 0, 150000, 150000, 950000, 450000, 450000, '2025-09-16 12:54:27', '2025-09-16 12:54:27'),
(25, '20', '2025/2026', 3000000, 0, 0, 150000, 150000, 950000, 450000, 450000, '2025-09-16 12:55:07', '2025-09-16 12:55:07'),
(26, '21', '2025/2026', 0, 0, 0, 150000, 150000, 950000, 450000, 450000, '2025-09-16 12:56:01', '2025-09-16 12:56:01');

-- --------------------------------------------------------

--
-- Table structure for table `tracer_studi`
--

CREATE TABLE `tracer_studi` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tracer_studi`
--

INSERT INTO `tracer_studi` (`id`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(5, 'tracer studi 2024', 'https://fontawesome.com/search?q=book&ic=free&o=r', '', '2025-09-03 18:27:50', '2025-09-03 18:27:50', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tri_dharma`
--

CREATE TABLE `tri_dharma` (
  `id` bigint NOT NULL,
  `kategori` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan_gdrive` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_publikasi` date NOT NULL,
  `id_anggota_1` bigint NOT NULL,
  `nama_anggota_1` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_identitas_anggota_1` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_role_anggota_1` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_program_studi_anggota_1` bigint DEFAULT NULL,
  `nama_program_studi_anggota_1` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_anggota_2` bigint NOT NULL,
  `nama_anggota_2` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_identitas_anggota_2` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_role_anggota_2` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi_anggota_2` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_anggota_3` bigint NOT NULL,
  `nama_anggota_3` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_identitas_anggota_3` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_role_anggota_3` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi_anggota_3` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_anggota_4` bigint NOT NULL,
  `nama_anggota_4` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_identitas_anggota_4` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_role_anggota_4` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi_anggota_4` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_anggota_5` bigint NOT NULL,
  `nama_anggota_5` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_identitas_anggota_5` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_role_anggota_5` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi_anggota_5` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `anggota_beda_kampus` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tri_dharma`
--

INSERT INTO `tri_dharma` (`id`, `kategori`, `judul`, `tautan`, `tautan_gdrive`, `dokumen`, `tanggal_publikasi`, `id_anggota_1`, `nama_anggota_1`, `nomor_identitas_anggota_1`, `nama_role_anggota_1`, `id_program_studi_anggota_1`, `nama_program_studi_anggota_1`, `id_anggota_2`, `nama_anggota_2`, `nomor_identitas_anggota_2`, `nama_role_anggota_2`, `nama_program_studi_anggota_2`, `id_anggota_3`, `nama_anggota_3`, `nomor_identitas_anggota_3`, `nama_role_anggota_3`, `nama_program_studi_anggota_3`, `id_anggota_4`, `nama_anggota_4`, `nomor_identitas_anggota_4`, `nama_role_anggota_4`, `nama_program_studi_anggota_4`, `id_anggota_5`, `nama_anggota_5`, `nomor_identitas_anggota_5`, `nama_role_anggota_5`, `nama_program_studi_anggota_5`, `anggota_beda_kampus`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(5, 'ARTIKEL PUBLIKASI', 'Parenting Class: Studi Naratif Pelibatan Orangtua Pada Pendidikan Anak Usia Dini Di Kota Banjarmasin', 'https://ejournal.ummuba.ac.id/index.php/mp/article/view/2937', '', '', '2025-06-29', 31, 'Rizki Nugerahani Ilise', '1129049101', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 40, 'Muhammad Agus Safrian Nur', '0158768669130093', 'Dosen', 'Pendidikan Guru Pendidikan Anak Usia Dini', 0, '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '2025-09-15 08:09:08', '2025-09-15 08:09:08', 31, 0),
(6, 'ARTIKEL PUBLIKASI', 'Digital Parenting: Pola Asuh Orang Tua Mendidik Anak Usia Dini di Era Digital', 'https://journal.iaisambas.ac.id/index.php/prymerly/article/view/3120', '', '', '2024-08-21', 31, 'Rizki Nugerahani Ilise', '1129049101', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 27, 'Novi Suma Setyawati', '1111128501', 'Dosen', 'Pendidikan Guru Pendidikan Anak Usia Dini', 33, 'Novi Nurdian', '1109119201', 'Dosen', 'Pendidikan Guru Sekolah Dasar', 0, '', '', '', '', 0, '', '', '', '', '', '2025-09-15 08:10:41', '2025-09-15 08:10:41', 31, 0),
(7, 'ARTIKEL PUBLIKASI', 'Strategi Guru Mengelola Kelas untuk Meningkatkan Disiplin dan Motivasi Belajar Siswa di Sekolah Dasar', 'https://journal.umg.ac.id/index.php/didaktika/article/view/9470', '', '', '2025-01-31', 33, 'Novi Nurdian', '1109119201', 'Dosen', 2, 'Pendidikan Guru Sekolah Dasar', 25, 'Muhammad Supian Sauri', '4333774675130243', 'Dosen', 'Pendidikan Guru Sekolah Dasar', 32, 'arminfani@stkipismbjm.ac.id', '1112098702', 'Dosen', 'Pendidikan Bahasa Inggris', 0, '', '', '', '', 0, '', '', '', '', '', '2025-09-15 13:11:00', '2025-09-15 13:21:08', 33, 33),
(8, 'ARTIKEL PUBLIKASI', 'Pendidikan Muatan Lokal Sebagai Penanaman Karakter Cinta Tanah Air', 'https://ejournal.undiksha.ac.id/index.php/JJPGSD/article/view/36414', 'https://ejournal.undiksha.ac.id/index.php/wkwkw', '1758070376_afa50e3d29c8a903bf28.pdf', '2021-06-30', 33, 'Novi Nurdian', '1109119201', 'Dosen', 2, 'Pendidikan Guru Sekolah Dasar', 31, 'Rizki Nugerahani Ilise', '1129049101', 'Dosen', 'Pendidikan Guru Pendidikan Anak Usia Dini', 0, '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '2025-09-15 13:13:40', '2025-09-17 07:52:56', 33, 1),
(10, 'ARTIKEL PUBLIKASI', 'Implementasi Keterampilan Dasar Mengajar Mahasiswa PGSD dalam Praktik Manajemen Kelas', 'https://www.putrapublisher.org/ojs/index.php/jspaud/article/view/986', '', '', '2025-07-20', 33, 'Novi Nurdian', '1109119201', 'Dosen', 2, 'Pendidikan Guru Sekolah Dasar', 27, 'Novi Suma Setyawati', '1111128501', 'Dosen', 'Pendidikan Guru Pendidikan Anak Usia Dini', 0, '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '2025-09-15 13:22:47', '2025-09-17 07:04:18', 33, 1),
(11, 'PENELITIAN', 'jaosdoisad', 'https://wkkwk.com/asjdiq', '', '', '2025-08-30', 28, 'Maulidha, M.Pd', '1129099003', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 0, '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '<p>oijoisd ojj osdjfoisf j<br>sdfsdfs<br>Sdfsfsdf</p>', '2025-09-17 07:23:35', '2025-09-17 07:23:35', 28, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `id_role` tinyint NOT NULL,
  `nama_role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `slug_role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `multi_role` mediumtext COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password_asli` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_kelamin` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `jabatan_fungsional` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `jabatan_struktural` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `motto_kerja` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_identitas` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `tempat_lahir` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `status_perkawinan` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `kewarganegaraan` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `asal_sekolah` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_ijazah` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_ijazah` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `nilai_rata_rata` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_ayah` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp_ayah` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `pekerjaan_ayah` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_ibu` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp_ibu` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `pekerjaan_ibu` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_wali` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp_wali` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `pekerjaan_wali` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `sumber_informasi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_program_studi` bigint NOT NULL,
  `jenjang_program_studi` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `singkatan_program_studi` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_tahun_akademik_diterima` bigint NOT NULL,
  `tahun_akademik_diterima` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe_tahun_akademik` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `id_tahun_akademik_lulus` bigint NOT NULL,
  `tahun_akademik_lulus` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe_tahun_akademik_lulus` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `semester` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `biaya_pendaftaran` int NOT NULL,
  `biaya_almamater` int NOT NULL,
  `biaya_ktm` int NOT NULL,
  `biaya_uang_gedung` int NOT NULL,
  `id_spp` bigint NOT NULL,
  `nama_spp` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `biaya_spp` int NOT NULL,
  `biaya_uts` int NOT NULL,
  `biaya_uas` int NOT NULL,
  `biaya_ldkm` int NOT NULL,
  `biaya_mbkm` int NOT NULL,
  `biaya_bimbingan_skripsi` int NOT NULL,
  `biaya_seminar_proposal` int NOT NULL,
  `biaya_sidang_skripsi` int NOT NULL,
  `biaya_yudisium` int NOT NULL,
  `biaya_wisuda` int NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `token_reset_password` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token_reset_password_at` datetime DEFAULT NULL,
  `mendaftar_at` datetime DEFAULT NULL,
  `diterima_at` datetime DEFAULT NULL,
  `status_akun` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_role`, `nama_role`, `slug_role`, `multi_role`, `nama`, `username`, `email`, `password`, `password_asli`, `foto`, `jenis_kelamin`, `alamat`, `no_hp`, `jabatan_fungsional`, `jabatan_struktural`, `motto_kerja`, `nomor_identitas`, `tempat_lahir`, `tanggal_lahir`, `agama`, `status_perkawinan`, `kewarganegaraan`, `asal_sekolah`, `nomor_ijazah`, `tahun_ijazah`, `nilai_rata_rata`, `nama_ayah`, `no_hp_ayah`, `pekerjaan_ayah`, `nama_ibu`, `no_hp_ibu`, `pekerjaan_ibu`, `nama_wali`, `no_hp_wali`, `pekerjaan_wali`, `sumber_informasi`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `id_tahun_akademik_diterima`, `tahun_akademik_diterima`, `tipe_tahun_akademik`, `id_tahun_akademik_lulus`, `tahun_akademik_lulus`, `tipe_tahun_akademik_lulus`, `semester`, `biaya_pendaftaran`, `biaya_almamater`, `biaya_ktm`, `biaya_uang_gedung`, `id_spp`, `nama_spp`, `biaya_spp`, `biaya_uts`, `biaya_uas`, `biaya_ldkm`, `biaya_mbkm`, `biaya_bimbingan_skripsi`, `biaya_seminar_proposal`, `biaya_sidang_skripsi`, `biaya_yudisium`, `biaya_wisuda`, `status`, `token_reset_password`, `token_reset_password_at`, `mendaftar_at`, `diterima_at`, `status_akun`, `created_at`, `updated_at`) VALUES
(1, 1, 'Superadmin', 'superadmin', '', 'Superadmin', 'superadmin', '', '$2y$10$mVEvojJB5S6yx0DpBklmYOFSmvI6k8WqqKuAZxLu7w3dFGBXxXLqa', '', '1701744923_ef8be205f9a3eefa1576.jpg', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', NULL, NULL, NULL, 'ENABLE', '2022-10-21 14:14:28', '2025-08-30 20:29:56'),
(3, 2, 'Keuangan', 'keuangan', '', 'Keuangan', 'keuangan', '', '$2y$10$.kbDhl4hTwmXFAdRWuguC.GNtrksW2UZ6aFilRgZ/HkdsSGxT6M9a', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2024-04-27 20:10:01', '2025-08-31 10:55:01'),
(4, 3, 'Waka Akademik', 'waka-akademik', '', 'Waka Akademik', 'wakaakademik', '', '$2y$10$sSUYi5pEYrhk3NnzEviHAeWSBUQPbubKEfeFI9p6k/chOZHvaUbA6', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-08-18 16:37:32', '2025-08-31 10:55:17'),
(10, 6, 'Staf Akademik', 'staf-akademik', '', 'Staf Akademik', 'stafakademik', '', '$2y$10$cVOuhN4t.CRTY5hGJqChmuRGtH1mwq4lCB47RX6GcQVkcBFj.M8eq', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-08-31 10:54:21', '2025-09-01 08:52:33'),
(13, 7, 'Ketua', 'ketua', '', 'Pimpinan', 'pimpinan', '', '$2y$10$jfvwAmvzAAFKr5f6inVURebO.tFhMPi5asXCiPbjcnDzmWXFEjjzO', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:04:46', '2025-09-17 04:55:40'),
(14, 8, 'Kaprodi', 'kaprodi', '', 'Kaprodi', 'kaprodi', '', '$2y$10$FJPtan1wLkj3MH8gzoGtfeLnrGsFFOWpSzLdjHp4wORAkvRQiZXrq', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:13:49', '2025-09-01 09:14:28'),
(15, 9, 'Waka Kemahasiswaan dan Kerja Sama', 'waka-kemahasiswaan-kerjasama', '', 'Waka Kemahasiswaan Dan Kerja Sama', 'wakakemahasiswaan', '', '$2y$10$/wny.1lBZEF7K3eEPbidSOme4RGvXpBBto.OXdVz71ltD1Ixw1yAK', '', '', 'Perempuan', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:22:04', '2025-09-02 07:47:26'),
(16, 10, 'LPM', 'lpm', '', 'LPM', 'lpm', '', '$2y$10$g6rORBGtEXAZ9Zquc6oia.mV7ausdmb9BDFTb02ZzqQ96VdqTx5ey', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:28:28', '2025-09-01 09:28:28'),
(17, 11, 'LPPM', 'lppm', '', 'LPPM', 'lppm', '', '$2y$10$f1B1ltfX0ccz/72TPH7dYu41WclqFHl.EAfZTyBYdaHmEP6F1KSOm', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:34:18', '2025-09-01 09:34:18'),
(18, 12, 'Staf Administrasi', 'staf-administrasi', '', 'Staf Administrasi', 'stafadministrasi', '', '$2y$10$uJxMgVOITLjYWh3M83qZ9.fk8wFQfi/yE0PtWi5qJln8CM74BYKmO', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:41:10', '2025-09-01 09:41:10'),
(19, 13, 'Pustakawan', 'pustakawan', '', 'Pustakawan', 'pustakawan', '', '$2y$10$yIiHMru9yBXAF7LHUO81NO/dmBPlN5x8t09R.odC9loudHc2EtyaW', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:44:06', '2025-09-01 09:44:06'),
(20, 14, 'Biro Alumni', 'biro-alumni', '', 'Biro Alumni', 'biroalumni', '', '$2y$10$/kNT6RPw25n8BkBAU74xZ.P7zDDDdo26/RvVsTBQSHZyeuOisifr.', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:45:52', '2025-09-01 09:45:52'),
(21, 15, 'UTP PLP', 'upt-plp', '', 'UPT PLP', 'uptplp', '', '$2y$10$IhIHmUr3HeFZCCPfNxMf5OYyVgezWxG.CcUuyyobpAxc1MEWV9DWy', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:49:14', '2025-09-01 09:49:14'),
(25, 4, 'Dosen', 'dosen', '{\"15\":{\"nama_role\":\"UTP PLP\",\"slug_role\":\"upt-plp\"}}', 'Muhammad Supian Sauri', '4333774675130243', 'Supian@stkipismbjm.ac.id', '$2y$10$k8ZUv95Owici3U9BtA3mY.TS1gwuwNg6xFTn14XlbhQXdktv4mJAy', '4333774675130243', '', 'Laki-laki', 'Jl. Cemara Raya No 13, Banjarmasin', '082140282996', '-', 'Dosen', 'Menuntut ilmu tidak pernah mengenal waktu', '4333774675130243', 'Kelua', '1996-10-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:00:25', '2025-09-16 10:07:44'),
(27, 4, 'Dosen', 'dosen', '{\"10\":{\"nama_role\":\"LPM\",\"slug_role\":\"lpm\"}}', 'Novi Suma Setyawati', '1111128501', 'novisuma@stkipismbjm.ac.id', '$2y$10$ggFdbebvxO4Lx6toFpk/T.4ZRHoH6sRwp2sQhp7lbfCoqFEzZYinW', '1111128501', '1758023427_c0bc96ba3bdeb77a7038.jpg', 'Perempuan', 'Jln Karang Anyar II blok j/2 Banjarbaru Utara', '085171511851', 'Asisten Ahli', 'LPM', 'Kerja Cepat, Kerja Cerdas dan bertanggung jawab', '1111128501', 'Banjarmasin', '1985-12-11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:01:09', '2025-09-16 18:50:46'),
(28, 4, 'Dosen', 'dosen', '{\"8\":{\"nama_role\":\"Kaprodi\",\"slug_role\":\"kaprodi\"}}', 'Maulidha, M.Pd', '1129099003', 'maulidha@stkipismbjm.ac.id', '$2y$10$U.7k/i9POhFlNBTxcOMcieoP4FH5gTuccc24hiICitEggWni6kcVe', '1129099003', '', 'Perempuan', 'Jl sungai lulut km 7, 1 komplek graha sejahtera blok A1 no 52', '085654545320', '-', 'Ketua Prodi PAUD', 'Lakukan yang terbaik dan jangan pernah menunda kegiatan', '1129099003', 'Banjarmasin', '1990-09-29', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:01:23', '2025-09-11 18:12:08'),
(29, 4, 'Dosen', 'dosen', '', 'Zulparis', '1111078702', '', '$2y$10$.ysbjVAxX/Dc.u.GK1N5S.XrVVr6asiW0BuXhV.J2IL74pAe6xvlK', '1111078702', '', 'Laki-laki', 'Komplek Annisa tahap 4 blok A nomor 15', '', 'Asisten Ahli', 'Dosen', 'Jangan takut mengcoba', '1111078702', 'Kuripan,Kec Kuripan Kabupaten Barito Kuala', '1987-07-10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:03:50', '2025-09-11 18:08:38'),
(31, 4, 'Dosen', 'dosen', '', 'Rizki Nugerahani Ilise', '1129049101', 'rizkinugerahani@gmail.com', '$2y$10$U9OpdgodiIPqNJ8kt775.ObFWS/YcJjSdkboJ0fLD.amYE1Fnv8ki', '1129049101', '1757898370_d4fe97951264d705b4a2.jpg', 'Perempuan', 'Jl Trans Kalimantan RT 17', '085345673542', 'Asisten Ahli', 'Kepala lppm', 'Semangat berkarya visioners dan tunjukkan kreativitas diri', '1129049101', 'Berangas Barat', '1991-04-29', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:10:02', '2025-09-15 09:03:12'),
(32, 4, 'Dosen', 'dosen', '{\"8\":{\"nama_role\":\"Kaprodi\",\"slug_role\":\"kaprodi\"}}', 'Armin Fani', '1112098702', 'arminfani@stkipismbjm.ac.id', '$2y$10$GOdlXKQ4yDfiA4/4eFV0RuSv6KHvpsAIlv6w6GEmtd9oqiYohnH3W', '1112098702', '1757994739_fab19f17b8f0ff489da4.jpg', 'Laki-laki', 'Jl. Bumi mas Raya Komplek Bumi Mas 5 no 80 Banjarmasin Selatan.', '082143161285', 'Asisten Ahli', 'Ketua Program Studi Pendidikan Bahasa Inggris', 'Inspiring minds, shaping the future.', '1112098702', 'arminfani@stkipismbjm.ac.id', '1987-09-12', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:34:15', '2025-09-16 10:52:19'),
(33, 4, 'Dosen', 'dosen', '{\"8\":{\"nama_role\":\"Kaprodi\",\"slug_role\":\"kaprodi\"}}', 'Novi Nurdian', '1109119201', 'novi@stkipism.ac.id', '$2y$10$XxUEQUNg5vdBVobnc9XwmuzAHEOfYrlRDz/pLk8eSrtKQ42VVVbEi', '1109119201', '1757902439_a586ea7df903d09cad2f.jpg', 'Perempuan', 'Komplek griya rosela blok A-15, guntung manggis, kota banjarbaru', '085348484565', 'Asisten ahli', 'Ketua Prodi PGSD', 'Berbagi ilmu itu keren! Terus semangat belajar dan berkarya, karena ilmu yang bermanfaat adalah penghargaan paling berharga.', '1109119201', 'Sidoarjo', '1992-11-09', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:57:57', '2025-09-16 10:54:20'),
(34, 4, 'Dosen', 'dosen', '{\"3\":{\"nama_role\":\"Waka Akademik\",\"slug_role\":\"waka-akademik\"}}', 'Vebrianti Umar, M.Pd', '1108029104', 'umar@humasoftstudio.com', '$2y$10$zETDeNwp0czQDkmZPny2wO/6MHTD9UWrveQQDE63H4eqcgZqVkOm6', '1108029104', '', 'Perempuan', 'Jl. Subur Makmur 2, Landasan Ulin', '0895803196062', 'Asisten Ahli', 'Wakil Ketua Bidang Akademik', 'Niatkan untuk bekerja dengan penuh tanggung jawab, harus punya target dan harus selesai tepat waktu.', '1108029104', 'Bitung', '1991-02-08', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:59:56', '2025-09-16 10:44:59'),
(35, 4, 'Dosen', 'dosen', '{\"9\":{\"nama_role\":\"Waka Kemahasiswaan dan Kerja Sama\",\"slug_role\":\"waka-kemahasiswaan-kerjasama\"},\"17\":{\"nama_role\":\"Admin Utama\",\"slug_role\":\"admin-utama\"}}', 'Yuliana Nurhayati, M.Pd.', '1109079302', 'ana@stkipismbjm.ac.id', '$2y$10$yh5KJUWVvGC38EjXI6c02eKgBwid8nLD3z/mWFckPOy9uh7C3AQxO', '1109079302', '', 'Perempuan', 'Jl.Dharma Bakti 2 Komplek budair permai Blok B /66', '081258026807', 'Belum Ada', 'Wakil Ketua Bidang Kerjasama dan Kemahasiswaan', '\" Jika Lelah Menjalani Profesimu Maka Istirahatlah Sejenak dan Lanjutkan dengan Ide Barumu\"', '1109079302', 'Ponorogo', '1993-07-09', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 13:20:13', '2025-09-12 12:22:07'),
(36, 17, 'Admin Utama', 'admin-utama', '', 'Admin Utama', 'adminutama', '', '$2y$10$9DYUNHjLRKoy6MxfnjapUOPDG3KZa3QfBcoY2gE4N0Vws4fMWI6H6', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-02 14:10:27', '2025-09-02 14:10:27'),
(37, 16, 'Tendik', 'tendik', '{\"12\":{\"nama_role\":\"Staf Administrasi\",\"slug_role\":\"staf-administrasi\"},\"13\":{\"nama_role\":\"Pustakawan\",\"slug_role\":\"pustakawan\"}}', 'Muhammad Juanda', '63710104108310004', 'juandapustaka@gmail.com', '$2y$10$XQpOqiGVHpBZ5aTg03HDcO03J7Ckus4EWo9LGH7Y91OyPSkZaup7q', '63710104108310004', '1758023507_9927ba31262032ce898a.jpg', 'Laki-laki', 'Jl. Gerilya Komp.Bumi Handayani 2', '08194101983', 'Pustakawan', 'Kepala Perpustakaan', 'Semangat, kerja keras dan kebersamaan', '63710104108310004', 'HSS', '1983-10-04', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-03 14:05:04', '2025-09-16 18:51:47'),
(39, 16, 'Tendik', 'tendik', '', 'Nurul Fitriyani, SE., MA.', '6371056409780006', 'nurulfitriyani241979@gmail.com', '$2y$10$lf5VWBi7vrjQ0/urDDZo0uie0DvgusUAgaudJt9Rtge6zfyFW9I4u', '6371056409780006', '1758025571_b6d6dbcaa485a111eb7f.jpg', 'Perempuan', 'Jl. Kacapiring II No.26 Rt.002 Rw.001 Kel. Kertak Baru Ilir Kec. Banjarmasin Tengah Banjarmasin 70111', '081251805567', '-', 'Kepala Administrasi Akademik dan Kemahasiswaan', 'Bekerja optimal, tampilkan sis yang terbaik dari diri', '6371056409780006', 'Bandung', '1978-09-24', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-04 12:58:24', '2025-09-16 19:26:11'),
(40, 4, 'Dosen', 'dosen', '', 'Muhammad Agus Safrian Nur', '0158768669130093', 'agus@stkipismbjm.ac.id', '$2y$10$w9KShDVMZd7uvN8eJG81OOIVgqIS9ZD/afLWm5YwX5IMah5McMdHC', '00000000', '1757903155_5888b0e0e7b289cd1c57.jpg', 'Laki-laki', 'Jalan Veteran Km. 5.5 Gang Mujahidin No. 74 Rt. 024, Kelurahan Sungai Lulut, Kecamatan Banjarmasin Timur.', '085390556813', '-', '-', '\" Fokus pada tujuan, capai kesuksesan \"', '0158768669130093', 'Banjarmasin', '1990-08-26', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-04 13:57:57', '2025-09-15 09:25:55'),
(41, 16, 'Tendik', 'tendik', '{\"2\":{\"nama_role\":\"Keuangan\",\"slug_role\":\"keuangan\"}}', 'Halima Chairia', '6371015011800013', 'halimachairia7@gmail.com', '$2y$10$qfxU9i2p65274dH4ihbz6.Ff2aoms2t8xhW7hXr30.dx4IL3tkfci', '6371015011800013', '', 'Perempuan', 'Komplek Banjar Indah Permai jl. Sintuk II No. 183 RT. 13 Banjarmasin', '085251626793', '', 'Kabag. Administrasi Umum dan Keuangan', 'Sesulit apa pun pekerjaanmu pasti ada penyelesaiannya', '6371015011800013', 'Banjarmasin', '1980-11-10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-04 14:31:38', '2025-09-11 18:12:53'),
(42, 17, 'Admin Utama', 'admin-utama', '', 'Admin 2', 'adminvisioner', '', '$2y$10$/fsqlu/uCBgrdC9PuB4jlu5QbvShxNG1A7LpvvH0I6OdipVPkZSB.', 'senyumdulu', '', 'Perempuan', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-04 17:03:42', '2025-09-11 19:22:24'),
(43, 4, 'Dosen', 'dosen', '', 'Tati Akhbaryah, S.S., S.Pd., M.Pd.', '0', 'tatiahatta27@gmail.com', '$2y$10$vfM0PjUE9UFhyzXdcenqaOj/ccPHOR19oH776YF9Ukl9Ro3yZ5r3a', 'tatia2711', '', 'Perempuan', 'Kompleks Pembanginan I jl. Sebatung no 10 Banjarmasin', '081347693805', 'Dosen', '-', 'Diam, Amati, Kerjakan', '0', 'Jakarta', '1968-11-27', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-04 18:41:51', '2025-09-04 18:41:51'),
(46, 4, 'Dosen', 'dosen', '', 'Abdul Aziz', '1110079002', 'aziz@stkipismbjm.ac.id', '$2y$10$jPB/8.a.qfFePjOayeNWiuxARGWUie12iVLG/34GsHjAtf5eBaZd.', '1110079002', '1757902115_b01898028ec94e9e6376.jpg', 'Laki-laki', 'Jalan AMD, Komplek Ar Raudah, no 44', '082250582011', 'tidak ada', 'tidak ada', 'Berani berimajinasi, berani berdedikasi', '1110079002', 'Sungai Pinang', '1990-09-12', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-12 12:04:50', '2025-09-15 09:08:35'),
(48, 4, 'Dosen', 'dosen', '', 'Norhayati K', '1234', 'norhayati.dr25@gmail.com', '$2y$10$HY5oabGAUDeLW/FGgDs7JuH0Eotqq33QDjQmuGwTp9pjsBqwImgci', 'Lulusberkah25', '', 'Perempuan', 'Komplek Citra Persada Asri, Lestari 1 no 32 Sungai besar, Banjarbaru', '082154244276', '-', '-', 'Tetapkan tenang, senang dan sukses', '1234', 'Tumpung Laung', '1993-12-25', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-12 14:21:58', '2025-09-15 09:08:30'),
(49, 16, 'Tendik', 'tendik', '', 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', 'nazemi6879@gmail.com', '$2y$10$pCidU2H51dMscv6ie7TOhu26g04DGs2ykvRfh1ZW/iZIdgRa.I0T2', 'Mili789?', '1758024635_9a6e7fad932ff2ef84f6.jpg', 'Perempuan', 'Jl. Malkon temon Komp. Buana permai Rt. 10 Kota Banjarmasin, kalimantan selatan', '081250134883', '-', 'Operator IT', 'Bekerja adalah energi harapan dan musuh kegagalan', '6371044111040002', 'Banjarmasin', '2004-11-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-12 14:27:59', '2025-09-16 19:10:36'),
(50, 16, 'Tendik', 'tendik', '', 'Nurul Fitriyani, SE., MA.', 'Dyandra 1503', 'noufysabilal@yahoo.co.id', '$2y$10$wSZVj0nc6osDl5yiEcfVQumDwctzCw541OEGEff79bESRz34zv5hW', 'Dyandra1503', '', 'Perempuan', 'Jl KACAPIRING 2 NO.26 RT.002 RW.001 KEL. KERTAK BARU ILIR KEC.BANJARMASIN TENGAH BANJARMASIN 70111', '081251805567', '-', 'Kepala Administrasi Akademik dan Kemahasiswaan', 'Bekerja Optimal, lakukan yang terbaik', 'Dyandra 1503', 'Bandung', '1978-09-24', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-15 14:58:30', '2025-09-15 14:58:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dosen_pendamping`
--
ALTER TABLE `dosen_pendamping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_kegiatan`
--
ALTER TABLE `jadwal_kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kalender_akademik`
--
ALTER TABLE `kalender_akademik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_dana_masuk`
--
ALTER TABLE `kategori_dana_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_penyusutan_inventaris`
--
ALTER TABLE `kategori_penyusutan_inventaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keuangan`
--
ALTER TABLE `keuangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan_pertanggungjawaban`
--
ALTER TABLE `laporan_pertanggungjawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan_promosi`
--
ALTER TABLE `laporan_promosi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkpt`
--
ALTER TABLE `lkpt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_keuangan`
--
ALTER TABLE `log_keuangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_login`
--
ALTER TABLE `log_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa_praktik_lapangan`
--
ALTER TABLE `mahasiswa_praktik_lapangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_dana`
--
ALTER TABLE `master_dana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran_mahasiswa`
--
ALTER TABLE `pembayaran_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pencatatan_surat`
--
ALTER TABLE `pencatatan_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengajaran`
--
ALTER TABLE `pengajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengembangan_kompetensi`
--
ALTER TABLE `pengembangan_kompetensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penyusutan_inventaris`
--
ALTER TABLE `penyusutan_inventaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perencanaan_pimpinan`
--
ALTER TABLE `perencanaan_pimpinan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permintaan_legalisir`
--
ALTER TABLE `permintaan_legalisir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perpustakaan`
--
ALTER TABLE `perpustakaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `responden`
--
ALTER TABLE `responden`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spmi`
--
ALTER TABLE `spmi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standar_pt`
--
ALTER TABLE `standar_pt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_mahasiswa`
--
ALTER TABLE `status_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_peringatan`
--
ALTER TABLE `surat_peringatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_tugas_penelitian`
--
ALTER TABLE `surat_tugas_penelitian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tagihan_mahasiswa`
--
ALTER TABLE `tagihan_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tarif_spp`
--
ALTER TABLE `tarif_spp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tracer_studi`
--
ALTER TABLE `tracer_studi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tri_dharma`
--
ALTER TABLE `tri_dharma`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dosen_pendamping`
--
ALTER TABLE `dosen_pendamping`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jadwal_kegiatan`
--
ALTER TABLE `jadwal_kegiatan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kalender_akademik`
--
ALTER TABLE `kalender_akademik`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kategori_dana_masuk`
--
ALTER TABLE `kategori_dana_masuk`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kategori_penyusutan_inventaris`
--
ALTER TABLE `kategori_penyusutan_inventaris`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `keuangan`
--
ALTER TABLE `keuangan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `laporan_pertanggungjawaban`
--
ALTER TABLE `laporan_pertanggungjawaban`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `laporan_promosi`
--
ALTER TABLE `laporan_promosi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lkpt`
--
ALTER TABLE `lkpt`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `log_keuangan`
--
ALTER TABLE `log_keuangan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `log_login`
--
ALTER TABLE `log_login`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=629;

--
-- AUTO_INCREMENT for table `mahasiswa_praktik_lapangan`
--
ALTER TABLE `mahasiswa_praktik_lapangan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `master_dana`
--
ALTER TABLE `master_dana`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pembayaran_mahasiswa`
--
ALTER TABLE `pembayaran_mahasiswa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pencatatan_surat`
--
ALTER TABLE `pencatatan_surat`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengajaran`
--
ALTER TABLE `pengajaran`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pengembangan_kompetensi`
--
ALTER TABLE `pengembangan_kompetensi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penyusutan_inventaris`
--
ALTER TABLE `penyusutan_inventaris`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `perencanaan_pimpinan`
--
ALTER TABLE `perencanaan_pimpinan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permintaan_legalisir`
--
ALTER TABLE `permintaan_legalisir`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `perpustakaan`
--
ALTER TABLE `perpustakaan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `responden`
--
ALTER TABLE `responden`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `spmi`
--
ALTER TABLE `spmi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `standar_pt`
--
ALTER TABLE `standar_pt`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `status_mahasiswa`
--
ALTER TABLE `status_mahasiswa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `surat_peringatan`
--
ALTER TABLE `surat_peringatan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surat_tugas_penelitian`
--
ALTER TABLE `surat_tugas_penelitian`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tagihan_mahasiswa`
--
ALTER TABLE `tagihan_mahasiswa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tarif_spp`
--
ALTER TABLE `tarif_spp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tracer_studi`
--
ALTER TABLE `tracer_studi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tri_dharma`
--
ALTER TABLE `tri_dharma`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
