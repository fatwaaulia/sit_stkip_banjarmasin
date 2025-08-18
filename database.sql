-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 18, 2025 at 09:15 AM
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
-- Table structure for table `form_input`
--

CREATE TABLE `form_input` (
  `id` bigint NOT NULL,
  `kode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `harga` int NOT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dokumen_pendukung` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gambar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gambar_multiple` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_kegiatan` datetime DEFAULT NULL,
  `select_multiple` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `checkbox` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `persetujuan` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `form_input`
--

INSERT INTO `form_input` (`id`, `kode`, `nama`, `slug`, `harga`, `deskripsi`, `dokumen_pendukung`, `gambar`, `gambar_multiple`, `tanggal_kegiatan`, `select_multiple`, `checkbox`, `persetujuan`, `created_at`, `updated_at`, `created_by`) VALUES
(4, 'JL4EN', 'Quae cumque aliquam', '', 339796, '', '', '', '[\"1755264055_9f57231016f4c06ebe4e.jpg\",\"1755264056_01dee68c97762718e720.jpg\",\"1755264056_eeacb82fdd2dca0527cb.jpg\"]', '2025-01-21 08:35:24', '[\"Dua\"]', '[\"checkbox 1\"]', 'Iya', '2025-02-13 15:57:36', '2025-08-15 20:21:14', 1),
(7, 'H9KE2', 'Neque repellendus qui', '', 45687, '', '', '', '', '2025-02-02 02:09:26', '', '', 'Tidak', '2025-02-13 15:57:36', '2025-05-05 08:44:42', 1),
(8, 'LFIBG', 'Voluptates asper', '', 262717, '', '', '', '', '2025-02-13 02:47:09', '', '', 'Iya', '2025-02-13 15:57:36', '2025-05-05 08:44:37', 1),
(9, 'J8HYS', 'Rerum rem possimus dolorem aut', '', 251047, '', '', '', '', '2025-02-11 05:25:05', '', '', 'Tidak', '2025-02-13 21:13:30', '2025-02-13 21:13:30', 1),
(10, 'EWHQF', 'In necessitatibus ipsa quam', '', 190738, '', '', '', '', '2025-01-28 00:04:37', '', '', 'Tidak', '2025-02-13 21:13:30', '2025-05-03 15:56:50', 1),
(11, '2LKAN', 'Est illum temporibu', '', 145998, '', '', '', '', '2025-02-11 02:19:22', '', '', 'Tidak', '2025-02-13 21:13:30', '2025-05-04 10:12:47', 1),
(12, 'EHU7P', 'Similique velit veniam alias itaqu', '', 243739, '', '', '', '', '2025-01-22 07:57:49', '', '', 'Tidak', '2025-02-13 21:13:30', '2025-05-04 10:13:37', 1),
(13, 'GSAUL', 'Veniam sunt qui eos facere qui', '', 213190, '', '', '', '', '2025-02-04 13:07:23', '', '', 'Iya', '2025-02-13 21:13:30', '2025-02-13 21:13:30', 1),
(14, 'TFKTO', 'Consequuntur temporibus doloribus ducimus', '', 19004, '', '', '', '', '2025-02-12 22:02:44', '', '', 'Iya', '2025-02-13 21:13:30', '2025-02-13 21:13:30', 1),
(15, 'PAXDQ', 'Vitae sit eosss', '', 160586, '', '', '', '', '2025-01-17 02:03:28', '', '', 'Iya', '2025-02-13 21:13:30', '2025-05-04 10:03:58', 1),
(17, 'CZG35', 'belanuk', 'belanuk', 98178923, '', '', '', '', NULL, '[\"Satu\"]', '[\"checkbox 1\"]', 'Iya', '2025-08-15 12:30:50', '2025-08-15 12:30:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Balita', '2024-02-04 20:24:55', '2025-06-23 11:14:19'),
(2, 'PAUD', '2024-05-10 11:06:54', '2025-04-23 14:01:47'),
(3, 'TK', '2024-05-10 11:06:59', '2025-03-18 06:23:58'),
(4, 'SD', '2024-05-10 11:07:05', '2025-02-04 06:42:08'),
(5, 'SMP', '2024-05-10 11:07:22', '2025-03-18 06:24:05'),
(6, 'SMA', '2024-05-10 11:07:26', '2024-05-10 11:07:26'),
(7, 'D3', '2024-05-10 11:07:45', '2024-05-10 11:07:52'),
(8, 'D4 / S1', '2024-05-10 11:08:02', '2024-05-10 11:08:02'),
(9, 'S2', '2024-05-10 11:08:07', '2024-05-10 11:08:07'),
(10, 'S3', '2024-05-10 11:08:13', '2025-02-08 10:23:49'),
(11, 'Kelurahan', '2024-05-10 11:08:26', '2024-05-10 11:08:26'),
(12, 'Kecamatan', '2024-05-10 11:08:31', '2024-05-10 11:08:31'),
(13, 'Sore', '2024-05-10 11:13:17', '2024-05-10 11:13:17'),
(14, 'siang', '2024-05-10 11:13:23', '2024-05-10 11:13:23'),
(15, 'Sekola', '2024-05-10 11:13:38', '2024-05-10 11:13:38'),
(17, 'Bokeso', '2024-05-10 11:14:03', '2024-05-10 11:14:03'),
(18, 'Bass', '2024-05-10 11:14:16', '2024-05-10 11:14:16'),
(19, 'Surabaya', '2024-06-10 08:38:59', '2024-06-10 08:38:59'),
(20, 'Kokoko', '2024-06-10 08:50:06', '2024-06-10 08:50:06'),
(21, 'Jakarta', '2024-06-10 08:50:14', '2024-06-10 08:50:14'),
(22, 'Bandung', '2024-10-17 08:34:20', '2024-10-26 07:28:39'),
(25, 'Apaan tuh', '2024-10-26 08:34:34', '2024-11-17 21:29:16');

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
(6, 0, 0, '', 'superadminasd', '::1', 'Failed', '2025-04-20 11:06:27', '2025-04-20 11:06:27'),
(7, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-04-20 11:06:31', '2025-04-20 11:06:31'),
(8, 0, 0, '', 'fatwaaulia@gmail.com', '::1', 'Failed', '2025-04-20 11:07:25', '2025-04-20 11:07:25'),
(9, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-04-20 11:07:31', '2025-04-20 11:07:31'),
(10, 1, 1, 'Superadmin', 'superadmin', '::1', 'Success', '2025-04-20 22:08:33', '2025-04-20 22:08:33'),
(12, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-04-27 16:18:51', '2025-04-27 16:18:51'),
(13, 0, 0, '', 'adminqqqq', '::1', 'Failed', '2025-04-27 16:27:40', '2025-04-27 16:27:40'),
(14, 3, 3, 'Fatwa Aulia', 'fatwaaulia.fy@gmail.com', '::1', 'Success', '2025-04-27 16:29:37', '2025-04-27 16:29:37'),
(15, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-04-29 19:49:27', '2025-04-29 19:49:27'),
(16, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-05-01 05:45:54', '2025-05-01 05:45:54'),
(17, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-05-01 06:47:27', '2025-05-01 06:47:27'),
(18, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-05-03 06:00:59', '2025-05-03 06:00:59'),
(19, 2, 2, 'Admin', 'admin', '::1', 'Success', '2025-05-05 09:05:37', '2025-05-05 09:05:37'),
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
(113, 1, 1, 'Admin', 'admin', '::1', 'Success', '2025-08-18 13:09:06', '2025-08-18 13:09:06');

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
(2, 'Keuangan', 'keuangan');

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
  `token_reset_password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token_reset_password_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_role`, `nama_role`, `slug_role`, `nama`, `username`, `email`, `password`, `foto`, `jenis_kelamin`, `alamat`, `no_hp`, `token_reset_password`, `token_reset_password_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin', 'Admin', 'admin', '', '$2y$10$mVEvojJB5S6yx0DpBklmYOFSmvI6k8WqqKuAZxLu7w3dFGBXxXLqa', '1701744923_ef8be205f9a3eefa1576.jpg', 'Laki-laki', '', '', '', NULL, '2022-10-21 14:14:28', '2025-08-01 13:29:47'),
(3, 2, 'Keuangan', 'keuangan', 'Keuangan', 'keuangan', '', '$2y$10$O/h9YibyABmarCDRvVzrfe23Y0qcIF5VHLFccOijKUtjTHYDS0MsC', '', 'Laki-laki', '', '', 'o8i2DhlfYzwQ6HOF1IGceJDxRv92LGVm', '2024-10-25 05:04:14', '2024-04-27 20:10:01', '2025-08-17 12:55:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_input`
--
ALTER TABLE `form_input`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_login`
--
ALTER TABLE `log_login`
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
-- Indexes for table `role`
--
ALTER TABLE `role`
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
-- AUTO_INCREMENT for table `form_input`
--
ALTER TABLE `form_input`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `log_login`
--
ALTER TABLE `log_login`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

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
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
