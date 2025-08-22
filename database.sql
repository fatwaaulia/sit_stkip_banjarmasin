-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 22, 2025 at 09:21 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.9

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
  `nama_aplikasi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_perusahaan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `favicon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `maps` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `nama_aplikasi`, `nama_perusahaan`, `deskripsi`, `logo`, `favicon`, `no_hp`, `alamat`, `maps`, `created_at`, `updated_at`) VALUES
(1, 'STKIP ISM Banjarmasin', 'Humasoft Studio Teknologi', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Possimus aspernatur quasi, magnam porro labore placeat! At reiciendis voluptates non perferendis suscipit rem placeat, voluptatum ea, saepe, eligendi error cum minima.', 'logo.png', 'favicon.png', '0', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Possimus aspernatur quasi.', '', '2024-09-17 13:06:51', '2025-08-17 12:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `kalender_akademik`
--

CREATE TABLE `kalender_akademik` (
  `id` bigint NOT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `gambar` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kalender_akademik`
--

INSERT INTO `kalender_akademik` (`id`, `judul`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Kalender Akademik Semester Ganjil Tahun 2025-2026', '1755644878_7bfb72fc1b9ffc4f3898.jpg', '2025-08-20 06:07:59', '2025-08-20 06:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `log_login`
--

CREATE TABLE `log_login` (
  `id` bigint NOT NULL,
  `id_user` bigint NOT NULL,
  `id_role` tinyint NOT NULL,
  `nama_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_login`
--

INSERT INTO `log_login` (`id`, `id_user`, `id_role`, `nama_user`, `username`, `ip_address`, `status`, `created_at`, `updated_at`) VALUES
(20, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-05-21 13:26:52', '2025-05-21 13:26:52'),
(21, 3, 3, 'Fatwa Aulia', 'fatwaaulia.fy@gmail.com', '::1', 'Success', '2025-05-21 13:28:07', '2025-05-21 13:28:07'),
(22, 0, 0, '', 'dmin', '::1', 'Failed', '2025-05-22 12:38:16', '2025-05-22 12:38:16'),
(23, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-05-22 12:38:20', '2025-05-22 12:38:20'),
(24, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-05-22 12:43:08', '2025-05-22 12:43:08'),
(25, 0, 0, '', 'rnt@himatekkits.com', '::1', 'Failed', '2025-06-01 12:35:38', '2025-06-01 12:35:38'),
(26, 0, 0, '', 'rnt@himatekkits.com', '::1', 'Failed', '2025-06-01 12:35:40', '2025-06-01 12:35:40'),
(27, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-06-01 12:44:12', '2025-06-01 12:44:12'),
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
(135, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-22 16:01:24', '2025-08-22 16:01:24');

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
  `nominal` int NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_by` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran_mahasiswa`
--

INSERT INTO `pembayaran_mahasiswa` (`id`, `id_tagihan_mahasiswa`, `jenis_tagihan_mahasiswa`, `id_tahun_akademik`, `tahun_akademik`, `tipe_tahun_akademik`, `id_mahasiswa`, `nama_mahasiswa`, `nomor_identitas_mahasiswa`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `nominal`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(5, 3, 'MBKM', 1, '2025/2026', 'Ganjil', 5, 'Fatwa Aulia', '362055401093', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 50000, 'Lunas', '2025-08-22 16:21:16', '2025-08-22 16:21:16', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `penggunaan_dana`
--

CREATE TABLE `penggunaan_dana` (
  `id` bigint NOT NULL,
  `grup` int NOT NULL,
  `nama_jenis_dana` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ts_2` int NOT NULL,
  `ts_1` int NOT NULL,
  `ts_0` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penggunaan_dana`
--

INSERT INTO `penggunaan_dana` (`id`, `grup`, `nama_jenis_dana`, `ts_2`, `ts_1`, `ts_0`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dana Operasional Proses Pembelajaran', 1694905893, 1572978965, 1534232341, '2025-08-17 22:50:44', '2025-08-18 06:15:02'),
(2, 1, 'Dana Penelitian', 54000000, 48000000, 48000000, '2025-08-17 22:50:44', '2025-08-17 22:50:44'),
(3, 1, 'Dana Pengabdian Kepada Masyarakat', 22500000, 22500000, 25500000, '2025-08-17 22:50:44', '2025-08-18 06:08:56'),
(4, 1, 'Investasi Prasarana', 369652324, 353895894, 333547493, '2025-08-17 22:50:44', '2025-08-18 06:10:28'),
(5, 1, 'Investasi Sarana', 85942070, 40425600, 35424200, '2025-08-17 22:50:44', '2025-08-18 06:12:39'),
(6, 1, 'Investasi SDM', 83385000, 106244000, 114887500, '2025-08-17 22:50:44', '2025-08-18 06:13:34'),
(7, 1, 'Lain-lain', 0, 0, 0, '2025-08-17 22:50:44', '2025-08-18 06:13:47'),
(8, 2, 'Dana Penelitian', 0, 0, 0, '2025-08-17 22:50:44', '2025-08-18 06:19:53'),
(9, 2, 'Dana PKM', 0, 0, 0, '2025-08-17 22:50:44', '2025-08-18 06:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `penyusutan_inventaris`
--

CREATE TABLE `penyusutan_inventaris` (
  `id` bigint NOT NULL,
  `nama_barang` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_beli` date NOT NULL,
  `harga_beli` int NOT NULL,
  `umur_ekonomis` int NOT NULL,
  `nilai_residu` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyusutan_inventaris`
--

INSERT INTO `penyusutan_inventaris` (`id`, `nama_barang`, `tanggal_beli`, `harga_beli`, `umur_ekonomis`, `nilai_residu`, `created_at`, `updated_at`) VALUES
(1, 'Komputer', '2024-02-13', 5000000, 3, 500000, '2025-08-18 13:57:06', '2025-08-18 15:49:15'),
(2, 'Printer', '2023-06-01', 2000000, 4, 200000, '2025-08-18 15:51:44', '2025-08-18 15:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `perolehan_dana`
--

CREATE TABLE `perolehan_dana` (
  `id` bigint NOT NULL,
  `no_sumber_dana` int NOT NULL,
  `nama_sumber_dana` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_jenis_dana` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ts_2` int NOT NULL,
  `ts_1` int NOT NULL,
  `ts_0` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perolehan_dana`
--

INSERT INTO `perolehan_dana` (`id`, `no_sumber_dana`, `nama_sumber_dana`, `nama_jenis_dana`, `ts_2`, `ts_1`, `ts_0`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mahasiswa', 'SPP', 535000000, 617500000, 675000000, '2025-08-17 08:37:23', '2025-08-17 08:37:23'),
(2, 1, 'Mahasiswa', 'Sumbangan Lainnya', 11750000, 13800000, 10900000, '2025-08-17 08:37:23', '2025-08-17 08:37:23'),
(3, 1, 'Mahasiswa', 'Lain-lain', 0, 33150000, 59300000, '2025-08-17 08:37:23', '2025-08-17 08:37:23'),
(4, 2, 'Kementerian/ Yayasan', 'Anggaran Rutin', 1200000000, 1200000000, 1200000000, '2025-08-17 08:37:23', '2025-08-17 17:19:00'),
(5, 2, 'Kementerian/ Yayasan', 'Anggaran Pembangunan', 0, 0, 0, '2025-08-17 08:37:23', '2025-08-17 17:19:10'),
(6, 2, 'Kementerian/ Yayasan', 'Hibah Penelitian', 54000000, 48000000, 48000000, '2025-08-17 08:37:23', '2025-08-17 17:19:27'),
(7, 2, 'Kementerian/ Yayasan', 'Hibah PKM', 22500000, 22500000, 25500000, '2025-08-17 08:37:23', '2025-08-17 17:21:46'),
(8, 2, 'Kementerian/ Yayasan', 'Lain-lain', 0, 0, 0, '2025-08-17 08:37:23', '2025-08-17 17:20:07'),
(9, 3, 'PT Sendiri', 'Jasa Layanan Profesi dan Keahlian', 0, 0, 0, '2025-08-17 08:37:23', '2025-08-17 17:20:07'),
(10, 3, 'PT Sendiri', 'Produk Institusi', 20600000, 0, 0, '2025-08-17 08:37:23', '2025-08-17 18:26:39'),
(11, 3, 'PT Sendiri', 'Kerjasama Kelembagaan (Pemerintah atau Swasta)', 24000000, 24000000, 24000000, '2025-08-17 08:37:23', '2025-08-17 21:30:57'),
(12, 3, 'PT Sendiri', 'Lain-lain', 739600000, 772600000, 758200000, '2025-08-17 08:37:23', '2025-08-17 21:31:50'),
(13, 4, 'Sumber Lain (Dalam dan Luar Negeri)', 'Hibah', 0, 0, 0, '2025-08-17 08:37:23', '2025-08-17 17:20:07'),
(14, 4, 'Sumber Lain (Dalam dan Luar Negeri)', 'Dana Lestari dan Filantropis', 0, 0, 0, '2025-08-17 08:37:23', '2025-08-17 17:20:07'),
(15, 4, 'Sumber Lain (Dalam dan Luar Negeri)', 'Lain-lain', 530842, 674909, 1041505, '2025-08-17 08:37:23', '2025-08-17 21:32:58'),
(16, 5, 'Dana Penelitian dan PKM', 'Dana Penelitian', 0, 5000000, 5000000, '2025-08-17 08:37:23', '2025-08-17 21:48:38'),
(17, 5, 'Dana Penelitian dan PKM', 'Dana PKM', 0, 5000000, 5000000, '2025-08-17 08:37:23', '2025-08-17 21:48:48');

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
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` tinyint NOT NULL,
  `nama` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `nama`, `slug`) VALUES
(1, 'Admin', 'admin'),
(2, 'Keuangan', 'keuangan'),
(3, 'Akademik', 'akademik'),
(4, 'Dosen', 'dosen'),
(5, 'Mahasiswa', 'mahasiswa');

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
-- Table structure for table `tagihan_mahasiswa`
--

CREATE TABLE `tagihan_mahasiswa` (
  `id` bigint NOT NULL,
  `kategori` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `jenis` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `json_id_mahasiswa` mediumtext COLLATE utf8mb4_general_ci NOT NULL,
  `id_tahun_akademik` bigint NOT NULL,
  `tahun_akademik` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe_tahun_akademik` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `periode_mulai_tahun_akademik` date NOT NULL,
  `periode_selesai_tahun_akademik` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_by` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tagihan_mahasiswa`
--

INSERT INTO `tagihan_mahasiswa` (`id`, `kategori`, `jenis`, `json_id_mahasiswa`, `id_tahun_akademik`, `tahun_akademik`, `tipe_tahun_akademik`, `periode_mulai_tahun_akademik`, `periode_selesai_tahun_akademik`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'MABA', 'ALMAMATER', '', 1, '2025/2026', 'Ganjil', '2025-09-01', '2026-01-15', '2025-08-21 12:36:22', '2025-08-21 12:36:22', '2', ''),
(2, 'SEMESTER', 'SPP', '', 1, '2025/2026', 'Ganjil', '2025-09-01', '2026-01-15', '2025-08-22 06:51:08', '2025-08-22 06:51:08', '2', ''),
(3, 'PERORANGAN', 'MBKM', '[\"6\",\"5\"]', 1, '2025/2026', 'Ganjil', '2025-09-01', '2026-01-15', '2025-08-22 10:49:27', '2025-08-22 16:16:19', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `id` bigint NOT NULL,
  `tahun_akademik` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `periode_mulai` date NOT NULL,
  `periode_selesai` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tahun_akademik`
--

INSERT INTO `tahun_akademik` (`id`, `tahun_akademik`, `tipe`, `periode_mulai`, `periode_selesai`, `created_at`, `updated_at`) VALUES
(1, '2025/2026', 'Ganjil', '2025-09-01', '2026-01-15', '2025-08-18 21:16:55', '2025-08-18 21:23:45'),
(2, '2025/2026', 'Genap', '2026-03-08', '2026-07-05', '2025-08-18 21:24:36', '2025-08-18 21:24:48');

-- --------------------------------------------------------

--
-- Table structure for table `tarif_spp`
--

CREATE TABLE `tarif_spp` (
  `id` int NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `biaya` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tarif_spp`
--

INSERT INTO `tarif_spp` (`id`, `nama`, `biaya`, `created_at`, `updated_at`) VALUES
(1, 'SPP Tarif 1', 5000000, '2025-08-19 14:10:03', '2025-08-19 14:21:17'),
(2, 'SPP Tarif 2', 4000000, '2025-08-19 14:18:58', '2025-08-19 14:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `id_role` tinyint NOT NULL,
  `nama_role` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug_role` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_kelamin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nomor_identitas` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `tempat_lahir` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `id_program_studi` bigint NOT NULL,
  `jenjang_program_studi` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program_studi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `singkatan_program_studi` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_tahun_akademik_diterima` bigint NOT NULL,
  `tahun_akademik_diterima` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tipe_tahun_akademik` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `periode_mulai_tahun_akademik` date DEFAULT NULL,
  `periode_selesai_tahun_akademik` date DEFAULT NULL,
  `semester` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `kelas` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
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
  `status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `token_reset_password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token_reset_password_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_role`, `nama_role`, `slug_role`, `nama`, `username`, `email`, `password`, `foto`, `jenis_kelamin`, `alamat`, `no_hp`, `nomor_identitas`, `tempat_lahir`, `tanggal_lahir`, `id_program_studi`, `jenjang_program_studi`, `nama_program_studi`, `singkatan_program_studi`, `id_tahun_akademik_diterima`, `tahun_akademik_diterima`, `tipe_tahun_akademik`, `periode_mulai_tahun_akademik`, `periode_selesai_tahun_akademik`, `semester`, `kelas`, `biaya_almamater`, `biaya_ktm`, `biaya_uang_gedung`, `id_spp`, `nama_spp`, `biaya_spp`, `biaya_uts`, `biaya_uas`, `biaya_ldkm`, `biaya_mbkm`, `biaya_bimbingan_skripsi`, `biaya_seminar_proposal`, `biaya_sidang_skripsi`, `biaya_yudisium`, `biaya_wisuda`, `status`, `token_reset_password`, `token_reset_password_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin', 'Admin', 'admin', '', '$2y$10$mVEvojJB5S6yx0DpBklmYOFSmvI6k8WqqKuAZxLu7w3dFGBXxXLqa', '1701744923_ef8be205f9a3eefa1576.jpg', 'Laki-laki', '', '', '', '', NULL, 0, '', '', '', 0, '', '', NULL, NULL, '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', NULL, '2022-10-21 14:14:28', '2025-08-01 13:29:47'),
(3, 2, 'Keuangan', 'keuangan', 'Keuangan', 'keuangan', '', '$2y$10$O/h9YibyABmarCDRvVzrfe23Y0qcIF5VHLFccOijKUtjTHYDS0MsC', '', 'Laki-laki', '', '', '', '', NULL, 0, '', '', '', 0, '', '', NULL, NULL, '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, '2024-04-27 20:10:01', '2025-08-17 12:55:09'),
(4, 3, 'Akademik', 'akademik', 'Akademik', 'akademik', '', '$2y$10$ImQAWNG6keTBgvSlIZXZeOoO3U.aH8GcqL1nCamgFHiaunM3dje5.', '', 'Laki-laki', '', '', '', '', NULL, 0, '', '', '', 0, '', '', NULL, NULL, '', '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL, NULL, '2025-08-18 16:37:32', '2025-08-18 16:37:32'),
(5, 5, 'Mahasiswa', 'Mahasiswa', 'Fatwa Aulia', '362055401093', 'fatwaaulia.fy@gmail.com', '$2y$10$Kj6j1J1g65.P6rzazo/4DexLRkjFggUuFaivHjx94LBVMRGx4p7da', '', 'Laki-laki', 'Dsn. Lidah RT/RW 002/003 Desa Gambiran, Kec. Gambiran, Kab. Banyuwangi', '082345566500', '362055401093', 'Banyuwangi', '2001-01-01', 1, 'S1', 'Pendidikan Bahasa Inggris', 'PBI', 1, '2025/2026', 'Ganjil', '2025-09-01', '2026-01-15', '1', 'D', 100000, 25000, 2500000, 1, 'SPP Tarif 1', 5000000, 250000, 500000, 50000, 50000, 100000, 150000, 200000, 250000, 300000, 'Aktif', NULL, NULL, '2025-08-19 09:56:48', '2025-08-21 16:12:20'),
(6, 5, 'Mahasiswa', 'mahasiswa', 'Putri Salsabila', '1234567890', 'salsabilla@gmail.com', '$2y$10$DyxkiMlw8hyFGKeKHTGNruqLcg67JQAhVn10os8OxpDegkPpujrDK', '', 'Perempuan', 'Jember', '082634793123', '1234567890', 'Jember', '2002-01-12', 2, 'S1', 'Pendidikan Guru Sekolah Dasar', 'PGSD', 1, '2025/2026', 'Ganjil', '2025-09-01', '2026-01-15', '1', 'C', 50000, 100000, 900000, 2, 'SPP Tarif 2', 4000000, 150000, 200000, 50000, 75000, 50000, 50000, 100000, 150000, 200000, 'Aktif', NULL, NULL, '2025-08-22 10:37:04', '2025-08-22 10:37:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kalender_akademik`
--
ALTER TABLE `kalender_akademik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_login`
--
ALTER TABLE `log_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran_mahasiswa`
--
ALTER TABLE `pembayaran_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penggunaan_dana`
--
ALTER TABLE `penggunaan_dana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penyusutan_inventaris`
--
ALTER TABLE `penyusutan_inventaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perolehan_dana`
--
ALTER TABLE `perolehan_dana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_mahasiswa`
--
ALTER TABLE `status_mahasiswa`
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
-- AUTO_INCREMENT for table `kalender_akademik`
--
ALTER TABLE `kalender_akademik`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log_login`
--
ALTER TABLE `log_login`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `pembayaran_mahasiswa`
--
ALTER TABLE `pembayaran_mahasiswa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penggunaan_dana`
--
ALTER TABLE `penggunaan_dana`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `penyusutan_inventaris`
--
ALTER TABLE `penyusutan_inventaris`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `perolehan_dana`
--
ALTER TABLE `perolehan_dana`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `status_mahasiswa`
--
ALTER TABLE `status_mahasiswa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tagihan_mahasiswa`
--
ALTER TABLE `tagihan_mahasiswa`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tarif_spp`
--
ALTER TABLE `tarif_spp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
