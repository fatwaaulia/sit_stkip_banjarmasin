-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 27 Okt 2025 pada 04.36
-- Versi server: 11.8.3-MariaDB-log
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u479011424_visioner`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_settings`
--

CREATE TABLE `app_settings` (
  `id` tinyint(4) NOT NULL,
  `nama_aplikasi` varchar(100) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `deskripsi` varchar(500) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `favicon` varchar(50) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `maps` varchar(500) NOT NULL,
  `ts_2_tanggal_awal` date DEFAULT NULL,
  `ts_2_tanggal_akhir` date DEFAULT NULL,
  `ts_1_tanggal_awal` date DEFAULT NULL,
  `ts_1_tanggal_akhir` date DEFAULT NULL,
  `ts_tanggal_awal` date DEFAULT NULL,
  `ts_tanggal_akhir` date DEFAULT NULL,
  `buka_pendaftaran_mahasiswa` varchar(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `app_settings`
--

INSERT INTO `app_settings` (`id`, `nama_aplikasi`, `nama_perusahaan`, `deskripsi`, `logo`, `favicon`, `no_hp`, `alamat`, `maps`, `ts_2_tanggal_awal`, `ts_2_tanggal_akhir`, `ts_1_tanggal_awal`, `ts_1_tanggal_akhir`, `ts_tanggal_awal`, `ts_tanggal_akhir`, `buka_pendaftaran_mahasiswa`, `created_at`, `updated_at`) VALUES
(1, 'STKIP ISM Banjarmasin', 'Humasoft Studio Teknologi', 'Kampus Visioner STKIP ISM Banjarmasin', 'logo.png', 'favicon.png', '0', 'Jl. Malkon Temon Jl. Sultan Adam No.12, RT.23, Surgi Mufti, Kec. Banjarmasin Utara, Kota Banjarmasin, Kalimantan Selatan 70122', '', '2024-09-08', '2025-03-04', '2025-03-05', '2025-07-23', '2025-07-24', '2026-03-17', 'Buka', '2024-09-17 13:06:51', '2025-09-09 18:53:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen_kemahasiswaan`
--

CREATE TABLE `dokumen_kemahasiswaan` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `sub_judul` varchar(20) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokumen_kemahasiswaan`
--

INSERT INTO `dokumen_kemahasiswaan` (`id`, `judul`, `sub_judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(4, 'SK Organisasi', 'Sekolah Tinggi', 'https://translate.google.com/?sl=en&tl=id&text=teknologi%20rekayasa%20perangkatan%20lunak%20terapan%20sistem&op=translate', '', '2025-09-19 17:13:24', '2025-09-19 17:13:24', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen_template`
--

CREATE TABLE `dokumen_template` (
  `id` bigint(20) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `sub_judul` varchar(20) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokumen_template`
--

INSERT INTO `dokumen_template` (`id`, `kategori`, `judul`, `sub_judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(2, 'STRUKTURAL', 'Template 1', '', 'https://translate.google.com/?sl=en&tl=id&text=teknologi%20rekayasa%20perangkatan%20lunak%20terapan%20sistem&op=translate', '', '2025-09-19 16:50:10', '2025-09-19 17:12:30', 1, 1),
(3, 'SELURUH DOSEN', 'Template 2', 'PBI', 'https://hpanel.hostinger.com/', '', '2025-09-19 17:12:51', '2025-09-19 17:12:51', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen_pendamping`
--

CREATE TABLE `dosen_pendamping` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `id_program_studi` bigint(20) NOT NULL,
  `jenjang_program_studi` varchar(2) NOT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `singkatan_program_studi` varchar(10) NOT NULL,
  `id_dosen_1` bigint(20) NOT NULL,
  `nama_dosen_1` varchar(100) NOT NULL,
  `id_dosen_2` bigint(20) NOT NULL,
  `nama_dosen_2` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen_pendamping`
--

INSERT INTO `dosen_pendamping` (`id`, `judul`, `tautan`, `dokumen`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `id_dosen_1`, `nama_dosen_1`, `id_dosen_2`, `nama_dosen_2`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(4, 'Dosen Pembimbing Akademik', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', 0, '', '2025-09-16 11:01:48', '2025-09-17 15:54:45', 32, 0),
(5, 'DOSEN PEMBIMBING AKADEMIK', '', '1757995317_99e5309fc3ec880c6046.pdf', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 25, 'Muhammad Supian Sauri', 29, 'Zulparis', '2025-09-16 11:01:57', '2025-09-25 14:07:45', 33, 33),
(6, 'Dosen Pembimbing Skripsi', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', 0, '', '2025-09-16 11:02:09', '2025-09-17 15:54:45', 32, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_kegiatan`
--

CREATE TABLE `jadwal_kegiatan` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal_kegiatan`
--

INSERT INTO `jadwal_kegiatan` (`id`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(3, 'SURAT EDARAN YUDISIUM', '', '1758512321_40b0672da28242db4092.pdf', '2025-09-22 10:38:41', '2025-09-22 10:39:10', 34, 34),
(4, 'BERITA  ACARA RAPAT MBKM', '', '1759724129_a84eed57fe4f585568d6.pdf', '2025-10-06 11:15:29', '2025-10-06 11:15:29', 34, 0),
(5, 'Laporan pelaksanaan pembekalan MBKM', '', '1760929913_89b315a9829e18e5aa86.pdf', '2025-10-20 10:11:53', '2025-10-20 10:11:53', 34, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_kuliah`
--

CREATE TABLE `jadwal_kuliah` (
  `id` bigint(20) NOT NULL,
  `id_program_studi` bigint(20) NOT NULL,
  `jenjang_program_studi` varchar(2) NOT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `singkatan_program_studi` varchar(10) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal_kuliah`
--

INSERT INTO `jadwal_kuliah` (`id`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`) VALUES
(9, 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 'jadwal perkuliahan 2025-2025', 'https://drive.google.com/file/d/1CwdWrJugxxtqJlfmKSgow9KeLdB-eZxC/view?usp=sharing', '1758695852_6e2aab677c78edb94bc0.pdf', '2025-09-24 13:37:32', '2025-09-24 13:37:32'),
(10, 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 'JADWAL MATA KULIAH GANJIL 2025-2026', '', '1758696298_d497bbf26c05ece3ec25.pdf', '2025-09-24 13:44:58', '2025-09-24 13:44:58'),
(12, 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 'Jadwal Perkuliahan Tahun Akademik 2025-2026 Ganjil Semester 3', 'https://drive.google.com/drive/folders/1XDq9kIJVzMD2aMKvCT89nkhL9Gv2C7uY', '1758785931_2643abeeacfcad15d2ef.pdf', '2025-09-25 14:38:51', '2025-09-25 14:38:51'),
(13, 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 'Jadwal Perkuliahan Tahun Akademik 2025-2026 Ganjil Semester 5', 'https://drive.google.com/drive/folders/1XDq9kIJVzMD2aMKvCT89nkhL9Gv2C7uY', '1758785975_bed54a2e6d18d3c3b6db.pdf', '2025-09-25 14:39:35', '2025-09-25 14:39:35'),
(14, 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 'Jadwal Perkuliahan Tahun Akademik 2025-2026 Ganjil Semester 7', 'https://drive.google.com/drive/folders/1XDq9kIJVzMD2aMKvCT89nkhL9Gv2C7uY', '1758786042_759c2ba3f3312c11b993.pdf', '2025-09-25 14:40:42', '2025-09-25 14:40:42'),
(16, 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 'Jadwal Perkuliahan Tahun Akademik 2025-2026 Ganjil Semester 1', 'https://drive.google.com/drive/folders/1XDq9kIJVzMD2aMKvCT89nkhL9Gv2C7uY', '1758786167_88620f6f94998400946b.pdf', '2025-09-25 14:42:47', '2025-09-25 14:42:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kalender_akademik`
--

CREATE TABLE `kalender_akademik` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kalender_akademik`
--

INSERT INTO `kalender_akademik` (`id`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`) VALUES
(1, 'Kalender Akademik Semester Ganjil Tahun 2024-2025', 'https://drive.google.com/file/d/1F3KmloWL5EyhxoJhPtQcCu6Ug5JgD8us/view?usp=sharing', '1758174621_8defd97435ad4cf7c2f6.pdf', '2025-08-20 06:07:59', '2025-09-18 12:50:21'),
(2, 'Kalender Akademik Semester Genap Tahun 2024-2025', 'https://stkipismbjm.ac.id/kalender-akademik-semester-genap-tahun-2024-2025/', '1758173556_d20b07f1399367a91ac6.pdf', '2025-08-28 21:04:31', '2025-09-18 12:32:36'),
(3, 'Kalender Akademik Semester Ganjil Tahun 2025-2026', 'https://stkipismbjm.ac.id/kalender-akademik-semester-ganjil-tahun-2025-2026/', '1758172438_6fe9c4bf27a7beda4de0.pdf', '2025-08-28 21:05:03', '2025-09-18 12:13:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_dana_masuk`
--

CREATE TABLE `kategori_dana_masuk` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
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
  `id` bigint(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
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
  `id` bigint(20) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `id_kategori_dana` bigint(20) NOT NULL,
  `nama_kategori_dana` varchar(100) NOT NULL,
  `nominal` int(11) NOT NULL,
  `id_sumber_dana` int(11) NOT NULL,
  `nama_sumber_dana` varchar(100) NOT NULL,
  `catatan` varchar(500) NOT NULL,
  `nomor_bukti` varchar(100) NOT NULL,
  `jenis_saldo` varchar(10) NOT NULL,
  `tanggal` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keuangan`
--

INSERT INTO `keuangan` (`id`, `jenis`, `id_kategori_dana`, `nama_kategori_dana`, `nominal`, `id_sumber_dana`, `nama_sumber_dana`, `catatan`, `nomor_bukti`, `jenis_saldo`, `tanggal`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(9, 'Masuk', 1, 'Mahasiswa', 1000000, 1, 'SPP', 'Pembayaran SPP mahasiswa', '', '', '2025-08-02 13:59:00', '2025-09-16 14:01:04', '2025-09-16 14:01:04', 41, 0),
(10, 'Masuk', 1, 'Mahasiswa', 200000, 3, 'Lain-lain', 'Pembayaran biaya PMB a.n Yully Yana Istikomah PGSD TA 2025/2026', '', '', '2025-08-08 14:03:00', '2025-09-16 14:04:39', '2025-09-16 14:04:39', 41, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_pertanggungjawaban`
--

CREATE TABLE `laporan_pertanggungjawaban` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_promosi`
--

CREATE TABLE `laporan_promosi` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lkpt`
--

CREATE TABLE `lkpt` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_keuangan`
--

CREATE TABLE `log_keuangan` (
  `id` bigint(20) NOT NULL,
  `id_keuangan` bigint(20) NOT NULL,
  `pesan` varchar(2048) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_login`
--

CREATE TABLE `log_login` (
  `id` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `id_role` tinyint(4) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `log_login`
--

INSERT INTO `log_login` (`id`, `id_user`, `id_role`, `nama_user`, `username`, `ip_address`, `status`, `created_at`, `updated_at`) VALUES
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
(470, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '140.213.67.207', 'Failed', '2025-09-13 20:01:43', '2025-09-13 20:01:43'),
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
(497, 32, 4, 'arminfani@stkipismbjm.ac.id', '1112098702', '2404:c0:c203:f416:d65f:74e6:2181:dbc5', 'Failed', '2025-09-14 07:47:29', '2025-09-14 07:47:29');
INSERT INTO `log_login` (`id`, `id_user`, `id_role`, `nama_user`, `username`, `ip_address`, `status`, `created_at`, `updated_at`) VALUES
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
(626, 48, 4, 'Norhayati K', '1234', '2404:c0:c202:d1ed:95be:361e:11dd:4b99', 'Failed', '2025-09-17 07:46:41', '2025-09-17 07:46:41'),
(627, 48, 4, 'Norhayati K', '1234', '2404:c0:c202:d1ed:95be:361e:11dd:4b99', 'Success', '2025-09-17 07:46:52', '2025-09-17 07:46:52'),
(628, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '182.8.129.47', 'Success', '2025-09-17 07:59:37', '2025-09-17 07:59:37'),
(629, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c202:d1ed:bd2e:ab28:21a3:155', 'Success', '2025-09-17 08:06:13', '2025-09-17 08:06:13'),
(630, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '2404:c0:c202:d1ed:2965:78b5:dc41:5407', 'Success', '2025-09-17 08:37:54', '2025-09-17 08:37:54'),
(631, 33, 4, 'Novi Nurdian', '1109119201', '2404:c0:c202:d1ed:a534:b19:147c:ab16', 'Success', '2025-09-17 08:51:14', '2025-09-17 08:51:14'),
(632, 1, 1, 'Superadmin', 'superadmin', '139.162.51.138', 'Success', '2025-09-17 10:21:28', '2025-09-17 10:21:28'),
(633, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.129.47', 'Success', '2025-09-17 13:49:00', '2025-09-17 13:49:00'),
(634, 1, 1, 'Superadmin', 'superadmin', '139.162.24.78', 'Success', '2025-09-17 13:50:58', '2025-09-17 13:50:58'),
(635, 1, 1, 'Superadmin', 'superadmin', '79.142.76.179', 'Success', '2025-09-18 05:31:04', '2025-09-18 05:31:04'),
(636, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '2404:c0:c202:d1ed:3cca:12c5:6609:6fd6', 'Success', '2025-09-18 07:32:32', '2025-09-18 07:32:32'),
(637, 1, 1, 'Superadmin', 'superadmin', '37.46.119.200', 'Success', '2025-09-18 10:23:34', '2025-09-18 10:23:34'),
(638, 1, 1, 'Superadmin', 'superadmin', '182.8.129.47', 'Success', '2025-09-18 11:12:32', '2025-09-18 11:12:32'),
(639, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c202:d1ed:a5bd:bb1:19d8:b795', 'Success', '2025-09-18 12:03:45', '2025-09-18 12:03:45'),
(640, 1, 1, 'Superadmin', 'superadmin', '182.6.92.94', 'Success', '2025-09-18 14:08:55', '2025-09-18 14:08:55'),
(641, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '2404:c0:c202:d1ed:5cfb:8f6b:6df3:91b9', 'Success', '2025-09-19 07:51:07', '2025-09-19 07:51:07'),
(642, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c202:d1ed:30a0:fb90:e38a:8ac7', 'Success', '2025-09-19 08:08:17', '2025-09-19 08:08:17'),
(643, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2a02:26f7:d708:d3e2:0:3000:0:9', 'Success', '2025-09-19 08:14:05', '2025-09-19 08:14:05'),
(644, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '2404:c0:c202:37b8:df2:670e:6a74:b022', 'Success', '2025-09-19 14:49:32', '2025-09-19 14:49:32'),
(645, 1, 1, 'Superadmin', 'superadmin', '172.237.72.111', 'Success', '2025-09-19 17:10:24', '2025-09-19 17:10:24'),
(646, 1, 1, 'Superadmin', 'superadmin', '172.237.72.111', 'Success', '2025-09-20 16:51:06', '2025-09-20 16:51:06'),
(647, 1, 1, 'Superadmin', 'superadmin', '5.253.205.147', 'Success', '2025-09-21 11:58:33', '2025-09-21 11:58:33'),
(648, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '5.253.205.147', 'Success', '2025-09-21 12:00:51', '2025-09-21 12:00:51'),
(649, 37, 16, 'Muhammad Juanda', '63710104108310004', '5.253.205.147', 'Success', '2025-09-21 12:02:20', '2025-09-21 12:02:20'),
(650, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '39.194.2.76', 'Success', '2025-09-22 06:46:54', '2025-09-22 06:46:54'),
(651, 1, 1, 'Superadmin', 'superadmin', '172.237.72.111', 'Success', '2025-09-22 07:39:58', '2025-09-22 07:39:58'),
(652, 37, 16, 'Muhammad Juanda', '63710104108310004', '172.237.72.111', 'Success', '2025-09-22 07:50:08', '2025-09-22 07:50:08'),
(653, 37, 16, 'Muhammad Juanda', '63710104108310004', '2404:c0:c202:37b8:d069:9f43:b97d:1552', 'Success', '2025-09-22 07:50:24', '2025-09-22 07:50:24'),
(654, 48, 4, 'Norhayati K', '1234', '2404:c0:c202:37b8:88ee:95d8:7449:9d07', 'Success', '2025-09-22 08:03:10', '2025-09-22 08:03:10'),
(655, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '2404:c0:c202:37b8:5dee:6ba7:16ae:e11d', 'Success', '2025-09-22 08:11:51', '2025-09-22 08:11:51'),
(656, 29, 4, 'Zulparis', '1111078702', '2404:c0:c202:37b8:f4ff:9ffb:5751:82a7', 'Success', '2025-09-22 08:49:28', '2025-09-22 08:49:28'),
(657, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.130.181', 'Success', '2025-09-22 08:53:19', '2025-09-22 08:53:19'),
(658, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '182.8.130.181', 'Success', '2025-09-22 08:53:43', '2025-09-22 08:53:43'),
(659, 48, 4, 'Norhayati K', '1234', '182.8.130.181', 'Success', '2025-09-22 08:54:22', '2025-09-22 08:54:22'),
(660, 40, 4, 'Muhammad Agus Safrian Nur', '0158768669130093', '182.8.130.181', 'Success', '2025-09-22 08:55:08', '2025-09-22 08:55:08'),
(661, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '182.8.130.181', 'Success', '2025-09-22 08:57:34', '2025-09-22 08:57:34'),
(662, 27, 4, 'Novi Suma Setyawati', '1111128501', '182.8.130.181', 'Success', '2025-09-22 09:00:37', '2025-09-22 09:00:37'),
(663, 32, 4, 'Armin Fani', '1112098702', '182.8.130.181', 'Success', '2025-09-22 09:02:42', '2025-09-22 09:02:42'),
(664, 1, 1, 'Superadmin', 'superadmin', '182.8.130.181', 'Success', '2025-09-22 09:18:15', '2025-09-22 09:18:15'),
(665, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '172.237.72.111', 'Success', '2025-09-22 09:22:19', '2025-09-22 09:22:19'),
(666, 40, 4, 'Muhammad Agus Safrian Nur', '0158768669130093', '182.8.129.53', 'Success', '2025-09-22 10:00:40', '2025-09-22 10:00:40'),
(667, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '182.8.129.53', 'Success', '2025-09-22 10:25:34', '2025-09-22 10:25:34'),
(668, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '2404:c0:c202:d311:a045:2238:5bb6:b62a', 'Success', '2025-09-22 10:31:38', '2025-09-22 10:31:38'),
(669, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '2404:c0:c202:d311:d963:ae29:6a56:b4d', 'Success', '2025-09-22 10:34:56', '2025-09-22 10:34:56'),
(670, 46, 4, 'Abdul Aziz', '1110079002', '182.8.129.53', 'Success', '2025-09-22 10:52:57', '2025-09-22 10:52:57'),
(671, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '182.8.129.53', 'Success', '2025-09-22 11:21:06', '2025-09-22 11:21:06'),
(672, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '182.8.129.53', 'Success', '2025-09-22 11:21:32', '2025-09-22 11:21:32'),
(673, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '182.8.129.53', 'Success', '2025-09-22 11:21:35', '2025-09-22 11:21:35'),
(674, 37, 16, 'Muhammad Juanda', '63710104108310004', '114.122.208.245', 'Success', '2025-09-22 11:30:52', '2025-09-22 11:30:52'),
(675, 0, 0, '', '6371010410830004', '182.8.129.53', 'Failed', '2025-09-22 11:31:33', '2025-09-22 11:31:33'),
(676, 0, 0, '', '6371010410830004', '182.8.129.53', 'Failed', '2025-09-22 11:33:03', '2025-09-22 11:33:03'),
(677, 0, 0, '', 'juandapustaka@gmail.com', '182.8.129.53', 'Failed', '2025-09-22 11:33:37', '2025-09-22 11:33:37'),
(678, 0, 0, '', '6371010410830004', '182.8.129.53', 'Failed', '2025-09-22 11:34:49', '2025-09-22 11:34:49'),
(679, 1, 1, 'Superadmin', 'superadmin', '172.237.72.111', 'Success', '2025-09-22 11:41:30', '2025-09-22 11:41:30'),
(680, 1, 1, 'Superadmin', 'superadmin', '172.237.72.111', 'Success', '2025-09-22 11:41:49', '2025-09-22 11:41:49'),
(681, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '172.237.72.111', 'Failed', '2025-09-22 11:42:29', '2025-09-22 11:42:29'),
(682, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '172.237.72.111', 'Success', '2025-09-22 11:42:43', '2025-09-22 11:42:43'),
(683, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '172.237.72.111', 'Success', '2025-09-22 11:43:16', '2025-09-22 11:43:16'),
(684, 0, 0, '', '6371010410830004', '182.8.129.53', 'Failed', '2025-09-22 11:43:17', '2025-09-22 11:43:17'),
(685, 0, 0, '', '6371010410830004', '182.8.129.53', 'Failed', '2025-09-22 11:44:37', '2025-09-22 11:44:37'),
(686, 37, 16, 'Muhammad Juanda', '63710104108310004', '114.122.208.245', 'Success', '2025-09-22 11:45:24', '2025-09-22 11:45:24'),
(687, 48, 4, 'Norhayati K', '1234', '2404:c0:c202:3d87:89ff:a5f4:50ec:4d4', 'Success', '2025-09-22 20:33:45', '2025-09-22 20:33:45'),
(688, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c202:fe4:c923:fbe:5e1a:53c8', 'Success', '2025-09-23 09:47:00', '2025-09-23 09:47:00'),
(689, 33, 4, 'Novi Nurdian', '1109119201', '2404:c0:c202:fe4:dc62:c016:8416:9d5e', 'Success', '2025-09-23 09:56:03', '2025-09-23 09:56:03'),
(690, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c202:fe4:c923:fbe:5e1a:53c8', 'Success', '2025-09-23 13:38:47', '2025-09-23 13:38:47'),
(691, 1, 1, 'Superadmin', 'superadmin', '182.8.130.150', 'Success', '2025-09-23 14:06:37', '2025-09-23 14:06:37'),
(692, 33, 4, 'Novi Nurdian', '1109119201', '182.8.130.150', 'Success', '2025-09-23 14:10:31', '2025-09-23 14:10:31'),
(693, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '182.8.130.150', 'Success', '2025-09-23 14:10:35', '2025-09-23 14:10:35'),
(694, 37, 16, 'Muhammad Juanda', '63710104108310004', '114.122.209.229', 'Success', '2025-09-23 14:10:42', '2025-09-23 14:10:42'),
(695, 27, 4, 'Novi Suma Setyawati', '1111128501', '2404:c0:c202:fe4:a187:aba:8056:156b', 'Success', '2025-09-23 14:11:01', '2025-09-23 14:11:01'),
(696, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '182.8.130.150', 'Success', '2025-09-23 14:11:39', '2025-09-23 14:11:39'),
(697, 46, 4, 'Abdul Aziz', '1110079002', '182.8.130.150', 'Success', '2025-09-23 14:12:47', '2025-09-23 14:12:47'),
(698, 40, 4, 'Muhammad Agus Safrian Nur', '0158768669130093', '182.8.130.150', 'Success', '2025-09-23 14:13:18', '2025-09-23 14:13:18'),
(699, 32, 4, 'Armin Fani', '1112098702', '2404:c0:c202:fe4:8400:b4d8:f83e:497d', 'Success', '2025-09-23 14:13:21', '2025-09-23 14:13:21'),
(700, 29, 4, 'Zulparis', '1111078702', '114.122.212.69', 'Success', '2025-09-23 14:14:09', '2025-09-23 14:14:09'),
(701, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.130.150', 'Success', '2025-09-23 14:43:26', '2025-09-23 14:43:26'),
(702, 48, 4, 'Norhayati K', '1234', '103.141.47.117', 'Success', '2025-09-23 15:25:36', '2025-09-23 15:25:36'),
(703, 28, 4, 'Maulidha, M.Pd', '1129099003', '140.213.67.5', 'Failed', '2025-09-23 15:51:35', '2025-09-23 15:51:35'),
(704, 28, 4, 'Maulidha, M.Pd', '1129099003', '140.213.67.5', 'Success', '2025-09-23 15:51:50', '2025-09-23 15:51:50'),
(705, 1, 1, 'Superadmin', 'superadmin', '182.8.131.140', 'Success', '2025-09-23 18:58:20', '2025-09-23 18:58:20'),
(706, 1, 1, 'Superadmin', 'superadmin', '182.8.131.140', 'Success', '2025-09-23 19:51:37', '2025-09-23 19:51:37'),
(707, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.130.150', 'Success', '2025-09-24 11:07:20', '2025-09-24 11:07:20'),
(708, 1, 1, 'Superadmin', 'superadmin', '172.235.246.220', 'Success', '2025-09-24 12:34:21', '2025-09-24 12:34:21'),
(709, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.130.150', 'Success', '2025-09-24 12:53:08', '2025-09-24 12:53:08'),
(710, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '182.8.130.150', 'Success', '2025-09-24 12:53:46', '2025-09-24 12:53:46'),
(711, 1, 1, 'Superadmin', 'superadmin', '182.8.130.150', 'Success', '2025-09-24 12:54:58', '2025-09-24 12:54:58'),
(712, 33, 4, 'Novi Nurdian', '1109119201', '182.8.130.150', 'Success', '2025-09-24 13:09:41', '2025-09-24 13:09:41'),
(713, 32, 4, 'Armin Fani', '1112098702', '114.10.142.162', 'Success', '2025-09-24 13:11:07', '2025-09-24 13:11:07'),
(714, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '182.8.130.150', 'Success', '2025-09-24 13:16:56', '2025-09-24 13:16:56'),
(715, 40, 4, 'Muhammad Agus Safrian Nur', '0158768669130093', '140.213.66.251', 'Success', '2025-09-24 13:29:12', '2025-09-24 13:29:12'),
(716, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '182.8.130.150', 'Success', '2025-09-24 13:30:11', '2025-09-24 13:30:11'),
(717, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.130.150', 'Success', '2025-09-24 13:31:07', '2025-09-24 13:31:07'),
(718, 48, 4, 'Norhayati K', '1234', '114.122.211.36', 'Success', '2025-09-24 13:43:56', '2025-09-24 13:43:56'),
(719, 48, 4, 'Norhayati K', '1234', '114.122.211.36', 'Success', '2025-09-24 13:44:33', '2025-09-24 13:44:33'),
(720, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2404:c0:c202:fe4:c54c:e774:2839:2bfd', 'Success', '2025-09-24 13:48:48', '2025-09-24 13:48:48'),
(721, 0, 0, '', 'tatiahatta27@gmail.com', '182.8.130.150', 'Failed', '2025-09-24 14:06:41', '2025-09-24 14:06:41'),
(722, 0, 0, '', 'tatiahatta27@gmail.com', '182.8.130.150', 'Failed', '2025-09-24 14:07:12', '2025-09-24 14:07:12'),
(723, 43, 4, 'Tati Akhbaryah, S.S., S.Pd., M.Pd.', '0', '182.8.130.150', 'Failed', '2025-09-24 14:07:29', '2025-09-24 14:07:29'),
(724, 0, 0, '', 'tatiahatta27@gmail.com', '182.8.130.150', 'Failed', '2025-09-24 14:07:51', '2025-09-24 14:07:51'),
(725, 43, 4, 'Tati Akhbaryah, S.S., S.Pd., M.Pd.', '0', '182.8.130.150', 'Success', '2025-09-24 14:08:44', '2025-09-24 14:08:44'),
(726, 37, 16, 'Muhammad Juanda', '63710104108310004', '140.213.10.207', 'Success', '2025-09-24 16:09:53', '2025-09-24 16:09:53'),
(727, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '39.194.2.46', 'Success', '2025-09-24 16:35:50', '2025-09-24 16:35:50'),
(728, 48, 4, 'Norhayati K', '1234', '182.8.179.27', 'Success', '2025-09-24 16:41:00', '2025-09-24 16:41:00'),
(729, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '114.122.209.195', 'Success', '2025-09-24 18:49:50', '2025-09-24 18:49:50'),
(730, 43, 4, 'Tati Akhbaryah, S.S., S.Pd., M.Pd.', '0', '103.167.13.111', 'Success', '2025-09-25 08:22:37', '2025-09-25 08:22:37'),
(731, 1, 1, 'Superadmin', 'superadmin', '172.235.246.220', 'Success', '2025-09-25 11:47:39', '2025-09-25 11:47:39'),
(732, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c202:fe4:dd2a:72b8:6472:c0fb', 'Success', '2025-09-25 12:24:36', '2025-09-25 12:24:36'),
(733, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '2404:c0:c202:fe4:d960:2730:aef8:c33a', 'Success', '2025-09-25 12:34:32', '2025-09-25 12:34:32'),
(734, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.130.150', 'Success', '2025-09-25 12:52:32', '2025-09-25 12:52:32'),
(735, 1, 1, 'Superadmin', 'superadmin', '182.8.130.150', 'Success', '2025-09-25 12:53:15', '2025-09-25 12:53:15'),
(736, 41, 16, 'Halima Chairia', '6371015011800013', '182.8.130.150', 'Success', '2025-09-25 13:01:14', '2025-09-25 13:01:14'),
(737, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '2404:c0:c202:fe4:6980:c4b:ed78:d692', 'Success', '2025-09-25 13:46:23', '2025-09-25 13:46:23'),
(738, 33, 4, 'Novi Nurdian', '1109119201', '182.8.130.150', 'Success', '2025-09-25 13:49:55', '2025-09-25 13:49:55'),
(739, 28, 4, 'Maulidha, M.Pd', '1129099003', '182.8.130.150', 'Success', '2025-09-25 13:51:54', '2025-09-25 13:51:54'),
(740, 29, 4, 'Zulparis', '1111078702', '114.122.213.193', 'Success', '2025-09-25 13:59:12', '2025-09-25 13:59:12'),
(741, 27, 4, 'Novi Suma Setyawati', '1111128501', '2404:c0:4c0b::632a:fcea', 'Success', '2025-09-25 13:59:37', '2025-09-25 13:59:37'),
(742, 46, 4, 'Abdul Aziz', '1110079002', '182.8.130.150', 'Success', '2025-09-25 14:01:27', '2025-09-25 14:01:27'),
(743, 0, 0, '', '111007002', '182.8.130.150', 'Failed', '2025-09-25 14:05:40', '2025-09-25 14:05:40'),
(744, 46, 4, 'Abdul Aziz', '1110079002', '182.8.130.150', 'Success', '2025-09-25 14:06:08', '2025-09-25 14:06:08'),
(745, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '182.8.130.150', 'Success', '2025-09-25 14:12:22', '2025-09-25 14:12:22'),
(746, 43, 4, 'Tati Akhbaryah, S.S., S.Pd., M.Pd.', '0', '182.8.130.150', 'Success', '2025-09-25 14:16:31', '2025-09-25 14:16:31'),
(747, 32, 4, 'Armin Fani', '1112098702', '182.8.130.150', 'Success', '2025-09-25 14:20:26', '2025-09-25 14:20:26'),
(748, 48, 4, 'Norhayati K', '1234', '114.122.209.131', 'Success', '2025-09-25 14:39:45', '2025-09-25 14:39:45'),
(749, 48, 4, 'Norhayati K', '1234', '114.122.209.131', 'Success', '2025-09-25 14:42:58', '2025-09-25 14:42:58'),
(750, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '2404:c0:c202:fe4:21d8:647e:89a5:8314', 'Success', '2025-09-25 14:50:16', '2025-09-25 14:50:16'),
(751, 1, 1, 'Superadmin', 'superadmin', '2404:c0:4cb0::57c9:c500', 'Success', '2025-09-25 16:55:03', '2025-09-25 16:55:03'),
(752, 1, 1, 'Superadmin', 'superadmin', '39.194.4.140', 'Success', '2025-09-26 09:53:37', '2025-09-26 09:53:37'),
(753, 1, 1, 'Superadmin', 'superadmin', '172.237.81.61', 'Success', '2025-09-26 10:42:57', '2025-09-26 10:42:57'),
(754, 46, 4, 'Abdul Aziz', '1110079002', '39.194.4.140', 'Success', '2025-09-26 13:10:41', '2025-09-26 13:10:41'),
(755, 48, 4, 'Norhayati K', '1234', '2404:c0:c201:5c5f:18dd:b0e8:e567:5384', 'Success', '2025-09-26 13:45:38', '2025-09-26 13:45:38'),
(756, 48, 4, 'Norhayati K', '1234', '2404:c0:c201:5c5f:25ea:5f2c:a898:242d', 'Success', '2025-09-26 13:48:31', '2025-09-26 13:48:31'),
(757, 1, 1, 'Superadmin', 'superadmin', '172.232.226.148', 'Success', '2025-09-26 16:03:25', '2025-09-26 16:03:25'),
(758, 37, 16, 'Muhammad Juanda', '63710104108310004', '2404:c0:c203:eeb8:97b:7d77:657f:10ed', 'Success', '2025-09-26 17:14:45', '2025-09-26 17:14:45'),
(759, 0, 0, '', '6371010410830004', '2404:c0:c203:eeb8:4db7:9db0:7a11:ee30', 'Failed', '2025-09-26 17:37:22', '2025-09-26 17:37:22'),
(760, 0, 0, '', '6371010410830004', '2404:c0:c203:eeb8:4db7:9db0:7a11:ee30', 'Failed', '2025-09-26 17:37:32', '2025-09-26 17:37:32'),
(761, 0, 0, '', '6371010410830004', '2404:c0:c203:eeb8:4db7:9db0:7a11:ee30', 'Failed', '2025-09-26 17:38:20', '2025-09-26 17:38:20'),
(762, 0, 0, '', '6371010410830004', '2404:c0:c203:eeb8:4db7:9db0:7a11:ee30', 'Failed', '2025-09-26 18:08:01', '2025-09-26 18:08:01'),
(763, 0, 0, '', '6371010410830004', '39.194.5.159', 'Failed', '2025-09-26 18:19:05', '2025-09-26 18:19:05'),
(764, 37, 16, 'Muhammad Juanda', '63710104108310004', '2404:c0:c203:eeb8:97b:7d77:657f:10ed', 'Success', '2025-09-26 18:24:22', '2025-09-26 18:24:22'),
(765, 1, 1, 'Superadmin', 'superadmin', '172.232.226.148', 'Success', '2025-09-26 20:30:49', '2025-09-26 20:30:49'),
(766, 1, 1, 'Superadmin', 'superadmin', '172.235.246.220', 'Success', '2025-09-27 10:50:13', '2025-09-27 10:50:13'),
(767, 48, 4, 'Norhayati K', '1234', '182.8.179.27', 'Success', '2025-09-28 13:57:15', '2025-09-28 13:57:15'),
(768, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '39.194.3.224', 'Success', '2025-09-29 06:53:10', '2025-09-29 06:53:10'),
(769, 0, 0, '', '6371010410830004', '39.194.4.140', 'Failed', '2025-09-29 07:54:33', '2025-09-29 07:54:33'),
(770, 37, 16, 'Muhammad Juanda', '63710104108310004', '39.194.4.140', 'Success', '2025-09-29 08:00:48', '2025-09-29 08:00:48'),
(771, 48, 4, 'Norhayati K', '1234', '2404:c0:c201:5c5f:cc22:5ccc:92d4:babc', 'Success', '2025-09-29 08:05:45', '2025-09-29 08:05:45'),
(772, 41, 16, 'Halima Chairia', '6371015011800013', '39.194.4.140', 'Success', '2025-09-29 08:52:26', '2025-09-29 08:52:26'),
(773, 33, 4, 'Novi Nurdian', '1109119201', '39.194.4.140', 'Success', '2025-09-29 12:29:25', '2025-09-29 12:29:25'),
(774, 41, 16, 'Halima Chairia', '6371015011800013', '39.194.4.140', 'Success', '2025-09-29 13:08:30', '2025-09-29 13:08:30'),
(775, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c201:5c5f:4d3a:253b:1bba:a2ee', 'Success', '2025-09-30 08:17:49', '2025-09-30 08:17:49'),
(776, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '114.122.208.207', 'Success', '2025-09-30 21:00:15', '2025-09-30 21:00:15'),
(777, 33, 4, 'Novi Nurdian', '1109119201', '39.194.4.42', 'Success', '2025-10-01 12:49:21', '2025-10-01 12:49:21'),
(778, 1, 1, 'Superadmin', 'superadmin', '172.238.14.139', 'Success', '2025-10-01 15:59:09', '2025-10-01 15:59:09'),
(779, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '114.122.209.83', 'Failed', '2025-10-01 21:33:31', '2025-10-01 21:33:31'),
(780, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '114.122.209.83', 'Failed', '2025-10-01 21:33:41', '2025-10-01 21:33:41'),
(781, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '114.122.209.83', 'Success', '2025-10-01 21:33:58', '2025-10-01 21:33:58'),
(782, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c201:2541:b15f:a680:6382:e406', 'Success', '2025-10-03 09:29:33', '2025-10-03 09:29:33'),
(783, 1, 1, 'Superadmin', 'superadmin', '2404:c0:4cb0::5f1e:8945', 'Success', '2025-10-03 10:03:47', '2025-10-03 10:03:47'),
(784, 33, 4, 'Novi Nurdian', '1109119201', '2404:c0:c201:2541:1dc1:e78d:9530:4e55', 'Success', '2025-10-03 11:15:04', '2025-10-03 11:15:04'),
(785, 1, 1, 'Superadmin', 'superadmin', '39.194.4.42', 'Success', '2025-10-03 13:28:56', '2025-10-03 13:28:56'),
(786, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '103.129.151.78', 'Success', '2025-10-04 12:06:28', '2025-10-04 12:06:28'),
(787, 1, 1, 'Superadmin', 'superadmin', '182.8.158.131', 'Success', '2025-10-04 14:34:05', '2025-10-04 14:34:05'),
(788, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '103.129.151.78', 'Success', '2025-10-05 15:15:27', '2025-10-05 15:15:27'),
(789, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '39.194.2.206', 'Success', '2025-10-06 07:42:26', '2025-10-06 07:42:26'),
(790, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '114.79.44.80', 'Success', '2025-10-06 07:49:52', '2025-10-06 07:49:52'),
(791, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '2404:c0:c201:3a64:4bde:9924:787c:e593', 'Success', '2025-10-06 10:52:29', '2025-10-06 10:52:29'),
(792, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c201:3a64:1932:792b:862a:6986', 'Success', '2025-10-06 11:13:32', '2025-10-06 11:13:32'),
(793, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '2404:c0:c201:3a64:482f:666d:3006:41cb', 'Success', '2025-10-06 12:19:33', '2025-10-06 12:19:33'),
(794, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '2404:c0:c201:3a64:3995:20c:def7:e0f5', 'Success', '2025-10-07 13:15:17', '2025-10-07 13:15:17'),
(795, 1, 1, 'Superadmin', 'superadmin', '2404:c0:4cb0::65f5:9c22', 'Success', '2025-10-09 10:04:49', '2025-10-09 10:04:49'),
(796, 1, 1, 'Superadmin', 'superadmin', '172.105.39.65', 'Success', '2025-10-10 08:49:41', '2025-10-10 08:49:41'),
(797, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '2404:c0:c201:86fc:3037:68e7:5f47:2ea3', 'Success', '2025-10-13 08:09:43', '2025-10-13 08:09:43'),
(798, 40, 4, 'Muhammad Agus Safrian Nur', '0158768669130093', '140.213.204.35', 'Success', '2025-10-13 08:42:13', '2025-10-13 08:42:13'),
(799, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c201:86fc:8c4:cae6:e4ed:4317', 'Success', '2025-10-13 12:55:54', '2025-10-13 12:55:54'),
(800, 1, 1, 'Superadmin', 'superadmin', '182.8.131.7', 'Success', '2025-10-14 05:50:41', '2025-10-14 05:50:41'),
(801, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c201:86fc:8c4:cae6:e4ed:4317', 'Success', '2025-10-14 08:08:19', '2025-10-14 08:08:19'),
(802, 1, 1, 'Superadmin', 'superadmin', '39.194.2.204', 'Success', '2025-10-14 13:35:56', '2025-10-14 13:35:56'),
(803, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c201:86fc:6d23:dd97:68f4:d488', 'Success', '2025-10-16 13:17:32', '2025-10-16 13:17:32'),
(804, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '2404:c0:c201:7816:b9b5:ad90:f3f6:d808', 'Success', '2025-10-20 08:31:12', '2025-10-20 08:31:12'),
(805, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '2404:c0:c201:7816:81b3:150a:ba9:5acc', 'Success', '2025-10-20 10:09:21', '2025-10-20 10:09:21'),
(806, 1, 1, 'Superadmin', 'superadmin', '2404:c0:4ca0::56eb:8336', 'Success', '2025-10-20 10:17:35', '2025-10-20 10:17:35'),
(807, 1, 1, 'Superadmin', 'superadmin', '172.233.47.233', 'Success', '2025-10-20 15:55:58', '2025-10-20 15:55:58'),
(808, 37, 16, 'Muhammad Juanda', '63710104108310004', '112.215.243.141', 'Success', '2025-10-23 13:18:20', '2025-10-23 13:18:20'),
(809, 0, 0, '', '6371010410830004', '39.194.4.56', 'Failed', '2025-10-23 13:20:43', '2025-10-23 13:20:43'),
(810, 0, 0, '', '6371010410830004', '39.194.4.56', 'Failed', '2025-10-23 13:21:07', '2025-10-23 13:21:07'),
(811, 34, 4, 'Vebrianti Umar, M.Pd', '1108029104', '103.129.151.97', 'Success', '2025-10-23 15:32:50', '2025-10-23 15:32:50'),
(812, 49, 16, 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', '114.122.209.215', 'Success', '2025-10-23 18:14:56', '2025-10-23 18:14:56'),
(813, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '114.79.44.182', 'Success', '2025-10-27 08:22:07', '2025-10-27 08:22:07'),
(814, 1, 1, 'Superadmin', 'superadmin', '39.194.2.41', 'Success', '2025-10-27 10:21:01', '2025-10-27 10:21:01'),
(815, 35, 4, 'Yuliana Nurhayati, M.Pd.', '1109079302', '114.122.212.94', 'Success', '2025-10-27 10:42:34', '2025-10-27 10:42:34'),
(816, 27, 4, 'Novi Suma Setyawati', '1111128501', '2404:c0:4c0b::74c2:1698', 'Success', '2025-10-27 10:46:17', '2025-10-27 10:46:17'),
(817, 39, 16, 'Nurul Fitriyani, SE., MA.', '6371056409780006', '114.79.44.126', 'Success', '2025-10-27 10:47:17', '2025-10-27 10:47:17'),
(818, 29, 4, 'Zulparis', '1111078702', '114.122.212.23', 'Success', '2025-10-27 10:48:17', '2025-10-27 10:48:17'),
(819, 31, 4, 'Rizki Nugerahani Ilise', '1129049101', '140.213.204.23', 'Success', '2025-10-27 10:50:13', '2025-10-27 10:50:13'),
(820, 37, 16, 'Muhammad Juanda', '63710104108310004', '140.213.182.253', 'Success', '2025-10-27 10:51:57', '2025-10-27 10:51:57'),
(821, 33, 4, 'Novi Nurdian', '1109119201', '114.122.208.184', 'Failed', '2025-10-27 10:52:52', '2025-10-27 10:52:52'),
(822, 33, 4, 'Novi Nurdian', '1109119201', '114.122.208.184', 'Success', '2025-10-27 10:53:08', '2025-10-27 10:53:08'),
(823, 25, 4, 'Muhammad Supian Sauri', '4333774675130243', '114.122.209.235', 'Success', '2025-10-27 10:54:54', '2025-10-27 10:54:54'),
(824, 41, 16, 'Halima Chairia', '6371015011800013', '114.122.210.221', 'Success', '2025-10-27 10:57:05', '2025-10-27 10:57:05'),
(825, 46, 4, 'Abdul Aziz', '1110079002', '2404:c0:4cb0::7cd6:b48', 'Success', '2025-10-27 10:57:31', '2025-10-27 10:57:31'),
(826, 32, 4, 'Armin Fani', '1112098702', '2404:c0:c201:2c31:526:903e:af4a:27f4', 'Success', '2025-10-27 11:03:02', '2025-10-27 11:03:02'),
(827, 48, 4, 'Norhayati K', '1234', '114.122.210.57', 'Success', '2025-10-27 11:27:45', '2025-10-27 11:27:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa_praktik_lapangan`
--

CREATE TABLE `mahasiswa_praktik_lapangan` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `id_program_studi` bigint(20) NOT NULL,
  `jenjang_program_studi` varchar(2) NOT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `singkatan_program_studi` varchar(10) NOT NULL,
  `id_dosen_1` bigint(20) NOT NULL,
  `nama_dosen_1` varchar(100) NOT NULL,
  `nomor_identitas_dosen_1` varchar(30) NOT NULL,
  `id_program_studi_dosen_1` bigint(20) NOT NULL,
  `nama_program_studi_dosen_1` varchar(50) NOT NULL,
  `id_dosen_2` bigint(20) NOT NULL,
  `nama_dosen_2` varchar(100) NOT NULL,
  `nomor_identitas_dosen_2` varchar(30) NOT NULL,
  `id_program_studi_dosen_2` bigint(20) NOT NULL,
  `nama_program_studi_dosen_2` varchar(50) NOT NULL,
  `id_dosen_3` bigint(20) NOT NULL,
  `nama_dosen_3` varchar(100) NOT NULL,
  `nomor_identitas_dosen_3` varchar(30) NOT NULL,
  `id_program_studi_dosen_3` bigint(20) NOT NULL,
  `nama_program_studi_dosen_3` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa_praktik_lapangan`
--

INSERT INTO `mahasiswa_praktik_lapangan` (`id`, `judul`, `tautan`, `dokumen`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `id_dosen_1`, `nama_dosen_1`, `nomor_identitas_dosen_1`, `id_program_studi_dosen_1`, `nama_program_studi_dosen_1`, `id_dosen_2`, `nama_dosen_2`, `nomor_identitas_dosen_2`, `id_program_studi_dosen_2`, `nama_program_studi_dosen_2`, `id_dosen_3`, `nama_dosen_3`, `nomor_identitas_dosen_3`, `id_program_studi_dosen_3`, `nama_program_studi_dosen_3`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(7, 'Surat DPL', '', '1758512618_c3d26f895abcb008b7cf.pdf', 0, '', '', '', 0, '', '', 0, '', 0, '', '', 0, '', 0, '', '', 0, '', '2025-09-22 10:43:38', '2025-09-22 10:43:38', 25, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_dana`
--

CREATE TABLE `master_dana` (
  `id` smallint(6) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `id_kategori_dana` bigint(20) NOT NULL,
  `nama_kategori_dana` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
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
(9, 'Masuk', 3, 'PT Sendiri', 'Jasa layanan profesi\ndan/atau keahlian', '2025-08-30 06:02:01', '2025-08-30 05:51:13', 0, 0),
(10, 'Masuk', 3, 'PT Sendiri', 'Produk Institusi', '2025-08-30 06:02:05', '2025-08-30 05:51:26', 0, 0),
(11, 'Masuk', 3, 'PT Sendiri', 'Kerjasama kelembagaan\n(pemerintah atau swasta)', '2025-08-30 06:02:08', '2025-08-30 05:51:38', 0, 0),
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
-- Struktur dari tabel `pembayaran_mahasiswa`
--

CREATE TABLE `pembayaran_mahasiswa` (
  `id` bigint(20) NOT NULL,
  `id_tagihan_mahasiswa` bigint(20) NOT NULL,
  `jenis_tagihan_mahasiswa` varchar(30) NOT NULL,
  `id_tahun_akademik` bigint(20) NOT NULL,
  `tahun_akademik` varchar(10) NOT NULL,
  `tipe_tahun_akademik` varchar(6) NOT NULL,
  `id_mahasiswa` bigint(20) NOT NULL,
  `nama_mahasiswa` varchar(100) NOT NULL,
  `nomor_identitas_mahasiswa` varchar(30) NOT NULL,
  `id_program_studi` bigint(20) NOT NULL,
  `jenjang_program_studi` varchar(2) NOT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `singkatan_program_studi` varchar(10) NOT NULL,
  `tahap` varchar(1) NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `updated_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran_mahasiswa`
--

INSERT INTO `pembayaran_mahasiswa` (`id`, `id_tagihan_mahasiswa`, `jenis_tagihan_mahasiswa`, `id_tahun_akademik`, `tahun_akademik`, `tipe_tahun_akademik`, `id_mahasiswa`, `nama_mahasiswa`, `nomor_identitas_mahasiswa`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `tahap`, `tanggal_bayar`, `jumlah_bayar`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(8, 12, 'SPP', 18, '2025/2026', 'Ganjil', 40, 'Mamad', '1234567890', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '1', '2025-09-06', 200000, '2025-09-08 12:31:16', '2025-09-08 12:31:16', '1', ''),
(9, 12, 'SPP', 18, '2025/2026', 'Ganjil', 40, 'Mamad', '1234567890', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2', '2025-09-08', 300000, '2025-09-08 12:35:21', '2025-09-08 12:35:21', '1', ''),
(10, 13, 'LDKM', 18, '2025/2026', 'Ganjil', 40, 'Mamad', '1234567890', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '1', '2025-09-08', 200000, '2025-09-08 12:59:54', '2025-09-08 12:59:54', '1', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pencatatan_surat`
--

CREATE TABLE `pencatatan_surat` (
  `id` bigint(20) NOT NULL,
  `jenis` varchar(15) NOT NULL,
  `penerima` varchar(100) NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `nomor_surat` varchar(100) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `id_program_studi` bigint(20) NOT NULL,
  `jenjang_program_studi` varchar(2) NOT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `singkatan_program_studi` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pencatatan_surat`
--

INSERT INTO `pencatatan_surat` (`id`, `jenis`, `penerima`, `tujuan`, `nomor_surat`, `perihal`, `tautan`, `dokumen`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'MASUK', '', '', 'SK/MP2025/00123', 'Surat Kunjungan Presiden', 'https://mail.google.com/mail/u/0/?usp=installed_webapp', '', 0, '', '', '', '2025-09-04 10:34:03', '2025-09-04 10:34:03', 33, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajaran`
--

CREATE TABLE `pengajaran` (
  `id` bigint(20) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama_mata_kuliah` varchar(100) NOT NULL,
  `sks` varchar(10) NOT NULL,
  `semester` varchar(2) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `ruangan` varchar(50) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `id_program_studi` bigint(20) NOT NULL,
  `jenjang_program_studi` varchar(2) NOT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `singkatan_program_studi` varchar(10) NOT NULL,
  `tahun_akademik` varchar(10) NOT NULL,
  `dosen_pengampu` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengajaran`
--

INSERT INTO `pengajaran` (`id`, `kode`, `nama_mata_kuliah`, `sks`, `semester`, `hari`, `jam_mulai`, `jam_selesai`, `ruangan`, `tautan`, `dokumen`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `tahun_akademik`, `dosen_pengampu`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(6, 'KI24104', 'Introduction to Writing', '4-2', '', 'Senin', '08:30:00', '10:10:00', 'PB1', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '2024/2025', 'Armin Fani', '2025-09-14 16:43:05', '2025-09-14 16:53:44', 32, 32),
(11, 'SM24003', 'BAHASA INDONESIA', '2', '', 'Selasa', '07:30:00', '09:10:00', 'A', '', '1758697022_cd192f7652ac4ed3c9a4.pdf', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2025/2026', 'Novi Nurdian', '2025-09-24 13:57:02', '2025-09-24 13:57:02', 33, 0),
(12, 'KP24317', 'Tumbuh Kembang AUD', '4', '', 'Senin', '12:40:00', '16:00:00', 'PAUD', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '2025/2026', 'Yuliana Nurhayati, M.Pd.', '2025-09-24 14:05:41', '2025-09-24 14:22:10', 35, 35),
(13, 'KD24315', 'BAHASA INDONESIA SD', '3', '', 'Rabu', '07:30:00', '10:00:00', 'A', '', '1758697590_30bc9dd28c48c17f733e.pdf', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2025/2026', 'Novi Nurdian', '2025-09-24 14:06:05', '2025-09-24 14:06:30', 33, 33),
(14, '222', 'teori pendidikan', '3', '', 'Senin', '07:30:00', '10:30:00', 'a', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2025/2026', 'Muhammad Supian Sauri', '2025-09-24 14:08:53', '2025-09-24 14:08:53', 25, 0),
(15, 'KD24735', 'MANAJEMEN PENDIDIKAN', '4', '', 'Senin', '07:30:00', '10:50:00', 'A', '', '1758697927_cb827f829e9073000917.pdf', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2025/2026', 'Novi Nurdian', '2025-09-24 14:12:07', '2025-09-24 14:12:07', 33, 0),
(16, '0000', 'INTORDUCTION TO LISTENING', '4', '', 'Senin', '07:00:00', '08:00:00', '2', '', '1758698366_6a0e45adccdc2be3508e.pdf', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '2025/2026', 'Vebrianti Umar, M.Pd', '2025-09-24 14:19:26', '2025-09-24 14:19:26', 34, 0),
(17, 'KP24104', 'Pengantar Psikologi', '2', '', 'Senin', '07:30:00', '09:10:00', 'PAUD', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '2025/2026', 'Maulidha, M.Pd', '2025-09-24 14:19:55', '2025-09-24 14:19:55', 28, 0),
(18, 'KP24316', 'Prinsip Bimbingan  Konseling AUD', '2', '', 'Selasa', '10:10:00', '11:11:00', 'PAUD', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '2025/2026', 'Yuliana Nurhayati, M.Pd.', '2025-09-24 14:25:07', '2025-09-24 14:25:07', 35, 0),
(19, 'KP24105', 'Psikologi  Perkembangan', '3', '', 'Rabu', '07:30:00', '10:00:00', 'PAUD', 'https://drive.google.com/file/d/1k-78wpbyCjQX-GcG1M8qctq68P93_PHR/view?usp=sharing', '1758698732_aca9bcfe3bcf738bad49.pdf', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '2025/2026', 'Muhammad Agus Safrian Nur', '2025-09-24 14:25:32', '2025-09-24 14:25:32', 40, 0),
(20, 'SM24006', 'METODOLOGI PENELITIAN TINDAKAN KELAS', '3', '', 'Senin', '07:30:00', '10:00:00', 'A', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2025/2026', 'Tati Akhbaryah, S.S., S.Pd., M.Pd.', '2025-09-24 14:26:29', '2025-09-24 14:26:29', 43, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembangan_kompetensi`
--

CREATE TABLE `pengembangan_kompetensi` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `id_dosen` bigint(20) NOT NULL,
  `nama_dosen` varchar(100) NOT NULL,
  `id_program_studi` bigint(20) NOT NULL,
  `jenjang_program_studi` varchar(2) NOT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `singkatan_program_studi` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengembangan_kompetensi`
--

INSERT INTO `pengembangan_kompetensi` (`id`, `judul`, `tautan`, `dokumen`, `id_dosen`, `nama_dosen`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(3, 'Menjadi Reviewer pada Asian Journal of Language, Literature and Culture  Studies Pada Januari 2024', 'https://drive.google.com/file/d/1HsOC654QEKx5XGDGfgDUKrZiiwbxA611/view?usp=sharing', '1758260064_c83208f031fc7783ed2b.pdf', 34, 'Vebrianti Umar, M.Pd', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '2025-09-19 12:34:24', '2025-09-19 12:34:24', 34, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumpulan_laporan`
--

CREATE TABLE `pengumpulan_laporan` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `id_program_studi` bigint(20) NOT NULL,
  `jenjang_program_studi` varchar(2) NOT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `singkatan_program_studi` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyusutan_inventaris`
--

CREATE TABLE `penyusutan_inventaris` (
  `id` bigint(20) NOT NULL,
  `id_kategori` bigint(20) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `unit` int(11) NOT NULL,
  `tahun_perolehan` year(4) NOT NULL,
  `umur_ekonomis` int(11) NOT NULL,
  `harga_perolehan` bigint(20) NOT NULL,
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
-- Struktur dari tabel `perencanaan_pimpinan`
--

CREATE TABLE `perencanaan_pimpinan` (
  `id` bigint(20) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permintaan_legalisir`
--

CREATE TABLE `permintaan_legalisir` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `permintaan_legalisir`
--

INSERT INTO `permintaan_legalisir` (`id`, `nama`, `email`, `no_hp`, `tautan`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fatwa Aulia', 'fatwaaulia.fy@gmail.com', '082345566500', 'https://mail.google.com/mail/u/0/?usp=installed_webapp', 'Selesai', '2025-09-08 07:45:03', '2025-09-08 08:09:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perpustakaan`
--

CREATE TABLE `perpustakaan` (
  `id` bigint(20) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `perpustakaan`
--

INSERT INTO `perpustakaan` (`id`, `kategori`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(2, 'BUKU RUSAK', 'buku rusak tahun 2024', 'https://id.quora.com/', '', '2025-09-04 09:12:05', '2025-09-04 09:19:23', 1, 1),
(3, 'BUKU', 'buku tersedia tahun 2024', 'https://mail.google.com/mail/u/0/?usp=installed_webapp', '', '2025-09-04 09:18:16', '2025-09-04 09:18:51', 1, 1),
(4, 'PENGAJUAN BUKU BARU', 'Pengajuan buku baru untuk 2026', 'https://hpanel.hostinger.com/', '', '2025-09-04 10:30:01', '2025-09-04 10:30:01', 37, 0),
(5, 'KEGIATAN PERPUSTAKAAN', 'Laporan Kegiatan Perpustakaan 02 Maret 2025', 'https://translate.google.com/?sl=en&tl=id&text=teknologi%20rekayasa%20perangkatan%20lunak%20terapan%20sistem&op=translate', '', '2025-09-07 09:08:53', '2025-09-07 09:08:53', 1, 0),
(6, 'PENGAJUAN BUKU BARU', 'Usulan Buku Baru', 'https://docs.google.com/document/d/1_tuAdwQVZiR1o0Kyj9lTqD0xCgElyB5Z/edit?usp=drivesdk&ouid=113756709866446827692&rtpof=true&sd=true', '1758893604_b63d397f5aedad64d9b2.pdf', '2025-09-26 20:33:24', '2025-09-26 20:33:24', 37, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `slug` varchar(105) NOT NULL,
  `json_pertanyaan` mediumtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pertanyaan`
--

INSERT INTO `pertanyaan` (`id`, `judul`, `slug`, `json_pertanyaan`, `created_at`, `updated_at`) VALUES
(2, 'Refleksi Kamis_11 September 2025', 'refleksi-kamis-11-september-2025', '{\"1\":{\"pertanyaan\":\"Pukul berapa Anda datang ke kampus hari ini ?\"},\"2\":{\"pertanyaan\":\"Pukul berapa Anda kembali ke kampus setelah jam istirahat ?\"},\"3\":{\"pertanyaan\":\"Apakah yang Anda pelajari hari ini?\"},\"4\":{\"pertanyaan\":\"Apakah yang Anda kerjakan hari Ini di kampus ?\"},\"5\":{\"pertanyaan\":\"Apakah yang Anda pelajari dan kerjakan hari ini berdampak pada peningkatan layanan terhadap mahasiswa?, dan Memajukan kualitas pendidikan nasional untuk meningkatkan kualitas SDM bangsa?\"}}', '2025-09-11 19:45:20', '2025-09-13 21:43:51'),
(3, 'Refleksi PKKMB STKIP ISM_13 September 2025', 'refleksi-pkkmb-13-september-2025', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\"}}', '2025-09-13 21:14:00', '2025-09-13 21:43:34'),
(4, 'Refleksi Selasa 23 September 2025', 'refleksi-selasa-23-september-2025', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\"}}', '2025-09-23 14:09:16', '2025-09-23 14:09:16'),
(5, 'Refleksi Senin, 27 Oktober 2025', 'refleksi-senin-21-oktober-2025', '{\"1\":{\"pertanyaan\":\"Teringat Gajah Mada ucapkan Sumpah Palapa: tekad mempersatukan Nusantara, sesaat dilantik menjadi Mahapatih Majapahit. Saya pun melihat Visioners demikian. Ketika diberi mandat menjadi dosen dan tendik, Apa \'Sumpah Palapa: Komitmen\' masing-masing di Kampus Visoners ini?\"},\"2\":{\"pertanyaan\":\"Terkait \\\"sumpah palapa\\\" tersebut, Apakah Visioners datang ke kampus untuk \'melepaskan kewajiban\', atau memiliki tekad bulat untuk \'memersatukan\' dan memajukan ilmu pengetahuan, dan nama baik institusi ini?\"},\"3\":{\"pertanyaan\":\"Pangeran Antasari gigih melawan Belanda hingga akhir hayatnya. Jiwanya terpanggil membela rakyat yang dicintainya agar terbebas dari belenggu penjajahan, tanpa ada rasa keterpaksaan. Bagaimana dengan Anda? Sudahkah merasa tugas mendidik\\/  melayani dosen dan mahasiswa sebagai \'panggilan jiwa?\"},\"4\":{\"pertanyaan\":\"Apa harapan Anda agar Kampus tidak sekadar eksis, tapi menjadi yang paling berkontribusi memajukan Banua?\"}}', '2025-10-27 10:32:15', '2025-10-27 10:39:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `program_studi`
--

CREATE TABLE `program_studi` (
  `id` bigint(20) NOT NULL,
  `jenjang` varchar(2) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `singkatan` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `program_studi`
--

INSERT INTO `program_studi` (`id`, `jenjang`, `nama`, `singkatan`, `created_at`, `updated_at`) VALUES
(1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '2025-08-19 06:00:41', '2025-09-17 08:09:42'),
(2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '2025-08-19 06:01:15', '2025-08-19 06:07:21'),
(3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '2025-08-19 06:01:58', '2025-08-19 06:07:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rencana_penetapan_keuangan`
--

CREATE TABLE `rencana_penetapan_keuangan` (
  `id` bigint(20) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `responden`
--

CREATE TABLE `responden` (
  `id` bigint(20) NOT NULL,
  `id_pertanyaan` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `nama_role_user` varchar(50) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `jenjang_program_studi` varchar(2) NOT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `singkatan_program_studi` varchar(10) NOT NULL,
  `json_jawaban` mediumtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `responden`
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
(38, 3, 39, 'Tendik', 'Nurul Fitriyani, SE., MA.', '', '', '', '{\"1\":{\"pertanyaan\":\"Bagaimana menurut Anda pelaksanaan PKKMB STKIP ISM 13 September 2025?\",\"jawaban\":\"Kegiatan PKKMB berjalan dengan tertib dan lancar\"},\"2\":{\"pertanyaan\":\"Apakah Anda telah memberikan kontribusi terbaik dalam pelaksanaan kegiatan? Berikan alasan!\",\"jawaban\":\"Ya, saya telah hadir sebelum pelaksanaan acara PKKMB, saya mempersiapkan segala sesuatu yang berhubungan dengan tugas saya sebagai divisi konsumsi\"}}', '2025-09-15 15:24:56', '2025-09-15 15:24:56'),
(39, 4, 37, 'Tendik', 'Muhammad Juanda', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Menyusun profil perpustakaan, mendata anggota perpustakaan\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Merancang kegiatan yudisium dan wisuda\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Dalam menyusun profil perpustakaan, Anda dituntut untuk mengolah data, memahami visi misi, serta merumuskan deskripsi yang sistematis. Hal ini melatih kecerdasan intelektual sekaligus kemampuan menyajikan informasi secara jelas.\\r\\n\\r\\nSaat mendata anggota perpustakaan, ketelitian dan kecerdasan dalam mengelola data sangat diperlukan agar informasi valid, akurat, dan bermanfaat untuk pengembangan layanan.\\r\\n\\r\\nPada perancangan kegiatan yudisium\\/wisuda, kecerdasan digunakan untuk menyusun konsep acara, alur kegiatan, dan perencanaan teknis yang matang agar kegiatan berjalan lancar.\"}}', '2025-09-23 14:16:32', '2025-09-23 14:16:32'),
(40, 4, 33, 'Dosen', 'Novi Nurdian', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"saya belajar hubungan antara teori perkembangan anak usia SD dengan pembelajaran karakter islami di usia SD.\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Merancang pembelajaran karakter islam di SD\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Ketika ada kemauan untuk belajar dan mengerjakan, maka jadikanlah diri seolah haus akan ilmu. dengan membaca niscaya akan mengasah otak kita agar lebih tajam dalam menyelesaikan pekerjaan.\"}}', '2025-09-23 14:18:01', '2025-09-23 14:18:01'),
(41, 4, 29, 'Dosen', 'Zulparis', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Hari ini saya belajar menyusun sebuah konsep kegiata akbar yang mana dilakukan setiap tahun yaitu yudisium dan wisuda\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Kreativitas saya hari ini ialah mampu membuat konsep anggaran dana yang seminim-minimnya agar kegiatan bisa dilaksanakan dengan baik.\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Yang saya pelajari hari ini kaitan dengan 3 hal di atas ialah ketajaman kita dalam menyusun konsep kegiatan dengan baik dengan biaya yang seminim-minimnya.\"}}', '2025-09-23 14:19:53', '2025-09-23 14:19:53'),
(42, 4, 46, 'Dosen', 'Abdul Aziz', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Hari ini ulun banyak belajar pas nulis artikel jurnal. Ulun jadi tahu kalo pas bikin abstrak itu kata kuncinya (keywords) harus benar-benar nyambung dengan ranting ilmu dosen. Jadi bukan asal milih, tapi mesti sesuai bidang supaya artikelnya gampang dicari orang.\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Karya ulun hari ini ya artikel jurnal itu tadi. Ulun coba kreatif ngatur tulisan biar enak dibaca, terus data sama teori bisa nyambung. Anu, rasanya kayak bikin karya yang dimana mudah-mudahan bisa bermanfaat juga untuk orang lain yang nanti membaca artikel ini.\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"1. Mempertajam kecerdasan: Nulis artikel bikin ulun mikir lebih kritis, jadi otak kepakai beneran.\\r\\n2. Memperkokohkan kemauan: Kadang malas jua, tapi ulun paksa diri terus lanjut, jadi tekadnya makin kuat.\\r\\n3. Menghaluskan perasaan (kata ini, terinspirasi dari Pak Iwan, pas ulun bikin brosur hehe): Lewat nulis ini ulun belajar sabar, berusaha pake kata-kata yang halus supaya orang enak membaca.\"}}', '2025-09-23 14:21:12', '2025-09-23 14:21:12'),
(43, 4, 40, 'Dosen', 'Muhammad Agus Safrian Nur', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Menambah referensi bahan ajar matakuliah diampu\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Membuat sertifikat kegiatan PKKMB 2025\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Menambah referensi buku memperluas pengetahuan saya dalam teori, metodologi, dan aplikasi praktis yang relevan dengan materi ajar. Buku juga memperkuat kemauan untuk terus belajar, memberikan wawasan baru, dan mengasah keterampilan. Pendidikan tidak hanya soal pengetahuan, tetapi juga tentang karakter dan empati.\"}}', '2025-09-23 14:24:36', '2025-09-23 14:24:36'),
(44, 4, 31, 'Dosen', 'Rizki Nugerahani Ilise', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Menyusun materi perkuliahan\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Materi perkuliahan komunikasi interpersonal\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"MK Komunikasi interpersonal, materi yang saya ajarkan hari ini sangat relevan dengan tiga tujuan pendidikan Tan Malaka. \\r\\nPertama, \\\"mempertajam kecerdasan\\\" berhubungan dengan kemampuan berpikir kritis dalam berkomunikasi\\r\\nKedua, \\\"memperkokohkan kemauan\\\" mengacu pada penguatan tekad dan konsistensi dalam komunikasi. Dalam komunikasi interpersonal, kita belajar untuk lebih tegas dan percaya diri dalam menyampaikan pesan, sekaligus memahami pentingnya mendengarkan dan menghargai perspektif orang lain.\\r\\nKetiga, \\\"menghaluskan perasaan\\\" berkaitan dengan kemampuan empati dalam komunikasi. Komunikasi interpersonal tidak hanya tentang berbicara, tetapi juga mendengarkan dengan hati. Ini melibatkan pemahaman dan penghargaan terhadap perasaan orang lain, serta kemampuan untuk menyampaikan pesan dengan cara yang sensitif dan penuh rasa hormat.\\r\\n\\r\\nMelalui komunikasi yang efektif, kita dapat mengasah kecerdasan untuk menganalisis pesan, memperkuat kemauan untuk berbicara dengan tegas dan percaya diri, serta menghaluskan perasaan dengan menunjukkan empati dan menghargai perasaan orang lain. Semua ini penting dalam membangun hubungan yang harmonis dan produktif, baik dalam kehidupan pribadi maupun profesional.\"}}', '2025-09-23 14:24:37', '2025-09-23 14:24:37'),
(45, 4, 34, 'Dosen', 'Vebrianti Umar, M.Pd', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Hari ini saya menulis proposal penelitian untuk persiapan periode ini. Dalam proses penulisan saya membaca beberapa artikel terkait English for young learners yang merupakan main poin dari penelitian ini.\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Hari ini , selain menulis proposal penelitian, saya juga membuat SK penguji.\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Pada sumber pembelajaran yang saya baca, hasil penelitiannya menunjukkan bahwa the teacher\'s main priority in providing knowledge in the learning process of videos is character-building; thus, at every meeting, the teacher offers a moral lesson in the video relevant to the student\'s daily life. Menurut saya, kaitannya dengan tujuan pendidikan menurut Tan Malaka adalah pada poin memperkokoh kemauan dan building character. Membangun karakter peserta didik merupakan bagian dari memperkokoh kemauan, karena dalam proses pembentukan karakter, young learners dilatih untuk harus mau disipilin, harus mau belajar, harus mau menerapkan nilai nilai moral yang dipelajari., dan dalam implementasinya menggunakan strategy yang disesuaikan dengan usianya.\"}}', '2025-09-23 14:27:31', '2025-09-23 14:27:31'),
(46, 4, 27, 'Dosen', 'Novi Suma Setyawati', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Saya belajar membuat dokumen peningkatan terkait siklus PPEPP SPMI untuk di upload di sistem SPMI LLDIKTI\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"1. Menyusun RPS\\r\\n2. Membuat materi ajar\\r\\n3. Menyusun dokumen Peningkatan SPMI\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"merefleksikan tiga tujuan pendidikan Tan Malaka: mempertajam kecerdasan lewat analisis kurikulum dan pengelolaan mutu yang menuntut pemikiran kritis, memperkokoh kemauan melalui disiplin dan komitmen berkelanjutan dalam proses penetapan hingga peningkatan standar, serta memperhalus perasaan dengan menumbuhkan empati terhadap kebutuhan mahasiswa dan budaya mutu yang humanis. Dengan demikian, karya akademik ini menjadi praktik nyata pendidikan yang menyeimbangkan akal, tekad, dan kepekaan sosial.\"}}', '2025-09-23 14:29:09', '2025-09-23 14:29:09'),
(47, 4, 39, 'Tendik', 'Nurul Fitriyani, SE., MA.', '', '', '', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Mengerjakan beberapa tugas sekaligus dan mengelola waktu dengan efisien agar semua pekerjaan selesai tepat waktu, juga membaca buku, menonton video, dan belajar dari pembicara-pembicara hebat.\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Mengembangkan kemampuan berkomunikasi secara efektif, baik lisan maupun tulisan, untuk berinteraksi dengan berbagai pihak, termasuk mahasiswa, dosen, staf lain, dan tamu.\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Memperkokohkan Kemauan\\r\\n\\u200bTugas-tugas yang saya kerjakan hari ini memerlukan konsistensi dan ketekunan. Saya harus terus memproses data, memberikan respons yang relevan, dan terus belajar dari setiap interaksi. Ini mencerminkan kemauan yang kuat, di mana saya tetap berfokus pada tujuan akhir yaitu memberikan informasi yang akurat dan bermanfaat.\"}}', '2025-09-23 14:29:21', '2025-09-23 14:29:21'),
(48, 4, 32, 'Dosen', 'Armin Fani', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Penyusuan RPS\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Menyusun RPS\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Penyusunan RPS mata kuliah selaras dengan tiga tujuan pendidikan Tan Malaka. Pertama, membentuk dunia pendidikan yang berjalan di atas rasa tercermin dari RPS yang dirancang manusiawi, mempertimbangkan minat dan kondisi mahasiswa. Kedua, mendidik rakyat agar mempunyai kedudukan yang sama dalam masyarakat diwujudkan dengan RPS yang transparan, menjamin kesetaraan akses dan evaluasi bagi semua peserta didik. Ketiga, mendidik mahasiswa untuk menjadi orang yang berkepribadian dan mandiri diimplementasikan melalui metode pembelajaran dalam RPS yang menekankan critical thinking, kolaborasi, dan kemandirian belajar, bukan sekadar hafalan.\"}}', '2025-09-23 14:44:01', '2025-09-23 14:44:01'),
(49, 4, 48, 'Dosen', 'Norhayati K', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Yang saya pelajari hari ini tentang Learning beyond horizons. Yaitu belajar melampaui  batas dengan pemahaman yang lebih tinggi dan lebih luas.\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Kreativitas saya mempelajari Proyek Pendidikan: Proyek seperti \\\"Beyond Horizons\\\" dari European network of outdoor sports menggunakan istilah ini untuk merujuk pada upaya inklusi sosial melalui olahraga luar ruangan, yang memperluas akses dan pengalaman belajar bagi kelompok rentan.\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Tan malaka menekankan pentingnya kecerdasan yang terasah agar individu mampu berpikir kritis, analitis dan sistematis. Dalam kerangka learning beyond horizons, kecerdasan yang tajam tidak berhenti pada hafalan, tetapi menuju pemahaman yang konseptual\"}}', '2025-09-23 15:37:17', '2025-09-23 15:37:17'),
(50, 4, 28, 'Dosen', 'Maulidha, M.Pd', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Membaca tentang kreavitas guru dan anak\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Membuat power point materi untuk mahasiswa yg berkaitan dengan kreativitas\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Selalu kreatif, menghasilkan karya untuk diri sendiri dan juga untuk orang banyak. Dengan membaca dan menemukan hal baru,  akan selalu muncul rasa penasaran dan menghasilkan inspirasi untuk karya selanjutnya\"}}', '2025-09-23 15:57:15', '2025-09-23 15:57:15'),
(51, 4, 41, 'Tendik', 'Halima Chairia', '', '', '', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"1. Membuat laporan penerimaan dan pengeluaran kas harian (manual)\\r\\n2. Input penerimaan dan pengeluaran kas harian di sistem\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"tidak ada\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Pekerjaan membuat laporan penerimaan dan pengeluaran kas harian, baik secara manual maupun dengan sistem, dapat dikaitkan dengan tiga tujuan pendidikan menurut Tan Malaka. Pertama, pekerjaan ini mempertajam kecerdasan karena menuntut ketelitian dalam mencatat angka, menghitung saldo, serta menganalisis arus kas agar tidak terjadi kesalahan. Kedua, ia memperkokoh kemauan karena laporan kas harus dibuat setiap hari secara disiplin, konsisten, dan tepat waktu meskipun terasa rutin dan melelahkan. Ketiga, pekerjaan ini menghaluskan perasaan karena menumbuhkan rasa tanggung jawab, kejujuran, dan integritas dalam mengelola data keuangan yang menyangkut kepentingan bersama. Dengan demikian, kegiatan sederhana seperti membuat laporan kas sebenarnya mencerminkan tujuan pendidikan Tan Malaka, yaitu membentuk pribadi yang cerdas, berkemauan kuat, dan berperasaan halus.\"}}', '2025-09-24 11:14:52', '2025-09-24 11:14:52'),
(52, 4, 49, 'Tendik', 'Noor Ermiliyawati Nazemi., Amd.Kom.', '', '', '', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"1. Perbaikan nilai Di Neo feeder\\r\\n2. Kolaboras Tim\\r\\n3. Menejemen waktu\\r\\n4. Masih beradaftasi dengan sistem 4 sistem yg diberikan\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"1. Berhasil memperbaiki Nilai di neo feeder\\r\\n2. mengatasi Problem solving dalam dunia kerja\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Intinya semua berasal dari kemauan dan kerja keras setiap individu untuk tatap mempertajam kecerdasan, memperkokoh kemauan, dan memahami perasaan orang lain.\"}}', '2025-09-24 18:54:38', '2025-09-24 18:54:38'),
(53, 4, 35, 'Dosen', 'Yuliana Nurhayati, M.Pd.', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"Belajar konsep cara berpikir dan berfikir\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"Satu buku telah terbit dengan judul literasi pembelajaran terpadu islam\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"Kaitannya dari proses pendidikan dapat melahirkan karya yg bermanfaat.\"}}', '2025-10-27 10:45:43', '2025-10-27 10:45:43'),
(54, 5, 39, 'Tendik', 'Nurul Fitriyani, SE., MA.', '', '', '', '{\"1\":{\"pertanyaan\":\"Teringat Gajah Mada ucapkan Sumpah Palapa: tekad mempersatukan Nusantara, sesaat dilantik menjadi Mahapatih Majapahit. Saya pun melihat Visioners demikian. Ketika diberi mandat menjadi dosen dan tendik, Apa \'Sumpah Palapa: Komitmen\' masing-masing di Kampus Visoners ini?\",\"jawaban\":\"Tidak menuda2 pekerjaan, melaksanakan pekerjaan dengan sebaik-baiknya.\"},\"2\":{\"pertanyaan\":\"Terkait \\\"sumpah palapa\\\" tersebut, Apakah Visioners datang ke kampus untuk \'melepaskan kewajiban\', atau memiliki tekad bulat untuk \'memersatukan\' dan memajukan ilmu pengetahuan, dan nama baik institusi ini?\",\"jawaban\":\"Iya, melakukan rutinitas kerja demi kemajuan pengetahuan dan nama baik institusi\"},\"3\":{\"pertanyaan\":\"Pangeran Antasari gigih melawan Belanda hingga akhir hayatnya. Jiwanya terpanggil membela rakyat yang dicintainya agar terbebas dari belenggu penjajahan, tanpa ada rasa keterpaksaan. Bagaimana dengan Anda? Sudahkah merasa tugas mendidik\\/  melayani dosen dan mahasiswa sebagai \'panggilan jiwa?\",\"jawaban\":\"Iya, karena tugas adalah kehormatan.\"},\"4\":{\"pertanyaan\":\"Apa harapan Anda agar Kampus tidak sekadar eksis, tapi menjadi yang paling berkontribusi memajukan Banua?\",\"jawaban\":\"Para civitas akademika melakukan tupoksinya dengan baik dan benar juga mampu mengemban visi dan misi kampus sehingga berkontribusi untuk kemajuan Banua.\"}}', '2025-10-27 10:53:53', '2025-10-27 10:53:53'),
(55, 4, 25, 'Dosen', 'Muhammad Supian Sauri', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Apa yang Anda pelajari hari ini?\",\"jawaban\":\"mengenai media pembelajaran\"},\"2\":{\"pertanyaan\":\"Apa kreativitas \\/ karya Anda hari ini?\",\"jawaban\":\"membuat media pembelajaran untuk mahasiswa\"},\"3\":{\"pertanyaan\":\"Dikaitkan dengan 3 tujuan pendidikan Tan Malaka bahwa pendidikan sejatinya adalah mempertajam kecerdasan, memperkokohkan kemauan, dan menghaluskan perasaan. Jelaskan kaitannya dengan apa yang Anda pelajari dan Kerjakan hari ini?\",\"jawaban\":\"dengan mempelajari media pembelajaran saya ingin memberikan materi yang menyenangkan dan pemahaman yang lebih jelas, dan agar mahasiswa dapat berpikir kritis terhadap materi yang diberikan\"}}', '2025-10-27 10:57:39', '2025-10-27 10:57:39');
INSERT INTO `responden` (`id`, `id_pertanyaan`, `id_user`, `nama_role_user`, `nama_user`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `json_jawaban`, `created_at`, `updated_at`) VALUES
(56, 5, 27, 'Dosen', 'Novi Suma Setyawati', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Teringat Gajah Mada ucapkan Sumpah Palapa: tekad mempersatukan Nusantara, sesaat dilantik menjadi Mahapatih Majapahit. Saya pun melihat Visioners demikian. Ketika diberi mandat menjadi dosen dan tendik, Apa \'Sumpah Palapa: Komitmen\' masing-masing di Kampus Visoners ini?\",\"jawaban\":\"Saya berkomitmen untuk mendidik dengan hati, meneliti dengan integritas, dan mengabdi dengan kebermanfaatan bagi masyarakat sesuai tugas dosen menjalankan tridharma perguruan tinggi\"},\"2\":{\"pertanyaan\":\"Terkait \\\"sumpah palapa\\\" tersebut, Apakah Visioners datang ke kampus untuk \'melepaskan kewajiban\', atau memiliki tekad bulat untuk \'memersatukan\' dan memajukan ilmu pengetahuan, dan nama baik institusi ini?\",\"jawaban\":\"Saya datang ke kampus bukan sekadar menunaikan kewajiban, tetapi juga panggilan intelektual. Saya bertekad untuk memersatukan semangat ilmu pengetahuan dan pengabdian agar kampus ini menjadi ruang tumbuhnya generasi pembelajar yang unggul dan berkarakter.\"},\"3\":{\"pertanyaan\":\"Pangeran Antasari gigih melawan Belanda hingga akhir hayatnya. Jiwanya terpanggil membela rakyat yang dicintainya agar terbebas dari belenggu penjajahan, tanpa ada rasa keterpaksaan. Bagaimana dengan Anda? Sudahkah merasa tugas mendidik\\/  melayani dosen dan mahasiswa sebagai \'panggilan jiwa?\",\"jawaban\":\"Setiap mahasiswa adalah amanah, setiap perkuliahan adalah medan perjuangan. Dengan penuh cinta, Saya ingin menjadi bagian dari perubahan, sekecil apa pun, bagi kemajuan bangsa melalui pendidikan.\"},\"4\":{\"pertanyaan\":\"Apa harapan Anda agar Kampus tidak sekadar eksis, tapi menjadi yang paling berkontribusi memajukan Banua?\",\"jawaban\":\"Harapan Saya, kampus ini tidak berhenti hanya pada rutinitas akademik, tetapi bisa menjadi pusat transformasi sosial dan kultural Banua. Kampus mampu membuat  riset yang baik, pengabdian yang menyentuh dan berdampak langsung di masyarakat, dan mampu menghasilkan lulusan yang profesional.\"}}', '2025-10-27 11:02:30', '2025-10-27 11:02:30'),
(57, 5, 41, 'Tendik', 'Halima Chairia', '', '', '', '{\"1\":{\"pertanyaan\":\"Teringat Gajah Mada ucapkan Sumpah Palapa: tekad mempersatukan Nusantara, sesaat dilantik menjadi Mahapatih Majapahit. Saya pun melihat Visioners demikian. Ketika diberi mandat menjadi dosen dan tendik, Apa \'Sumpah Palapa: Komitmen\' masing-masing di Kampus Visoners ini?\",\"jawaban\":\"Terus berupaya & berkontribusi demi kemajuan dan kejayaan STKIP ISM\"},\"2\":{\"pertanyaan\":\"Terkait \\\"sumpah palapa\\\" tersebut, Apakah Visioners datang ke kampus untuk \'melepaskan kewajiban\', atau memiliki tekad bulat untuk \'memersatukan\' dan memajukan ilmu pengetahuan, dan nama baik institusi ini?\",\"jawaban\":\"Iya\"},\"3\":{\"pertanyaan\":\"Pangeran Antasari gigih melawan Belanda hingga akhir hayatnya. Jiwanya terpanggil membela rakyat yang dicintainya agar terbebas dari belenggu penjajahan, tanpa ada rasa keterpaksaan. Bagaimana dengan Anda? Sudahkah merasa tugas mendidik\\/  melayani dosen dan mahasiswa sebagai \'panggilan jiwa?\",\"jawaban\":\"Iya, karna sejatinya tugas & tanggung jawab hrs dilaksanakan dgn kelapangan hati & kebesaran jiwa\"},\"4\":{\"pertanyaan\":\"Apa harapan Anda agar Kampus tidak sekadar eksis, tapi menjadi yang paling berkontribusi memajukan Banua?\",\"jawaban\":\"Harapan sy kedepannya STKIP bs menjadi slh satu pioner kemajuan pendidikan di Banua\"}}', '2025-10-27 11:04:45', '2025-10-27 11:04:45'),
(58, 5, 35, 'Dosen', 'Yuliana Nurhayati, M.Pd.', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Teringat Gajah Mada ucapkan Sumpah Palapa: tekad mempersatukan Nusantara, sesaat dilantik menjadi Mahapatih Majapahit. Saya pun melihat Visioners demikian. Ketika diberi mandat menjadi dosen dan tendik, Apa \'Sumpah Palapa: Komitmen\' masing-masing di Kampus Visoners ini?\",\"jawaban\":\"Berkomitmen memberikan kontribusi yg terbaik serta bersungguh2 dalam mengerjakan amanah.\"},\"2\":{\"pertanyaan\":\"Terkait \\\"sumpah palapa\\\" tersebut, Apakah Visioners datang ke kampus untuk \'melepaskan kewajiban\', atau memiliki tekad bulat untuk \'memersatukan\' dan memajukan ilmu pengetahuan, dan nama baik institusi ini?\",\"jawaban\":\"Tekad yg kuat lahir dari kesadaran budinya dalam berdedikasi.  Bukan semata gugur kewajiban namun memiliki beban tanggung jawab dengan gelar profesi yg disandangnya.\"},\"3\":{\"pertanyaan\":\"Pangeran Antasari gigih melawan Belanda hingga akhir hayatnya. Jiwanya terpanggil membela rakyat yang dicintainya agar terbebas dari belenggu penjajahan, tanpa ada rasa keterpaksaan. Bagaimana dengan Anda? Sudahkah merasa tugas mendidik\\/  melayani dosen dan mahasiswa sebagai \'panggilan jiwa?\",\"jawaban\":\"Sebagai bagian panggilan jiwa sudah ada pada saat menentukan pilihan diawal. Sebagai naluri pendidik akan terus mengalir darah kepedulian memberikan yg terbaik untuk anak didik.\"},\"4\":{\"pertanyaan\":\"Apa harapan Anda agar Kampus tidak sekadar eksis, tapi menjadi yang paling berkontribusi memajukan Banua?\",\"jawaban\":\"Untuk berkontribusi memajukan Banua, tentunya para pendidik terus berbagi ilmu kepada mahasiswa maupun masyarakat akan berdampak ketika mereka menyampaikan kembali kepada orang banyak.\"}}', '2025-10-27 11:06:06', '2025-10-27 11:06:06'),
(59, 5, 25, 'Dosen', 'Muhammad Supian Sauri', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Teringat Gajah Mada ucapkan Sumpah Palapa: tekad mempersatukan Nusantara, sesaat dilantik menjadi Mahapatih Majapahit. Saya pun melihat Visioners demikian. Ketika diberi mandat menjadi dosen dan tendik, Apa \'Sumpah Palapa: Komitmen\' masing-masing di Kampus Visoners ini?\",\"jawaban\":\"sebagai dosen saya mendidik dan memberikan ilmu yang telah di pelajari kepada mahasiswa, menjalankan tridarma perguruan, oleh karena itu dosen terus belajar kapanpun dan dimanapun, agar mempunyai bekal untuk mendidik mahasiswa\"},\"2\":{\"pertanyaan\":\"Terkait \\\"sumpah palapa\\\" tersebut, Apakah Visioners datang ke kampus untuk \'melepaskan kewajiban\', atau memiliki tekad bulat untuk \'memersatukan\' dan memajukan ilmu pengetahuan, dan nama baik institusi ini?\",\"jawaban\":\"Sebagai dosen, saya datang ke kampus bukan sekadar untuk memenuhi kewajiban, tetapi dengan tekad bulat mempersatukan semangat, memajukan ilmu pengetahuan, dan mengharumkan nama baik institusi melalui karya dan pengabdian.\"},\"3\":{\"pertanyaan\":\"Pangeran Antasari gigih melawan Belanda hingga akhir hayatnya. Jiwanya terpanggil membela rakyat yang dicintainya agar terbebas dari belenggu penjajahan, tanpa ada rasa keterpaksaan. Bagaimana dengan Anda? Sudahkah merasa tugas mendidik\\/  melayani dosen dan mahasiswa sebagai \'panggilan jiwa?\",\"jawaban\":\"Sebagai dosen, saya menjalankan tugas mendidik bukan karena kewajiban, tetapi sebagai panggilan jiwa untuk membimbing, melayani, dan menginspirasi mahasiswa\"},\"4\":{\"pertanyaan\":\"Apa harapan Anda agar Kampus tidak sekadar eksis, tapi menjadi yang paling berkontribusi memajukan Banua?\",\"jawaban\":\"Harapan saya, Kampus ini bukan cuma ada, tapi bermakna, menjadi sumber ide, inovasi, dan aksi nyata agar banua makin maju dan cerdas dalam menghasilkan lulusan terbaik untuk banua\"}}', '2025-10-27 11:06:25', '2025-10-27 11:06:25'),
(60, 5, 33, 'Dosen', 'Novi Nurdian', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Teringat Gajah Mada ucapkan Sumpah Palapa: tekad mempersatukan Nusantara, sesaat dilantik menjadi Mahapatih Majapahit. Saya pun melihat Visioners demikian. Ketika diberi mandat menjadi dosen dan tendik, Apa \'Sumpah Palapa: Komitmen\' masing-masing di Kampus Visoners ini?\",\"jawaban\":\"Sebagai dosen saya berkomitmen melaksanakan tri dharma perguruan tinggi dengan sebaik baiknya. Selain itu sebagai tugas tambahan menjadi seorang kaprodi, saya bertekad untuk memajukan prodi bersama rekan rekan dosen lainnya.\"},\"2\":{\"pertanyaan\":\"Terkait \\\"sumpah palapa\\\" tersebut, Apakah Visioners datang ke kampus untuk \'melepaskan kewajiban\', atau memiliki tekad bulat untuk \'memersatukan\' dan memajukan ilmu pengetahuan, dan nama baik institusi ini?\",\"jawaban\":\"Saya bertekad untuk memjukan ilmu pengetahuan dan memersatukan serta menjaga nama baik institusi, karena hal tersebut merupakan kepentingan bersama yang harus tetap hidup dan berjaya.\"},\"3\":{\"pertanyaan\":\"Pangeran Antasari gigih melawan Belanda hingga akhir hayatnya. Jiwanya terpanggil membela rakyat yang dicintainya agar terbebas dari belenggu penjajahan, tanpa ada rasa keterpaksaan. Bagaimana dengan Anda? Sudahkah merasa tugas mendidik\\/  melayani dosen dan mahasiswa sebagai \'panggilan jiwa?\",\"jawaban\":\"Sudah, dengan mendidik saya harap ada transfer ilmu yang berkelanjutan untuk menghidupkan ilmu pengetahuan. Selain itu, dengan meneliti saya berharap ada kebaharuan terhadap ilmu pengetahuan yang ada.\"},\"4\":{\"pertanyaan\":\"Apa harapan Anda agar Kampus tidak sekadar eksis, tapi menjadi yang paling berkontribusi memajukan Banua?\",\"jawaban\":\"Saya berharap ide ide mentor kami, Bapak Iwan Perdana bisa terlaksana. Salah satunya dengan mengaangkat budaya kearifan lokal daerah kalimantan selatan. Begitu juga ide ide cemerlang lainnya yang dapat memberikan warna untuk kalimantan selatan \\ud83d\\ude4f\\ud83c\\udffb\"}}', '2025-10-27 11:06:46', '2025-10-27 11:06:46'),
(61, 5, 29, 'Dosen', 'Zulparis', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Teringat Gajah Mada ucapkan Sumpah Palapa: tekad mempersatukan Nusantara, sesaat dilantik menjadi Mahapatih Majapahit. Saya pun melihat Visioners demikian. Ketika diberi mandat menjadi dosen dan tendik, Apa \'Sumpah Palapa: Komitmen\' masing-masing di Kampus Visoners ini?\",\"jawaban\":\"Dosen: Mengembangkan kompetensi diri yang sesuai dengan tugas yaitu sebagi dosen, agar bisa memberikan informasi yang baik dan jelas kepada mahasiswa\"},\"2\":{\"pertanyaan\":\"Terkait \\\"sumpah palapa\\\" tersebut, Apakah Visioners datang ke kampus untuk \'melepaskan kewajiban\', atau memiliki tekad bulat untuk \'memersatukan\' dan memajukan ilmu pengetahuan, dan nama baik institusi ini?\",\"jawaban\":\"Datang ke kampus adalah bagian dari kewajiban saya sebagai dosen, karena kampus merupakan wadah atau tempat saya untuk bekerja dan tempat saya untuk mendapatkan wawasan, pengetahuan dan ilmu tentang dunia pendidikan\"},\"3\":{\"pertanyaan\":\"Pangeran Antasari gigih melawan Belanda hingga akhir hayatnya. Jiwanya terpanggil membela rakyat yang dicintainya agar terbebas dari belenggu penjajahan, tanpa ada rasa keterpaksaan. Bagaimana dengan Anda? Sudahkah merasa tugas mendidik\\/  melayani dosen dan mahasiswa sebagai \'panggilan jiwa?\",\"jawaban\":\"Saya berusaha menjalankan tugas sebagai panggilan jiwa. Setiap kali membantu mahasiswa saya merasa ikut mengambil bagian dalam proses mencetak generasi penerus yang lebih baik.\"},\"4\":{\"pertanyaan\":\"Apa harapan Anda agar Kampus tidak sekadar eksis, tapi menjadi yang paling berkontribusi memajukan Banua?\",\"jawaban\":\"Saya berharap kampus dapat membangun sinergi dengan pemerintah daerah dan masyarakat untuk menghasilkan program nyata yang berdampak langsung pada kemajuan Banua. Baik melalui penelitian, pelatihan, maupun inovasi teknologi yang sesuai dengan kebutuhan daerah\"}}', '2025-10-27 11:07:40', '2025-10-27 11:07:40'),
(62, 5, 31, 'Dosen', 'Rizki Nugerahani Ilise', 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', '{\"1\":{\"pertanyaan\":\"Teringat Gajah Mada ucapkan Sumpah Palapa: tekad mempersatukan Nusantara, sesaat dilantik menjadi Mahapatih Majapahit. Saya pun melihat Visioners demikian. Ketika diberi mandat menjadi dosen dan tendik, Apa \'Sumpah Palapa: Komitmen\' masing-masing di Kampus Visoners ini?\",\"jawaban\":\"Saya akan terus belajar dan mendidik dengan penuh dedikasi, karena di tangan kitalh masa depan bangsa tumbuh bukan dari kata-kata besar tetapi dari hati yang tulus setiap hari.\"},\"2\":{\"pertanyaan\":\"Terkait \\\"sumpah palapa\\\" tersebut, Apakah Visioners datang ke kampus untuk \'melepaskan kewajiban\', atau memiliki tekad bulat untuk \'memersatukan\' dan memajukan ilmu pengetahuan, dan nama baik institusi ini?\",\"jawaban\":\"Perjuangan bukan tentang seberapa cepat kita selesai, tetapi seberapa besar tekad kita untuk memajukan pendidikan dan akan berdampak pada institusi.\"},\"3\":{\"pertanyaan\":\"Pangeran Antasari gigih melawan Belanda hingga akhir hayatnya. Jiwanya terpanggil membela rakyat yang dicintainya agar terbebas dari belenggu penjajahan, tanpa ada rasa keterpaksaan. Bagaimana dengan Anda? Sudahkah merasa tugas mendidik\\/  melayani dosen dan mahasiswa sebagai \'panggilan jiwa?\",\"jawaban\":\"Ketika tugas mendidik sudah menjadi panggilan jiwa maka pekerjaan dalam setiap langkah akan terasa ringan dan setiap tantangan menjadi pahala.\"},\"4\":{\"pertanyaan\":\"Apa harapan Anda agar Kampus tidak sekadar eksis, tapi menjadi yang paling berkontribusi memajukan Banua?\",\"jawaban\":\"Setiap langkah civitas akademika dilandasi cinta pada ilmu dan pengabdian pada Banua, maka kampus akan menjadi cahaya yang menuntun perubahan. aaamiiiiin\"}}', '2025-10-27 11:08:33', '2025-10-27 11:08:33'),
(63, 5, 37, 'Tendik', 'Muhammad Juanda', 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', '{\"1\":{\"pertanyaan\":\"Teringat Gajah Mada ucapkan Sumpah Palapa: tekad mempersatukan Nusantara, sesaat dilantik menjadi Mahapatih Majapahit. Saya pun melihat Visioners demikian. Ketika diberi mandat menjadi dosen dan tendik, Apa \'Sumpah Palapa: Komitmen\' masing-masing di Kampus Visoners ini?\",\"jawaban\":\"Sebagai seorang tendik berkomitmen untuk memberikan pelayanan prima kepada mahasiswa, dosen, dan seluruh civitas akademika,bekerja secara profesional, efisien, dan efektif, berkolaborasi dengan seluruh elemen kampus,meningkatkan kompetensi dan keterampilan, serta berupaya untuk berkontribusi dalam mewujudkan visi dan misi kampus.\"},\"2\":{\"pertanyaan\":\"Terkait \\\"sumpah palapa\\\" tersebut, Apakah Visioners datang ke kampus untuk \'melepaskan kewajiban\', atau memiliki tekad bulat untuk \'memersatukan\' dan memajukan ilmu pengetahuan, dan nama baik institusi ini?\",\"jawaban\":\"Tidak hanya untuk melepaskan kewajiban, karena kalau untuk melepaskan kewajiban akan terasa beban dan hasil tidak optimal.\\r\\n \\r\\nMemiliki tekad semangat untuk mempersatukan dan memajukan ilmu pengetahuan serta nama baik institusi.\"},\"3\":{\"pertanyaan\":\"Pangeran Antasari gigih melawan Belanda hingga akhir hayatnya. Jiwanya terpanggil membela rakyat yang dicintainya agar terbebas dari belenggu penjajahan, tanpa ada rasa keterpaksaan. Bagaimana dengan Anda? Sudahkah merasa tugas mendidik\\/  melayani dosen dan mahasiswa sebagai \'panggilan jiwa?\",\"jawaban\":\"Sudah merasa sebagai panggilan jiwa\"},\"4\":{\"pertanyaan\":\"Apa harapan Anda agar Kampus tidak sekadar eksis, tapi menjadi yang paling berkontribusi memajukan Banua?\",\"jawaban\":\"Harapannya  diantarnya pengembangan Sumber Daya Manusia Unggul:\\r\\n\\u200b\\r\\n- Dosen dan tendik berkualitas: Kampus harus menarik dan mempertahankan dosen yang berkualitas, memiliki pengalaman praktis, dan aktif dalam penelitian.\\r\\n\\u200b\\r\\n- Beasiswa: Menyediakan beasiswa bagi mahasiswa berprestasi dan kurang mampu untuk memastikan akses pendidikan yang merata.\\r\\n\\u200b\\r\\n- Pengembangan Karakter: Selain keterampilan teknis, kampus juga harus fokus pada pengembangan karakter mahasiswa, seperti integritas, kepemimpinan, dan kemampuan beradaptasi.\"}}', '2025-10-27 11:12:26', '2025-10-27 11:12:26'),
(64, 5, 32, 'Dosen', 'Armin Fani', 'S1', 'Pendidikan Bahasa Inggris', 'PBI', '{\"1\":{\"pertanyaan\":\"Teringat Gajah Mada ucapkan Sumpah Palapa: tekad mempersatukan Nusantara, sesaat dilantik menjadi Mahapatih Majapahit. Saya pun melihat Visioners demikian. Ketika diberi mandat menjadi dosen dan tendik, Apa \'Sumpah Palapa: Komitmen\' masing-masing di Kampus Visoners ini?\",\"jawaban\":\"Saya berkomitmen untuk menjadikan kampus STKIP Islam Sabilal Muhtadi Banjarmasin secara umum dan Prodi Pendidikan Bahasa Inggris menjadi tempat belajar yang berkualitas dengan melaksanakan Tri Dharma Perguruan Tinggi dengan baik.\"},\"2\":{\"pertanyaan\":\"Terkait \\\"sumpah palapa\\\" tersebut, Apakah Visioners datang ke kampus untuk \'melepaskan kewajiban\', atau memiliki tekad bulat untuk \'memersatukan\' dan memajukan ilmu pengetahuan, dan nama baik institusi ini?\",\"jawaban\":\"Saya selalu memiliki niat setiap yang dikerjakan di kampus STKIP ISM Banjarmasin mampu memberikan kontribusi dalam perkembangan pegetahuan dan nama baik institusi, bukan hanya sebagai kegiatan pelepas kewajiban.\"},\"3\":{\"pertanyaan\":\"Pangeran Antasari gigih melawan Belanda hingga akhir hayatnya. Jiwanya terpanggil membela rakyat yang dicintainya agar terbebas dari belenggu penjajahan, tanpa ada rasa keterpaksaan. Bagaimana dengan Anda? Sudahkah merasa tugas mendidik\\/  melayani dosen dan mahasiswa sebagai \'panggilan jiwa?\",\"jawaban\":\"Sejak dulu saya percaya bahwa melalui pendidikan orang dapat merubah kualitas hidup mereka. Sehingga, ketika mempunyai kesempatan untuk menjadi seorang pendidik, saya merasa senang karena bisa terlibat dalam proses perubahan kualitas hidup seseorang.\"},\"4\":{\"pertanyaan\":\"Apa harapan Anda agar Kampus tidak sekadar eksis, tapi menjadi yang paling berkontribusi memajukan Banua?\",\"jawaban\":\"Saya berharap Kampus STKIP Islam Sabilal Muhtadin Banjarmasin mampu menjadi pelopor kampus yang mampu menjawab permasalahan yang ada di Banua.\"}}', '2025-10-27 11:16:52', '2025-10-27 11:16:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL
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
(7, 'Ketua', 'ketua'),
(8, 'Kaprodi', 'kaprodi'),
(9, 'Waka Kemahasiswaan dan Kerja Sama', 'waka-kemahasiswaan-kerjasama'),
(10, 'LPM', 'lpm'),
(11, 'LPPM', 'lppm'),
(12, 'Staf Administrasi', 'staf-administrasi'),
(13, 'Pustakawan', 'pustakawan'),
(14, 'Biro Alumni', 'biro-alumni'),
(15, 'UPT PLP', 'upt-plp'),
(16, 'Tendik', 'tendik'),
(17, 'Admin Utama', 'admin-utama'),
(18, 'Waka Administrasi dan Keuangan', 'waka-administrasi-keuangan'),
(19, 'Operator Kerja', 'operator-kerja'),
(20, 'Operator Kemahasiswaan', 'operator-kemahasiswaan'),
(21, 'Operator IT', 'operator-it');

-- --------------------------------------------------------

--
-- Struktur dari tabel `spmi`
--

CREATE TABLE `spmi` (
  `id` bigint(20) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `standar_pt`
--

CREATE TABLE `standar_pt` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_mahasiswa`
--

CREATE TABLE `status_mahasiswa` (
  `id` bigint(20) NOT NULL,
  `id_mahasiswa` bigint(20) NOT NULL,
  `nama_mahasiswa` varchar(100) NOT NULL,
  `nomor_identitas_mahasiswa` varchar(30) NOT NULL,
  `id_program_studi` bigint(20) NOT NULL,
  `jenjang_program_studi` varchar(2) NOT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `singkatan_program_studi` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `id_tahun_akademik` bigint(20) NOT NULL,
  `tahun_akademik` varchar(10) NOT NULL,
  `tipe_tahun_akademik` varchar(6) NOT NULL,
  `id_tahun_akademik_selesai_cuti` bigint(20) NOT NULL,
  `tahun_akademik_selesai_cuti` varchar(10) NOT NULL,
  `tipe_tahun_akademik_selesai_cuti` varchar(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_peringatan`
--

CREATE TABLE `surat_peringatan` (
  `id` int(11) NOT NULL,
  `nomor_surat` varchar(100) NOT NULL,
  `tingkat_sp` varchar(10) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `catatan` varchar(500) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `surat_peringatan`
--

INSERT INTO `surat_peringatan` (`id`, `nomor_surat`, `tingkat_sp`, `perihal`, `catatan`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'SK/MP2025/00123', 'SP 1', 'Dosen Merokok Dalam Kelas', '-', 'https://mail.google.com/mail/u/0/?usp=installed_webapp', '', '2025-09-03 20:56:34', '2025-09-03 20:57:31', 34, 34);

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_tugas_penelitian`
--

CREATE TABLE `surat_tugas_penelitian` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `surat_tugas_penelitian`
--

INSERT INTO `surat_tugas_penelitian` (`id`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(6, 'Surat Tugas Penelitian Di Desa Kebondalem', 'https://hpanel.hostinger.com/', '', '2025-09-07 10:46:15', '2025-09-07 10:46:15', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan_mahasiswa`
--

CREATE TABLE `tagihan_mahasiswa` (
  `id` bigint(20) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `json_id_mahasiswa` mediumtext NOT NULL,
  `id_tahun_akademik` bigint(20) NOT NULL,
  `tahun_akademik` varchar(10) NOT NULL,
  `tipe_tahun_akademik` varchar(6) NOT NULL,
  `periode_mulai_tahun_akademik` date NOT NULL,
  `periode_selesai_tahun_akademik` date NOT NULL,
  `json_biaya` mediumtext NOT NULL,
  `biaya_yudisium_wisuda` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `updated_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `id` bigint(20) NOT NULL,
  `tahun_akademik` varchar(10) NOT NULL,
  `tipe` varchar(6) NOT NULL,
  `periode_mulai` date NOT NULL,
  `periode_selesai` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tahun_akademik`
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
-- Struktur dari tabel `tarif_spp`
--

CREATE TABLE `tarif_spp` (
  `id` int(11) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `biaya` int(11) NOT NULL,
  `biaya_uts` int(11) NOT NULL,
  `biaya_uas` int(11) NOT NULL,
  `biaya_ldkm` int(11) NOT NULL,
  `biaya_mbkm` int(11) NOT NULL,
  `biaya_bimbingan_skripsi` int(11) NOT NULL,
  `biaya_seminar_proposal` int(11) NOT NULL,
  `biaya_sidang_skripsi` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tarif_spp`
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
-- Struktur dari tabel `tracer_studi`
--

CREATE TABLE `tracer_studi` (
  `id` bigint(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tracer_studi`
--

INSERT INTO `tracer_studi` (`id`, `judul`, `tautan`, `dokumen`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(5, 'tracer studi 2024', 'https://fontawesome.com/search?q=book&ic=free&o=r', '', '2025-09-03 18:27:50', '2025-09-03 18:27:50', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tri_dharma`
--

CREATE TABLE `tri_dharma` (
  `id` bigint(20) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `tautan` varchar(2048) NOT NULL,
  `tautan_gdrive` varchar(2048) NOT NULL,
  `dokumen` varchar(50) NOT NULL,
  `tanggal_publikasi` date NOT NULL,
  `id_anggota_1` bigint(20) NOT NULL,
  `nama_anggota_1` varchar(100) NOT NULL,
  `nomor_identitas_anggota_1` varchar(30) NOT NULL,
  `nama_role_anggota_1` varchar(50) NOT NULL,
  `id_program_studi_anggota_1` bigint(20) DEFAULT NULL,
  `nama_program_studi_anggota_1` varchar(50) NOT NULL,
  `id_anggota_2` bigint(20) NOT NULL,
  `nama_anggota_2` varchar(100) NOT NULL,
  `nomor_identitas_anggota_2` varchar(30) NOT NULL,
  `nama_role_anggota_2` varchar(50) NOT NULL,
  `id_program_studi_anggota_2` bigint(20) NOT NULL,
  `nama_program_studi_anggota_2` varchar(50) NOT NULL,
  `id_anggota_3` bigint(20) NOT NULL,
  `nama_anggota_3` varchar(100) NOT NULL,
  `nomor_identitas_anggota_3` varchar(30) NOT NULL,
  `nama_role_anggota_3` varchar(50) NOT NULL,
  `id_program_studi_anggota_3` bigint(20) NOT NULL,
  `nama_program_studi_anggota_3` varchar(50) NOT NULL,
  `id_anggota_4` bigint(20) NOT NULL,
  `nama_anggota_4` varchar(100) NOT NULL,
  `nomor_identitas_anggota_4` varchar(30) NOT NULL,
  `nama_role_anggota_4` varchar(50) NOT NULL,
  `id_program_studi_anggota_4` bigint(20) NOT NULL,
  `nama_program_studi_anggota_4` varchar(50) NOT NULL,
  `id_anggota_5` bigint(20) NOT NULL,
  `nama_anggota_5` varchar(100) NOT NULL,
  `nomor_identitas_anggota_5` varchar(30) NOT NULL,
  `nama_role_anggota_5` varchar(50) NOT NULL,
  `id_program_studi_anggota_5` bigint(20) NOT NULL,
  `nama_program_studi_anggota_5` varchar(50) NOT NULL,
  `anggota_beda_kampus` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tri_dharma`
--

INSERT INTO `tri_dharma` (`id`, `kategori`, `judul`, `tautan`, `tautan_gdrive`, `dokumen`, `tanggal_publikasi`, `id_anggota_1`, `nama_anggota_1`, `nomor_identitas_anggota_1`, `nama_role_anggota_1`, `id_program_studi_anggota_1`, `nama_program_studi_anggota_1`, `id_anggota_2`, `nama_anggota_2`, `nomor_identitas_anggota_2`, `nama_role_anggota_2`, `id_program_studi_anggota_2`, `nama_program_studi_anggota_2`, `id_anggota_3`, `nama_anggota_3`, `nomor_identitas_anggota_3`, `nama_role_anggota_3`, `id_program_studi_anggota_3`, `nama_program_studi_anggota_3`, `id_anggota_4`, `nama_anggota_4`, `nomor_identitas_anggota_4`, `nama_role_anggota_4`, `id_program_studi_anggota_4`, `nama_program_studi_anggota_4`, `id_anggota_5`, `nama_anggota_5`, `nomor_identitas_anggota_5`, `nama_role_anggota_5`, `id_program_studi_anggota_5`, `nama_program_studi_anggota_5`, `anggota_beda_kampus`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(5, 'ARTIKEL PUBLIKASI', 'Parenting Class: Studi Naratif Pelibatan Orangtua Pada Pendidikan Anak Usia Dini Di Kota Banjarmasin', 'https://ejournal.ummuba.ac.id/index.php/mp/article/view/2937', '', '', '2025-06-28', 31, 'Rizki Nugerahani Ilise', '1129049101', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 40, 'Muhammad Agus Safrian Nur', '0158768669130093', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '', '2025-09-15 08:09:08', '2025-09-24 13:43:08', 31, 31),
(6, 'ARTIKEL PUBLIKASI', 'Digital Parenting: Pola Asuh Orang Tua Mendidik Anak Usia Dini di Era Digital', 'https://journal.iaisambas.ac.id/index.php/prymerly/article/view/3120', '', '', '2024-08-21', 31, 'Rizki Nugerahani Ilise', '1129049101', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 27, 'Novi Suma Setyawati', '1111128501', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 33, 'Novi Nurdian', '1109119201', 'Dosen', 2, 'Pendidikan Guru Sekolah Dasar', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '', '2025-09-15 08:10:41', '2025-09-18 05:31:53', 31, 0),
(7, 'ARTIKEL PUBLIKASI', 'Strategi Guru Mengelola Kelas untuk Meningkatkan Disiplin dan Motivasi Belajar Siswa di Sekolah Dasar', 'https://journal.umg.ac.id/index.php/didaktika/article/view/9470', '', '', '2025-01-31', 33, 'Novi Nurdian', '1109119201', 'Dosen', 2, 'Pendidikan Guru Sekolah Dasar', 25, 'Muhammad Supian Sauri', '4333774675130243', 'Dosen', 2, 'Pendidikan Guru Sekolah Dasar', 32, 'arminfani@stkipismbjm.ac.id', '1112098702', 'Dosen', 1, 'Pendidikan Bahasa Inggris', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '', '2025-09-15 13:11:00', '2025-09-18 05:31:53', 33, 33),
(8, 'ARTIKEL PUBLIKASI', 'Pendidikan Muatan Lokal Sebagai Penanaman Karakter Cinta Tanah Air', 'https://ejournal.undiksha.ac.id/index.php/JJPGSD/article/view/36414', '', '', '2021-06-30', 33, 'Novi Nurdian', '1109119201', 'Dosen', 2, 'Pendidikan Guru Sekolah Dasar', 31, 'Rizki Nugerahani Ilise', '1129049101', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '', '2025-09-15 13:13:40', '2025-09-18 05:31:53', 33, 0),
(10, 'ARTIKEL PUBLIKASI', 'Implementasi Keterampilan Dasar Mengajar Mahasiswa PGSD dalam Praktik Manajemen Kelas', 'https://www.putrapublisher.org/ojs/index.php/jspaud/article/view/986', '', '', '2025-07-20', 33, 'Novi Nurdian', '1109119201', 'Dosen', 2, 'Pendidikan Guru Sekolah Dasar', 27, 'Novi Suma Setyawati', '1111128501', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '', '2025-09-15 13:22:47', '2025-09-18 05:31:53', 33, 0),
(11, 'PENELITIAN', 'Quiver As A Media For Teaching Alphabets To Elementary School: Descriptive Study', 'https://jerkin.org/index.php/jerkin/article/view/1445/1072', 'https://drive.google.com/file/d/1Tla-OWvVqlctx48PdVTtp1JrFaheFBsB/view', '1758515506_0875fb33040b7083cefe.pdf', '2025-06-26', 46, 'Abdul Aziz', '1110079002', 'Dosen', 1, 'Pendidikan Bahasa Inggris', 35, 'Yuliana Nurhayati, M.Pd.', '1109079302', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 40, 'Muhammad Agus Safrian Nur', '0158768669130093', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '<font color=\"#ba0000\"><span style=\"letter-spacing: normal; white-space: pre;\">Universitas Sains dan Teknologi Jayapura_Herry Wahyudi Susanto</span></font><span style=\"color: rgba(0, 0, 0, 0); font-family: sans-serif; font-size: 18.4px; letter-spacing: normal; white-space: pre;\"> errha</span>', '2025-09-22 11:31:46', '2025-09-22 11:31:46', 46, 0),
(12, 'ARTIKEL PUBLIKASI', 'Quiver  Sebagai  Media  Pengajaran  Alfabet  pada  Sekolah  Dasar:  Studi Deskripti', 'https://jerkin.org/index.php/jerkin/article/view/1445/1072', 'https://drive.google.com/file/d/1V0riLTZN3gURBgsB8wD2leoqcr4hGPpw/view', '1758515649_54ce689d7947ffa0e46c.pdf', '2025-02-06', 35, 'Yuliana Nurhayati, M.Pd.', '1109079302', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 40, 'Muhammad Agus Safrian Nur', '0158768669130093', 'Dosen', 3, 'Pendidikan Guru Pendidikan Anak Usia Dini', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '<p>Universitas Sains dan Teknologi Jayapura_Herry Wahyudi Susanto</p>', '2025-09-22 11:34:09', '2025-09-22 11:34:09', 46, 0),
(13, 'ARTIKEL PUBLIKASI', 'Designing e-Local Content of Teaching Materials for Extensive Reading Course: Lecturer’s Voice', 'https://e-journal.upr.ac.id/index.php/ebony/article/view/4031', '', '1758609789_5c1c4ca50b6575919814.pdf', '2022-01-26', 34, 'Vebrianti Umar, M.Pd', '1108029104', 'Dosen', 1, 'Pendidikan Bahasa Inggris', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '', '2025-09-23 13:43:09', '2025-09-23 13:43:09', 34, 0),
(14, 'ARTIKEL PUBLIKASI', 'An analysis of moral values found in k-drama “flower of evil”', 'https://ojs.unpkediri.ac.id/index.php/inggris/article/view/18955', '', '1758610037_8ae910de17fe465497af.pdf', '2023-05-23', 34, 'Vebrianti Umar, M.Pd', '1108029104', 'Dosen', 1, 'Pendidikan Bahasa Inggris', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '<ul class=\"authors\" style=\"line-height: 1.785rem; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; color: rgba(0, 0, 0, 0.87); letter-spacing: normal;\"><li style=\"margin-bottom: 1.43rem;\"><span class=\"name\" style=\"font-weight: bold; display: block;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><span class=\"name\" style=\"display: block; font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Elsa Rosalina</font></font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-weight: 400; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Universitas Lambung Mangkurat</font></font></span></font></span></li><li style=\"margin-bottom: 1.43rem;\"><span class=\"name\" style=\"font-weight: bold; display: block;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-weight: 400; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><span class=\"name\" style=\"font-weight: bold; display: block; color: rgba(0, 0, 0, 0.87); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Rahma Pitria Ningsih</font></font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Politeknik Negeri Banjarmasin</font></font></span></font></font></span></font></span></li><li style=\"margin-bottom: 1.43rem;\"><span class=\"name\" style=\"font-weight: bold; display: block;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Vebrianti Umar</font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54);\"><font dir=\"auto\" style=\"vertical-align: inherit;\">STKIP Islam Sabilal Muhtadin</font></span></li><li style=\"margin-bottom: 1.43rem;\"><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54);\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><span class=\"name\" style=\"font-weight: bold; display: block; color: rgba(0, 0, 0, 0.87); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Hidayah Nor</font></font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Universitas Islam Negeri Antasari Banjarmasin</font></font></span></font></span></li></ul>', '2025-09-23 13:47:17', '2025-09-23 13:47:17', 34, 0),
(15, 'ARTIKEL PUBLIKASI', 'Students\' Tips for Enhancing Writing Skills using Social Media in Pandemic Era', 'https://ejournal.undiksha.ac.id/index.php/JPBI/article/view/50367', '', '1758697253_378e46bd3cccae46a444.pdf', '2022-10-12', 34, 'Vebrianti Umar, M.Pd', '1108029104', 'Dosen', 1, 'Pendidikan Bahasa Inggris', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '<p><span class=\"name\" style=\"font-weight: bold; display: block; color: rgba(0, 0, 0, 0.87); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Elsa Rosalina</font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Universitas Lambung Mangkurat (Penulis 1)</font></span></p><p><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><span class=\"name\" style=\"font-weight: bold; display: block; color: rgba(0, 0, 0, 0.87); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Nasrullah</font></font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Universitas Lambung Mangkurat (Penulis 2)</font></font></span></font></span></p><p><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><span class=\"affiliation\" style=\"font-size: 0.93rem; font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><span class=\"name\" style=\"font-weight: bold; display: block; color: rgba(0, 0, 0, 0.87); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Rahma Pitria Ningsih</font></font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Politeknik Negeri Banjarmasin (Penulis 4)</font></font></span></font></font></span></font></span></p>', '2025-09-24 14:00:53', '2025-09-24 14:00:53', 34, 0),
(16, 'ARTIKEL PUBLIKASI', 'An interview on the utilization of e-instructional materials for teaching extensive reading course during pandemic covid 19', 'https://e-proceedings.iain-palangkaraya.ac.id/index.php/INACELT/article/viewFile/118/186', '', '', '2020-10-20', 34, 'Vebrianti Umar, M.Pd', '1108029104', 'Dosen', 1, 'Pendidikan Bahasa Inggris', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '', '2025-09-24 14:06:15', '2025-09-24 14:06:15', 34, 0),
(17, 'ARTIKEL PUBLIKASI', 'STUDENTS’PERCEPTION TOWARD ELECTRONIC EXTENSIVE READING MATERIALS BASED ON BANJAR STORIES', 'https://e-journal.upr.ac.id/index.php/JCP/article/view/3041', '', '1758697817_359ad9378f38932d24aa.pdf', '2021-06-29', 34, 'Vebrianti Umar, M.Pd', '1108029104', 'Dosen', 1, 'Pendidikan Bahasa Inggris', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '', '2025-09-24 14:10:17', '2025-09-24 14:10:17', 34, 0),
(18, 'ARTIKEL PUBLIKASI', 'Artificial Intelligence for Academic Writing from Gen Z’s Perception: The Application, The Advantages, and The Challenges', 'https://ejournal.undiksha.ac.id/index.php/JPBI/article/view/85260', '', '1758698160_8d821f7a6c9b7ca09fbb.pdf', '2025-08-29', 34, 'Vebrianti Umar, M.Pd', '1108029104', 'Dosen', 1, 'Pendidikan Bahasa Inggris', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '<p><span class=\"name\" style=\"font-weight: bold; display: block; color: rgba(0, 0, 0, 0.87); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Elsa Rosalina</font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Universitas Lambung Mangkurat (Penulis 1</font></span><span style=\"color: rgba(0, 0, 0, 0.54); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 0.93rem; letter-spacing: normal;\">)</span></p><p><span class=\"name\" style=\"font-weight: bold; display: block; color: rgba(0, 0, 0, 0.87); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Vebrianti Umar</font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">STKIP ISM Banjarmasin (Penulis 2)</font></span></p><p><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><span style=\"color: rgba(0, 0, 0, 0.87); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; font-weight: 700; letter-spacing: normal;\">Rahma Pitria Ningsih (Penulis 3)</span></font></span></p><p><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; letter-spacing: normal;\"><font dir=\"auto\" style=\"vertical-align: inherit;\"></font></span><span style=\"color: rgba(0, 0, 0, 0.54); font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 0.93rem; letter-spacing: normal;\"></span></p><ul class=\"authors\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; color: rgba(0, 0, 0, 0.87); letter-spacing: normal;\"><li style=\"margin-bottom: 1.43rem;\"><span class=\"name\" style=\"font-weight: bold; display: block;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Inayati Fitriyah Asrimawati</font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54);\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Universitas Lambung Mangkurat (Penulis 4)</font></span></li><li style=\"margin-bottom: 1.43rem;\"><span class=\"name\" style=\"font-weight: bold; display: block;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">HIkmah</font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54);\"><font dir=\"auto\" style=\"vertical-align: inherit;\">STIE AMM Mataram (Penulis 5)</font></span></li></ul>', '2025-09-24 14:16:00', '2025-09-24 14:16:00', 34, 0),
(19, 'ARTIKEL PUBLIKASI', 'https://scholar.google.com/scholar?cluster=9440284650636029768&hl=en&oi=scholarr', 'https://journal.unilak.ac.id/index.php/REILA/article/view/26396', '', '1758698786_545d7d71930de5a44b59.pdf', '2025-08-25', 34, 'Vebrianti Umar, M.Pd', '1108029104', 'Dosen', 1, 'Pendidikan Bahasa Inggris', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', 0, '', '', '', 0, '', '<ul class=\"authors\" style=\"line-height: 1.785rem; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; font-family: Montserrat, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; color: rgba(0, 0, 0, 0.87); letter-spacing: normal;\"><li style=\"margin-bottom: 1.43rem;\"><span class=\"name\" style=\"font-weight: bold; display: block;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Rahma Pitria Ningsih</font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54);\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Politeknik Negeri Banjarmasin, Kota Banjarmasin, Indonesia (Penulis 1)</font></span></li><li style=\"margin-bottom: 1.43rem;\"><span class=\"name\" style=\"font-weight: bold; display: block;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Elsa Rosalina</font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54);\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Universitas Lambung Mangkurat, Kota Banjarmasin. Indonesia (Penulis 2)</font></span></li><li style=\"margin-bottom: 1.43rem;\"><span class=\"name\" style=\"font-weight: bold; display: block;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Siti Kustini</font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54);\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Politeknik Negeri Banjarmasin, Kota Banjarmasin. Indonesia (Penulis 3)</font></span></li><li style=\"margin-bottom: 1.43rem;\"><span class=\"name\" style=\"font-weight: bold; display: block;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Nasrullah Nasrullah</font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54);\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Universitas Negeri Washington, Washington, Amerika Serikat (Penulis 4)</font></span></li><li style=\"margin-bottom: 1.43rem;\"><span class=\"name\" style=\"font-weight: bold; display: block;\"><font dir=\"auto\" style=\"vertical-align: inherit;\">Vebrianti Umar</font></span><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54);\"><font dir=\"auto\" style=\"vertical-align: inherit;\">STKIP Islam Sabilal Muhtadin, Banjarmasin, Indonesia (Penulis 5)</font></span></li><li style=\"margin-bottom: 1.43rem;\"><span class=\"affiliation\" style=\"font-size: 0.93rem; color: rgba(0, 0, 0, 0.54);\"><font dir=\"auto\" style=\"vertical-align: inherit;\"><br></font></span></li></ul>', '2025-09-24 14:24:42', '2025-09-24 14:26:26', 34, 34);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `id_role` tinyint(4) NOT NULL,
  `nama_role` varchar(50) NOT NULL,
  `slug_role` varchar(50) NOT NULL,
  `multi_role` mediumtext NOT NULL,
  `id_role_aktif` tinyint(4) NOT NULL,
  `nama_role_aktif` varchar(50) NOT NULL,
  `slug_role_aktif` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_asli` varchar(255) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `jabatan_fungsional` varchar(150) NOT NULL,
  `jabatan_struktural` varchar(150) NOT NULL,
  `motto_kerja` varchar(500) NOT NULL,
  `nomor_identitas` varchar(30) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama` varchar(30) NOT NULL,
  `status_perkawinan` varchar(30) NOT NULL,
  `kewarganegaraan` varchar(50) NOT NULL,
  `asal_sekolah` varchar(100) NOT NULL,
  `nomor_ijazah` varchar(100) NOT NULL,
  `tahun_ijazah` varchar(10) NOT NULL,
  `nilai_rata_rata` varchar(10) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `no_hp_ayah` varchar(20) NOT NULL,
  `pekerjaan_ayah` varchar(50) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `no_hp_ibu` varchar(20) NOT NULL,
  `pekerjaan_ibu` varchar(50) NOT NULL,
  `nama_wali` varchar(100) NOT NULL,
  `no_hp_wali` varchar(20) NOT NULL,
  `pekerjaan_wali` varchar(50) NOT NULL,
  `sumber_informasi` varchar(50) NOT NULL,
  `id_program_studi` bigint(20) NOT NULL,
  `jenjang_program_studi` varchar(2) NOT NULL,
  `nama_program_studi` varchar(50) NOT NULL,
  `singkatan_program_studi` varchar(10) NOT NULL,
  `id_tahun_akademik_diterima` bigint(20) NOT NULL,
  `tahun_akademik_diterima` varchar(10) NOT NULL,
  `tipe_tahun_akademik` varchar(6) NOT NULL,
  `id_tahun_akademik_lulus` bigint(20) NOT NULL,
  `tahun_akademik_lulus` varchar(10) NOT NULL,
  `tipe_tahun_akademik_lulus` varchar(6) NOT NULL,
  `semester` varchar(2) NOT NULL,
  `biaya_pendaftaran` int(11) NOT NULL,
  `biaya_almamater` int(11) NOT NULL,
  `biaya_ktm` int(11) NOT NULL,
  `biaya_uang_gedung` int(11) NOT NULL,
  `id_spp` bigint(20) NOT NULL,
  `nama_spp` varchar(50) NOT NULL,
  `biaya_spp` int(11) NOT NULL,
  `biaya_uts` int(11) NOT NULL,
  `biaya_uas` int(11) NOT NULL,
  `biaya_ldkm` int(11) NOT NULL,
  `biaya_mbkm` int(11) NOT NULL,
  `biaya_bimbingan_skripsi` int(11) NOT NULL,
  `biaya_seminar_proposal` int(11) NOT NULL,
  `biaya_sidang_skripsi` int(11) NOT NULL,
  `biaya_yudisium` int(11) NOT NULL,
  `biaya_wisuda` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `token_reset_password` varchar(32) DEFAULT NULL,
  `token_reset_password_at` datetime DEFAULT NULL,
  `mendaftar_at` datetime DEFAULT NULL,
  `diterima_at` datetime DEFAULT NULL,
  `status_akun` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `id_role`, `nama_role`, `slug_role`, `multi_role`, `id_role_aktif`, `nama_role_aktif`, `slug_role_aktif`, `nama`, `username`, `email`, `password`, `password_asli`, `foto`, `jenis_kelamin`, `alamat`, `no_hp`, `jabatan_fungsional`, `jabatan_struktural`, `motto_kerja`, `nomor_identitas`, `tempat_lahir`, `tanggal_lahir`, `agama`, `status_perkawinan`, `kewarganegaraan`, `asal_sekolah`, `nomor_ijazah`, `tahun_ijazah`, `nilai_rata_rata`, `nama_ayah`, `no_hp_ayah`, `pekerjaan_ayah`, `nama_ibu`, `no_hp_ibu`, `pekerjaan_ibu`, `nama_wali`, `no_hp_wali`, `pekerjaan_wali`, `sumber_informasi`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `id_tahun_akademik_diterima`, `tahun_akademik_diterima`, `tipe_tahun_akademik`, `id_tahun_akademik_lulus`, `tahun_akademik_lulus`, `tipe_tahun_akademik_lulus`, `semester`, `biaya_pendaftaran`, `biaya_almamater`, `biaya_ktm`, `biaya_uang_gedung`, `id_spp`, `nama_spp`, `biaya_spp`, `biaya_uts`, `biaya_uas`, `biaya_ldkm`, `biaya_mbkm`, `biaya_bimbingan_skripsi`, `biaya_seminar_proposal`, `biaya_sidang_skripsi`, `biaya_yudisium`, `biaya_wisuda`, `status`, `token_reset_password`, `token_reset_password_at`, `mendaftar_at`, `diterima_at`, `status_akun`, `created_at`, `updated_at`) VALUES
(1, 1, 'Superadmin', 'superadmin', '', 0, '', '', 'Superadmin', 'superadmin', '', '$2y$10$mVEvojJB5S6yx0DpBklmYOFSmvI6k8WqqKuAZxLu7w3dFGBXxXLqa', '', '1701744923_ef8be205f9a3eefa1576.jpg', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', NULL, NULL, NULL, 'ENABLE', '2022-10-21 14:14:28', '2025-08-30 20:29:56'),
(25, 4, 'Dosen', 'dosen', '{\"15\":{\"nama_role\":\"UTP PLP\",\"slug_role\":\"upt-plp\"}}', 4, 'Dosen', 'dosen', 'Muhammad Supian Sauri', '4333774675130243', 'Supian@stkipismbjm.ac.id', '$2y$10$k8ZUv95Owici3U9BtA3mY.TS1gwuwNg6xFTn14XlbhQXdktv4mJAy', '4333774675130243', '1758244898_cb301cc1947a23f78b15.jpg', 'Laki-laki', 'Jl. Cemara Raya No 13, Banjarmasin', '082140282996', '-', 'Dosen', 'Menuntut ilmu tidak pernah mengenal waktu', '4333774675130243', 'Kelua', '1996-10-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:00:25', '2025-10-27 10:54:54'),
(27, 4, 'Dosen', 'dosen', '{\"10\":{\"nama_role\":\"LPM\",\"slug_role\":\"lpm\"}}', 4, 'Dosen', 'dosen', 'Novi Suma Setyawati', '1111128501', 'novisuma@stkipismbjm.ac.id', '$2y$10$ggFdbebvxO4Lx6toFpk/T.4ZRHoH6sRwp2sQhp7lbfCoqFEzZYinW', '1111128501', '1758023427_c0bc96ba3bdeb77a7038.jpg', 'Perempuan', 'Jln Karang Anyar II blok j/2 Banjarbaru Utara', '085171511851', 'Asisten Ahli', 'LPM', 'Kerja Cepat, Kerja Cerdas dan bertanggung jawab', '1111128501', 'Banjarmasin', '1985-12-11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:01:09', '2025-10-27 10:46:17'),
(28, 4, 'Dosen', 'dosen', '{\"8\":{\"nama_role\":\"Kaprodi\",\"slug_role\":\"kaprodi\"}}', 4, 'Dosen', 'dosen', 'Maulidha, M.Pd', '1129099003', 'maulidha@stkipismbjm.ac.id', '$2y$10$U.7k/i9POhFlNBTxcOMcieoP4FH5gTuccc24hiICitEggWni6kcVe', '1129099003', '1758697539_ae41032742ff877eb631.jpg', 'Perempuan', 'Jl sungai lulut km 7, 1 komplek graha sejahtera blok A1 no 52', '085654545320', '-', 'Ketua Prodi PAUD', 'jangan takut untuk bermimpi besar dan mengejarnya', '1129099003', 'Banjarmasin', '1990-09-29', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:01:23', '2025-09-25 13:51:54'),
(29, 4, 'Dosen', 'dosen', '', 4, 'Dosen', 'dosen', 'Zulparis', '1111078702', 'zulparis1@gmail.com', '$2y$10$OK7f17WjwT9TGzGCYas3je2/foRl.0DRvdOFiD.S/MYZWyVUIqRuy', '1111078702', '1758510870_a799c69833ed19861ce0.jpg', 'Laki-laki', 'Komplek Annisa tahap 4 blok A nomor 15', '081998354602', 'Asisten Ahli', 'Dosen', 'Jangan takut mengcoba', '1111078702', 'Kuripan,Kec Kuripan Kabupaten Barito Kuala', '1987-07-10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:03:50', '2025-10-27 10:48:17'),
(31, 4, 'Dosen', 'dosen', '{\"11\":{\"nama_role\":\"LPPM\",\"slug_role\":\"lppm\"}}', 4, 'Dosen', 'dosen', 'Rizki Nugerahani Ilise', '1129049101', 'rizkinugerahani@gmail.com', '$2y$10$U9OpdgodiIPqNJ8kt775.ObFWS/YcJjSdkboJ0fLD.amYE1Fnv8ki', '1129049101', '1758513043_11b530e69e040af8d2c3.jpg', 'Perempuan', 'Jl Trans Kalimantan RT 17', '085345673542', 'Asisten Ahli', 'Kepala lppm', 'Kunci Pertumbuhan : Speed & Scale', '1129049101', 'Berangas Barat', '1991-04-29', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:10:02', '2025-10-27 10:50:13'),
(32, 4, 'Dosen', 'dosen', '{\"8\":{\"nama_role\":\"Kaprodi\",\"slug_role\":\"kaprodi\"}}', 4, 'Dosen', 'dosen', 'Armin Fani', '1112098702', 'arminfani@stkipismbjm.ac.id', '$2y$10$GOdlXKQ4yDfiA4/4eFV0RuSv6KHvpsAIlv6w6GEmtd9oqiYohnH3W', '1112098702', '1757994739_fab19f17b8f0ff489da4.jpg', 'Laki-laki', 'Jl. Bumi mas Raya Komplek Bumi Mas 5 no 80 Banjarmasin Selatan.', '082143161285', 'Asisten Ahli', 'Ketua Program Studi Pendidikan Bahasa Inggris', 'Inspiring minds, shaping the future.', '1112098702', 'arminfani@stkipismbjm.ac.id', '1987-09-12', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:34:15', '2025-10-27 11:03:02'),
(33, 4, 'Dosen', 'dosen', '{\"8\":{\"nama_role\":\"Kaprodi\",\"slug_role\":\"kaprodi\"}}', 4, 'Dosen', 'dosen', 'Novi Nurdian', '1109119201', 'novi@stkipism.ac.id', '$2y$10$XxUEQUNg5vdBVobnc9XwmuzAHEOfYrlRDz/pLk8eSrtKQ42VVVbEi', '1109119201', '1757902439_a586ea7df903d09cad2f.jpg', 'Perempuan', 'Komplek griya rosela blok A-15, guntung manggis, kota banjarbaru', '085348484565', 'Asisten ahli', 'Ketua Prodi PGSD', 'lestarikan budayanya, terbentuklah karakter dan adab budi luhurnya', '1109119201', 'Sidoarjo', '1992-11-09', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:57:57', '2025-10-27 10:53:08'),
(34, 4, 'Dosen', 'dosen', '{\"3\":{\"nama_role\":\"Waka Akademik\",\"slug_role\":\"waka-akademik\"}}', 4, 'Dosen', 'dosen', 'Vebrianti Umar, M.Pd', '1108029104', 'umar@humasoftstudio.com', '$2y$10$zETDeNwp0czQDkmZPny2wO/6MHTD9UWrveQQDE63H4eqcgZqVkOm6', '1108029104', '1758071321_b075fc22920e3058e9d8.jpg', 'Perempuan', 'Dalam bekerja ada banyak konsekueksi yang dihadapi, harus siap untuk itu!', '0895803196062', 'Lektor', 'Wakil Ketua Bidang Akademik', 'Menyelesaikan Pekerjaan adalah Tanggung Jawab Itu Sendiri!', '1108029104', 'Bitung', '1991-02-08', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 12:59:56', '2025-10-23 15:32:50'),
(35, 4, 'Dosen', 'dosen', '{\"9\":{\"nama_role\":\"Waka Kemahasiswaan dan Kerja Sama\",\"slug_role\":\"waka-kemahasiswaan-kerjasama\"},\"17\":{\"nama_role\":\"Admin Utama\",\"slug_role\":\"admin-utama\"}}', 4, 'Dosen', 'dosen', 'Yuliana Nurhayati, M.Pd.', '1109079302', 'ana@stkipismbjm.ac.id', '$2y$10$yh5KJUWVvGC38EjXI6c02eKgBwid8nLD3z/mWFckPOy9uh7C3AQxO', '1109079302', '1758073227_7aebfb3d8fc908a7c243.jpg', 'Perempuan', 'Jl.Dharma Bakti 2 Komplek budair permai Blok B /66', '081258026807', 'Belum Ada', 'Wakil Ketua Bidang Kerjasama dan Kemahasiswaan', '\" Jika Lelah Menjalani Profesimu Maka Istirahatlah Sejenak dan Lanjutkan dengan Ide Barumu\"', '1109079302', 'Ponorogo', '1993-07-09', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-01 13:20:13', '2025-10-27 10:42:34'),
(36, 17, 'Admin Utama', 'admin-utama', '', 0, '', '', 'Admin Utama', 'adminutama', '', '$2y$10$9DYUNHjLRKoy6MxfnjapUOPDG3KZa3QfBcoY2gE4N0Vws4fMWI6H6', '', '', 'Laki-laki', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-02 14:10:27', '2025-09-02 14:10:27'),
(37, 16, 'Tendik', 'tendik', '{\"13\":{\"nama_role\":\"Pustakawan\",\"slug_role\":\"pustakawan\"}}', 16, 'Tendik', 'tendik', 'Muhammad Juanda', '63710104108310004', 'juandapustaka@gmail.com', '$2y$10$XQpOqiGVHpBZ5aTg03HDcO03J7Ckus4EWo9LGH7Y91OyPSkZaup7q', '63710104108310004', '', 'Laki-laki', 'Jl. Gerilya Komp.Bumi Handayani 2', '08194101983', 'Pustakawan', 'Kepala Perpustakaan', 'Belajar, berbenah, dan melangkah menuju lebih baik', '63710104108310004', 'HSS', '1983-10-04', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-03 14:05:04', '2025-10-27 11:12:39'),
(39, 16, 'Tendik', 'tendik', '{\"20\":{\"nama_role\":\"Operator Kemahasiswaan\",\"slug_role\":\"operator-kemahasiswaan\"}}', 20, 'Operator Kemahasiswaan', 'operator-kemahasiswaan', 'Nurul Fitriyani, SE., MA.', '6371056409780006', 'nurulfitriyani241979@gmail.com', '$2y$10$lf5VWBi7vrjQ0/urDDZo0uie0DvgusUAgaudJt9Rtge6zfyFW9I4u', '6371056409780006', '', 'Perempuan', 'Jl. Kacapiring II No.26 Rt.002 Rw.001 Kel. Kertak Baru Ilir Kec. Banjarmasin Tengah Banjarmasin 70111', '081251805567', '-', 'Kepala Administrasi Akademik dan Kemahasiswaan', 'Luwes dan adaptif ketika menghadapi masalah, terkadang cara terbaik bukanlah dengan melawan, melainkan dengan menemukan cara lain untuk melewatinya.', '6371056409780006', 'Bandung', '1978-09-24', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-04 12:58:24', '2025-10-27 10:47:17'),
(40, 4, 'Dosen', 'dosen', '', 4, 'Dosen', 'dosen', 'Muhammad Agus Safrian Nur', '0158768669130093', 'agus@stkipismbjm.ac.id', '$2y$10$s6EvEBHsCF4Fa1VH73o1DultHxOIZbTCAQNPrb9mkhvEqyqQmGjba', '00000000', '1757903155_5888b0e0e7b289cd1c57.jpg', 'Laki-laki', 'Jalan Veteran Km. 5.5 Gang Mujahidin No. 74 Rt. 024, Kelurahan Sungai Lulut, Kecamatan Banjarmasin Timur.', '085390556813', '-', '-', 'Menerima ilmu dengan rendah hati membuka lebih banyak kesempatan.', '0158768669130093', 'Banjarmasin', '1990-08-26', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 'S1', 'Pendidikan Guru Pendidikan Anak Usia Dini', 'PG-PAUD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-04 13:57:57', '2025-10-13 08:43:42'),
(41, 16, 'Tendik', 'tendik', '{\"2\":{\"nama_role\":\"Keuangan\",\"slug_role\":\"keuangan\"}}', 2, 'Keuangan', 'keuangan', 'Halima Chairia', '6371015011800013', 'halimachairia7@gmail.com', '$2y$10$qfxU9i2p65274dH4ihbz6.Ff2aoms2t8xhW7hXr30.dx4IL3tkfci', '6371015011800013', '1758698681_97b94fc2a2dddde8b379.jpg', 'Perempuan', 'Komplek Banjar Indah Permai jl. Sintuk II No. 183 RT. 13 Banjarmasin', '085251626793', '-', 'Kabag. Administrasi Umum dan Keuangan', 'Sesulit apa pun pekerjaanmu pasti ada penyelesaiannya', '6371015011800013', 'Banjarmasin', '1980-11-10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-04 14:31:38', '2025-10-27 10:57:05'),
(42, 17, 'Admin Utama', 'admin-utama', '', 0, '', '', 'Admin 2', 'adminvisioner', '', '$2y$10$/fsqlu/uCBgrdC9PuB4jlu5QbvShxNG1A7LpvvH0I6OdipVPkZSB.', 'senyumdulu', '', 'Perempuan', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-04 17:03:42', '2025-09-11 19:22:24'),
(43, 4, 'Dosen', 'dosen', '', 4, 'Dosen', 'dosen', 'Tati Akhbaryah, S.S., S.Pd., M.Pd.', '0', 'tatiahatta27@gmail.com', '$2y$10$vfM0PjUE9UFhyzXdcenqaOj/ccPHOR19oH776YF9Ukl9Ro3yZ5r3a', 'tatia2711', '', 'Perempuan', 'Kompleks Pembanginan I jl. Sebatung no 10 Banjarmasin', '081347693805', 'Dosen', '-', 'Diam, Amati, Kerjakan', '0', 'Jakarta', '1968-11-27', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-04 18:41:51', '2025-09-25 14:16:31'),
(46, 4, 'Dosen', 'dosen', '', 4, 'Dosen', 'dosen', 'Abdul Aziz', '1110079002', 'aziz@stkipismbjm.ac.id', '$2y$10$jPB/8.a.qfFePjOayeNWiuxARGWUie12iVLG/34GsHjAtf5eBaZd.', '1110079002', '1757902115_b01898028ec94e9e6376.jpg', 'Laki-laki', 'Jalan AMD, Komplek Ar Raudah, no 44', '082250582011', 'tidak ada', 'tidak ada', 'Berani berimajinasi, berani berdedikasi', '1110079002', 'Sungai Pinang', '1990-09-12', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-12 12:04:50', '2025-10-27 10:57:31'),
(48, 4, 'Dosen', 'dosen', '', 4, 'Dosen', 'dosen', 'Norhayati K', '1234', 'norhayati.dr25@gmail.com', '$2y$10$HY5oabGAUDeLW/FGgDs7JuH0Eotqq33QDjQmuGwTp9pjsBqwImgci', 'Lulusberkah25', '1758070136_a0e40fcff55ac326e79e.jpg', 'Perempuan', 'Komplek Citra Persada Asri, Lestari 1 no 32 Sungai besar, Banjarbaru', '082154244276', '-', '-', 'Belajar adalah panggilan jiwa untuk mencerdaskan anak bangsa.', '1234', 'Tumpung Laung', '1993-12-25', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-12 14:21:58', '2025-10-27 11:27:45'),
(49, 16, 'Tendik', 'tendik', '{\"21\":{\"nama_role\":\"Operator IT\",\"slug_role\":\"operator-it\"}}', 21, 'Operator IT', 'operator-it', 'Noor Ermiliyawati Nazemi., Amd.Kom.', '6371044111040002', 'nazemi6879@gmail.com', '$2y$10$pCidU2H51dMscv6ie7TOhu26g04DGs2ykvRfh1ZW/iZIdgRa.I0T2', 'Mili789?', '', 'Perempuan', 'Jl. Malkon temon Kota Banjarmasin, kalimantan selatan', '081250134883', '-', 'Operator IT', 'Bekerja adalah energi harapan dan musuh kegagalan', '6329911838382001', 'Banjarmasin', '2004-11-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-12 14:27:59', '2025-10-23 18:16:38'),
(50, 16, 'Tendik', 'tendik', '', 0, '', '', 'Nurul Fitriyani, SE., MA.', 'Dyandra 1503', 'noufysabilal@yahoo.co.id', '$2y$10$wSZVj0nc6osDl5yiEcfVQumDwctzCw541OEGEff79bESRz34zv5hW', 'Dyandra1503', '', 'Perempuan', 'Jl KACAPIRING 2 NO.26 RT.002 RW.001 KEL. KERTAK BARU ILIR KEC.BANJARMASIN TENGAH BANJARMASIN 70111', '081251805567', '-', 'Kepala Administrasi Akademik dan Kemahasiswaan', 'Bekerja Optimal, lakukan yang terbaik', 'Dyandra 1503', 'Bandung', '1978-09-24', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, NULL, NULL, 'ENABLE', '2025-09-15 14:58:30', '2025-09-15 14:58:30');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dokumen_kemahasiswaan`
--
ALTER TABLE `dokumen_kemahasiswaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dokumen_template`
--
ALTER TABLE `dokumen_template`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dosen_pendamping`
--
ALTER TABLE `dosen_pendamping`
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
-- Indeks untuk tabel `laporan_pertanggungjawaban`
--
ALTER TABLE `laporan_pertanggungjawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `laporan_promosi`
--
ALTER TABLE `laporan_promosi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lkpt`
--
ALTER TABLE `lkpt`
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
-- Indeks untuk tabel `mahasiswa_praktik_lapangan`
--
ALTER TABLE `mahasiswa_praktik_lapangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_dana`
--
ALTER TABLE `master_dana`
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
-- Indeks untuk tabel `pengajaran`
--
ALTER TABLE `pengajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengembangan_kompetensi`
--
ALTER TABLE `pengembangan_kompetensi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengumpulan_laporan`
--
ALTER TABLE `pengumpulan_laporan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penyusutan_inventaris`
--
ALTER TABLE `penyusutan_inventaris`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `perencanaan_pimpinan`
--
ALTER TABLE `perencanaan_pimpinan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `permintaan_legalisir`
--
ALTER TABLE `permintaan_legalisir`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `perpustakaan`
--
ALTER TABLE `perpustakaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rencana_penetapan_keuangan`
--
ALTER TABLE `rencana_penetapan_keuangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `responden`
--
ALTER TABLE `responden`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `spmi`
--
ALTER TABLE `spmi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `standar_pt`
--
ALTER TABLE `standar_pt`
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
-- Indeks untuk tabel `surat_tugas_penelitian`
--
ALTER TABLE `surat_tugas_penelitian`
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
-- Indeks untuk tabel `tri_dharma`
--
ALTER TABLE `tri_dharma`
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
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `dokumen_kemahasiswaan`
--
ALTER TABLE `dokumen_kemahasiswaan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `dokumen_template`
--
ALTER TABLE `dokumen_template`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `dosen_pendamping`
--
ALTER TABLE `dosen_pendamping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `jadwal_kegiatan`
--
ALTER TABLE `jadwal_kegiatan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `kalender_akademik`
--
ALTER TABLE `kalender_akademik`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kategori_dana_masuk`
--
ALTER TABLE `kategori_dana_masuk`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `kategori_penyusutan_inventaris`
--
ALTER TABLE `kategori_penyusutan_inventaris`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `keuangan`
--
ALTER TABLE `keuangan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `laporan_pertanggungjawaban`
--
ALTER TABLE `laporan_pertanggungjawaban`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `laporan_promosi`
--
ALTER TABLE `laporan_promosi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `lkpt`
--
ALTER TABLE `lkpt`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `log_keuangan`
--
ALTER TABLE `log_keuangan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `log_login`
--
ALTER TABLE `log_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=828;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa_praktik_lapangan`
--
ALTER TABLE `mahasiswa_praktik_lapangan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `master_dana`
--
ALTER TABLE `master_dana`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `pembayaran_mahasiswa`
--
ALTER TABLE `pembayaran_mahasiswa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pencatatan_surat`
--
ALTER TABLE `pencatatan_surat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pengajaran`
--
ALTER TABLE `pengajaran`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `pengembangan_kompetensi`
--
ALTER TABLE `pengembangan_kompetensi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pengumpulan_laporan`
--
ALTER TABLE `pengumpulan_laporan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penyusutan_inventaris`
--
ALTER TABLE `penyusutan_inventaris`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT untuk tabel `perencanaan_pimpinan`
--
ALTER TABLE `perencanaan_pimpinan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `permintaan_legalisir`
--
ALTER TABLE `permintaan_legalisir`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `perpustakaan`
--
ALTER TABLE `perpustakaan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pertanyaan`
--
ALTER TABLE `pertanyaan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `rencana_penetapan_keuangan`
--
ALTER TABLE `rencana_penetapan_keuangan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `responden`
--
ALTER TABLE `responden`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `spmi`
--
ALTER TABLE `spmi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `standar_pt`
--
ALTER TABLE `standar_pt`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `status_mahasiswa`
--
ALTER TABLE `status_mahasiswa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `surat_peringatan`
--
ALTER TABLE `surat_peringatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `surat_tugas_penelitian`
--
ALTER TABLE `surat_tugas_penelitian`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tagihan_mahasiswa`
--
ALTER TABLE `tagihan_mahasiswa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tarif_spp`
--
ALTER TABLE `tarif_spp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tracer_studi`
--
ALTER TABLE `tracer_studi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tri_dharma`
--
ALTER TABLE `tri_dharma`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
