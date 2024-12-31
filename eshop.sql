-- Adminer 4.8.1 MySQL 5.7.11 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`, `quantity`) VALUES
(1,	1,	1,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	4),
(2,	1,	4,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	2),
(3,	1,	19,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	1),
(4,	2,	15,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	4),
(5,	2,	21,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	2),
(6,	2,	23,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	3),
(7,	3,	12,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	5),
(8,	3,	17,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	1),
(9,	3,	22,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	5);

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1,	'Electronics',	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(2,	'Clothing',	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(3,	'Books',	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(4,	'Home Appliances',	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(5,	'Toys',	'2024-12-31 07:55:03',	'2024-12-31 07:55:03');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_reset_tokens_table',	1),
(3,	'2019_08_19_000000_create_failed_jobs_table',	1),
(4,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(5,	'2024_11_30_152708_create_posts_table',	1),
(6,	'2024_11_30_153524_create_products_table',	1),
(7,	'2024_12_31_125327_create_orders_table',	1),
(8,	'2024_12_31_141918_create_categories_table',	1),
(9,	'2024_12_31_141929_create_staff_table',	1),
(10,	'2024_12_31_141950_create_cart_items_table',	1),
(11,	'2024_12_31_142006_create_order_items_table',	1);

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `total_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `created_at`, `updated_at`) VALUES
(1,	1,	1812.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(2,	1,	2686.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(3,	1,	2130.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(4,	2,	707.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(5,	2,	1318.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(6,	2,	2020.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(7,	3,	2580.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(8,	3,	1487.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(9,	3,	1458.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04');

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `created_at`, `updated_at`, `quantity`, `price`) VALUES
(1,	1,	1,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	2,	489.00),
(2,	1,	2,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	4,	975.00),
(3,	1,	3,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	3,	348.00),
(4,	2,	6,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	2,	881.00),
(5,	2,	16,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	1,	976.00),
(6,	2,	21,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	3,	829.00),
(7,	3,	10,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	3,	880.00),
(8,	3,	16,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	5,	976.00),
(9,	3,	20,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	5,	274.00),
(10,	4,	4,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	5,	118.00),
(11,	4,	5,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	5,	179.00),
(12,	4,	17,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	1,	410.00),
(13,	5,	1,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	1,	489.00),
(14,	5,	5,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	4,	179.00),
(15,	5,	7,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	5,	650.00),
(16,	6,	4,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	3,	118.00),
(17,	6,	12,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	2,	959.00),
(18,	6,	19,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	5,	943.00),
(19,	7,	6,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	3,	881.00),
(20,	7,	13,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	3,	985.00),
(21,	7,	22,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	1,	714.00),
(22,	8,	1,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	3,	489.00),
(23,	8,	3,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	5,	348.00),
(24,	8,	7,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	3,	650.00),
(25,	9,	3,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	1,	348.00),
(26,	9,	9,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	5,	396.00),
(27,	9,	22,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04',	4,	714.00);

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `name`, `category_id`, `price`, `created_at`, `updated_at`) VALUES
(1,	'Phone',	1,	489.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(2,	'Laptop',	1,	975.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(3,	'Camera',	1,	348.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(4,	'Headphones',	1,	118.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(5,	'Smart Watch',	1,	179.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(6,	'T-Shirt',	2,	881.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(7,	'Jeans',	2,	650.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(8,	'Jacket',	2,	232.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(9,	'Shoes',	2,	396.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(10,	'Hat',	2,	880.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(11,	'Novel',	3,	860.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(12,	'Biography',	3,	959.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(13,	'Science Fiction',	3,	985.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(14,	'Textbook',	3,	904.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(15,	'Comics',	3,	209.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(16,	'Microwave',	4,	976.00,	'2024-12-31 07:55:03',	'2024-12-31 07:55:03'),
(17,	'Refrigerator',	4,	410.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(18,	'Vacuum Cleaner',	4,	718.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(19,	'Blender',	4,	943.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(20,	'Washing Machine',	4,	274.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(21,	'Doll',	5,	829.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(22,	'Puzzle',	5,	714.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(23,	'Toy Car',	5,	440.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(24,	'Board Game',	5,	217.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(25,	'Lego Set',	5,	794.00,	'2024-12-31 07:55:04',	'2024-12-31 07:55:04');

DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'Geo Olson',	'umitchell@example.org',	'2024-12-31 07:55:04',	'$2y$12$EVuNvtWri15j3UBveHClYeLX6s/5qIoiKfqnLgwKiIC0DFrtVcJgK',	'oltxNc3duB',	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(2,	'Nelson Runolfsdottir',	'torrey53@example.com',	'2024-12-31 07:55:04',	'$2y$12$EVuNvtWri15j3UBveHClYeLX6s/5qIoiKfqnLgwKiIC0DFrtVcJgK',	'UYkjiM83i6',	'2024-12-31 07:55:04',	'2024-12-31 07:55:04'),
(3,	'Brody Schmeler I',	'flossie.hegmann@example.com',	'2024-12-31 07:55:04',	'$2y$12$EVuNvtWri15j3UBveHClYeLX6s/5qIoiKfqnLgwKiIC0DFrtVcJgK',	'Npo5KlLwzr',	'2024-12-31 07:55:04',	'2024-12-31 07:55:04');

-- 2024-12-31 15:55:40
