-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2023 at 04:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `questacademy`
--

-- --------------------------------------------------------

--
-- Table structure for table `assign_class_teacher`
--

CREATE TABLE `assign_class_teacher` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: active; 1:inactive',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not deleted; 1:deleted',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assign_class_teacher`
--

INSERT INTO `assign_class_teacher` (`id`, `class_id`, `teacher_id`, `status`, `is_delete`, `created_by`, `created_at`, `updated_at`) VALUES
(73, 2, 23, 0, 0, 1, '2023-12-11 04:46:25', '2023-12-11 04:46:25'),
(74, 2, 22, 0, 0, 1, '2023-12-11 04:46:25', '2023-12-11 04:46:25'),
(75, 2, 21, 0, 0, 1, '2023-12-11 04:46:25', '2023-12-11 04:46:25'),
(76, 2, 20, 0, 0, 1, '2023-12-11 04:46:25', '2023-12-11 04:46:25'),
(77, 2, 19, 0, 0, 1, '2023-12-11 04:46:25', '2023-12-12 10:15:00'),
(80, 2, 15, 0, 0, 1, '2023-12-12 13:49:25', '2023-12-12 13:49:25');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:active, 1:inactive',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not, 1:yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`, `status`, `is_delete`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Bachelor of Science in Information Technology', 0, 0, 1, '2023-11-27 09:30:45', '2023-11-30 03:18:46'),
(2, 'Bachelor of Science in Computer Science', 0, 0, 1, '2023-11-27 10:41:13', '2023-11-30 03:18:28'),
(4, 'Bachelor of Science in Psychology', 0, 0, 1, '2023-11-30 03:32:35', '2023-11-30 03:32:35'),
(5, 'Bachelor of Science in Mathematics', 0, 0, 1, '2023-11-30 03:33:00', '2023-11-30 03:33:00'),
(6, 'Bachelor of Science in Information System', 0, 0, 1, '2023-11-30 03:33:24', '2023-11-30 03:33:24'),
(7, 'Bachelor of Science in Entertainment and Multimedia Computing', 0, 0, 1, '2023-11-30 03:34:35', '2023-11-30 03:34:35'),
(8, 'Bachelor of Public Administration', 0, 0, 1, '2023-11-30 03:35:16', '2023-11-30 03:35:16'),
(9, 'Bachelor of Arts in Communication', 0, 0, 1, '2023-11-30 03:36:10', '2023-11-30 03:36:10'),
(10, 'Bachelor of Arts in Political Science', 0, 0, 1, '2023-11-30 03:37:04', '2023-11-30 03:37:04'),
(11, 'Bachelor of Science in Office Administration', 0, 0, 1, '2023-11-30 03:38:57', '2023-11-30 03:38:57'),
(12, 'Bachelor of Science in Accounting Information Technology', 0, 0, 1, '2023-11-30 03:39:33', '2023-12-08 19:49:48'),
(13, 'Bachelor of Science in Computer Engineering', 0, 1, 1, '2023-12-05 08:23:53', '2023-12-05 08:24:03'),
(14, 'Physical Education', 0, 1, 4, '2023-12-10 05:24:04', '2023-12-10 05:24:13');

-- --------------------------------------------------------

--
-- Table structure for table `class_subject`
--

CREATE TABLE `class_subject` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not delete; 1:delete',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:active; 1:inactive',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_subject`
--

INSERT INTO `class_subject` (`id`, `class_id`, `subject_id`, `created_by`, `is_delete`, `status`, `created_at`, `updated_at`) VALUES
(45, 9, 5, 1, 0, 0, '2023-12-05 08:26:37', '2023-12-05 08:26:37'),
(46, 9, 6, 1, 0, 0, '2023-12-05 08:26:37', '2023-12-05 08:26:37'),
(47, 9, 10, 1, 0, 0, '2023-12-05 08:26:37', '2023-12-05 08:26:37'),
(48, 9, 8, 1, 0, 0, '2023-12-05 08:26:37', '2023-12-05 08:26:37'),
(49, 2, 1, 1, 0, 0, '2023-12-05 08:27:31', '2023-12-05 08:27:31'),
(50, 2, 5, 1, 0, 0, '2023-12-05 08:27:31', '2023-12-05 08:27:31'),
(51, 2, 4, 1, 0, 0, '2023-12-05 08:27:31', '2023-12-05 08:27:31'),
(52, 2, 9, 1, 1, 0, '2023-12-05 08:27:31', '2023-12-05 08:28:55'),
(53, 2, 6, 1, 0, 0, '2023-12-05 08:27:31', '2023-12-05 08:27:31'),
(54, 2, 3, 1, 0, 0, '2023-12-05 08:27:31', '2023-12-05 08:27:31'),
(55, 2, 7, 1, 0, 0, '2023-12-05 08:27:31', '2023-12-05 08:27:31'),
(56, 2, 2, 1, 0, 0, '2023-12-05 08:27:31', '2023-12-05 08:27:31'),
(57, 2, 8, NULL, 0, 0, '2023-12-05 08:27:55', '2023-12-05 08:27:55'),
(60, 5, 8, 4, 0, 1, '2023-12-10 06:09:31', '2023-12-10 06:09:31'),
(61, 11, 5, 1, 0, 0, '2023-12-11 14:19:14', '2023-12-11 14:19:14'),
(62, 11, 8, 1, 0, 0, '2023-12-11 14:19:14', '2023-12-11 14:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `class_subject_timetable`
--

CREATE TABLE `class_subject_timetable` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `week_id` int(11) DEFAULT NULL,
  `start_time` varchar(25) DEFAULT NULL,
  `end_time` varchar(25) DEFAULT NULL,
  `room_number` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_subject_timetable`
--

INSERT INTO `class_subject_timetable` (`id`, `class_id`, `subject_id`, `week_id`, `start_time`, `end_time`, `room_number`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 4, '13:00', '16:00', '302', '2023-12-11 11:54:29', '2023-12-11 11:54:29'),
(3, 2, 7, 1, '10:00', '13:00', 'ONLINE', '2023-12-11 12:35:33', '2023-12-11 12:35:33'),
(6, 2, 1, 3, '08:00', '13:00', '302', '2023-12-11 13:52:32', '2023-12-11 13:52:32'),
(7, 2, 6, 7, '13:00', '16:00', '101', '2023-12-11 14:20:16', '2023-12-11 14:20:16');

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
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `homework_date` date DEFAULT NULL,
  `submission_date` date DEFAULT NULL,
  `document_file` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not delete; 1:deleted',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `homework`
--

INSERT INTO `homework` (`id`, `class_id`, `subject_id`, `homework_date`, `submission_date`, `document_file`, `description`, `is_delete`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2023-12-12', '2023-12-14', '20231212054235itr80bkzhvcmr24k7yye.pdf', '<p>pasahan ng enhancement kay sir emman sa thursday</p>', 0, 1, '2023-12-12 05:42:35', '2023-12-12 09:11:44'),
(2, 2, 4, '2023-10-20', '2023-12-08', '20231212091354v18bphdzebtyzksuysgv.html', '<p>ah pasahan kay sir LA</p>', 0, 1, '2023-12-12 09:13:54', '2023-12-12 15:01:03'),
(3, 2, 1, '2023-12-12', '2023-12-15', '20231212015633xyyzup9mcowvrzonrg2k.pdf', '<p>di ko alam kung ano to</p>', 0, 15, '2023-12-12 13:56:33', '2023-12-12 14:48:30'),
(4, 2, 1, '2023-12-12', '2023-12-12', NULL, '', 1, 15, '2023-12-12 14:12:48', '2023-12-12 14:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `homework_submit`
--

CREATE TABLE `homework_submit` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `document_file` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `homework_submit`
--

INSERT INTO `homework_submit` (`id`, `homework_id`, `student_id`, `description`, `document_file`, `created_at`, `updated_at`) VALUES
(1, 3, 12, '<p>testing papasa</p>', '20231213092409saaazi7jewxknalcdi3h.docx', '2023-12-13 09:24:09', '2023-12-13 09:24:09');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

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
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:active, 1:inactive',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:no, 1:yes',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `type`, `created_by`, `status`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Advance Web Systems', 'Practical', 1, 0, 0, '2023-11-29 11:36:00', '2023-11-29 11:48:44'),
(2, 'Software Engineering 1', 'Theory', 1, 0, 0, '2023-11-29 11:55:44', '2023-11-29 11:55:44'),
(3, 'Networks and Communications', 'Practical', 1, 0, 0, '2023-11-30 04:01:26', '2023-11-30 04:01:26'),
(4, 'Graphics and Visual Computing', 'Practical', 1, 0, 0, '2023-11-30 04:01:47', '2023-11-30 04:01:47'),
(5, 'Ethics', 'Theory', 1, 0, 0, '2023-11-30 04:01:58', '2023-11-30 04:01:58'),
(6, 'Methods of Research', 'Theory', 1, 0, 0, '2023-11-30 04:02:18', '2023-11-30 04:02:18'),
(7, 'Science, Technology and Society', 'Theory', 1, 0, 0, '2023-11-30 04:02:50', '2023-11-30 04:02:50'),
(8, 'Team Sports', 'Practical', 1, 0, 0, '2023-11-30 04:03:00', '2023-11-30 04:03:00'),
(9, 'Introduction to Computer Programming', 'Theory', 1, 0, 0, '2023-12-05 08:24:44', '2023-12-05 08:24:44'),
(10, 'Physical Education', 'Practical', 1, 0, 0, '2023-12-05 08:25:59', '2023-12-05 08:25:59'),
(11, 'Physical Education', 'Practical', 4, 0, 1, '2023-12-10 05:24:58', '2023-12-10 05:25:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `student_number` varchar(50) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 3 COMMENT '1:admin, 2:teacher, 3:student',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not deleted, 1:deleted',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:active, 1:inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `student_number`, `class_id`, `gender`, `date_of_birth`, `religion`, `mobile_number`, `admission_date`, `profile_pic`, `blood_group`, `height`, `weight`, `address`, `user_type`, `is_delete`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Avila', NULL, 'adminavila@gmail.com', NULL, '$2y$12$NvayrXGU4eobJi0um8Lh7.0O4dh934dhGHmZN4EsoEpDtu6Tm7Z/W', 'r13urlI8uQl829tN1UKdZq1gcEh2pbFp5vTiiwBshkUuc3np0wEvK56LnZCD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-11-19 05:34:15', '2023-12-10 19:44:32'),
(2, 'Teacher', NULL, 'teacher@gmail.com', NULL, '$2y$12$1mN6L3yMJzJ49/yQ6Bv.7OTsnwQoSnw4f5..9kMAadOb1GPFp08UC', 'iKXkvw7UqG7LswhR2sVrbrdjkn4KObB18rsEyrWQWhKZrdNDHu4OjhUIoSPp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, '2023-11-19 05:34:15', '2023-11-19 05:34:15'),
(3, 'Student', NULL, 'student@gmail.com', NULL, '$2y$12$tLeeZWWQuc/QKfVQ8NP/ae51RCX0CAQEtMUVXeU3BIoIG3PPukZ2y', 'YeNUwJsKUDFVfMVvYn3b0RaFHUhstNxZZUI3K7I9SYj4ijcDCWaeOhxO8Dis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2023-11-19 05:34:15', '2023-11-30 01:24:16'),
(4, 'Morata', NULL, 'adminmorata@gmail.com', NULL, '$2y$12$y2r1f6jK735a5opWriTYt.IIri4cbFOvWQWAO9et3Au60CaQRZ3DW', 'neNp8CTtsr3Xin4rJbRvCHsSa2YIicdPzh1morZsnAdHJapYOUDOUnZrH7YB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-11-26 19:22:20', '2023-12-09 21:30:46'),
(6, 'Belardo', NULL, 'adminbelardo@gmail.com', NULL, '$2y$12$dQNjpsQlCUZcDRFX8HMkyulcubEj8o99wH6ziAoIG/.WJCgvYULF.', 'oeT7zDloSP6lUdrJZykGpYxo2XPQON6ZcZokSHeqpVqBDyWS0P6aOarBXzTK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2023-11-26 19:24:06', '2023-12-09 21:33:59'),
(12, 'Julian Miguel', 'Avila', 'avila.julian.miguel.bscs2021@gmail.com', NULL, '$2y$12$7ONdxXuZmAHcC8asZzk91e9vWFvj2us4CDj4JwDULe8HPvCCGsZ9a', 'mM7Q0v0QCvZlhKOF9nsJCENt93qmN40a6Kw6VpPhzcOyKKvd1DVyjD5wj00m', '20211042-N', 2, 'Male', '2002-10-01', 'Catholic', '09282566980', '2023-08-14', '7joa7yd5fn0iq4ccet8q.jpg', 'AB', '171', '73', NULL, 3, 0, 0, '2023-11-30 03:36:12', '2023-12-04 21:52:20'),
(13, 'Joemen', 'Barrios', 'joemenbarrios@gmail.com', NULL, '$2y$12$7Tjdf3Q6bQE375vItjckZebwE8yGfQujIyCyZJFd4Dst/qwoSTNgG', NULL, NULL, NULL, 'Female', NULL, NULL, '012345678', NULL, '20231208091615gqrxdjzqvknbeshpnw3p.jpg', NULL, NULL, NULL, 'North Caloocan', 2, 0, 0, '2023-12-04 23:20:36', '2023-12-08 13:16:16'),
(14, 'Anonymous', NULL, 'admin@gmail.com', NULL, '$2y$12$fBuydrEiWYyuL.fB6UPDXOABcVsrLrptzMymx6gd5wm6MMP0G0jEG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, '2023-12-05 00:13:22', '2023-12-05 00:14:55'),
(15, 'Emman', 'Flores', 'emmanflores@gmail.com', NULL, '$2y$12$AO90bRW/JdMuY.YjL3QVyO4ZPfJwKceXThgSC.XMKeZAjJEisQHgm', 'f3R5fzGbuA1hI31JK02ohhTI7Mca387UehknKiNrLyVG8eMMnGshUPqLF7ks', NULL, NULL, 'Male', NULL, NULL, '012345679', NULL, '20231208091518selbrep6ushcvsi9lwpp.jpg', NULL, NULL, NULL, 'North Caloocan', 2, 0, 0, '2023-12-05 00:16:10', '2023-12-08 13:15:18'),
(16, 'Reylan', 'Belardo', 'belardo.reylan.bscs2021@gmail.com', NULL, '$2y$12$ABD22k/1pSd58f7n8EdP6Oc5wZuuGE8W2HX0oBAYLdVzow60nroLe', NULL, '20211052-N', 2, 'Male', '2023-12-05', 'Catholic', '0465789321', '2023-08-14', '202312050821088li1mc6dy9sokltpbole.png', 'O', '167', '75', NULL, 3, 1, 0, '2023-12-05 00:21:09', '2023-12-05 00:22:25'),
(17, 'Mary Thalia Cygie', 'Morata', 'morata.marythaliacygie.bscs2021@gmail.com', NULL, '$2y$12$9wV1KMLFyzpQXeKRsQ8jTuacdmHQUCPdgQW.U1jsGVAMWT4dZdMhq', NULL, '20210692-N', 2, 'Female', '2001-07-02', 'Jehovah\'s Witnesses', '+639666255186', '2021-08-16', '20231208073718db1jaq2j0gjs0kc0xykc.jpg', 'AB+', '158cm', '65kg', NULL, 3, 0, 0, '2023-12-08 11:37:18', '2023-12-08 11:37:18'),
(18, 'Reylan', 'Belardo', 'reylanbelardo@gmail.com', NULL, '$2y$12$.SLzzgfaV7aNtFBeNXFzFOs2nx63PmrebSXJlEI6wmkfyvGaHD066', NULL, '20219865-N', 2, 'Male', '2001-04-01', 'Roman Catholic', '09667854345', '2021-08-16', '20231208073957n4jtxbqvgoarax4h0vy8.jpg', 'O-', '160cm', '71kg', NULL, 3, 0, 0, '2023-12-08 11:39:58', '2023-12-08 11:39:58'),
(19, 'Benjamin Dave', 'Cruz', 'davecruz@gmail.com', NULL, '$2y$12$lpSeLwlBHUqduNoMOgez4.yceF/I27su45mKQ8LDOEvf54O6pX2Dq', NULL, NULL, NULL, 'Male', NULL, NULL, '09776543456', NULL, '20231208091445xpyiflvwyhmnpfmokeyk.jpg', NULL, NULL, NULL, 'North Caloocan', 2, 0, 0, '2023-12-08 13:14:46', '2023-12-08 13:14:46'),
(20, 'LA', 'Alban', 'albanLA@gmail.com', NULL, '$2y$12$z3cQvXYqD4k7Im3b2Qo5FuBXfVKUJf4AD/UlaHlyZ1dYxJo5jTQ6.', NULL, NULL, NULL, 'Male', NULL, NULL, '09576432345', NULL, '20231208091707wi6pyez4p4cbdpuhgg1i.jpg', NULL, NULL, NULL, 'North Caloocan', 2, 0, 0, '2023-12-08 13:17:07', '2023-12-08 13:17:07'),
(21, 'Ramon', 'Lacanilao', 'drlacanilao@gmail.com', NULL, '$2y$12$5im.h9wdaPzXk79iowLr/.9vRKOgrmhYltP8VsWEkUDmhoHrgMA..', NULL, NULL, NULL, 'Male', NULL, NULL, '09123456789', NULL, '20231208091847oehzvkfcdlspe4k48dg5.jpg', NULL, NULL, NULL, 'North Caloocan', 2, 0, 0, '2023-12-08 13:18:47', '2023-12-08 13:18:47'),
(22, 'RR', 'Alban', 'RRalban25@gmail.com', NULL, '$2y$12$tsCT1zb3LG39vmj4e6lUVOYqpdD2J0SLpVPPr4x8SXUGBPWNpAiEm', NULL, NULL, NULL, 'Male', NULL, NULL, '09453426789', NULL, '20231208091940qll31rqtndq1zyvi8md9.jpg', NULL, NULL, NULL, '', 2, 0, 0, '2023-12-08 13:19:41', '2023-12-09 21:12:53'),
(23, 'Ness', 'Arlos', 'arlosness@gmail.com', NULL, '$2y$12$SookkYp5xHq3MsVhlko0qOQdw5Qww0S34SSTrJwf8T2ddszzctSF2', '7VqPX1EOKyT0WHFMKmvPLzVL2SYLxmSfQk7E3q5EFgVxDraEconXaYmy2PWx', NULL, NULL, 'Female', NULL, NULL, '09853425678', NULL, '20231208092116noqjerkxylialqrf1mvv.jpg', NULL, NULL, NULL, 'North Caloocan', 2, 0, 0, '2023-12-08 13:21:16', '2023-12-11 06:21:31'),
(24, 'Jasper', 'Mella', 'mella.jasper.bscs2021@gmail.com', NULL, '$2y$12$mmy062f.1re.tRAVFCikfOhPzFULbH349GqckCaWteqeH.8Fmcfhu', NULL, '20211057-N', 2, 'Male', '2003-07-07', 'Roman Catholic', '09152670817', '2023-12-09', '20231209032029uxvcjkpxbmxmeuqet3ab.jpg', 'AB+', '160cm', '49', NULL, 3, 0, 0, '2023-12-08 19:20:30', '2023-12-08 19:20:30'),
(25, 'Lia', 'Ramirez', 'liaeramirez@gmail.com', NULL, '$2y$12$kokcbcnrb21XBedbYJhC9Oxnjp1lTmOzFM23i/eEFWZCnw/sk.pO2', NULL, NULL, NULL, 'Other', NULL, NULL, '09786453245', NULL, NULL, NULL, NULL, NULL, 'North Caloocan', 2, 1, 0, '2023-12-09 23:12:29', '2023-12-09 23:14:14'),
(26, 'Lia', 'Ramirez', 'lia@gmail.com', NULL, '$2y$12$94rM1aYYNg8rHgK0Ykpe2uw5zmZHO7..KOg3NtJzyOoEAGUYlzhiC', NULL, NULL, NULL, 'Female', NULL, NULL, '09675648392', NULL, '2023121007140627fntaxakxmd0x1hjrzy.jpg', NULL, NULL, NULL, '', 2, 0, 0, '2023-12-09 23:14:07', '2023-12-09 23:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `week`
--

CREATE TABLE `week` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `week`
--

INSERT INTO `week` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sunday', NULL, NULL),
(2, 'Monday', NULL, NULL),
(3, 'Tuesday', NULL, NULL),
(4, 'Wednesday', NULL, NULL),
(5, 'Thursday', NULL, NULL),
(6, 'Friday', NULL, NULL),
(7, 'Saturday', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assign_class_teacher`
--
ALTER TABLE `assign_class_teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_subject`
--
ALTER TABLE `class_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_subject_timetable`
--
ALTER TABLE `class_subject_timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homework_submit`
--
ALTER TABLE `homework_submit`
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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `week`
--
ALTER TABLE `week`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assign_class_teacher`
--
ALTER TABLE `assign_class_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `class_subject`
--
ALTER TABLE `class_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `class_subject_timetable`
--
ALTER TABLE `class_subject_timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `homework_submit`
--
ALTER TABLE `homework_submit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `week`
--
ALTER TABLE `week`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
