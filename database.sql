-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 03 Sep 2025 pada 14.01
-- Versi server: 8.0.30
-- Versi PHP: 8.3.9

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
-- Struktur dari tabel `app_settings`
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
-- Dumping data untuk tabel `app_settings`
--

INSERT INTO `app_settings` (`id`, `nama_aplikasi`, `nama_perusahaan`, `deskripsi`, `logo`, `favicon`, `no_hp`, `alamat`, `maps`, `ts_2_tanggal_awal`, `ts_2_tanggal_akhir`, `ts_1_tanggal_awal`, `ts_1_tanggal_akhir`, `ts_tanggal_awal`, `ts_tanggal_akhir`, `buka_pendaftaran_mahasiswa`, `created_at`, `updated_at`) VALUES
(1, 'STKIP ISM Banjarmasin', 'Humasoft Studio Teknologi', 'Kampus Visioner STKIP ISM Banjarmasin', 'logo.png', 'favicon.png', '0', 'Jl. Malkon Temon Jl. Sultan Adam No.12, RT.23, Surgi Mufti, Kec. Banjarmasin Utara, Kota Banjarmasin, Kalimantan Selatan 70122', '', '2024-09-08', '2025-03-04', '2025-03-05', '2025-07-23', '2025-07-24', '2026-03-17', 'Buka', '2024-09-17 13:06:51', '2025-09-01 08:47:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_kegiatan`
--

CREATE TABLE `jadwal_kegiatan` (
  `id` bigint NOT NULL,
  `kategori` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal_kegiatan`
--

INSERT INTO `jadwal_kegiatan` (`id`, `kategori`, `judul`, `tautan`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(2, 'MBKM', 'Jadwal MBKM 2024 - 2025 Ganjil', 'https://www.researchgate.net/profile/Aceng-Wahid/publication/346397070_Analisis_Metode_Waterfall_Untuk_Pengembangan_Sistem_Informasi/links/5fbfa91092851c933f5d76b6/Analisis-Metode-Waterfall-Untuk-Pengembangan-Sistem-Informasi.pdf', '2025-09-01 10:09:28', '2025-09-01 10:09:28', 4, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_kuliah`
--

CREATE TABLE `jadwal_kuliah` (
  `id` bigint NOT NULL,
  `id_program_studi` bigint NOT NULL,
  `jenjang_program_studi` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `singkatan_program_studi` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal_kuliah`
--

INSERT INTO `jadwal_kuliah` (`id`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `judul`, `tautan`, `created_at`, `updated_at`) VALUES
(2, 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '2024/2025 Ganjil', 'https://translate.google.com/?sl=en&tl=id&text=teknologi%20rekayasa%20perangkatan%20lunak%20terapan%20sistem&op=translate', '2025-09-02 18:31:04', '2025-09-02 18:31:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kalender_akademik`
--

CREATE TABLE `kalender_akademik` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kalender_akademik`
--

INSERT INTO `kalender_akademik` (`id`, `judul`, `tautan`, `created_at`, `updated_at`) VALUES
(1, 'Kalender Akademik Semester Ganjil Tahun 2024-2025', 'https://www.youtube.com/', '2025-08-20 06:07:59', '2025-08-31 06:31:22'),
(2, 'Kalender Akademik Semester Genap Tahun 2024-2025', 'https://www.youtube.com/', '2025-08-28 21:04:31', '2025-08-31 06:31:15'),
(3, 'Kalender Akademik Semester Ganjil Tahun 2025-2026', 'https://www.youtube.com/watch?v=sWeVcbGhBv0&list=RDsWeVcbGhBv0&start_radio=1', '2025-08-28 21:05:03', '2025-08-31 06:31:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_dana_masuk`
--

CREATE TABLE `kategori_dana_masuk` (
  `id` bigint NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_dana_masuk`
--

INSERT INTO `kategori_dana_masuk` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Mahasiswa', '2025-08-29 22:42:15', '2025-08-29 22:42:15'),
(2, 'Kementerian/ Yayasan', '2025-08-29 22:42:15', '2025-08-29 22:42:15'),
(3, 'PT Sendiri', '2025-08-29 22:42:15', '2025-08-29 22:42:15'),
(4, 'Sumber Lain (Dalam dan Luar Negeri)', '2025-08-29 22:42:15', '2025-08-29 22:42:15'),
(5, 'Dana Penelitian dan PKM', '2025-08-29 22:42:15', '2025-08-29 22:42:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_penyusutan_inventaris`
--

CREATE TABLE `kategori_penyusutan_inventaris` (
  `id` bigint NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_penyusutan_inventaris`
--

INSERT INTO `kategori_penyusutan_inventaris` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Tanah', '2025-08-27 00:45:46', '2025-08-27 00:45:46'),
(2, 'Bangunan', '2025-08-27 00:45:46', '2025-08-27 00:45:46'),
(3, 'Inventaris Kantor', '2025-08-27 00:45:46', '2025-08-27 00:45:46'),
(4, 'Perpustakaan', '2025-08-27 00:45:46', '2025-08-27 00:45:46'),
(5, 'Laboratorium', '2025-08-27 00:45:46', '2025-08-27 00:45:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keuangan`
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
-- Dumping data untuk tabel `keuangan`
--

INSERT INTO `keuangan` (`id`, `jenis`, `id_kategori_dana`, `nama_kategori_dana`, `nominal`, `id_sumber_dana`, `nama_sumber_dana`, `catatan`, `tanggal`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Masuk', 1, 'Mahasiswa', 2500000, 1, 'SPP', '', '2025-08-30 06:25:00', '2025-08-30 06:25:36', '2025-08-30 07:59:49', 3, 1),
(2, 'Keluar', 11, 'Grup 1', -10000000, 18, 'Dana Operasional Proses Pembelajaran', '', '2025-08-30 06:30:00', '2025-08-30 06:31:10', '2025-08-30 06:31:10', 3, 0),
(3, 'Keluar', 11, 'Grup 1', -1000000, 18, 'Dana Operasional Proses Pembelajaran', '', '2025-08-30 07:33:00', '2025-08-30 07:34:01', '2025-08-30 07:34:01', 1, 0),
(4, 'Masuk', 1, 'Mahasiswa', 30000000, 1, 'SPP', '', '2025-08-28 07:34:00', '2025-08-30 07:34:40', '2025-08-30 07:34:40', 1, 0),
(5, 'Masuk', 1, 'Mahasiswa', 10000000, 2, 'Sumbangan Lainnya', 'donasi mahasiswa', '2025-08-30 10:39:00', '2025-08-30 10:40:09', '2025-08-30 10:40:09', 1, 0),
(6, 'Masuk', 2, 'Kementerian/ Yayasan', 5000000, 4, 'Anggaran Rutin', '', '2025-08-30 10:40:00', '2025-08-30 10:40:30', '2025-08-30 10:40:30', 1, 0),
(7, 'Keluar', 12, 'Grup 2', -900000, 25, 'Dana Penelitian', '', '2025-08-25 15:45:00', '2025-08-30 15:45:42', '2025-08-30 15:45:42', 1, 0),
(8, 'Keluar', 12, 'Grup 2', -1500000, 26, 'Dana PKM', '', '2025-08-28 16:17:00', '2025-08-30 16:18:15', '2025-08-30 16:18:15', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_promosi`
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
-- Struktur dari tabel `log_keuangan`
--

CREATE TABLE `log_keuangan` (
  `id` bigint NOT NULL,
  `id_keuangan` bigint NOT NULL,
  `jenis_keuangan` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_kategori_dana_masuk` bigint NOT NULL,
  `nama_kategori_dana_masuk` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `id_sumber_dana` bigint NOT NULL,
  `nama_sumber_dana` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nominal_sebelum` int NOT NULL,
  `nominal_setelah` int NOT NULL,
  `catatan_sebelum` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `catatan_setelah` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_sebelum` datetime NOT NULL,
  `tanggal_setelah` datetime NOT NULL,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `log_keuangan`
--

INSERT INTO `log_keuangan` (`id`, `id_keuangan`, `jenis_keuangan`, `id_kategori_dana_masuk`, `nama_kategori_dana_masuk`, `id_sumber_dana`, `nama_sumber_dana`, `nominal_sebelum`, `nominal_setelah`, `catatan_sebelum`, `catatan_setelah`, `tanggal_sebelum`, `tanggal_setelah`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'Masuk', 1, 'Mahasiswa', 1, 'SPP', 2500000, 2500000, '0', '0', '2025-08-30 06:25:00', '2025-08-30 06:25:00', 2025, 2025, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_login`
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
-- Dumping data untuk tabel `log_login`
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
(239, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '::1', 'Success', '2025-09-03 20:49:05', '2025-09-03 20:49:05'),
(240, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '::1', 'Success', '2025-09-03 20:58:30', '2025-09-03 20:58:30'),
(241, 33, 4, 'Novi Nurdian', '1109119201', '::1', 'Success', '2025-09-03 20:59:43', '2025-09-03 20:59:43'),
(242, 37, 16, 'Muhammad Juanda', '63710104108310004', '::1', 'Success', '2025-09-03 21:00:55', '2025-09-03 21:00:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_dana`
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
-- Dumping data untuk tabel `master_dana`
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
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` bigint NOT NULL,
  `id_program_studi` bigint NOT NULL,
  `jenjang_program_studi` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `singkatan_program_studi` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `judul`, `tautan`, `created_at`, `updated_at`) VALUES
(2, 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2025/2026 Ganjil', 'https://translate.google.com/?sl=en&tl=id&text=teknologi%20rekayasa%20perangkatan%20lunak%20terapan%20sistem&op=translate', '2025-09-02 18:27:20', '2025-09-02 18:27:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran_mahasiswa`
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
  `nominal` int NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_by` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran_mahasiswa`
--

INSERT INTO `pembayaran_mahasiswa` (`id`, `id_tagihan_mahasiswa`, `jenis_tagihan_mahasiswa`, `id_tahun_akademik`, `tahun_akademik`, `tipe_tahun_akademik`, `id_mahasiswa`, `nama_mahasiswa`, `nomor_identitas_mahasiswa`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `nominal`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(6, 7, 'PENDAFTARAN', 3, '2025/2026', 'Ganjil', 5, 'Fatwa Aulia', '362055401093', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 50000, 'Lunas', '2025-08-31 20:29:24', '2025-08-31 20:29:24', '1', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pencatatan_surat`
--

CREATE TABLE `pencatatan_surat` (
  `id` bigint NOT NULL,
  `jenis` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_surat` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `perihal` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penelitian_dosen`
--

CREATE TABLE `penelitian_dosen` (
  `id` bigint NOT NULL,
  `kategori` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembangan_kompetensi`
--

CREATE TABLE `pengembangan_kompetensi` (
  `id` bigint NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengembangan_kompetensi`
--

INSERT INTO `pengembangan_kompetensi` (`id`, `judul`, `tautan`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'iawiai', 'https://www.researchgate.net/profile/Aceng-Wahid/publication/346397070_Analisis_Metode_Waterfall_Untuk_Pengembangan_Sistem_Informasi/links/5fbfa91092851c933f5d76b6/Analisis-Metode-Waterfall-Untuk-Pengembangan-Sistem-Informasi.pdf', '2025-09-03 14:17:57', '2025-09-03 14:17:57', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyusutan_inventaris`
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
-- Dumping data untuk tabel `penyusutan_inventaris`
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
-- Struktur dari tabel `program_studi`
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
-- Dumping data untuk tabel `program_studi`
--

INSERT INTO `program_studi` (`id`, `jenjang`, `nama`, `singkatan`, `created_at`, `updated_at`) VALUES
(1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '2025-08-19 06:00:41', '2025-08-19 06:07:10'),
(2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2025-08-19 06:01:15', '2025-08-19 06:07:21'),
(3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '2025-08-19 06:01:58', '2025-08-19 06:07:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` tinyint NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `nama`, `slug`) VALUES
(1, 'Superadmin', 'superadmin'),
(2, 'Keuangan', 'keuangan'),
(3, 'Waka Akademik', 'waka-akademik'),
(4, 'Dosen', 'dosen'),
(5, 'Mahasiswa', 'mahasiswa'),
(6, 'Staf Akademik', 'staf-akademik'),
(7, 'Pimpinan', 'pimpinan'),
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
-- Struktur dari tabel `status_mahasiswa`
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
-- Struktur dari tabel `surat_peringatan`
--

CREATE TABLE `surat_peringatan` (
  `id` int NOT NULL,
  `nomor_surat` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tingkat_sp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `perihal` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `catatan` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `surat_peringatan`
--

INSERT INTO `surat_peringatan` (`id`, `nomor_surat`, `tingkat_sp`, `perihal`, `catatan`, `tautan`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'SK/MP2025/00123', 'SP 1', 'Dosen Merokok Dalam Kelas', '-', 'https://mail.google.com/mail/u/0/?usp=installed_webapp', '2025-09-03 20:56:34', '2025-09-03 20:57:31', 34, 34);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan_mahasiswa`
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
-- Struktur dari tabel `tahun_akademik`
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
-- Dumping data untuk tabel `tahun_akademik`
--

INSERT INTO `tahun_akademik` (`id`, `tahun_akademik`, `tipe`, `periode_mulai`, `periode_selesai`, `created_at`, `updated_at`) VALUES
(3, '2025/2026', 'Ganjil', '2025-09-01', '2026-01-31', '2025-08-18 21:16:55', '2025-09-01 12:52:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tarif_spp`
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `tracer_studi`
--

CREATE TABLE `tracer_studi` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tautan` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tracer_studi`
--

INSERT INTO `tracer_studi` (`id`, `judul`, `tautan`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(5, 'tracer studi 2024', 'https://fontawesome.com/search?q=book&ic=free&o=r', '2025-09-03 18:27:50', '2025-09-03 18:27:50', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `id_role`, `nama_role`, `slug_role`, `multi_role`, `nama`, `username`, `email`, `password`, `foto`, `jenis_kelamin`, `alamat`, `no_hp`, `jabatan_fungsional`, `jabatan_struktural`, `motto_kerja`, `nomor_identitas`, `tempat_lahir`, `tanggal_lahir`, `agama`, `status_perkawinan`, `kewarganegaraan`, `asal_sekolah`, `nomor_ijazah`, `tahun_ijazah`, `nilai_rata_rata`, `nama_ayah`, `no_hp_ayah`, `pekerjaan_ayah`, `nama_ibu`, `no_hp_ibu`, `pekerjaan_ibu`, `nama_wali`, `no_hp_wali`, `pekerjaan_wali`, `sumber_informasi`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `id_tahun_akademik_diterima`, `tahun_akademik_diterima`, `tipe_tahun_akademik`, `id_tahun_akademik_lulus`, `tahun_akademik_lulus`, `tipe_tahun_akademik_lulus`, `semester`, `biaya_pendaftaran`, `biaya_almamater`, `biaya_ktm`, `biaya_uang_gedung`, `id_spp`, `nama_spp`, `biaya_spp`, `biaya_uts`, `biaya_uas`, `biaya_ldkm`, `biaya_mbkm`, `biaya_bimbingan_skripsi`, `biaya_seminar_proposal`, `biaya_sidang_skripsi`, `biaya_yudisium`, `biaya_wisuda`, `status`, `token_reset_password`, `token_reset_password_at`, `mendaftar_at`, `diterima_at`, `status_akun`, `created_at`, `updated_at`) VALUES
(1, 1, 'Superadmin', 'superadmin', '', 'Superadmin', 'superadmin', '', '$2y$10$mVEvojJB5S6yx0DpBklmYOFSmvI6k8WqqKuAZxLu7w3dFGBXxXLqa', '1701744923_ef8be205f9a3eefa1576.jpg', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', NULL, NULL, NULL, 'ENABLE', '2022-10-21 14:14:28', '2025-08-30 20:29:56'),
(3, 2, 'Keuangan', 'keuangan', '', 'Keuangan', 'keuangan', '', '$2y$10$.kbDhl4hTwmXFAdRWuguC.GNtrksW2UZ6aFilRgZ/HkdsSGxT6M9a', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2024-04-27 20:10:01', '2025-08-31 10:55:01'),
(4, 3, 'Waka Akademik', 'waka-akademik', '', 'Waka Akademik', 'wakaakademik', '', '$2y$10$sSUYi5pEYrhk3NnzEviHAeWSBUQPbubKEfeFI9p6k/chOZHvaUbA6', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-08-18 16:37:32', '2025-08-31 10:55:17'),
(10, 6, 'Staf Akademik', 'staf-akademik', '', 'Staf Akademik', 'stafakademik', '', '$2y$10$cVOuhN4t.CRTY5hGJqChmuRGtH1mwq4lCB47RX6GcQVkcBFj.M8eq', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-08-31 10:54:21', '2025-09-01 08:52:33'),
(13, 7, 'Pimpinan', 'pimpinan', '', 'Pimpinan', 'pimpinan', '', '$2y$10$jfvwAmvzAAFKr5f6inVURebO.tFhMPi5asXCiPbjcnDzmWXFEjjzO', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:04:46', '2025-09-01 09:04:46'),
(14, 8, 'Kaprodi', 'kaprodi', '', 'Kaprodi', 'kaprodi', '', '$2y$10$FJPtan1wLkj3MH8gzoGtfeLnrGsFFOWpSzLdjHp4wORAkvRQiZXrq', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:13:49', '2025-09-01 09:14:28'),
(15, 9, 'Waka Kemahasiswaan dan Kerja Sama', 'waka-kemahasiswaan-kerjasama', '', 'Waka Kemahasiswaan Dan Kerja Sama', 'wakakemahasiswaan', '', '$2y$10$/wny.1lBZEF7K3eEPbidSOme4RGvXpBBto.OXdVz71ltD1Ixw1yAK', '', 'Perempuan', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:22:04', '2025-09-02 07:47:26'),
(16, 10, 'LPM', 'lpm', '', 'LPM', 'lpm', '', '$2y$10$g6rORBGtEXAZ9Zquc6oia.mV7ausdmb9BDFTb02ZzqQ96VdqTx5ey', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:28:28', '2025-09-01 09:28:28'),
(17, 11, 'LPPM', 'lppm', '', 'LPPM', 'lppm', '', '$2y$10$f1B1ltfX0ccz/72TPH7dYu41WclqFHl.EAfZTyBYdaHmEP6F1KSOm', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:34:18', '2025-09-01 09:34:18'),
(18, 12, 'Staf Administrasi', 'staf-administrasi', '', 'Staf Administrasi', 'stafadministrasi', '', '$2y$10$uJxMgVOITLjYWh3M83qZ9.fk8wFQfi/yE0PtWi5qJln8CM74BYKmO', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:41:10', '2025-09-01 09:41:10'),
(19, 13, 'Pustakawan', 'pustakawan', '', 'Pustakawan', 'pustakawan', '', '$2y$10$yIiHMru9yBXAF7LHUO81NO/dmBPlN5x8t09R.odC9loudHc2EtyaW', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:44:06', '2025-09-01 09:44:06'),
(20, 14, 'Biro Alumni', 'biro-alumni', '', 'Biro Alumni', 'biroalumni', '', '$2y$10$/kNT6RPw25n8BkBAU74xZ.P7zDDDdo26/RvVsTBQSHZyeuOisifr.', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:45:52', '2025-09-01 09:45:52'),
(21, 15, 'UTP PLP', 'upt-plp', '', 'UPT PLP', 'uptplp', '', '$2y$10$IhIHmUr3HeFZCCPfNxMf5OYyVgezWxG.CcUuyyobpAxc1MEWV9DWy', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:49:14', '2025-09-01 09:49:14'),
(22, 16, 'Tendik', 'tendik', '', 'Tendik', 'tendik', '', '$2y$10$0N9UVbHNXBTy0sDS9A10tuRjetb/ZvxGkRZFUCqEpr26qFaizexRO', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 09:51:11', '2025-09-01 09:51:11'),
(25, 4, 'Dosen', 'dosen', '', 'Muhammad Supian Sauri', '4333774675130243', '', '$2y$10$22rfMMw1BBiBBq7qqvBwH.368VLcsLgEh7ltH84ksb8CrWtYW8c3a', '', 'Laki-laki', 'Jl. Cemara Raya No 13, Banjarmasin', '', '-', 'Ketua UPPL', 'Terus belajar dan mengahar', '4333774675130243', 'Kelua', '1996-10-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:00:25', '2025-09-01 12:00:25'),
(27, 4, 'Dosen', 'dosen', '', 'Novi Suma Setyawati', '1111128501', '', '$2y$10$i34PKiV.6nBFcsf6EIKmxOiK9l1uB2MZbbop3QrjjIbtq0bsQu66u', '', 'Perempuan', 'Jln Karang Anyar II blok j/2 Banjarbaru Utara', '', 'Asisten Ahli', 'LPM', 'Kerja Cepat, Kerja Cerdas dan bertanggung jawab', '1111128501', 'Banjarmasin', '1985-12-11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:01:09', '2025-09-01 12:01:09'),
(28, 4, 'Dosen', 'dosen', '', 'Maulidha, M.Pd', '1129099003', '', '$2y$10$wHzbBIrnjgHl0SCzX3Gyge8j8j46EK2W7WOnyCfN9dsftZGpebSgu', '', 'Perempuan', 'Jl sungai lulut km 7, 1 komplek graha sejahtera blok A1 no 52', '', '-', 'Ketua Prodi PAUD', 'Lakukan yang terbaik dan jangan pernah menunda kegiatan', '1129099003', 'Banjarmasin', '1990-09-29', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:01:23', '2025-09-02 16:37:43'),
(29, 4, 'Dosen', 'dosen', '', 'Zulparis', '1111078702', '', '$2y$10$nx3AlqErXWQwm4F/3UqEfejWg7RJqMVmCaQ1U2Mn7H0Lmm9oUHMbK', '', 'Laki-laki', 'Komplek Annisa tahap 4 blok A nomor 15', '', 'Asisten Ahli', 'Dosen', 'Jangan takut mengcoba', '1111078702', 'Kuripan,Kec Kuripan Kabupaten Barito Kuala', '1987-07-10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:03:50', '2025-09-01 12:03:50'),
(31, 4, 'Dosen', 'dosen', '', 'Rizki Nugerahani Ilise', '1129049101', '', '$2y$10$uM/5yB/0.u6n3pdKxMD8GuY9q2P9xHfz8bmEMYUJTNC53SDXdDEMa', '', 'Perempuan', 'Jl Trans Kalimantan RT 17', '', 'Asisten Ahli', 'Kepala lppm', 'Hidup harus bermanfaat untuk institusi & berkontribusi untuk Negara', '1129049101', 'Berangas Barat', '1991-04-29', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:10:02', '2025-09-01 12:10:02'),
(32, 4, 'Dosen', 'dosen', '', 'Armin Fani', '1112098702', '', '$2y$10$8T.jZlsgi3mpGZJtxrdT2.ScO5STPm2KTxhHkkWHAkS/4JCJZhcQO', '', 'Laki-laki', 'Jl. Bumi mas Raya Komplek Bumi Mas 5 no 80 Banjarmasin Selatan.', '', 'Asisten Ahli', 'Ketua Program Studi Pendidikan Bahasa Inggris', 'Inspiring minds, shaping the future.', '1112098702', 'Babai Hulu', '1987-09-12', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:34:15', '2025-09-01 12:34:15'),
(33, 4, 'Dosen', 'dosen', '{\"8\":{\"nama_role\":\"Kaprodi\",\"slug_role\":\"kaprodi\"}}', 'Novi Nurdian', '1109119201', 'novi@gmail.com', '$2y$10$goy5tLXa63tH1JUC8imUUOwrSKdfCMjG9xmFV6wwZDc3epgnI9qaW', '', 'Perempuan', 'Komplek griya rosela blok A-15, guntung manggis, kota banjarbaru', '12345678900', 'Asisten ahli', 'Ketua Prodi PGSD', 'Kerja keras, kerja cerdas.', '1109119201', 'Sidoarjo', '1992-11-09', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:57:57', '2025-09-03 20:45:08'),
(34, 4, 'Dosen', 'dosen', '{\"3\":{\"nama_role\":\"Waka Akademik\",\"slug_role\":\"waka-akademik\"}}', 'Vebrianti Umar, M.Pd', '1108029104', 'vebrianti@gmail.com', '$2y$10$iw4uz.Fuh7594KgPwb697.nyG.59O7ROwPpsXDO4t.XqOJitK8Rei', '', 'Perempuan', 'Jl. Subur Makmur 2, Landasan Ulin', '1234567890', 'Asisten Ahli', 'Wakil Ketua Bidang Akademik', 'Melaksanakan tugas dengan penuh tanggung jawab, karena tugas adalah sebuah kehormatan.', '1108029104', 'Bitung', '1991-02-08', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:59:56', '2025-09-03 20:44:01'),
(35, 4, 'Dosen', 'dosen', '{\"9\":{\"nama_role\":\"Waka Kemahasiswaan dan Kerja Sama\",\"slug_role\":\"waka-kemahasiswaan-kerjasama\"}}', 'Yuliana Nurhayati, M.Pd.', '1109079302', 'yuliana@gmail.com', '$2y$10$dQXThze4BmeiOqQPpYqmO.g.xGploS9yV83r1CLug3hJMarrrJtpi', '', 'Perempuan', 'Jl.Dharma Bakti 2 Komplek budair permai Blok B /66', '081258026807', 'Belum Ada', 'Wakil Ketua Bidang Kerjasama dan Kemahasiswaan', '\" Jika Lelah Menjalani Profesimu Maka Istirahatlah Sejenak dan Lanjutkan dengan Ide Barumu\"', '1109079302', 'Ponorogo', '1993-07-09', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 13:20:13', '2025-09-03 20:42:01'),
(36, 17, 'Admin Utama', 'admin-utama', '', 'Admin Utama', 'adminutama', '', '$2y$10$9DYUNHjLRKoy6MxfnjapUOPDG3KZa3QfBcoY2gE4N0Vws4fMWI6H6', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-02 14:10:27', '2025-09-02 14:10:27'),
(37, 16, 'Tendik', 'tendik', '{\"13\":{\"nama_role\":\"Pustakawan\",\"slug_role\":\"pustakawan\"}}', 'Muhammad Juanda', '63710104108310004', 'juandapustaka@gmail.com', '$2y$10$8eCBtHvjmZF8IDvbhTJ3FuPO5RNHeYVuYfGW5EycNHBZZg7ilc2y6', '', 'Laki-laki', 'Jl. Gerilya Komp.Bumi Handayani 2', '08194101983', 'Pustakawan', 'Kepala Perpustakaan', 'Terus bersemangat', '63710104108310004', 'HSS', '1983-10-04', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-03 14:05:04', '2025-09-03 20:47:12');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwal_kegiatan`
--
ALTER TABLE `jadwal_kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kalender_akademik`
--
ALTER TABLE `kalender_akademik`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_dana_masuk`
--
ALTER TABLE `kategori_dana_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_penyusutan_inventaris`
--
ALTER TABLE `kategori_penyusutan_inventaris`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keuangan`
--
ALTER TABLE `keuangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `laporan_promosi`
--
ALTER TABLE `laporan_promosi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_keuangan`
--
ALTER TABLE `log_keuangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_login`
--
ALTER TABLE `log_login`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_dana`
--
ALTER TABLE `master_dana`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembayaran_mahasiswa`
--
ALTER TABLE `pembayaran_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pencatatan_surat`
--
ALTER TABLE `pencatatan_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penelitian_dosen`
--
ALTER TABLE `penelitian_dosen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengembangan_kompetensi`
--
ALTER TABLE `pengembangan_kompetensi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penyusutan_inventaris`
--
ALTER TABLE `penyusutan_inventaris`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `status_mahasiswa`
--
ALTER TABLE `status_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `surat_peringatan`
--
ALTER TABLE `surat_peringatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tagihan_mahasiswa`
--
ALTER TABLE `tagihan_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tarif_spp`
--
ALTER TABLE `tarif_spp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tracer_studi`
--
ALTER TABLE `tracer_studi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `jadwal_kegiatan`
--
ALTER TABLE `jadwal_kegiatan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kalender_akademik`
--
ALTER TABLE `kalender_akademik`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kategori_dana_masuk`
--
ALTER TABLE `kategori_dana_masuk`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `kategori_penyusutan_inventaris`
--
ALTER TABLE `kategori_penyusutan_inventaris`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `keuangan`
--
ALTER TABLE `keuangan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `laporan_promosi`
--
ALTER TABLE `laporan_promosi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `log_keuangan`
--
ALTER TABLE `log_keuangan`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `log_login`
--
ALTER TABLE `log_login`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT untuk tabel `master_dana`
--
ALTER TABLE `master_dana`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pembayaran_mahasiswa`
--
ALTER TABLE `pembayaran_mahasiswa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pencatatan_surat`
--
ALTER TABLE `pencatatan_surat`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penelitian_dosen`
--
ALTER TABLE `penelitian_dosen`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pengembangan_kompetensi`
--
ALTER TABLE `pengembangan_kompetensi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `penyusutan_inventaris`
--
ALTER TABLE `penyusutan_inventaris`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `status_mahasiswa`
--
ALTER TABLE `status_mahasiswa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `surat_peringatan`
--
ALTER TABLE `surat_peringatan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tagihan_mahasiswa`
--
ALTER TABLE `tagihan_mahasiswa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tarif_spp`
--
ALTER TABLE `tarif_spp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tracer_studi`
--
ALTER TABLE `tracer_studi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
