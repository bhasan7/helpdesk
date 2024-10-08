-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 08, 2024 at 08:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hifaoil`
--

-- --------------------------------------------------------

--
-- Table structure for table `firma_problemi`
--

CREATE TABLE `firma_problemi` (
  `id_firme` bigint(20) UNSIGNED NOT NULL,
  `id_problem` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `firma_problemi`
--

INSERT INTO `firma_problemi` (`id_firme`, `id_problem`) VALUES
(1, 1),
(2, 15),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `firme`
--

CREATE TABLE `firme` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `naziv_firme` varchar(255) NOT NULL,
  `tipovi_problema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tipovi_problema`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `firme`
--

INSERT INTO `firme` (`id`, `naziv_firme`, `tipovi_problema`, `created_at`, `updated_at`) VALUES
(1, 'HIFA OIL', NULL, '2024-09-20 13:22:38', '2024-09-20 13:22:38'),
(2, 'EURO-METALI', NULL, '2024-09-21 15:09:47', '2024-09-21 15:09:47'),
(3, 'EURO-ROAL', NULL, '2024-09-21 20:02:54', '2024-09-21 20:02:54'),
(4, 'L.B Profile', NULL, '2024-09-22 18:18:29', '2024-09-22 18:18:29'),
(5, 'BoWido', NULL, '2024-09-23 13:49:50', '2024-09-23 13:49:50'),
(6, 'NOSTRO', NULL, '2024-09-23 16:38:59', '2024-09-23 16:38:59'),
(7, 'HIFA SOLAR', NULL, '2024-09-23 16:39:43', '2024-09-23 16:39:43'),
(8, 'EURO-METALI ZAGREB', NULL, '2024-09-23 18:15:51', '2024-09-23 18:15:51');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id_korisnik` bigint(20) UNSIGNED NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `id_firme` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2024_09_19_141304_create_tickets_table', 1),
(5, '2024_09_20_071356_create_tipovi_problema_table', 1),
(6, '2024_09_20_071359_create_prioriteti_table', 1),
(7, '2024_09_20_071401_create_firme_table', 1),
(8, '2024_09_20_071405_create_sektori_table', 1),
(9, '2024_09_20_071409_create_poslovnice_table', 1),
(14, '2014_10_12_000000_create_users_table', 2),
(15, '2024_09_20_084013_create_poslovnice_table', 3),
(16, '2024_09_20_084020_create_korisnik_table', 3),
(18, '2024_09_21_094300_create_poslovnica_user_table', 3),
(19, '2024_09_21_111730_add_user_id_to_tickets_table', 3),
(20, '2024_09_20_084024_create_firma_problemi_table', 4);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poslovnica_user`
--

CREATE TABLE `poslovnica_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `poslovnica_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poslovnice`
--

CREATE TABLE `poslovnice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `naziv_poslovnice` varchar(255) NOT NULL,
  `firma_id` varchar(11) DEFAULT NULL,
  `opis_poslovnice` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poslovnice`
--

INSERT INTO `poslovnice` (`id`, `naziv_poslovnice`, `firma_id`, `opis_poslovnice`, `created_at`, `updated_at`) VALUES
(1, 'Bp Maglaj', '1', NULL, '2024-09-20 13:22:56', '2024-09-20 13:22:56'),
(2, 'BP Gračanica', '1', NULL, '2024-09-21 07:28:50', '2024-09-21 07:28:50'),
(3, 'BP Maglaj 2', '1', NULL, '2024-09-21 07:28:59', '2024-09-21 07:28:59'),
(4, 'POSLOVNICA DOBOJ JUG', '1', 'TEST', '2024-09-21 17:50:19', '2024-09-21 17:50:19'),
(5, 'Doboj-Jug', '2', NULL, '2024-09-21 18:25:31', '2024-09-21 18:25:31'),
(6, 'Mostar', '2', NULL, '2024-09-21 18:26:08', '2024-09-21 18:26:08'),
(7, 'Sarajevo', '2', NULL, '2024-09-21 20:00:19', '2024-09-21 20:00:19'),
(8, 'Test', '3', NULL, '2024-09-21 20:02:34', '2024-09-21 20:02:34'),
(9, 'Podgorica', '1', NULL, '2024-09-21 20:04:35', '2024-09-21 20:04:35'),
(10, 'Zagreb', NULL, NULL, '2024-09-22 07:02:38', '2024-09-22 07:02:38'),
(11, 'Poslovnica 1', NULL, NULL, '2024-09-22 16:59:36', '2024-09-22 16:59:36'),
(12, 'Zagreb1', NULL, NULL, '2024-09-22 17:02:19', '2024-09-22 17:02:19'),
(13, 'test', '2', NULL, NULL, NULL),
(14, 'POSLOVNICA DOBOJ JUG 1', NULL, NULL, '2024-09-22 17:08:20', '2024-09-22 17:08:20'),
(15, 'Poslovnica 12', NULL, NULL, '2024-09-22 17:12:23', '2024-09-22 17:12:23'),
(16, 'Poslovnica 122', NULL, NULL, '2024-09-22 17:15:12', '2024-09-22 17:15:12'),
(17, 'Poslovnica 144', NULL, NULL, '2024-09-22 17:17:17', '2024-09-22 17:17:17'),
(18, '444', NULL, NULL, '2024-09-22 17:20:55', '2024-09-22 17:20:55'),
(19, '222', NULL, NULL, '2024-09-22 17:22:02', '2024-09-22 17:22:02'),
(20, '33', NULL, NULL, '2024-09-22 17:25:05', '2024-09-22 17:25:05'),
(21, '22', NULL, NULL, '2024-09-22 17:25:38', '2024-09-22 17:25:38'),
(22, '444', NULL, NULL, '2024-09-22 17:28:55', '2024-09-22 17:28:55'),
(23, '2', NULL, NULL, '2024-09-22 17:29:43', '2024-09-22 17:29:43'),
(24, '222', NULL, NULL, '2024-09-22 17:31:32', '2024-09-22 17:31:32'),
(25, 'Tttt', NULL, NULL, '2024-09-22 17:32:40', '2024-09-22 17:32:40'),
(26, '333', NULL, NULL, '2024-09-22 17:35:23', '2024-09-22 17:35:23'),
(27, 'Poslovnica 14444', NULL, NULL, '2024-09-22 17:36:15', '2024-09-22 17:36:15'),
(28, 'Poslovnica 1222', NULL, NULL, '2024-09-22 17:38:20', '2024-09-22 17:38:20'),
(29, '2244556', NULL, NULL, '2024-09-22 17:40:36', '2024-09-22 17:40:36'),
(30, 'Poslovnica 1ee', NULL, NULL, '2024-09-22 17:42:15', '2024-09-22 17:42:15'),
(31, 'TEST POSLOVNCIA', '1', NULL, NULL, NULL),
(32, 'TEST POSLOVNCIA', '1', NULL, NULL, NULL),
(33, 'Poslovnica 122222', NULL, NULL, '2024-09-22 17:44:18', '2024-09-22 17:44:18'),
(34, 'Poslovnica tes', NULL, NULL, '2024-09-22 17:45:06', '2024-09-22 17:45:06'),
(35, '222', NULL, NULL, '2024-09-22 17:46:48', '2024-09-22 17:46:48'),
(36, 'ttee', NULL, NULL, '2024-09-22 17:49:53', '2024-09-22 17:49:53'),
(37, 'TEST2222', NULL, NULL, '2024-09-22 17:51:07', '2024-09-22 17:51:07'),
(38, 'Poslovnica 12222', '2', NULL, NULL, NULL),
(39, 'Poslovnica 1', '3', NULL, NULL, NULL),
(40, 'Doboj', '4', NULL, NULL, NULL),
(41, 'Doboj', '5', NULL, NULL, NULL),
(42, 'Crna Gora', '2', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prioriteti`
--

CREATE TABLE `prioriteti` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `naziv_prioriteta` varchar(255) NOT NULL,
  `opis_prioriteta` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prioriteti`
--

INSERT INTO `prioriteti` (`id`, `naziv_prioriteta`, `opis_prioriteta`, `created_at`, `updated_at`) VALUES
(1, 'VISOK', NULL, '2024-09-21 08:12:52', '2024-09-21 08:12:52'),
(2, 'Standardan', NULL, '2024-09-22 07:02:18', '2024-09-22 07:02:18'),
(3, 'Nizak', 'Ovo je nizak prioritet', '2024-09-23 13:45:11', '2024-09-23 13:45:11'),
(4, 'Testni', 'Ovo je samo za potrebe snimanja', '2024-09-23 18:15:31', '2024-09-23 18:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `sektori`
--

CREATE TABLE `sektori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `naziv_sektora` varchar(255) NOT NULL,
  `opis_sektora` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sektori`
--

INSERT INTO `sektori` (`id`, `naziv_sektora`, `opis_sektora`, `created_at`, `updated_at`) VALUES
(1, 'IT_SEKTOR', NULL, '2024-09-20 13:22:46', '2024-09-20 13:22:46'),
(2, 'RACUNOVODSTVO', NULL, '2024-09-21 15:15:16', '2024-09-21 15:15:16'),
(3, 'Tehnički sektor', NULL, '2024-09-23 18:16:05', '2024-09-23 18:16:05');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `problem_type` varchar(255) NOT NULL,
  `priority_level` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `problem_type`, `priority_level`, `title`, `description`, `attachment`, `created_at`, `updated_at`) VALUES
(61, 29, 'RAČUNOVODSTVO', 'Testni', 'Potrebe Snimanja', 'Testiramo aplikaciju', 'attachments/AvOHNXAH1b9NQumSMHaAm1YcDKCDxFTnajBfUarn.jpg', '2024-09-23 18:19:09', '2024-09-23 18:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `tipovi_problema`
--

CREATE TABLE `tipovi_problema` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tip_problema` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `opis` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tipovi_problema`
--

INSERT INTO `tipovi_problema` (`id`, `tip_problema`, `email`, `opis`, `created_at`, `updated_at`) VALUES
(1, 'IT PROBLEM', 'hasanbesic77@gmail.com', 'TEST', '2024-09-21 08:12:41', '2024-09-21 08:12:41'),
(2, 'Racunuvodstvo', 'thegosponsticker@gmail.com', 'TEST', '2024-09-21 17:03:15', '2024-09-21 17:03:15'),
(3, 'Tehnički Problem', 'hasanbesic77@gmail.com', 'TEST', '2024-09-21 17:03:42', '2024-09-21 17:03:42'),
(4, 'IT PROBLEM', 'hasanbesic77@gmail.com', 'TEST', '2024-09-22 07:14:11', '2024-09-22 07:14:11'),
(5, 'TEST', 'hasanbesic77@gmail.com', 'test', '2024-09-23 15:20:43', '2024-09-23 15:20:43'),
(6, 'IT_PROBLEM', 'hasanbesic77@gmail.com', 'TEST FUNKCIONALNOSTI', '2024-09-23 15:22:10', '2024-09-23 15:22:10'),
(7, 'IT PROBLEM', 'hasanbesic77@gmail.com', 'TEST', '2024-09-23 15:51:09', '2024-09-23 15:51:09'),
(8, 'IT PROBLEM', 'hasanbesic77@gmail.com', 'test', '2024-09-23 16:00:04', '2024-09-23 16:00:04'),
(9, 'IT PROBLEM', 'hasanbesic77@gmail.com', 'Test', '2024-09-23 16:01:58', '2024-09-23 16:01:58'),
(10, 'IT PROBLEM', 'hasanbesic77@gmail.com', 'TEST', '2024-09-23 16:04:27', '2024-09-23 16:04:27'),
(11, 'IT PROBLEM', 'hasanbesic77@gmail.com', 'test', '2024-09-23 16:09:03', '2024-09-23 16:09:03'),
(12, 'IT PROBLEM', 'hasanbesic77@gmail.com', 'test', '2024-09-23 16:09:34', '2024-09-23 16:09:34'),
(13, 'IT PROBLEM', 'hasanbesic77@gmail.com', 'test', '2024-09-23 16:18:20', '2024-09-23 16:18:20'),
(14, 'IT PROBLEM', 'hasanbesic77@gmail.com', 'test', '2024-09-23 16:25:27', '2024-09-23 16:25:27'),
(15, 'RAČUNOVODSTVO', 'hasanbesic77@gmail.com', 'Problemi vezani za računovodstvo', '2024-09-23 18:14:57', '2024-09-23 18:14:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `telefon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firma_id` bigint(20) UNSIGNED NOT NULL,
  `poslovnica_id` bigint(20) UNSIGNED NOT NULL,
  `sektor_id` bigint(20) UNSIGNED NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ime`, `prezime`, `telefon`, `email`, `password`, `firma_id`, `poslovnica_id`, `sektor_id`, `admin`, `created_at`, `updated_at`) VALUES
(11, 'Hasan', 'Bešić', '062/530-578', 'hasanbesic77@gmail.com', '$2y$12$ScvVJmLsW5LydAgYpKpIzOiXlC6gUXGNbL0SQzx/dU3fm0r5HcpFm', 1, 2, 1, 1, '2024-09-22 07:12:55', '2024-09-22 07:12:55'),
(29, 'HIFA', 'OIL', '062/530-578', 'hifahelpdesk@gmail.com', '$2y$12$ktUHVo0w45c2lm3DirI6wOicXun5j4/ZMqmE7SU4raUcmxpBoQfv2', 2, 5, 2, 0, '2024-09-23 18:14:09', '2024-09-23 18:14:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `firma_problemi`
--
ALTER TABLE `firma_problemi`
  ADD PRIMARY KEY (`id_firme`,`id_problem`),
  ADD UNIQUE KEY `firma_problemi_id_firme_id_problem_unique` (`id_firme`,`id_problem`),
  ADD KEY `firma_problemi_id_problem_foreign` (`id_problem`);

--
-- Indexes for table `firme`
--
ALTER TABLE `firme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id_korisnik`),
  ADD KEY `korisnik_id_firme_foreign` (`id_firme`);

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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `poslovnica_user`
--
ALTER TABLE `poslovnica_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poslovnica_user_user_id_foreign` (`user_id`),
  ADD KEY `poslovnica_user_poslovnica_id_foreign` (`poslovnica_id`);

--
-- Indexes for table `poslovnice`
--
ALTER TABLE `poslovnice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prioriteti`
--
ALTER TABLE `prioriteti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sektori`
--
ALTER TABLE `sektori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`);

--
-- Indexes for table `tipovi_problema`
--
ALTER TABLE `tipovi_problema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_firma_id_foreign` (`firma_id`),
  ADD KEY `users_poslovnica_id_foreign` (`poslovnica_id`),
  ADD KEY `users_sektor_id_foreign` (`sektor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `firme`
--
ALTER TABLE `firme`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id_korisnik` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poslovnica_user`
--
ALTER TABLE `poslovnica_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poslovnice`
--
ALTER TABLE `poslovnice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `prioriteti`
--
ALTER TABLE `prioriteti`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sektori`
--
ALTER TABLE `sektori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `tipovi_problema`
--
ALTER TABLE `tipovi_problema`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `firma_problemi`
--
ALTER TABLE `firma_problemi`
  ADD CONSTRAINT `firma_problemi_id_firme_foreign` FOREIGN KEY (`id_firme`) REFERENCES `firme` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `firma_problemi_id_problem_foreign` FOREIGN KEY (`id_problem`) REFERENCES `tipovi_problema` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `korisnik_id_firme_foreign` FOREIGN KEY (`id_firme`) REFERENCES `firme` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `poslovnica_user`
--
ALTER TABLE `poslovnica_user`
  ADD CONSTRAINT `poslovnica_user_poslovnica_id_foreign` FOREIGN KEY (`poslovnica_id`) REFERENCES `poslovnice` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poslovnica_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_firma_id_foreign` FOREIGN KEY (`firma_id`) REFERENCES `firme` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_poslovnica_id_foreign` FOREIGN KEY (`poslovnica_id`) REFERENCES `poslovnice` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_sektor_id_foreign` FOREIGN KEY (`sektor_id`) REFERENCES `sektori` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
