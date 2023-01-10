-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2023 at 04:21 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `cost` float NOT NULL,
  `quantity` int(20) NOT NULL,
  `selling_price` float NOT NULL,
  `total_procurement` double NOT NULL,
  `image` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_name`, `cost`, `quantity`, `selling_price`, `total_procurement`, `image`, `created_at`, `updated_at`) VALUES
(14, 'Coca-Cola', 0.5, 0, 0.75, 0, 'image-.Coca-Cola.41.jpeg', '2022-12-17 03:08:39', '2022-12-27 09:32:00'),
(17, 'cookies', 2.5, 0, 3.25, 0, 'image-.cookies.41.jpeg', '2022-12-20 03:02:28', '2022-12-27 09:32:11'),
(23, 'Pepsi', 0.2, 0, 0.25, 0, 'image-.Pepsi.41.jpeg', '2022-12-20 14:09:44', '2022-12-27 09:32:26'),
(33, 'Potato Chips', 0.6, 0, 0.8, 0, 'image-.Potato Chips.41.jpeg', '2022-12-22 06:58:24', '2023-01-02 04:51:44'),
(34, 'Tortilla Chips', 0.8, 0, 0.95, 0, 'image-.Tortilla Chips.41.jpeg', '2022-12-22 07:23:00', '2023-01-09 13:47:08'),
(35, 'Popcorn', 0.9, 0, 1.1, 0, 'image-.Popcorn.41.jpeg', '2022-12-22 07:24:42', '2023-01-09 13:47:12'),
(36, 'Mixed Fruit', 2.25, 9, 2.75, 0, 'image-.Mixed Fruit.41.jpeg', '2022-12-22 07:27:52', '2023-01-09 09:48:42'),
(37, 'Salted peanuts', 0.5, 8, 0.7, 0, 'image-.Salted peanuts.41.jpeg', '2022-12-22 08:10:40', '2023-01-10 10:21:42'),
(38, 'Candy', 0.4, 0, 0.55, 8.4, 'image-.Candy.41.jpeg', '2022-12-22 08:15:10', '2022-12-31 08:20:17'),
(40, 'Mirinda', 0.5, 0, 0.75, 4, 'image-.da.40.jpeg', '2022-12-27 07:57:03', '2023-01-09 09:52:29'),
(41, ' Dairy Milk', 0.5, 59, 0.71, 100, 'image-..41.jpeg', '2022-12-28 06:20:26', '2023-01-09 13:44:15'),
(42, 'Nutties', 0.6, 61, 0.95, 120, 'image-..42.jpeg', '2022-12-28 06:24:07', '2023-01-04 13:26:40'),
(43, 'Cadbury Flake', 0.35, 68, 0.5, 35, 'image-.13.43.jpeg', '2022-12-28 06:29:56', '2023-01-04 13:26:48'),
(46, 'Premium Saltines', 2.5, 15, 3.25, 62.5, 'image-.14.44.jpeg', '2023-01-02 09:38:00', '2023-01-03 05:45:50'),
(47, 'Sunflower Seeds', 1.75, 25, 2.25, 43.75, 'image-defult.png', '2023-01-02 09:40:49', '2023-01-02 09:43:00'),
(48, 'Corn Nuts', 2, 100, 2.35, 200, 'image-.Corn Nuts.49.jpeg', '2023-01-02 09:43:47', '2023-01-03 04:53:10'),
(51, 'Water', 0.18, 100, 0.25, 18, 'image-.16.49.jpeg', '2023-01-09 08:34:03', '2023-01-09 08:34:03');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(20) NOT NULL,
  `items_id` int(20) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `quantity` int(20) NOT NULL,
  `price` float NOT NULL,
  `cost` float NOT NULL,
  `total` float NOT NULL,
  `expenses` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `items_id`, `item_name`, `quantity`, `price`, `cost`, `total`, `expenses`, `created_at`, `updated_at`) VALUES
(210, 39, 'Water', 1, 0.25, 0.2, 0.25, 0.2, '2022-12-26 13:49:54', '2022-12-26 13:49:54'),
(211, 33, 'Potato Chips', 1, 0.4, 0.6, 0.4, 0.6, '2022-12-26 14:45:11', '2022-12-26 14:45:11'),
(212, 35, 'Popcorn', 1, 1.1, 0.9, 1.1, 0.9, '2022-12-26 14:45:43', '2022-12-26 14:45:43'),
(213, 6, 'Water', 1, 0.25, 0.18, 0.25, 0.18, '2022-12-26 14:45:48', '2022-12-26 14:45:48'),
(214, 6, 'Water', 1, 0.25, 0.18, 0.25, 0.18, '2022-12-26 14:45:53', '2022-12-26 14:45:53'),
(215, 6, 'Water', 2, 0.25, 0.18, 0.5, 0.36, '2022-12-26 14:45:57', '2022-12-26 14:45:57'),
(216, 6, 'Water', 2, 0.25, 0.18, 0.5, 0.36, '2022-12-26 17:02:56', '2022-12-26 17:02:56'),
(217, 37, 'Salted peanuts', 5, 0.7, 0.5, 3.5, 2.5, '2022-12-26 17:03:02', '2022-12-26 17:03:02'),
(222, 36, 'Mixed Fruit', 4, 2.75, 2.25, 11, 4.5, '2022-12-27 04:10:37', '2022-12-27 11:40:30'),
(224, 33, 'Potato Chips', 1, 0.8, 0.6, 0.8, 0.6, '2022-12-27 04:49:53', '2022-12-27 04:49:53'),
(225, 6, 'Water', 4, 0.25, 0.18, 1, 0.18, '2022-12-27 10:01:04', '2022-12-27 14:29:03'),
(226, 6, 'Water', 2, 0.25, 0.18, 0.5, 0.18, '2022-12-27 11:35:47', '2022-12-27 14:27:53'),
(227, 33, 'Potato Chips', 5, 0.8, 0.6, 4, 3, '2022-12-27 11:56:00', '2022-12-27 14:28:21'),
(228, 6, 'Water', 3, 0.25, 0.18, 0.75, 0.18, '2022-12-27 14:26:44', '2022-12-27 14:26:53'),
(229, 33, 'Potato Chips', 1, 0.8, 0.6, 0.8, 0.6, '2022-12-27 14:27:40', '2022-12-27 14:27:40'),
(247, 33, 'Potato Chips', 1, 0.8, 0.6, 0.8, 0.6, '2022-12-28 05:42:45', '2022-12-28 05:42:45'),
(248, 6, 'Water', 1, 0.25, 0.18, 0.25, 0.18, '2022-12-28 05:42:58', '2022-12-28 05:42:58'),
(250, 6, 'Water', 16, 0.25, 0.18, 4, 0.18, '2022-12-28 09:07:05', '2022-12-28 14:48:49'),
(251, 34, 'Tortilla Chips', 1, 0.95, 0.8, 0.95, 0.8, '2022-12-28 12:06:00', '2022-12-28 12:06:00'),
(252, 34, 'Tortilla Chips', 1, 0.95, 0.8, 0.95, 1.6, '2022-12-28 12:06:07', '2022-12-28 12:58:30'),
(253, 41, ' Dairy Milk', 2, 0.71, 0.5, 1.42, 2.5, '2022-12-28 12:06:18', '2022-12-28 13:41:07'),
(254, 42, 'Nutties', 5, 0.95, 0.6, 4.75, 3, '2022-12-28 12:06:28', '2022-12-28 12:06:28'),
(255, 41, ' Dairy Milk', 2, 0.71, 0.5, 1.42, 1, '2022-12-28 12:06:36', '2022-12-28 12:06:36'),
(256, 6, 'Water', 1, 0.25, 0.18, 0.25, 0.18, '2022-12-28 12:53:15', '2022-12-28 12:53:15'),
(257, 6, 'Water', 1, 0.25, 0.18, 0.25, 0.18, '2022-12-28 12:54:17', '2022-12-28 12:54:17'),
(258, 6, 'Water', 1, 0.25, 0.18, 0.25, 0.18, '2022-12-28 12:57:00', '2022-12-28 12:57:00'),
(259, 6, 'Water', 1, 0.25, 0.18, 0.25, 0.18, '2022-12-28 12:57:58', '2022-12-28 12:57:58'),
(260, 6, 'Water', 5, 0.25, 0.18, 1.25, 0.36, '2022-12-29 02:25:27', '2022-12-29 04:13:02'),
(261, 38, 'Candy', 5, 0.55, 0.4, 2.75, 2, '2022-12-29 02:30:54', '2022-12-29 02:30:54'),
(262, 6, 'Water', 7, 0.25, 0.18, 1.75, 0.9, '2022-12-29 02:35:18', '2022-12-29 03:33:45'),
(263, 35, 'Popcorn', 2, 1.1, 0.9, 2.2, 1.8, '2022-12-30 15:38:22', '2022-12-30 15:38:22'),
(264, 37, 'Salted peanuts', 2, 0.7, 0.5, 1.4, 1, '2022-12-30 15:38:28', '2022-12-30 15:38:28'),
(265, 6, 'Water', 5, 0.25, 0.18, 1.25, 0.9, '2022-12-30 15:38:35', '2022-12-30 15:38:35'),
(266, 41, ' Dairy Milk', 25, 0.71, 0.5, 17.75, 12.5, '2022-12-30 15:38:41', '2022-12-30 15:38:41'),
(267, 42, 'Nutties', 20, 0.95, 0.6, 19, 12, '2022-12-30 15:39:02', '2022-12-30 15:39:02'),
(269, 34, 'Tortilla Chips', 1, 0.95, 0.8, 0.95, 0.8, '2022-12-31 08:20:03', '2022-12-31 08:20:03'),
(270, 43, 'Cadbury Flake', 1, 0.5, 0.35, 0.5, 0.35, '2022-12-31 08:20:08', '2022-12-31 08:20:08'),
(271, 33, 'Potato Chips', 2, 0.8, 0.6, 1.6, 1.2, '2022-12-31 08:20:12', '2022-12-31 08:20:12'),
(272, 38, 'Candy', 2, 0.55, 0.4, 1.1, 0.8, '2022-12-31 08:20:17', '2022-12-31 08:20:17'),
(273, 6, 'Water', 2, 0.25, 0.18, 0.5, 0.36, '2022-12-31 08:20:21', '2022-12-31 08:20:21'),
(274, 35, 'Popcorn', 2, 1.1, 0.9, 2.2, 1.8, '2022-12-31 08:20:25', '2022-12-31 08:20:25'),
(275, 34, 'Tortilla Chips', 1, 0.95, 0.8, 0.95, 0.8, '2023-01-01 04:44:03', '2023-01-01 04:44:03'),
(276, 35, 'Popcorn', 1, 1.1, 0.9, 1.1, 0.9, '2023-01-01 04:44:08', '2023-01-01 04:44:08'),
(277, 6, 'Water', 5, 0.25, 0.18, 1.25, 0.9, '2023-01-01 04:44:13', '2023-01-01 04:44:13'),
(278, 35, 'Popcorn', 2, 1.1, 0.9, 2.2, 1.8, '2023-01-01 04:45:53', '2023-01-01 04:45:53'),
(279, 41, ' Dairy Milk', 2, 0.71, 0.5, 1.42, 1, '2023-01-01 04:45:58', '2023-01-01 04:45:58'),
(280, 36, 'Mixed Fruit', 2, 2.75, 2.25, 5.5, 4.5, '2023-01-01 04:46:04', '2023-01-01 04:46:04'),
(281, 43, 'Cadbury Flake', 2, 0.5, 0.35, 1, 0.7, '2023-01-01 04:46:10', '2023-01-01 04:46:10'),
(282, 6, 'Water', 1, 0.25, 0.18, 0.25, 0.18, '2023-01-01 07:42:09', '2023-01-01 07:42:09'),
(283, 6, 'Water', 1, 0.25, 0.18, 0.25, 0.18, '2023-01-01 09:30:57', '2023-01-01 09:30:57'),
(284, 6, 'Water', 2, 0.25, 0.18, 0.5, 0.36, '2023-01-01 12:05:27', '2023-01-01 12:05:27'),
(285, 6, 'Water', 14, 0.25, 0.18, 3.5, 0.72, '2023-01-02 04:51:29', '2023-01-02 07:21:07'),
(286, 41, ' Dairy Milk', 7, 0.71, 0.5, 4.97, 2, '2023-01-02 04:51:34', '2023-01-02 07:23:15'),
(287, 43, 'Cadbury Flake', 4, 0.5, 0.35, 2, 1.4, '2023-01-02 04:51:38', '2023-01-02 04:51:38'),
(288, 33, 'Potato Chips', 4, 0.8, 0.6, 3.2, 2.4, '2023-01-02 04:51:44', '2023-01-02 04:51:44'),
(289, 36, 'Mixed Fruit', 4, 2.75, 2.25, 11, 9, '2023-01-02 04:51:49', '2023-01-02 04:51:49'),
(290, 42, 'Nutties', 1, 0.95, 0.6, 0.95, 0.6, '2023-01-02 04:52:16', '2023-01-02 04:52:16'),
(291, 6, 'Water', 1, 0.25, 0.18, 0.25, 0.18, '2023-01-02 04:52:21', '2023-01-02 04:52:21'),
(292, 34, 'Tortilla Chips', 1, 0.95, 0.8, 0.95, 0.8, '2023-01-02 04:52:26', '2023-01-02 04:52:26'),
(293, 35, 'Popcorn', 1, 1.1, 0.9, 1.1, 0.9, '2023-01-02 04:52:30', '2023-01-02 04:52:30'),
(294, 37, 'Salted peanuts', 1, 0.7, 0.5, 0.7, 0.5, '2023-01-02 04:52:35', '2023-01-02 04:52:35'),
(295, 40, 'Mirinda', 1, 0.75, 0.5, 0.75, 0.5, '2023-01-02 04:52:39', '2023-01-02 04:52:39'),
(296, 35, 'Popcorn', 2, 1.1, 0.9, 2.2, 1.8, '2023-01-02 10:20:21', '2023-01-02 10:20:21'),
(297, 6, 'Water', 4, 0.25, 0.18, 1, 0.9, '2023-01-02 10:20:39', '2023-01-02 10:20:54'),
(298, 42, 'Nutties', 1, 0.95, 0.6, 0.95, 0.6, '2023-01-02 10:24:21', '2023-01-02 10:24:21'),
(301, 40, 'Mirinda', 6, 0.75, 0.5, 4.5, 1, '2023-01-03 05:45:41', '2023-01-03 19:23:46'),
(302, 46, 'Premium Saltines', 10, 3.25, 2.5, 32.5, 25, '2023-01-03 05:45:50', '2023-01-03 05:45:50'),
(303, 36, 'Mixed Fruit', 1, 2.75, 2.25, 2.75, 2.25, '2023-01-03 06:20:39', '2023-01-03 06:20:39'),
(304, 34, 'Tortilla Chips', 1, 0.95, 0.8, 0.95, 0.8, '2023-01-03 19:15:56', '2023-01-03 19:15:56'),
(305, 37, 'Salted peanuts', 1, 0.7, 0.5, 0.7, 0.5, '2023-01-03 19:16:14', '2023-01-03 19:16:14'),
(306, 34, 'Tortilla Chips', 2, 0.95, 0.8, 1.9, 1.6, '2023-01-04 06:33:42', '2023-01-04 06:33:42'),
(307, 36, 'Mixed Fruit', 2, 2.75, 2.25, 5.5, 4.5, '2023-01-04 06:55:06', '2023-01-04 06:55:06'),
(308, 42, 'Nutties', 12, 0.95, 0.6, 11.4, 7.2, '2023-01-04 13:26:40', '2023-01-04 13:26:40'),
(309, 43, 'Cadbury Flake', 25, 0.5, 0.35, 12.5, 8.75, '2023-01-04 13:26:48', '2023-01-04 13:26:48'),
(310, 34, 'Tortilla Chips', 6, 0.95, 0.8, 5.7, 1.6, '2023-01-07 13:17:23', '2023-01-07 13:20:02'),
(311, 35, 'Popcorn', 2, 1.1, 0.9, 2.2, 1.8, '2023-01-08 06:55:43', '2023-01-08 06:55:43'),
(331, 41, ' Dairy Milk', 1, 0.71, 0.5, 0.71, 0.5, '2023-01-09 09:48:53', '2023-01-09 09:48:53'),
(332, 37, 'Salted peanuts', 12, 0.7, 0.5, 8.4, 6, '2023-01-09 09:49:49', '2023-01-09 09:49:49'),
(333, 37, 'Salted peanuts', 12, 0.7, 0.5, 8.4, 6, '2023-01-09 09:49:50', '2023-01-09 09:49:50'),
(334, 34, 'Tortilla Chips', 1, 0.95, 0.8, 0.95, 0.8, '2023-01-09 09:50:32', '2023-01-09 09:50:32'),
(335, 35, 'Popcorn', 3, 1.1, 0.9, 3.3, 2.7, '2023-01-09 09:52:15', '2023-01-09 09:52:15'),
(336, 40, 'Mirinda', 1, 0.75, 0.5, 0.75, 0.5, '2023-01-09 09:52:29', '2023-01-09 09:52:29'),
(337, 34, 'Tortilla Chips', 2, 0.95, 0.8, 1.9, 1.6, '2023-01-09 09:55:27', '2023-01-09 09:55:27'),
(338, 41, ' Dairy Milk', 2, 0.71, 0.5, 1.42, 1, '2023-01-09 13:44:15', '2023-01-09 13:44:15'),
(339, 35, 'Popcorn', 2, 1.1, 0.9, 2.2, 1.8, '2023-01-09 13:44:57', '2023-01-09 13:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(7) NOT NULL,
  `username` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `permissions` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `display_name`, `email`, `password`, `role`, `permissions`, `image`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'Mohammad ', 'mohammad.borini@gmail.com', '$2y$10$sPgMu3CNO7ENO7KBs2e3B.96qPYKIOhUq9suI.FwMg18/4MKcS/o.', 'admin', 'a:12:{i:0;s:9:\"item:read\";i:1;s:11:\"item:create\";i:2;s:11:\"item:update\";i:3;s:11:\"item:delete\";i:4;s:9:\"user:read\";i:5;s:11:\"user:create\";i:6;s:11:\"user:update\";i:7;s:11:\"user:delete\";i:8;s:16:\"transaction:read\";i:9;s:18:\"transaction:create\";i:10;s:18:\"transaction:update\";i:11;s:18:\"transaction:delete\";}', 'image-.admin.39.webp', '2023-01-09 09:12:59', '2023-01-09 09:12:59'),
(4, 'wala_hudib', 'wala', 'test@test.com', '$2y$10$.gFeXTbunml6QrWwYaLkv.6u0.eTS7WuHVbuHUsm3T/tz4aKjjUtK', 'admin', 'a:12:{i:0;s:9:\"item:read\";i:1;s:11:\"item:create\";i:2;s:11:\"item:update\";i:3;s:11:\"item:delete\";i:4;s:9:\"user:read\";i:5;s:11:\"user:create\";i:6;s:11:\"user:update\";i:7;s:11:\"user:delete\";i:8;s:16:\"transaction:read\";i:9;s:18:\"transaction:create\";i:10;s:18:\"transaction:update\";i:11;s:18:\"transaction:delete\";}', 'defult.jpg', '2023-01-09 09:08:31', '2023-01-09 09:08:31'),
(8, 'Accountant', 'test', 'test@example.com', '$2y$10$1VtcCv1pmEgzfCIaaNRVNOefg5BlUqubzi3e1InQPGLMs.vcIDOM2', 'accountant', 'a:3:{i:0;s:16:\"transaction:read\";i:1;s:18:\"transaction:update\";i:2;s:18:\"transaction:delete\";}', 'defult.jpg', '2023-01-09 09:08:49', '2023-01-09 09:08:49'),
(9, 'seller', 'Tareq ziad', 'a@ho', '$2y$10$2mArsVRreZha82Z.7DyyUO227DFrh0b8CMTDIg4YbKV8ob4lwV3cm', 'seller', 'a:3:{i:0;s:18:\"transaction:create\";i:1;s:18:\"transaction:update\";i:2;s:18:\"transaction:delete\";}', 'defult.jpg', '2023-01-03 10:36:41', '2023-01-03 10:36:41'),
(13, 'samar', 'samar', 'samar@gmail.com', '$2y$10$/2PgU9WvtH71SByV6u.fg.mVLYnrtewUrdud4ct.MGslZ.LQVRgOW', 'admin', 'a:12:{i:0;s:9:\"item:read\";i:1;s:11:\"item:create\";i:2;s:11:\"item:update\";i:3;s:11:\"item:delete\";i:4;s:9:\"user:read\";i:5;s:11:\"user:create\";i:6;s:11:\"user:update\";i:7;s:11:\"user:delete\";i:8;s:16:\"transaction:read\";i:9;s:18:\"transaction:create\";i:10;s:18:\"transaction:update\";i:11;s:18:\"transaction:delete\";}', 'image-.samar.jpeg', '2023-01-03 06:14:00', '2023-01-03 06:14:00'),
(21, 'wesam', 'wesam', 'wesam@gmail.com', '$2y$10$sPgMu3CNO7ENO7KBs2e3B.96qPYKIOhUq9suI.FwMg18/4MKcS/o.', 'admin', 'a:12:{i:0;s:9:\"item:read\";i:1;s:11:\"item:create\";i:2;s:11:\"item:update\";i:3;s:11:\"item:delete\";i:4;s:9:\"user:read\";i:5;s:11:\"user:create\";i:6;s:11:\"user:update\";i:7;s:11:\"user:delete\";i:8;s:16:\"transaction:read\";i:9;s:18:\"transaction:create\";i:10;s:18:\"transaction:update\";i:11;s:18:\"transaction:delete\";}', 'defult.jpg', '2023-01-03 06:32:07', '2023-01-03 06:32:07'),
(32, 'marry', 'marry', 'marry@hotmail.com', '$2y$10$nsKrW1jFMruuzSXcOVMQYefTSTTYdy8KaMuUlhGaAzv6X/nAhaSSG', 'admin', 'a:12:{i:0;s:9:\"item:read\";i:1;s:11:\"item:create\";i:2;s:11:\"item:update\";i:3;s:11:\"item:delete\";i:4;s:9:\"user:read\";i:5;s:11:\"user:create\";i:6;s:11:\"user:update\";i:7;s:11:\"user:delete\";i:8;s:16:\"transaction:read\";i:9;s:18:\"transaction:create\";i:10;s:18:\"transaction:update\";i:11;s:18:\"transaction:delete\";}', 'defult.jpg', '2023-01-03 07:21:46', '2023-01-03 07:21:46'),
(34, 'borini', 'borini', 'borini@gmail.com', '$2y$10$dhgV5pbBmRc0Y7v4/Iei2.4pECRG1aOuw1v9gMn8p/qdNex.VwEzG', 'admin', 'a:12:{i:0;s:9:\"item:read\";i:1;s:11:\"item:create\";i:2;s:11:\"item:update\";i:3;s:11:\"item:delete\";i:4;s:9:\"user:read\";i:5;s:11:\"user:create\";i:6;s:11:\"user:update\";i:7;s:11:\"user:delete\";i:8;s:16:\"transaction:read\";i:9;s:18:\"transaction:create\";i:10;s:18:\"transaction:update\";i:11;s:18:\"transaction:delete\";}', 'defult.jpg', '2023-01-09 09:09:38', '2023-01-09 09:09:38'),
(35, 'andy', 'murry', 'andy@gmail.com', '$2y$10$xDIBe34P2jVFSDhPKhhL0.6v07iM1wi5d7J.7VGTYo8TQW1mGNcTq', 'admin', 'a:12:{i:0;s:9:\"item:read\";i:1;s:11:\"item:create\";i:2;s:11:\"item:update\";i:3;s:11:\"item:delete\";i:4;s:9:\"user:read\";i:5;s:11:\"user:create\";i:6;s:11:\"user:update\";i:7;s:11:\"user:delete\";i:8;s:16:\"transaction:read\";i:9;s:18:\"transaction:create\";i:10;s:18:\"transaction:update\";i:11;s:18:\"transaction:delete\";}', 'image-.andy.35.jpeg', '2023-01-03 10:21:58', '2023-01-03 10:21:58'),
(36, 'jack_deen', 'jack', 'jack@gmail.com', '$2y$10$Dnn1TgYH0xFTDi6aiHLyyecWUxYcAqtCSRLiZmOoRUyh7TW2nRuKC', 'admin', 'a:12:{i:0;s:9:\"item:read\";i:1;s:11:\"item:create\";i:2;s:11:\"item:update\";i:3;s:11:\"item:delete\";i:4;s:9:\"user:read\";i:5;s:11:\"user:create\";i:6;s:11:\"user:update\";i:7;s:11:\"user:delete\";i:8;s:16:\"transaction:read\";i:9;s:18:\"transaction:create\";i:10;s:18:\"transaction:update\";i:11;s:18:\"transaction:delete\";}', 'defult.jpg', '2023-01-09 09:10:10', '2023-01-09 09:10:10'),
(37, 'abughaith', 'ahmad', 'ahmad@ahmad.com', '$2y$10$e8p8fabZ/Ru2v2KcNvadM.2ShoJJyJoZhNUJY60HpQrP5QRza8/Py', 'porcurement', 'a:4:{i:0;s:9:\"item:read\";i:1;s:11:\"item:create\";i:2;s:11:\"item:update\";i:3;s:11:\"item:delete\";}', 'defult.jpg', '2023-01-03 12:15:10', '2023-01-03 12:15:10'),
(38, 'huda', 'Huda', 'huda@hotmail.com', '$2y$10$MRl3osG7XHUH2VHY74.NcuflQGZypSm2oW800d050/2KS3MgM51q2', 'porcurement', 'a:4:{i:0;s:9:\"item:read\";i:1;s:11:\"item:create\";i:2;s:11:\"item:update\";i:3;s:11:\"item:delete\";}', 'defult.jpg', '2023-01-09 08:16:29', '2023-01-09 08:16:29'),
(39, 'sandy', 'sandy', 'sandy@hotmail.com', '$2y$10$WC.4Q9qiaoKKzBJ2D2Ta5uhCYlbHImZioBtAh5Uwo61d2V6Opv6li', 'admin', 'a:12:{i:0;s:9:\"item:read\";i:1;s:11:\"item:create\";i:2;s:11:\"item:update\";i:3;s:11:\"item:delete\";i:4;s:9:\"user:read\";i:5;s:11:\"user:create\";i:6;s:11:\"user:update\";i:7;s:11:\"user:delete\";i:8;s:16:\"transaction:read\";i:9;s:18:\"transaction:create\";i:10;s:18:\"transaction:update\";i:11;s:18:\"transaction:delete\";}', 'defult.jpg', '2023-01-09 09:11:51', '2023-01-09 09:11:51');

-- --------------------------------------------------------

--
-- Table structure for table `users_transactions`
--

CREATE TABLE `users_transactions` (
  `id` int(20) NOT NULL,
  `transaction_id` int(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_transactions`
--

INSERT INTO `users_transactions` (`id`, `transaction_id`, `user_id`) VALUES
(173, 210, 2),
(174, 211, 2),
(175, 212, 2),
(176, 213, 2),
(177, 214, 2),
(178, 215, 2),
(179, 216, 2),
(180, 217, 2),
(185, 222, 2),
(187, 224, 2),
(188, 225, 2),
(189, 226, 2),
(190, 227, 2),
(191, 228, 2),
(192, 229, 2),
(210, 247, 9),
(211, 248, 9),
(213, 250, 2),
(214, 251, 2),
(215, 252, 2),
(216, 253, 2),
(217, 254, 2),
(218, 255, 2),
(219, 256, 2),
(220, 257, 2),
(221, 258, 2),
(222, 259, 2),
(223, 260, 2),
(224, 261, 2),
(225, 262, 2),
(226, 263, 2),
(227, 264, 2),
(228, 265, 2),
(229, 266, 2),
(230, 267, 2),
(232, 269, 2),
(233, 270, 2),
(234, 271, 2),
(235, 272, 2),
(236, 273, 2),
(237, 274, 2),
(238, 275, 2),
(239, 276, 2),
(240, 277, 2),
(241, 278, 2),
(242, 279, 2),
(243, 280, 2),
(244, 281, 2),
(245, 282, 2),
(246, 283, 2),
(247, 284, 2),
(248, 285, 2),
(249, 286, 2),
(250, 287, 2),
(251, 288, 2),
(252, 289, 2),
(253, 290, 2),
(254, 291, 2),
(255, 292, 2),
(256, 293, 2),
(257, 294, 2),
(258, 295, 2),
(259, 296, 2),
(260, 297, 2),
(261, 298, 2),
(264, 301, 2),
(265, 302, 2),
(266, 303, 9),
(267, 304, 2),
(268, 305, 2),
(269, 306, 2),
(270, 307, 2),
(271, 308, 2),
(272, 309, 2),
(273, 310, 2),
(274, 311, 2),
(294, 331, 2),
(295, 332, 2),
(296, 333, 2),
(297, 334, 2),
(298, 335, 2),
(299, 336, 2),
(300, 337, 2),
(301, 338, 2),
(302, 339, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_transactions`
--
ALTER TABLE `users_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fid` (`user_id`),
  ADD KEY `transaction_fid` (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users_transactions`
--
ALTER TABLE `users_transactions`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_transactions`
--
ALTER TABLE `users_transactions`
  ADD CONSTRAINT `transaction_fid` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `user_fid` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
