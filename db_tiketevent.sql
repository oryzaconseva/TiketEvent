-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2025 at 06:28 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tiketevent`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `event_id`, `quantity`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 5, 1, 10000, 'pending', '2025-11-11 07:23:54', '2025-11-11 07:23:54'),
(2, 2, 5, 1, 10000, 'confirmed', '2025-11-11 07:40:09', '2025-11-11 08:06:08'),
(3, 2, 5, 1, 10000, 'confirmed', '2025-11-11 07:53:41', '2025-11-11 08:05:57'),
(4, 3, 5, 1, 10000, 'confirmed', '2025-11-12 02:28:24', '2025-11-12 02:33:45'),
(5, 3, 7, 1, 10000, 'confirmed', '2025-11-12 02:57:01', '2025-11-12 03:00:39'),
(6, 3, 7, 1, 10000, 'pending', '2025-11-12 03:32:49', '2025-11-12 03:32:49'),
(7, 3, 7, 1, 10000, 'pending', '2025-11-12 03:34:12', '2025-11-12 03:34:12'),
(8, 3, 5, 1, 10000, 'pending', '2025-11-12 03:45:26', '2025-11-12 03:45:26'),
(9, 3, 5, 1, 10000, 'pending', '2025-11-12 03:48:11', '2025-11-12 03:48:11'),
(10, 3, 7, 1, 10000, 'pending', '2025-11-12 03:55:58', '2025-11-12 03:55:58'),
(11, 3, 7, 1, 10000, 'pending', '2025-11-12 04:03:01', '2025-11-12 04:03:01'),
(12, 3, 7, 1, 10000, 'pending', '2025-11-12 04:10:31', '2025-11-12 04:10:31'),
(13, 3, 7, 1, 10000, 'pending', '2025-11-12 04:15:20', '2025-11-12 04:15:20'),
(14, 3, 7, 1, 10000, 'pending', '2025-11-12 04:55:20', '2025-11-12 04:55:20'),
(15, 3, 7, 1, 10000, 'pending', '2025-11-12 04:58:50', '2025-11-12 04:58:50'),
(16, 3, 7, 1, 10000, 'pending', '2025-11-12 05:04:13', '2025-11-12 05:04:13'),
(17, 3, 5, 1, 10000, 'pending', '2025-11-12 05:08:49', '2025-11-12 05:08:49'),
(18, 3, 5, 1, 10000, 'pending', '2025-11-12 05:42:46', '2025-11-12 05:42:46'),
(19, 3, 7, 1, 10000, 'pending', '2025-11-12 05:51:34', '2025-11-12 05:51:34'),
(20, 3, 7, 1, 10000, 'pending', '2025-11-12 05:56:00', '2025-11-12 05:56:00'),
(21, 3, 7, 1, 10000, 'pending', '2025-11-12 06:25:04', '2025-11-12 06:25:04'),
(22, 3, 7, 1, 10000, 'pending', '2025-11-12 06:30:58', '2025-11-12 06:30:58'),
(23, 3, 7, 1, 10000, 'pending', '2025-11-12 07:16:40', '2025-11-12 07:16:40'),
(24, 3, 7, 1, 10000, 'confirmed', '2025-11-12 07:27:39', '2025-11-12 08:15:33'),
(25, 3, 5, 1, 10000, 'confirmed', '2025-11-12 07:27:53', '2025-11-12 07:45:03'),
(26, 3, 7, 1, 10000, 'confirmed', '2025-11-12 07:46:22', '2025-11-12 07:46:32'),
(27, 3, 5, 1, 10000, 'confirmed', '2025-11-12 07:50:20', '2025-11-12 07:50:35'),
(28, 3, 7, 1, 10000, 'confirmed', '2025-11-12 07:51:20', '2025-11-12 07:51:31'),
(29, 4, 7, 1, 10000, 'confirmed', '2025-11-12 07:59:09', '2025-11-12 08:01:06'),
(30, 2, 7, 1, 10000, 'pending', '2025-11-12 09:15:00', '2025-11-12 09:15:00'),
(31, 2, 7, 1, 10000, 'confirmed', '2025-11-12 09:16:41', '2025-11-12 21:51:49'),
(32, 2, 5, 1, 10000, 'confirmed', '2025-11-12 09:18:30', '2025-11-12 20:59:18'),
(33, 2, 10, 1, 500000, 'confirmed', '2025-11-12 21:10:19', '2025-11-12 21:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `quota` int(11) NOT NULL,
  `poster_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `description`, `date`, `location`, `price`, `quota`, `poster_image`, `created_at`, `updated_at`) VALUES
(5, 'Menfest Padang 2025', 'FULL LINE UP IS HERE! 🚨\r\nTanggal 17 Oktober kita bakal teriak bareng di GOR H. Agus Salim Padang 🏟️\r\n\r\n🎟️ Udah siap? Buruan amankan tiketmu sekarang sebelum kehabisan!\r\n#MenfestPadang2025', '2025-11-22 13:22:00', 'GOR H. Agus Salim Padang', 10000, 189, 'posters/XqBqspIeMtepeVHIhX3HIA3WB7vpLz2k4fWxIWIk.jpg', '2025-11-10 23:22:17', '2025-11-12 19:38:11'),
(7, 'Business Workshop', '✨ 2025 BUSINESS WORKSHOP ✨\r\n📢 Tema: “Content That Sells: Strategi Konten Kreatif untuk Menarik Pasar Online”\r\n\r\nIngin tahu gimana cara bikin konten yang bukan cuma menarik, tapi juga menghasilkan penjualan?\r\nYuk ikuti Workshop Kewirausahaan 2025 dan belajar langsung bersama:\r\n👔 Yudi Siswanto – Ketua DPD APRINDO Sumbar\r\n💼 Rayhanil Vebrian – BPC HIPMI Kota Padang\r\n\r\n📍 Tempat: Gedung PKM, Politeknik Negeri Padang\r\n📅 Tanggal: 22 November 2025\r\n🕰: 08.30-12.10 WIB\r\n💸 HTM: 10K aja!\r\n\r\n🎁 Benefit:\r\n✅ Snack\r\n✅ Sertifikat\r\n✅ Ilmu yang bermanfaat\r\n\r\nDaftar sekarang melalui link di bawah ini!\r\n🔗 https://forms.gle/D1umYrpynSJWJUo39\r\n📱 Pembayaran via DANA: 0822-8690-4493 (Sintia)\r\n\r\n📞 Contact Person:\r\nArin – 0822-3160-8427\r\nMeutia – 0895-2586-7161', '2025-11-22 20:30:00', 'PKM Politeknik Negeri Padang', 10000, 179, 'posters/2P0kvbWHH0yGNpQ9RaR3UIvNyTeyeFycvLTDKYRe.jpg', '2025-11-12 02:47:54', '2025-11-12 09:16:41'),
(9, 'Hackathon Cybertech 2025', 'Tema: \"CyberGame: Exploring the Vault\" 💡💻 \r\n\"Get ready to innovate and make an impact! 🌍🚀\r\n\r\nDaftarkan tim terbaikmu di Hackathon 2025 dan tunjukkan kemampuanmu dalam menciptakan solusi inovatif berbasis pengembangan game! \r\n\r\n🗓 Pendaftaran: 13 Oktober - 13 November 2025  (Free Insert!) \r\n📍 Pelaksanaan: 15 - 16 November 2025 \r\n🏢 Lokasi: Gedung C Politeknik Negeri Padang \r\n\r\n🔥 DETAIL LOMBA:\r\n\r\nFormat: 24 Jam Nonstop Coding! \r\nPlatform & Engine: BEBAS! Kalian bisa buat game untuk PC, Mobile, atau Web. Boleh pakai Unity, Unreal, Godot, atau engine lainnya.\r\nGenre Game: Bebas (Open Track).\r\nProject Lama: Punya project yang belum selesai? Boleh dipakai! (Maksimal 60% dari project yang sudah ada) .\r\n👥 Tim: 3 - 5 Orang Per Tim (Terbuka untuk Mahasiswa/Umum)  💰 HADIAH: JUTAAN RUPIAH + SERTIFIKAT\r\nAyo, tunggu apa lagi? Segera daftarkan tim-mu!\r\n\r\nNggak punya tim? TENANG! Kamu bisa mendaftar SOLO dan nanti akan dicarikan anggota tim oleh panitia! \r\n🔗 Link Pendaftaran (TIM):', '2025-11-15 09:18:00', 'Gedung C Politeknik Negeri Padang', 15000, 15, 'posters/pASDtDe501jnQz265fFXuBcTU3zBo5HdKDflcGuY.jpg', '2025-11-12 19:19:10', '2025-11-12 19:20:04'),
(10, 'Wedding Expo', 'Sebuah gaun bukan hanya busana, tapi perwujudan mimpi yang telah lama disimpan dalam hati.\r\nBersama Labertha @labertha_ , setiap detail, lipatan kain, dan sentuhan elegan dirancang untuk membuat setiap langkahmu di altar penuh percaya diri dan keanggunan.\r\n\r\n📍 28–30 November 2025\r\n🏨 @santikapremierepadanghotel\r\n\r\nTemukan Labertha bersama puluhan vendor terbaik hanya di Padang Wedding Expo 2025, one of the biggest wedding exhibitions in West Sumatera.\r\n✨ Free Entry untuk semua pengunjung!', '2025-11-28 09:00:00', 'Hotel Santika Premiere Padang', 500000, 49, 'posters/k2tUoQxGiK5rX1pgtabOJRosCw9ozYbg7SYwaEsk.jpg', '2025-11-12 19:49:38', '2025-11-12 21:10:19'),
(11, 'Seminar Legislatif', 'Hallo teman-teman pelajar SMA/SMK/Sederajat, Mahasiswa Aktif, Lembaga Legislatif se - Indonesia dan mahasiswa aktif Politeknik Negeri Padang🙌\r\n\r\nUntuk kamu Mahasiswa dan Pelajar, ada info menarik nih buat kamu🔥🔥\r\nPendaftaran peserta Seminar Legislatif  udah buka lho...🙌\r\n\r\nAyo daftarkan dirimu dan bersiaplah menjadi salah satu legislator yang berintegritas, bersinergi, aspiratif, dan solutif. \r\n\r\nJangan sia-sia kan karena banyak hal yang akan kamu dapatkan disini. \r\nAcaranya hanya satu hari di  kampus Politeknik Negeri Padang dan kamu akan mendapatkan sertifikat, dorprize, ilmu yang bermanfaat serta relasi dengan teman-teman se-Indonesia.\r\n\r\nPendaftaran : 8 Oktober - 5 November 2025\r\n\r\nLink Pendaftaran : \r\nhttps://forms.gle/rPypywAC5KqQuNnj8 \r\n\r\n💸 Insert : \r\nPaket A : 25k\r\nPaket B(online) : 15k\r\nBank            : SeaBank\r\nNo Rek        : 901867210590 \r\nAtas nama   : Alfinka Mutiara Sagina\r\n\r\n🖇 Jadwal Seminar Legislatif\r\n✏ 8 November 2025\r\n📍Politeknik Negeri Padang\r\n\r\nContact Person\r\n👤 089503561710 (Gio Aprillino)\r\n👤 085213339129 (Jisdaf Gio Pratama)\r\n\r\nPanitia Seminar Legislatif  2025\r\n1. Ketua Pelaksana : M Rafli Adriansyah\r\n2. Sekretaris : Hallysa Humaira Yutra\r\n_____________\r\nPantau terus kanal informasi kami🔍\r\nMedia :\r\nIG : @selegtif_pnp\r\n_____________\r\nPimpinan MPM KM PNP 2025/2026 :\r\n\r\nKetua Umum MPM KM PNP: Ahmad Shiddiq Hasyim NZ\r\nWakil Ketua Umum MPM KM PNP : Alqis Salam\r\n____________\r\nPantau terus kanal informasi kami 🔍 \r\nMedia :\r\nIG : @mpmkmpnp', '2025-11-15 08:00:00', 'Politeknik Negeri Padang', 25000, 150, 'posters/XOEwI59MHHGS0epsuZCenBudLWVUwbxiSMmwomI5.jpg', '2025-11-12 20:42:32', '2025-11-12 20:42:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_11_022715_create_events_table', 1),
(5, '2025_11_11_022741_create_bookings_table', 1),
(6, '2025_11_11_024317_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth_token', 'f5d303fd3d2de01e86c9ece392fe51c3d947b727602b2f27b501d3b1e0854232', '[\"*\"]', NULL, NULL, '2025-11-11 07:06:13', '2025-11-11 07:06:13'),
(2, 'App\\Models\\User', 2, 'auth_token', '1ee33b15876dd2a9836b4f83883e0b1036d93dcf764bf60868f7490c201637c4', '[\"*\"]', '2025-11-11 07:48:39', NULL, '2025-11-11 07:06:43', '2025-11-11 07:48:39'),
(3, 'App\\Models\\User', 2, 'auth_token', '0a76a9a0bc486e0be5bdd9b70196f300e646b9df323a9c428c9e31d1903f1dbc', '[\"*\"]', '2025-11-11 07:53:41', NULL, '2025-11-11 07:53:29', '2025-11-11 07:53:41'),
(4, 'App\\Models\\User', 3, 'auth_token', '516cdefb73f19ca4bb0aa0dd25ac99b4da470122688c297346677ebb486ee9e0', '[\"*\"]', NULL, NULL, '2025-11-12 02:27:47', '2025-11-12 02:27:47'),
(5, 'App\\Models\\User', 3, 'auth_token', '2c436b69e775bd23bbb41e58a57a985dd95d7fac46cf59e7b74b225555121409', '[\"*\"]', '2025-11-12 02:28:24', NULL, '2025-11-12 02:28:10', '2025-11-12 02:28:24'),
(6, 'App\\Models\\User', 3, 'auth_token', 'ef1d7a044bd5b6821a490093666454cf47e3b375952f30a7a27e69266eae6e08', '[\"*\"]', '2025-11-12 02:32:53', NULL, '2025-11-12 02:32:50', '2025-11-12 02:32:53'),
(7, 'App\\Models\\User', 3, 'auth_token', '0980e3ed99d30ecb006152d2fda789f7228ce1955124756b5389e6b77fcac194', '[\"*\"]', '2025-11-12 06:56:42', NULL, '2025-11-12 02:35:00', '2025-11-12 06:56:42'),
(8, 'App\\Models\\User', 3, 'auth_token', 'b106dad1c24b0aca410f4ec04031277882abb994c9ddebe8f44b4d6ec106f021', '[\"*\"]', '2025-11-12 07:46:23', NULL, '2025-11-12 07:16:31', '2025-11-12 07:46:23'),
(9, 'App\\Models\\User', 3, 'auth_token', 'c126716a691195f004f04f9728172541e56c671e5af45d9749569b57a5ad2f80', '[\"*\"]', '2025-11-12 07:51:36', NULL, '2025-11-12 07:49:18', '2025-11-12 07:51:36'),
(10, 'App\\Models\\User', 4, 'auth_token', '0eb075772181a3da9d53e5c59f1f9d401c74bda1dcf18248f873072f9dd6ff15', '[\"*\"]', NULL, NULL, '2025-11-12 07:56:38', '2025-11-12 07:56:38'),
(11, 'App\\Models\\User', 4, 'auth_token', '85d062a33054eb4819645035a52fb9134caedeb16b242ddcef61ca0f48b75c44', '[\"*\"]', '2025-11-12 07:59:09', NULL, '2025-11-12 07:58:56', '2025-11-12 07:59:09'),
(12, 'App\\Models\\User', 4, 'auth_token', '51d4ca01065e6392142da1a652eb66c7204c4a80e7fc91805608235f13065212', '[\"*\"]', '2025-11-12 08:01:11', NULL, '2025-11-12 08:00:07', '2025-11-12 08:01:11'),
(13, 'App\\Models\\User', 4, 'auth_token', '83664029816b80d69387e06987f722879e32ec31057076b10452b5cc6c2d6821', '[\"*\"]', '2025-11-12 08:10:11', NULL, '2025-11-12 08:04:01', '2025-11-12 08:10:11'),
(14, 'App\\Models\\User', 4, 'auth_token', 'abc0d6aad85a8c1a1e1846f642012db4c2f0e70466a30329fe6a87c08f9d43ea', '[\"*\"]', '2025-11-12 08:26:34', NULL, '2025-11-12 08:18:16', '2025-11-12 08:26:34'),
(15, 'App\\Models\\User', 4, 'auth_token', '5c7e856d3fab057fb336719e251f63f8ad254376eb4ad67c1ada2f52f3853311', '[\"*\"]', '2025-11-12 08:59:01', NULL, '2025-11-12 08:29:32', '2025-11-12 08:59:01'),
(16, 'App\\Models\\User', 4, 'auth_token', 'fdb3bda3c281dba7481fc485da943f90307879cc29aea6dbbc554812eec59bf6', '[\"*\"]', '2025-11-12 09:14:03', NULL, '2025-11-12 09:09:13', '2025-11-12 09:14:03'),
(17, 'App\\Models\\User', 2, 'auth_token', '9f410339a6ebe358fcc3ed23c85f4d674fe11fa8768f9da0f7e5b55d9c37ca49', '[\"*\"]', '2025-11-12 09:16:42', NULL, '2025-11-12 09:14:46', '2025-11-12 09:16:42'),
(18, 'App\\Models\\User', 2, 'auth_token', '6404f0e471d1fe5bdf7c25c99f2ff3441fd187913769a95e9d72b7d61bd06b0c', '[\"*\"]', '2025-11-12 09:18:37', NULL, '2025-11-12 09:18:07', '2025-11-12 09:18:37'),
(19, 'App\\Models\\User', 2, 'auth_token', 'aed499588105ce82a0757572afef3122c103b40ad25f04cecd370eb100efe17c', '[\"*\"]', '2025-11-12 09:25:01', NULL, '2025-11-12 09:24:59', '2025-11-12 09:25:01'),
(20, 'App\\Models\\User', 2, 'auth_token', 'e031be5f6dd236d88d89f41f2efd8bfa51a11a8f466a6789450913598a13dce4', '[\"*\"]', '2025-11-12 09:27:53', NULL, '2025-11-12 09:27:42', '2025-11-12 09:27:53'),
(21, 'App\\Models\\User', 3, 'auth_token', 'dabcbf93cac2fee69aaf945b7be63ad642f83fbdd35a840296504b6d3161f598', '[\"*\"]', '2025-11-12 20:55:58', NULL, '2025-11-12 20:55:55', '2025-11-12 20:55:58'),
(22, 'App\\Models\\User', 2, 'auth_token', '262b06ae428ff03714e7c2d043eabea878e4b4fa2851daac022febf1e8402718', '[\"*\"]', '2025-11-12 20:59:22', NULL, '2025-11-12 20:58:47', '2025-11-12 20:59:22'),
(23, 'App\\Models\\User', 3, 'auth_token', '525f90cfb1db369f1ec929e3c3dc7e3a81f421374981496a6c8eec8b6ac987c4', '[\"*\"]', '2025-11-12 21:04:49', NULL, '2025-11-12 21:04:46', '2025-11-12 21:04:49'),
(24, 'App\\Models\\User', 2, 'auth_token', '1359d168ea99c4ccf80f0e04d2e2a3fa311fa9fccf8285aaa0c094b78593ad11', '[\"*\"]', '2025-11-12 21:11:00', NULL, '2025-11-12 21:09:40', '2025-11-12 21:11:00'),
(25, 'App\\Models\\User', 2, 'auth_token', '465ed82b0c3bf5d8b8cc4512316d64c7e0cace471c05ed01cee7896cc59b326c', '[\"*\"]', '2025-11-12 21:12:25', NULL, '2025-11-12 21:12:23', '2025-11-12 21:12:25'),
(26, 'App\\Models\\User', 2, 'auth_token', 'f3f12d78e7a08e0dcae95cf35d349c542121ff861da38ca865b9b62352a6872a', '[\"*\"]', '2025-11-12 21:18:23', NULL, '2025-11-12 21:16:12', '2025-11-12 21:18:23'),
(27, 'App\\Models\\User', 2, 'auth_token', 'cb00e1b72a971e1dbb5e9d45825c1a82a230cecf179dd970acf4a442131ae13c', '[\"*\"]', '2025-11-12 21:19:30', NULL, '2025-11-12 21:19:28', '2025-11-12 21:19:30'),
(28, 'App\\Models\\User', 2, 'auth_token', 'cf9fe435f85c8cd301239a68aa057fe9ac0d2dcd0f3cd0708dd01fe08205842b', '[\"*\"]', '2025-11-12 21:31:22', NULL, '2025-11-12 21:31:20', '2025-11-12 21:31:22'),
(29, 'App\\Models\\User', 2, 'auth_token', '934005f26474cd205707fd4c491399ab2e9ae2f697d43ad6741ed41d97dff994', '[\"*\"]', '2025-11-12 21:35:50', NULL, '2025-11-12 21:35:47', '2025-11-12 21:35:50'),
(30, 'App\\Models\\User', 2, 'auth_token', '43beb5d99a2eb910a6ea1d53251c95fc3753451740a4bdfb9dca3d0dc17223f7', '[\"*\"]', '2025-11-12 21:40:59', NULL, '2025-11-12 21:40:56', '2025-11-12 21:40:59'),
(31, 'App\\Models\\User', 2, 'auth_token', 'bd3816aa493a9dc46a10438a63209a98d25ab6d67913da7ce8714e9150c6cf2e', '[\"*\"]', '2025-11-12 21:46:31', NULL, '2025-11-12 21:46:29', '2025-11-12 21:46:31'),
(32, 'App\\Models\\User', 2, 'auth_token', '4c6bf89e781bd19e450f3f7d7b917c71d29132353b012e66a737f9026d7bdb24', '[\"*\"]', '2025-11-12 21:48:56', NULL, '2025-11-12 21:48:53', '2025-11-12 21:48:56'),
(33, 'App\\Models\\User', 2, 'auth_token', '833fc49a6407fac818a9a2bc0af996e81e10b2b18268a37c3172be5abcf5a907', '[\"*\"]', '2025-11-12 21:49:51', NULL, '2025-11-12 21:49:48', '2025-11-12 21:49:51'),
(34, 'App\\Models\\User', 2, 'auth_token', '68110d8fb141cf25f025775b9d74721230de8346c8ed9af1f029d2c3ba2bc318', '[\"*\"]', '2025-11-12 22:06:29', NULL, '2025-11-12 21:55:33', '2025-11-12 22:06:29'),
(35, 'App\\Models\\User', 2, 'auth_token', '5bc3d2641cbe72f0c41504a318dfab926d5788f83261f001a4521b9671bbfef5', '[\"*\"]', '2025-11-12 22:07:14', NULL, '2025-11-12 22:07:12', '2025-11-12 22:07:14'),
(36, 'App\\Models\\User', 2, 'auth_token', 'f0f4179febbe104974ed2c2d4332f3af65556f99a4f0be44ea589abc7b73ea87', '[\"*\"]', '2025-11-12 22:08:12', NULL, '2025-11-12 22:08:11', '2025-11-12 22:08:12'),
(37, 'App\\Models\\User', 2, 'auth_token', 'b884326589254f5c3d0d067372f92cddc49bb9193c17b8e63c7e58d371fd0042', '[\"*\"]', '2025-11-12 22:08:45', NULL, '2025-11-12 22:08:43', '2025-11-12 22:08:45'),
(38, 'App\\Models\\User', 2, 'auth_token', '2bb5d5af8776c4520cb123bee47bfa56fd5c1a07b0fb37bfd37c2015b1f06337', '[\"*\"]', '2025-11-12 22:20:02', NULL, '2025-11-12 22:20:00', '2025-11-12 22:20:02');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('cHrZewu5vLm2NGiFbqwPQfx2Wmp1pbs9nJpMVKka', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTRlaEZsZkFzdWl3WnRDWmRNMVBuTlV2MGY0MHN3cjlXSWtkbkxySSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9fQ==', 1763010829);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Oryza Conseva', 'oryza@gmail.com', NULL, '$2y$12$Pni.A.n3ZQjfgwdX5mNkj.A7L5f75vS5H7q1OBL6us1ZcZvGr4..S', 'c6xGwNMXgnhoEzIcBY8MN3mRhIm9yEp3DuKMH4A9SyIWIcoxNR3s3dEsUcJY', '2025-11-10 21:23:49', '2025-11-10 21:23:49'),
(2, 'humaira', 'humairaelfiputri@gmail.com', NULL, '$2y$12$EafQCmeHDFIYx48Aac4ZkuoranejhlMOXL6ZsH6JkPCpc9yRNJoEC', NULL, '2025-11-11 07:06:13', '2025-11-11 07:06:13'),
(3, 'oryza', 'oryzaconseva@gmail.com', NULL, '$2y$12$qSSPXQlpbebHdYf9GplS/OnugbHQFYyq.NoZZzoTaPgLwpOpCPKSa', NULL, '2025-11-12 02:27:47', '2025-11-12 02:27:47'),
(4, 'salsa', 'salsa@gmail.com', NULL, '$2y$12$e6MhBrWqRr0zpNeKaZgplOhoIqYRV/61H2P7GS0QOsBSrYUeZio6C', NULL, '2025-11-12 07:56:38', '2025-11-12 07:56:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_event_id_foreign` (`event_id`);

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
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
