-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2022 at 09:05 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `device_type` enum('test') NOT NULL,
  `device_token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `user_id`, `device_type`, `device_token`, `created_at`, `updated_at`) VALUES
(1, 6, 'test', 'test123', NULL, NULL),
(7, 6, 'test', 'mBo3RxOmjdDE8sVQXzw37ABND9DBcX2zPYu8EtRk', NULL, NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_11_06_222923_create_transactions_table', 1),
(4, '2018_11_07_192923_create_transfers_table', 1),
(5, '2018_11_07_202152_update_transfers_table', 1),
(6, '2018_11_15_124230_create_wallets_table', 1),
(7, '2018_11_19_164609_update_transactions_table', 1),
(8, '2018_11_20_133759_add_fee_transfers_table', 1),
(9, '2018_11_22_131953_add_status_transfers_table', 1),
(10, '2018_11_22_133438_drop_refund_transfers_table', 1),
(11, '2019_05_13_111553_update_status_transfers_table', 1),
(12, '2019_06_25_103755_add_exchange_status_transfers_table', 1),
(13, '2019_07_29_184926_decimal_places_wallets_table', 1),
(14, '2019_08_19_000000_create_failed_jobs_table', 1),
(15, '2019_10_02_193759_add_discount_transfers_table', 1),
(16, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(17, '2020_10_30_193412_add_meta_wallets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_gateway` varchar(255) NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `public_key` varchar(255) NOT NULL,
  `environment` varchar(255) NOT NULL,
  `status` enum('active','inActive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `payment_gateway`, `secret_key`, `public_key`, `environment`, `status`, `created_at`, `updated_at`) VALUES
(1, 'stripe', 'sk_test_51L8ijKSGil1Ej60pbOuiGvhNTQ69ZSPYHbFfpiOmsdYMaZEycWzMOFV8mbaSeg9Lve8qTlVJHWEybSZ4oVfnWq0100VDIoBhBw', 'pk_test_6CQUBk1tl4Kqff9ySyWQIs4P00p1LqOdwG', 'test', 'active', '2021-12-02 04:41:27', '2021-12-02 04:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', 'ffa756d0174d0e0d5c810dccb317dc5b27a70b1ab2e16486298c6c6465abfa9a', '[\"*\"]', NULL, '2022-07-01 23:21:15', '2022-07-01 23:21:15'),
(2, 'App\\Models\\User', 2, 'authToken', '6ea05d57fdce8c6c4fba5a9d09862eaead3df26d9a3b1eb9de0b8549aa9894af', '[\"*\"]', NULL, '2022-07-01 23:29:49', '2022-07-01 23:29:49'),
(3, 'App\\Models\\User', 3, 'authToken', 'd0cf7e90461eb44e3ba1c38857dbb667d540629f9b6eb6ef965272d22eccc2ce', '[\"*\"]', NULL, '2022-07-01 23:30:51', '2022-07-01 23:30:51'),
(4, 'App\\Models\\User', 4, 'authToken', '44ce377691b14e767851e8fcfbe43bebd4293e78464e5c18a11bc71569239d48', '[\"*\"]', NULL, '2022-07-01 23:31:36', '2022-07-01 23:31:36'),
(5, 'App\\Models\\User', 5, 'authToken', 'e450aa5a042bd9cd76616716f67d6378140a7c86effe6ffe7073bc103b81b146', '[\"*\"]', NULL, '2022-07-01 23:34:28', '2022-07-01 23:34:28'),
(6, 'App\\Models\\User', 6, 'authToken', '9c281783845a7ab5ce5b69f26c3c50f68cdbdbefb7802008ab5d3eb16cc3812b', '[\"*\"]', NULL, '2022-07-01 23:36:31', '2022-07-01 23:36:31'),
(7, 'App\\Models\\User', 6, 'authToken', '0f35437f0d118e0e6f3f414d3f81cb08d93672dbb3c416cdca0fc6a62ee83cdd', '[\"*\"]', NULL, '2022-07-01 23:50:18', '2022-07-01 23:50:18'),
(8, 'App\\Models\\User', 6, 'authToken', 'f42c5cf42bdd0eb18b0c05c35c69378516da207cde4f6d2133a74d073f1ef98f', '[\"*\"]', NULL, '2022-07-01 23:54:42', '2022-07-01 23:54:42'),
(9, 'App\\Models\\User', 6, 'authToken', 'b86e2b674624f3df97ebd5e7fc5ac4b330d540878e8f61f3b3adeaee0b24c79b', '[\"*\"]', NULL, '2022-07-01 23:58:57', '2022-07-01 23:58:57'),
(10, 'App\\Models\\User', 6, 'authToken', '27c18765f2191930e8565045f6bc359f2f7b0d97cfc22fd2a3c2794c7c6273da', '[\"*\"]', NULL, '2022-07-01 23:59:14', '2022-07-01 23:59:14'),
(11, 'App\\Models\\User', 6, 'authToken', '22b883234847a5c913f8247247933e24138e23bff4d74fad482d67e5942e652d', '[\"*\"]', NULL, '2022-07-01 23:59:30', '2022-07-01 23:59:30'),
(12, 'App\\Models\\User', 6, 'authToken', '1acf30d6635b1b345f0dd50cbc77acdd75680ae468def80d1215a09c90776a32', '[\"*\"]', NULL, '2022-07-01 23:59:42', '2022-07-01 23:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(64,0) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(6, 'test5', 'test5@gmail.com', NULL, '$2y$10$qajNlB/5q1iemEtWO4siQOMD5lB8ipcNda7D7L8eu9Y7HXyL7pQZi', NULL, '2022-07-01 23:36:31', '2022-07-01 23:36:31');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `holder_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(64,0) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `holder_type`, `user_id`, `name`, `slug`, `description`, `balance`, `created_at`, `updated_at`) VALUES
(1, 'test', 6, 'first data', 'First Data', 'first wallet amount store', '200', '2022-07-03 01:25:19', '2022-07-03 01:25:19'),
(3, 'test', 6, 'first data', 'Second Data', 'first wallet amount store', '200', '2022-07-03 01:29:29', '2022-07-03 01:29:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_uuid_unique` (`uuid`),
  ADD KEY `transactions_payable_type_payable_id_index` (`payable_type`,`payable_id`),
  ADD KEY `payable_type_ind` (`payable_type`,`payable_id`,`type`),
  ADD KEY `payable_confirmed_ind` (`payable_type`,`payable_id`,`confirmed`),
  ADD KEY `payable_type_confirmed_ind` (`payable_type`,`payable_id`,`type`,`confirmed`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_wallet_id_foreign` (`wallet_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallets_holder_type_holder_id_slug_unique` (`holder_type`,`user_id`,`slug`),
  ADD KEY `wallets_holder_type_holder_id_index` (`holder_type`,`user_id`),
  ADD KEY `wallets_slug_index` (`slug`),
  ADD KEY `holder_type` (`holder_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
