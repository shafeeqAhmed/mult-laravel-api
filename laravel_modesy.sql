-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2022 at 06:54 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_modesy`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_recipient_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_street_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_street_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_suburb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_country_id` int(11) NOT NULL DEFAULT 0,
  `address_postal_code` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address_recipient_name`, `address_street_no`, `address_street_name`, `address_suburb`, `address_city`, `address_country_id`, `address_postal_code`, `created_at`, `updated_at`) VALUES
(1, 91, 'Laudantium Nam sapi', 'Libero vel laboriosa', 'Laboriosam omnis es', 'Duis adipisci veniam', 'Dolorem incidunt du', 2, 1234, '2021-08-08 13:25:08', '2021-08-08 13:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `admin_orders`
--

CREATE TABLE `admin_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `unique_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_product_amount` int(11) NOT NULL DEFAULT 0,
  `total_product_qty` int(11) NOT NULL DEFAULT 0,
  `order_status` enum('In Progress','Dispatched','Completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_orders`
--

INSERT INTO `admin_orders` (`id`, `customer_id`, `unique_no`, `customer_order_no`, `total_product_amount`, `total_product_qty`, `order_status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Or-100000', '0', 164, 2, 'In Progress', NULL, '2021-09-24 01:35:43', '2021-09-24 01:35:43'),
(2, 1, 'Or-100001', '0', 230, 4, 'In Progress', NULL, '2021-09-24 05:34:12', '2021-09-24 05:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fields` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_file_able` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `title`, `tags`, `fields`, `is_file_able`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Size', NULL, NULL, 0, 1, NULL, '2021-07-16 10:17:44', '2021-07-16 10:17:44'),
(2, 'Quality', NULL, NULL, 0, 1, NULL, '2021-07-17 08:51:34', '2021-07-31 07:27:47'),
(3, 'Tax', NULL, NULL, 0, 1, NULL, '2021-07-17 08:53:03', '2021-07-17 08:53:03'),
(4, 'material', NULL, NULL, 0, 1, NULL, '2021-07-31 07:27:16', '2021-07-31 07:27:16');

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bank_detail_firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_detail_bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_detail_account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_detail_branch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_detail_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_detail_request_status` enum('Pending','Approved','Rejected') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_details`
--

INSERT INTO `bank_details` (`id`, `user_id`, `bank_detail_firstname`, `bank_detail_bank_name`, `bank_detail_account_no`, `bank_detail_branch_code`, `bank_detail_file_name`, `bank_detail_request_status`, `created_at`, `updated_at`) VALUES
(1, 91, 'Ipsum sunt rem nece', 'Praesentium a rerum', 'Qui et eligendi sed', 'Eos eligendi aut et', 'rimsha amjad.pdf', 'Pending', '2021-08-08 13:26:08', '2021-08-08 13:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `billing_address_recipient_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_street_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_street_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_suburb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_country_id` int(11) NOT NULL DEFAULT 0,
  `billing_address_postal_code` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_addresses`
--

INSERT INTO `billing_addresses` (`id`, `user_id`, `billing_address_recipient_name`, `billing_address_street_no`, `billing_address_street_name`, `billing_address_suburb`, `billing_address_city`, `billing_address_country_id`, `billing_address_postal_code`, `created_at`, `updated_at`) VALUES
(1, 91, 'Rep', 'Iure et cupidatat ve', 'Pariatur Enim offic', 'Eiusmod hic repudian', 'Nihil deleniti qui o', 10, 1243, '2021-08-08 13:25:30', '2021-08-08 13:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_details`
--

CREATE TABLE `business_details` (
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `business_legal_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_account_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id_document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_bee_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_out_office_from` date NOT NULL,
  `business_out_office_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_details`
--

INSERT INTO `business_details` (`business_id`, `user_id`, `business_legal_name`, `business_type`, `business_registration_number`, `business_account_file`, `business_id_document`, `business_bee_status`, `business_out_office_from`, `business_out_office_to`, `created_at`, `updated_at`) VALUES
(2, 91, 'zati', 'abc', 'adfd', 'asfasd', 'a', 'dfsd', '0000-00-00', '0000-00-00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `module`, `type`, `value`, `created_at`, `updated_at`) VALUES
(36, 'header', 'show_language_switcher', 'true', '2021-07-02 06:50:53', '2021-07-02 06:50:53'),
(37, 'header', 'show_currency_switcher', 'false', '2021-07-02 06:50:53', '2021-07-02 06:50:53'),
(38, 'header', 'header_stikcy', 'true', '2021-07-02 06:50:53', '2021-07-13 16:58:53'),
(39, 'header', 'header_menu', '[{\"label\":\"Ut corporis cupidata\",\"value\":\"Perferendis alias fa\"},{\"label\":\"Quidem at et sit asp\",\"value\":\"Labore id a perfere\"},{\"label\":\"Natus porro ipsa ea\",\"value\":\"In alias quia ad est\"},{\"label\":\"Eveniet blanditiis \",\"value\":\"Ex in Nam molestiae \"}]', '2021-07-02 06:50:53', '2021-07-13 16:58:53'),
(40, 'header', 'header_logo', 'http://localhost/shafeeque/laravel-api/public/storage/admin/website/gHyH2DFKSkhln0vFW11HSKdM0g5c3q.jpg', '2021-07-02 06:51:40', '2021-08-17 11:43:32'),
(41, 'general', 'front_website_name', 'Autem enim irure mag', '2021-07-02 06:54:08', '2021-07-13 17:01:45'),
(42, 'general', 'site_moto', 'Ut aspernatur odio o', '2021-07-02 06:54:08', '2021-07-13 17:01:45'),
(43, 'general', 'website_base_color', 'Ut in eius nihil ut', '2021-07-02 06:54:08', '2021-07-13 17:01:45'),
(44, 'general', 'website_base_hover_color', '#243234', '2021-07-02 06:54:08', '2021-07-16 07:18:01'),
(45, 'general', 'site_icon', 'http://localhost/shafeeque/laravel-api/public/storage/admin/website/FLuBZsFPdjGG3zOUOrkMU6dZRSuWrj.png', '2021-07-02 06:54:09', '2021-12-06 15:37:48'),
(46, 'cookies_agreement', 'show_cookies_agreemeent', 'false', '2021-07-02 07:03:15', '2021-07-13 17:04:35'),
(47, 'global_seo', 'meta_title', 'Minim recusandae Er', '2021-07-02 08:09:33', '2021-07-02 08:09:33'),
(48, 'global_seo', 'meta_description', 'In tenetur ipsa eiu', '2021-07-02 08:09:33', '2021-07-02 08:09:33'),
(49, 'global_seo', 'keywords', 'Necessitatibus,ea,pe', '2021-07-02 08:09:33', '2021-07-02 08:09:33'),
(50, 'global_seo', 'meta_image', 'http://localhost/shafeeque/laravel-api/public/storage/admin/website/BokcF5bJnkLQZcXnMqn46HCHmKaaDM.png', '2021-07-02 08:09:34', '2021-08-08 14:12:56'),
(51, 'cookies_agreement', 'cookies_agreement_text', '<p>some text</p>', '2021-07-02 08:09:45', '2021-07-16 17:13:13'),
(52, 'custom_script', 'header_custom_script', 'text are befor script', '2021-07-02 08:09:49', '2021-07-16 07:46:28'),
(53, 'custom_script', 'footer_custom_script', 'text area befor footer', '2021-07-02 08:09:49', '2021-07-16 07:46:28'),
(54, 'footer_about_widget', 'about_description', 'Ducimus quam debiti', '2021-07-02 08:10:02', '2021-07-02 08:10:02'),
(55, 'footer_about_widget', 'footer_logo', 'http://localhost/shafeeque/laravel-api/public/storage/admin/website/Dn6hMJNddll0DLKjPQ3mSQ7dOVLi6O.png', '2021-07-02 08:10:03', '2021-08-08 14:21:49'),
(56, 'contact_info', 'address', 'Aut excepteur pariat', '2021-07-02 08:10:07', '2021-07-02 08:10:07'),
(57, 'contact_info', 'phone', '85', '2021-07-02 08:10:07', '2021-07-02 08:10:07'),
(58, 'contact_info', 'email', 'dexo@mailinator.com', '2021-07-02 08:10:07', '2021-07-02 08:10:07'),
(59, 'footer_link_widget_one', 'footer_link_widget_one_title', 'Aut dolor sit dolor', '2021-07-02 08:10:22', '2021-07-02 08:10:22'),
(60, 'footer_link_widget_one', 'footer_link_widget_one_links', '[{\"label\":\"Dolorem omnis qui qu\",\"value\":\"Anim labore aut nihi\",\"isRequired\":true},{\"label\":\"Sit corporis nobis s\",\"value\":\"Placeat accusantium\",\"isRequired\":true},{\"label\":\"Exercitationem disti\",\"value\":\"Voluptate quia enim \",\"isRequired\":true},{\"label\":\"Perferendis voluptas\",\"value\":\"Ipsa aut vel ad lib\",\"isRequired\":true},{\"label\":\"Dolorem est eu et fu\",\"value\":\"Nesciunt non minima\",\"isRequired\":true}]', '2021-07-02 08:10:22', '2021-07-02 08:10:22'),
(61, 'social_links_widget', 'copyright_text', 'Bottom footer', '2021-07-02 08:10:30', '2021-08-19 10:13:20'),
(62, 'social_links_widget', 'show_social_link', 'true', '2021-07-02 08:10:30', '2021-08-19 10:13:20'),
(63, 'social_links_widget', 'facebook', 'https://www.facebook.com/sique163', '2021-07-02 08:10:30', '2021-08-19 10:13:20'),
(64, 'social_links_widget', 'twitter', 'https://twitter.com/sique163', '2021-07-02 08:10:30', '2021-08-19 10:13:20'),
(65, 'social_links_widget', 'instagram', 'https://www.instagram.com/sique163', '2021-07-02 08:10:30', '2021-08-19 10:13:20'),
(66, 'social_links_widget', 'youtube', 'https://youtube.com/sique163', '2021-07-02 08:10:30', '2021-08-19 10:13:20'),
(67, 'social_links_widget', 'linkin', 'https://linkedin.com/sique163', '2021-07-02 08:10:30', '2021-08-19 10:13:20'),
(68, 'social_links_widget', 'payment_method_widget_img', 'http://localhost/shafeeque/laravel-api/public/storage/admin/website/1LBuN9oCPmjlDa1dulNS7nt9DZFM59.png', '2021-07-02 08:10:31', '2021-08-08 14:22:12'),
(69, 'general', 'website_base_hover_colo', 'undefined', '2021-07-15 19:33:32', '2021-07-15 19:33:32'),
(70, 'cookies_agreement', 'header_custom_script', 'undefined', '2021-07-16 07:46:10', '2021-07-16 07:46:10'),
(71, 'social_links_widget', 'pinterest', 'https://www.pinterest.com/sique163', '2021-08-19 10:13:20', '2021-08-19 10:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission_rate` double NOT NULL DEFAULT 0,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bread_crumbs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `level`, `name`, `commission_rate`, `banner`, `icon`, `featured`, `top`, `slug`, `bread_crumbs`, `meta_title`, `meta_description`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 'Electronics', 2, 'http://localhost/shafeeque/backend-modesy/public/storage/admin/categories/0Bf2oeeF4QSyUMCz8urRYyd8ytvoBv.png', 'http://localhost/shafeeque/backend-modesy/public/storage/admin/categories/yv0BvMHrggQLqtkN7kJvMyvDIlnyAB.png', 0, 0, 'electronics', 'Electronics', 'null', 'null', 1, NULL, '2021-06-08 04:24:31', '2021-07-24 21:55:50'),
(2, 0, 0, 'Cloth', 4, 'http://localhost/shafeeque/laravel-api/public/storage/admin/categories/slEDfKhLYMHgXje52jmljwKie6I3Yk.png', 'http://localhost/shafeeque/laravel-api/public/storage/admin/categories/mYSaYegfeRnxo8DApbW3VJEHS8YULh.png', 0, 0, 'cloth', 'Cloth', 'null', 'null', 1, NULL, '2021-06-08 04:24:54', '2021-09-09 05:46:44'),
(3, 1, 0, 'Mobile', 2, '', '', 0, 0, 'mobile', 'Mobile', 'null', 'null', 0, NULL, '2021-06-08 04:25:12', '2021-07-15 18:18:23'),
(4, 3, 0, 'Samsun', 2, '', '', 0, 0, 'samsun', 'Electronics > Mobile > Samsun', NULL, NULL, 1, NULL, '2021-06-08 04:26:52', '2021-06-08 04:26:52'),
(5, 4, 0, 'A series', 2, '', '', 0, 0, 'a-series', 'Electronics > Mobile > Samsun > A series', NULL, NULL, 1, NULL, '2021-06-08 04:36:16', '2021-06-08 04:36:16'),
(6, 4, 0, 'S series', 4, '', '', 0, 0, 's-series', 'Electronics > Mobile > Samsun > S series', NULL, NULL, 1, NULL, '2021-06-08 04:36:38', '2021-06-08 04:36:38'),
(7, 5, 0, 'A 50', 4, '', '', 0, 0, 'a-50', 'Electronics > Mobile > Samsun > A series > A 50', NULL, NULL, 1, NULL, '2021-06-08 04:36:58', '2021-06-08 04:36:58'),
(8, 7, 0, 'A 50 plus', 3, '', '', 0, 0, 'a-50-plus', 'Electronics > Mobile > Samsun > A series > A 50 > A 50 plus', NULL, NULL, 1, NULL, '2021-06-08 04:37:39', '2021-06-08 04:37:39'),
(9, 1, 0, 'Hedad phone', 2, '', '', 0, 0, 'hedad-phone', 'Electronics > Hedad phone', NULL, NULL, 1, NULL, '2021-06-11 01:37:37', '2021-06-11 01:37:37'),
(10, 1, 0, 'speaker', 2, '', '', 0, 0, 'speaker', 'Electronics > speaker', NULL, NULL, 1, NULL, '2021-06-11 01:38:10', '2021-06-11 01:38:10'),
(15, 0, 0, 'Furniture', 6, 'http://localhost/shafeeque/backend-modesy/public/storage/admin/categories/QgFHbZ4gb64cau52PZ23P1iTwjJCYh.png', 'http://localhost/shafeeque/backend-modesy/public/storage/admin/categories/pIJI3fRnnOU4inEicu6MWWNlVM9zww.png', 0, 0, 'furniture', 'Furniture', 'null', 'null', 1, NULL, '2021-07-15 16:17:28', '2021-07-24 21:55:05'),
(16, 15, 0, 'Bed', 3, '', '', 0, 0, 'bed', 'Bed', 'null', 'null', 1, NULL, '2021-07-15 16:20:13', '2021-07-15 18:36:45'),
(17, 16, 0, 'traditional', 3, 'http://localhost/shafeeque/backend-modesy/public/storage/admin/categories/Ts5iM2sO5AMg31tTrHyPx0XOg14PQt.png', 'http://localhost/shafeeque/backend-modesy/public/storage/admin/categories/bGA1rFKzkB1uh8UFtd6foA8LSsLF1G.png', 0, 0, 'traditional', 'Furniture > Bed > traditional', NULL, NULL, 1, NULL, '2021-07-15 18:22:22', '2021-07-15 18:22:22'),
(18, 0, 0, 'Books', 7, 'http://localhost/shafeeque/backend-modesy/public/storage/admin/categories/ODiMZ3nqSUo8d3NgIkNGB0hoHcxyuu.png', 'http://localhost/shafeeque/backend-modesy/public/storage/admin/categories/8LmWu6UjPdYAf83cS1LEqahKEf903i.png', 0, 0, 'books', 'Books', 'null', 'null', 1, NULL, '2021-07-17 07:40:47', '2021-07-24 21:54:47'),
(19, 0, 0, 'Laptop', 3, 'http://localhost/shafeeque/backend-modesy/public/storage/admin/categories/morZ5LZlMQMxR0U2mFRUkIV232rV8J.png', 'http://localhost/shafeeque/backend-modesy/public/storage/admin/categories/tvzCTExLE3rc1XAWVs6uI2RjToSnNv.png', 0, 0, 'laptop', 'Laptop', 'null', 'null', 1, NULL, '2021-07-17 08:48:55', '2021-07-25 07:40:11'),
(20, 18, 0, 'Math', 7, '', '', 0, 0, 'math', 'Books > Math', NULL, NULL, 1, NULL, '2021-07-17 08:49:50', '2021-07-17 08:49:50'),
(21, 20, 0, 'calculas', 7, '', '', 0, 0, 'calculas', 'Books > Math > calculas', NULL, NULL, 1, NULL, '2021-07-17 08:50:40', '2021-07-17 08:50:40'),
(22, 0, 0, 'Medicine', 12, 'http://localhost/shafeeque/laravel-api/public/storage/admin/categories/o4xrq2RtlRvVZ9TOwVBmmaj0c8Spzp.png', 'http://localhost/shafeeque/laravel-api/public/storage/admin/categories/D3PU1c2XVkER2Dm628yJYeaYkvWths.png', 0, 0, 'medicine', 'Medicine', NULL, NULL, 1, NULL, '2021-08-08 14:10:14', '2021-08-08 14:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `category_attributes`
--

CREATE TABLE `category_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_attributes`
--

INSERT INTO `category_attributes` (`id`, `attribute_id`, `category_id`, `user_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 2, NULL, 1, NULL, '2021-07-17 08:54:28', '2021-08-18 14:57:59'),
(5, 1, 2, NULL, 1, NULL, '2021-07-17 09:42:56', '2021-07-17 09:50:23'),
(6, 3, 6, NULL, 1, NULL, '2021-07-30 05:03:19', '2021-07-30 05:03:19'),
(7, 4, 2, NULL, 1, NULL, '2021-07-31 07:27:24', '2021-07-31 07:27:24'),
(8, 2, 2, NULL, 1, NULL, '2021-07-31 07:27:56', '2021-07-31 07:27:56'),
(9, 4, 8, NULL, 1, NULL, '2021-12-06 15:39:11', '2021-12-06 15:39:11'),
(10, 4, 6, NULL, 1, NULL, '2021-12-06 15:59:42', '2021-12-06 15:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `category_custom_fields`
--

CREATE TABLE `category_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `order_level` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_custom_fields`
--

INSERT INTO `category_custom_fields` (`id`, `custom_field_id`, `category_id`, `order_level`, `user_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 0, NULL, 1, NULL, '2021-08-15 07:47:21', '2021-08-15 07:47:21'),
(2, 3, 2, 0, NULL, 1, NULL, '2021-08-15 07:47:33', '2021-08-15 07:47:33'),
(3, 2, 2, 0, NULL, 1, NULL, '2021-08-15 07:47:43', '2021-08-15 07:47:43'),
(4, 4, 2, 0, NULL, 1, NULL, '2021-08-15 07:48:39', '2021-08-15 07:48:39');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(150) NOT NULL,
  `country_sort_name` varchar(3) NOT NULL,
  `country_phone_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `country_sort_name`, `country_phone_code`) VALUES
(1, 'Afghanistan', 'AF', 93),
(2, 'Albania', 'AL', 355),
(3, 'Algeria', 'DZ', 213),
(4, 'American Samoa', 'AS', 1684),
(5, 'Andorra', 'AD', 376),
(6, 'Angola', 'AO', 244),
(7, 'Anguilla', 'AI', 1264),
(8, 'Antarctica', 'AQ', 0),
(9, 'Antigua And Barbuda', 'AG', 1268),
(10, 'Argentina', 'AR', 54),
(11, 'Armenia', 'AM', 374),
(12, 'Aruba', 'AW', 297),
(13, 'Australia', 'AU', 61),
(14, 'Austria', 'AT', 43),
(15, 'Azerbaijan', 'AZ', 994),
(16, 'Bahamas The', 'BS', 1242),
(17, 'Bahrain', 'BH', 973),
(18, 'Bangladesh', 'BD', 880),
(19, 'Barbados', 'BB', 1246),
(20, 'Belarus', 'BY', 375),
(21, 'Belgium', 'BE', 32),
(22, 'Belize', 'BZ', 501),
(23, 'Benin', 'BJ', 229),
(24, 'Bermuda', 'BM', 1441),
(25, 'Bhutan', 'BT', 975),
(26, 'Bolivia', 'BO', 591),
(27, 'Bosnia and Herzegovina', 'BA', 387),
(28, 'Botswana', 'BW', 267),
(29, 'Bouvet Island', 'BV', 0),
(30, 'Brazil', 'BR', 55),
(31, 'British Indian Ocean Territory', 'IO', 246),
(32, 'Brunei', 'BN', 673),
(33, 'Bulgaria', 'BG', 359),
(34, 'Burkina Faso', 'BF', 226),
(35, 'Burundi', 'BI', 257),
(36, 'Cambodia', 'KH', 855),
(37, 'Cameroon', 'CM', 237),
(38, 'Canada', 'CA', 1),
(39, 'Cape Verde', 'CV', 238),
(40, 'Cayman Islands', 'KY', 1345),
(41, 'Central African Republic', 'CF', 236),
(42, 'Chad', 'TD', 235),
(43, 'Chile', 'CL', 56),
(44, 'China', 'CN', 86),
(45, 'Christmas Island', 'CX', 61),
(46, 'Cocos (Keeling) Islands', 'CC', 672),
(47, 'Colombia', 'CO', 57),
(48, 'Comoros', 'KM', 269),
(49, 'Republic Of The Congo', 'CG', 242),
(50, 'Democratic Republic Of The Congo', 'CD', 242),
(51, 'Cook Islands', 'CK', 682),
(52, 'Costa Rica', 'CR', 506),
(53, 'Cote D\'Ivoire (Ivory Coast)', 'CI', 225),
(54, 'Croatia (Hrvatska)', 'HR', 385),
(55, 'Cuba', 'CU', 53),
(56, 'Cyprus', 'CY', 357),
(57, 'Czech Republic', 'CZ', 420),
(58, 'Denmark', 'DK', 45),
(59, 'Djibouti', 'DJ', 253),
(60, 'Dominica', 'DM', 1767),
(61, 'Dominican Republic', 'DO', 1809),
(62, 'East Timor', 'TP', 670),
(63, 'Ecuador', 'EC', 593),
(64, 'Egypt', 'EG', 20),
(65, 'El Salvador', 'SV', 503),
(66, 'Equatorial Guinea', 'GQ', 240),
(67, 'Eritrea', 'ER', 291),
(68, 'Estonia', 'EE', 372),
(69, 'Ethiopia', 'ET', 251),
(70, 'External Territories of Australia', 'XA', 61),
(71, 'Falkland Islands', 'FK', 500),
(72, 'Faroe Islands', 'FO', 298),
(73, 'Fiji Islands', 'FJ', 679),
(74, 'Finland', 'FI', 358),
(75, 'France', 'FR', 33),
(76, 'French Guiana', 'GF', 594),
(77, 'French Polynesia', 'PF', 689),
(78, 'French Southern Territories', 'TF', 0),
(79, 'Gabon', 'GA', 241),
(80, 'Gambia The', 'GM', 220),
(81, 'Georgia', 'GE', 995),
(82, 'Germany', 'DE', 49),
(83, 'Ghana', 'GH', 233),
(84, 'Gibraltar', 'GI', 350),
(85, 'Greece', 'GR', 30),
(86, 'Greenland', 'GL', 299),
(87, 'Grenada', 'GD', 1473),
(88, 'Guadeloupe', 'GP', 590),
(89, 'Guam', 'GU', 1671),
(90, 'Guatemala', 'GT', 502),
(91, 'Guernsey and Alderney', 'XU', 44),
(92, 'Guinea', 'GN', 224),
(93, 'Guinea-Bissau', 'GW', 245),
(94, 'Guyana', 'GY', 592),
(95, 'Haiti', 'HT', 509),
(96, 'Heard and McDonald Islands', 'HM', 0),
(97, 'Honduras', 'HN', 504),
(98, 'Hong Kong S.A.R.', 'HK', 852),
(99, 'Hungary', 'HU', 36),
(100, 'Iceland', 'IS', 354),
(101, 'India', 'IN', 91),
(102, 'Indonesia', 'ID', 62),
(103, 'Iran', 'IR', 98),
(104, 'Iraq', 'IQ', 964),
(105, 'Ireland', 'IE', 353),
(106, 'Israel', 'IL', 972),
(107, 'Italy', 'IT', 39),
(108, 'Jamaica', 'JM', 1876),
(109, 'Japan', 'JP', 81),
(110, 'Jersey', 'XJ', 44),
(111, 'Jordan', 'JO', 962),
(112, 'Kazakhstan', 'KZ', 7),
(113, 'Kenya', 'KE', 254),
(114, 'Kiribati', 'KI', 686),
(115, 'Korea North', 'KP', 850),
(116, 'Korea South', 'KR', 82),
(117, 'Kuwait', 'KW', 965),
(118, 'Kyrgyzstan', 'KG', 996),
(119, 'Laos', 'LA', 856),
(120, 'Latvia', 'LV', 371),
(121, 'Lebanon', 'LB', 961),
(122, 'Lesotho', 'LS', 266),
(123, 'Liberia', 'LR', 231),
(124, 'Libya', 'LY', 218),
(125, 'Liechtenstein', 'LI', 423),
(126, 'Lithuania', 'LT', 370),
(127, 'Luxembourg', 'LU', 352),
(128, 'Macau S.A.R.', 'MO', 853),
(129, 'Macedonia', 'MK', 389),
(130, 'Madagascar', 'MG', 261),
(131, 'Malawi', 'MW', 265),
(132, 'Malaysia', 'MY', 60),
(133, 'Maldives', 'MV', 960),
(134, 'Mali', 'ML', 223),
(135, 'Malta', 'MT', 356),
(136, 'Man (Isle of)', 'XM', 44),
(137, 'Marshall Islands', 'MH', 692),
(138, 'Martinique', 'MQ', 596),
(139, 'Mauritania', 'MR', 222),
(140, 'Mauritius', 'MU', 230),
(141, 'Mayotte', 'YT', 269),
(142, 'Mexico', 'MX', 52),
(143, 'Micronesia', 'FM', 691),
(144, 'Moldova', 'MD', 373),
(145, 'Monaco', 'MC', 377),
(146, 'Mongolia', 'MN', 976),
(147, 'Montserrat', 'MS', 1664),
(148, 'Morocco', 'MA', 212),
(149, 'Mozambique', 'MZ', 258),
(150, 'Myanmar', 'MM', 95),
(151, 'Namibia', 'NA', 264),
(152, 'Nauru', 'NR', 674),
(153, 'Nepal', 'NP', 977),
(154, 'Netherlands Antilles', 'AN', 599),
(155, 'Netherlands The', 'NL', 31),
(156, 'New Caledonia', 'NC', 687),
(157, 'New Zealand', 'NZ', 64),
(158, 'Nicaragua', 'NI', 505),
(159, 'Niger', 'NE', 227),
(160, 'Nigeria', 'NG', 234),
(161, 'Niue', 'NU', 683),
(162, 'Norfolk Island', 'NF', 672),
(163, 'Northern Mariana Islands', 'MP', 1670),
(164, 'Norway', 'NO', 47),
(165, 'Oman', 'OM', 968),
(166, 'Pakistan', 'PK', 92),
(167, 'Palau', 'PW', 680),
(168, 'Palestinian Territory Occupied', 'PS', 970),
(169, 'Panama', 'PA', 507),
(170, 'Papua new Guinea', 'PG', 675),
(171, 'Paraguay', 'PY', 595),
(172, 'Peru', 'PE', 51),
(173, 'Philippines', 'PH', 63),
(174, 'Pitcairn Island', 'PN', 0),
(175, 'Poland', 'PL', 48),
(176, 'Portugal', 'PT', 351),
(177, 'Puerto Rico', 'PR', 1787),
(178, 'Qatar', 'QA', 974),
(179, 'Reunion', 'RE', 262),
(180, 'Romania', 'RO', 40),
(181, 'Russia', 'RU', 70),
(182, 'Rwanda', 'RW', 250),
(183, 'Saint Helena', 'SH', 290),
(184, 'Saint Kitts And Nevis', 'KN', 1869),
(185, 'Saint Lucia', 'LC', 1758),
(186, 'Saint Pierre and Miquelon', 'PM', 508),
(187, 'Saint Vincent And The Grenadines', 'VC', 1784),
(188, 'Samoa', 'WS', 684),
(189, 'San Marino', 'SM', 378),
(190, 'Sao Tome and Principe', 'ST', 239),
(191, 'Saudi Arabia', 'SA', 966),
(192, 'Senegal', 'SN', 221),
(193, 'Serbia', 'RS', 381),
(194, 'Seychelles', 'SC', 248),
(195, 'Sierra Leone', 'SL', 232),
(196, 'Singapore', 'SG', 65),
(197, 'Slovakia', 'SK', 421),
(198, 'Slovenia', 'SI', 386),
(199, 'Smaller Territories of the UK', 'XG', 44),
(200, 'Solomon Islands', 'SB', 677),
(201, 'Somalia', 'SO', 252),
(202, 'South Africa', 'ZA', 27),
(203, 'South Georgia', 'GS', 0),
(204, 'South Sudan', 'SS', 211),
(205, 'Spain', 'ES', 34),
(206, 'Sri Lanka', 'LK', 94),
(207, 'Sudan', 'SD', 249),
(208, 'Suriname', 'SR', 597),
(209, 'Svalbard And Jan Mayen Islands', 'SJ', 47),
(210, 'Swaziland', 'SZ', 268),
(211, 'Sweden', 'SE', 46),
(212, 'Switzerland', 'CH', 41),
(213, 'Syria', 'SY', 963),
(214, 'Taiwan', 'TW', 886),
(215, 'Tajikistan', 'TJ', 992),
(216, 'Tanzania', 'TZ', 255),
(217, 'Thailand', 'TH', 66),
(218, 'Togo', 'TG', 228),
(219, 'Tokelau', 'TK', 690),
(220, 'Tonga', 'TO', 676),
(221, 'Trinidad And Tobago', 'TT', 1868),
(222, 'Tunisia', 'TN', 216),
(223, 'Turkey', 'TR', 90),
(224, 'Turkmenistan', 'TM', 7370),
(225, 'Turks And Caicos Islands', 'TC', 1649),
(226, 'Tuvalu', 'TV', 688),
(227, 'Uganda', 'UG', 256),
(228, 'Ukraine', 'UA', 380),
(229, 'United Arab Emirates', 'AE', 971),
(230, 'United Kingdom', 'GB', 44),
(231, 'United States', 'US', 1),
(232, 'United States Minor Outlying Islands', 'UM', 1),
(233, 'Uruguay', 'UY', 598),
(234, 'Uzbekistan', 'UZ', 998),
(235, 'Vanuatu', 'VU', 678),
(236, 'Vatican City State (Holy See)', 'VA', 39),
(237, 'Venezuela', 'VE', 58),
(238, 'Vietnam', 'VN', 84),
(239, 'Virgin Islands (British)', 'VG', 1284),
(240, 'Virgin Islands (US)', 'VI', 1340),
(241, 'Wallis And Futuna Islands', 'WF', 681),
(242, 'Western Sahara', 'EH', 212),
(243, 'Yemen', 'YE', 967),
(244, 'Yugoslavia', 'YU', 38),
(245, 'Zambia', 'ZM', 260),
(246, 'Zimbabwe', 'ZW', 263);

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collapse` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_grouped` tinyint(1) NOT NULL DEFAULT 1,
  `fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`fields`)),
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1=category,2=product',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `title`, `collapse`, `description`, `is_grouped`, `fields`, `type`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Text Fields', '{\"open\":false,\"submit\":false,\"loader\":false}', NULL, 1, '[{\"id\":1,\"label\":\"First name\",\"name\":\"\",\"placeHolder\":\"Enter First Name\",\"requredField\":true,\"type\":\"text\"},{\"id\":2,\"label\":\"Middle Name\",\"placeHolder\":\"Enter Middle Name\",\"requredField\":false,\"type\":\"text\",\"name\":\"\"},{\"id\":3,\"label\":\"Last Name\",\"placeHolder\":\"Enter Last Name\",\"requredField\":false,\"type\":\"text\",\"name\":\"\"}]', 1, 1, NULL, '2021-08-15 07:33:06', '2021-08-15 07:33:06'),
(2, 'Select Fields', '{\"open\":false,\"submit\":false,\"loader\":false}', NULL, 1, '[{\"id\":2,\"label\":\"Course\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"select\",\"selectOptions\":[{\"title\":\"PHP\"},{\"title\":\"Dot Net\"},{\"title\":\"Wordpress\"}],\"select\":[],\"multiple\":true},{\"id\":3,\"label\":\"Gender\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"select\",\"selectOptions\":[{\"title\":\"Male\"},{\"title\":\"Female\"}],\"select\":[],\"multiple\":false}]', 1, 1, NULL, '2021-08-15 07:42:53', '2021-08-15 07:42:53'),
(3, 'File Field', '{\"open\":false,\"submit\":false,\"loader\":false}', NULL, 1, '[{\"id\":3,\"label\":\"Profile\",\"placeHolder\":\"\",\"requredField\":true,\"type\":\"file\",\"name\":[],\"select\":[],\"multiple\":false},{\"id\":4,\"label\":\"Cover Photos\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"file\",\"name\":[],\"select\":[],\"multiple\":true}]', 1, 1, NULL, '2021-08-15 07:45:24', '2021-08-15 07:45:24'),
(4, 'Radio Fields', '{\"open\":false,\"submit\":false,\"loader\":false}', NULL, 1, '[{\"id\":2,\"label\":\"Gender\",\"placeHolder\":\"\",\"requredField\":true,\"type\":\"radio\",\"radioOptions\":[{\"text\":\"Male\",\"value\":\"\"},{\"text\":\"Female\",\"value\":\"\"},{\"text\":\"Other\",\"value\":\"\"}],\"selectedRadio\":\"\"},{\"id\":3,\"label\":\"Developer\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"radio\",\"radioOptions\":[{\"text\":\"Front End\",\"value\":\"\"},{\"text\":\"Backend\",\"value\":\"\"}],\"selectedRadio\":\"\"}]', 1, 1, NULL, '2021-08-15 07:47:03', '2021-08-15 07:47:03'),
(5, 'Est delectus corpor', '{\"open\":false,\"submit\":false,\"loader\":false}', NULL, 1, '[{\"id\":1,\"label\":\"Ut ea laborum fugit\",\"name\":\"\",\"placeHolder\":\"Cumque voluptate qui\",\"requredField\":false,\"type\":\"text\"},{\"id\":2,\"label\":\"Dolorum minus consec\",\"placeHolder\":\"Cum omnis consectetu\",\"requredField\":false,\"type\":\"text\",\"name\":\"\"},{\"id\":3,\"label\":\"Quis perspiciatis a\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"select\",\"selectOptions\":[{\"title\":\"Natus et rerum et in\"},{\"title\":\"Reprehenderit ducimu\"},{\"title\":\"Sint commodi occaeca\"}],\"select\":[],\"multiple\":false},{\"id\":4,\"label\":\"Mollitia in nemo nes\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"file\",\"name\":[],\"select\":[],\"multiple\":false},{\"id\":5,\"label\":\"Aut dicta omnis sunt\",\"placeHolder\":\"\",\"requredField\":true,\"type\":\"radio\",\"radioOptions\":[{\"text\":\"Ut dolor ut recusand\",\"value\":\"\"},{\"text\":\"Ab ut ea minim excep\",\"value\":\"\"},{\"text\":\"Quae nobis ad rerum \",\"value\":\"\"}],\"selectedRadio\":\"\"}]', 1, 1, NULL, '2021-12-06 15:59:25', '2021-12-06 15:59:25'),
(6, 'Id est impedit erro', '{\"open\":false,\"submit\":false,\"loader\":false}', NULL, 1, '[{\"id\":1,\"label\":\"Cupiditate Nam et iu\",\"name\":\"\",\"placeHolder\":\"Nesciunt non enim a\",\"requredField\":false,\"type\":\"text\"},{\"id\":2,\"label\":\"Repudiandae vero aut\",\"placeHolder\":\"Illum et ea reprehe\",\"requredField\":true,\"type\":\"text\",\"name\":\"\"},{\"id\":3,\"label\":\"Asperiores voluptatu\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"select\",\"selectOptions\":[{\"title\":\"Dolores voluptatem e\"},{\"title\":\"Dolor in neque lorem\"}],\"select\":[],\"multiple\":true},{\"id\":4,\"label\":\"Id consequat Vel de\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"radio\",\"radioOptions\":[{\"text\":\"Aut aliquid facilis \",\"value\":\"\"},{\"text\":\"Irure autem quis con\",\"value\":\"\"}],\"selectedRadio\":\"\"},{\"id\":5,\"label\":\"Voluptas rerum eius \",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"file\",\"name\":[],\"select\":[],\"multiple\":false},{\"id\":6,\"label\":\"Temporibus accusamus\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"radio\",\"radioOptions\":[{\"text\":\"Dolores id molestiae\",\"value\":\"\"}],\"selectedRadio\":\"\"},{\"id\":7,\"label\":\"Asperiores id obcaec\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"select\",\"selectOptions\":[{\"title\":\"Irure sapiente conse\"}],\"select\":[],\"multiple\":false},{\"id\":8,\"label\":\"Voluptas quia non am\",\"placeHolder\":\"Reiciendis ea asperi\",\"requredField\":true,\"type\":\"text\",\"name\":\"\"},{\"id\":9,\"label\":\"Dolore Nam id et por\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"file\",\"name\":[],\"select\":[],\"multiple\":true}]', 1, 1, NULL, '2021-12-06 17:01:15', '2021-12-06 17:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exchange_rates`
--

CREATE TABLE `exchange_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(20,5) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exchange_rates`
--

INSERT INTO `exchange_rates` (`id`, `base_currency_code`, `exchange_rate`, `status`, `code`, `created_at`, `updated_at`) VALUES
(1, 'ZAR', 1.00000, 1, 'ZAR', '2021-04-17 17:26:24', NULL),
(2, 'ZAR', 0.25760, 1, 'AED', '2021-04-17 17:26:24', NULL),
(3, 'ZAR', 5.45190, 1, 'AFN', '2021-04-17 17:26:24', NULL),
(4, 'ZAR', 7.23470, 1, 'ALL', '2021-04-17 17:26:24', NULL),
(5, 'ZAR', 36.64160, 1, 'AMD', '2021-04-17 17:26:24', NULL),
(6, 'ZAR', 0.12560, 1, 'ANG', '2021-04-17 17:26:24', NULL),
(7, 'ZAR', 45.82150, 1, 'AOA', '2021-04-17 17:26:24', NULL),
(8, 'ZAR', 6.53410, 1, 'ARS', '2021-04-17 17:26:24', NULL),
(9, 'ZAR', 0.09054, 1, 'AUD', '2021-04-17 17:26:24', NULL),
(10, 'ZAR', 0.12560, 1, 'AWG', '2021-04-17 17:26:24', NULL),
(11, 'ZAR', 0.11940, 1, 'AZN', '2021-04-17 17:26:24', NULL),
(12, 'ZAR', 0.11450, 1, 'BAM', '2021-04-17 17:26:24', NULL),
(13, 'ZAR', 0.14030, 1, 'BBD', '2021-04-17 17:26:24', NULL),
(14, 'ZAR', 5.95610, 1, 'BDT', '2021-04-17 17:26:24', NULL),
(15, 'ZAR', 0.11450, 1, 'BGN', '2021-04-17 17:26:24', NULL),
(16, 'ZAR', 0.02637, 1, 'BHD', '2021-04-17 17:26:24', NULL),
(17, 'ZAR', 136.60090, 1, 'BIF', '2021-04-17 17:26:24', NULL),
(18, 'ZAR', 0.07014, 1, 'BMD', '2021-04-17 17:26:24', NULL),
(19, 'ZAR', 0.09346, 1, 'BND', '2021-04-17 17:26:24', NULL),
(20, 'ZAR', 0.48430, 1, 'BOB', '2021-04-17 17:26:24', NULL),
(21, 'ZAR', 0.39440, 1, 'BRL', '2021-04-17 17:26:24', NULL),
(22, 'ZAR', 0.07014, 1, 'BSD', '2021-04-17 17:26:24', NULL),
(23, 'ZAR', 5.23760, 1, 'BTN', '2021-04-17 17:26:24', NULL),
(24, 'ZAR', 0.75920, 1, 'BWP', '2021-04-17 17:26:24', NULL),
(25, 'ZAR', 0.18320, 1, 'BYN', '2021-04-17 17:26:24', NULL),
(26, 'ZAR', 0.14030, 1, 'BZD', '2021-04-17 17:26:24', NULL),
(27, 'ZAR', 0.08767, 1, 'CAD', '2021-04-17 17:26:24', NULL),
(28, 'ZAR', 139.54200, 1, 'CDF', '2021-04-17 17:26:24', NULL),
(29, 'ZAR', 0.06450, 1, 'CHF', '2021-04-17 17:26:24', NULL),
(30, 'ZAR', 49.39490, 1, 'CLP', '2021-04-17 17:26:24', NULL),
(31, 'ZAR', 0.45760, 1, 'CNY', '2021-04-17 17:26:24', NULL),
(32, 'ZAR', 259.39610, 1, 'COP', '2021-04-17 17:26:24', NULL),
(33, 'ZAR', 43.05870, 1, 'CRC', '2021-04-17 17:26:24', NULL),
(34, 'ZAR', 0.07014, 1, 'CUC', '2021-04-17 17:26:24', NULL),
(35, 'ZAR', 1.80620, 1, 'CUP', '2021-04-17 17:26:24', NULL),
(36, 'ZAR', 6.45790, 1, 'CVE', '2021-04-17 17:26:24', NULL),
(37, 'ZAR', 1.51920, 1, 'CZK', '2021-04-17 17:26:24', NULL),
(38, 'ZAR', 12.46610, 1, 'DJF', '2021-04-17 17:26:24', NULL),
(39, 'ZAR', 0.43690, 1, 'DKK', '2021-04-17 17:26:24', NULL),
(40, 'ZAR', 4.00730, 1, 'DOP', '2021-04-17 17:26:24', NULL),
(41, 'ZAR', 9.31300, 1, 'DZD', '2021-04-17 17:26:24', NULL),
(42, 'ZAR', 1.10000, 1, 'EGP', '2021-04-17 17:26:24', NULL),
(43, 'ZAR', 1.05220, 1, 'ERN', '2021-04-17 17:26:24', NULL),
(44, 'ZAR', 2.91500, 1, 'ETB', '2021-04-17 17:26:24', NULL),
(45, 'ZAR', 0.05857, 1, 'EUR', '2021-04-17 17:26:24', NULL),
(46, 'ZAR', 0.14270, 1, 'FJD', '2021-04-17 17:26:24', NULL),
(47, 'ZAR', 0.05079, 1, 'FKP', '2021-04-17 17:26:24', NULL),
(48, 'ZAR', 0.43690, 1, 'FOK', '2021-04-17 17:26:24', NULL),
(49, 'ZAR', 0.05079, 1, 'GBP', '2021-04-17 17:26:24', NULL),
(50, 'ZAR', 0.24080, 1, 'GEL', '2021-04-17 17:26:24', NULL),
(51, 'ZAR', 0.05079, 1, 'GGP', '2021-04-17 17:26:24', NULL),
(52, 'ZAR', 0.40380, 1, 'GHS', '2021-04-17 17:26:24', NULL),
(53, 'ZAR', 0.05079, 1, 'GIP', '2021-04-17 17:26:24', NULL),
(54, 'ZAR', 3.64900, 1, 'GMD', '2021-04-17 17:26:24', NULL),
(55, 'ZAR', 705.78900, 1, 'GNF', '2021-04-17 17:26:24', NULL),
(56, 'ZAR', 0.54240, 1, 'GTQ', '2021-04-17 17:26:24', NULL),
(57, 'ZAR', 14.93670, 1, 'GYD', '2021-04-17 17:26:24', NULL),
(58, 'ZAR', 0.54500, 1, 'HKD', '2021-04-17 17:26:24', NULL),
(59, 'ZAR', 1.68760, 1, 'HNL', '2021-04-17 17:26:24', NULL),
(60, 'ZAR', 0.44130, 1, 'HRK', '2021-04-17 17:26:24', NULL),
(61, 'ZAR', 5.76020, 1, 'HTG', '2021-04-17 17:26:24', NULL),
(62, 'ZAR', 21.17700, 1, 'HUF', '2021-04-17 17:26:24', NULL),
(63, 'ZAR', 1016.51300, 1, 'IDR', '2021-04-17 17:26:24', NULL),
(64, 'ZAR', 0.23050, 1, 'ILS', '2021-04-17 17:26:24', NULL),
(65, 'ZAR', 0.05079, 1, 'IMP', '2021-04-17 17:26:24', NULL),
(66, 'ZAR', 5.23780, 1, 'INR', '2021-04-17 17:26:24', NULL),
(67, 'ZAR', 102.71920, 1, 'IQD', '2021-04-17 17:26:24', NULL),
(68, 'ZAR', 2930.14490, 1, 'IRR', '2021-04-17 17:26:24', NULL),
(69, 'ZAR', 8.89460, 1, 'ISK', '2021-04-17 17:26:24', NULL),
(70, 'ZAR', 10.36300, 1, 'JMD', '2021-04-17 17:26:24', NULL),
(71, 'ZAR', 0.04973, 1, 'JOD', '2021-04-17 17:26:24', NULL),
(72, 'ZAR', 7.62690, 1, 'JPY', '2021-04-17 17:26:24', NULL),
(73, 'ZAR', 7.50730, 1, 'KES', '2021-04-17 17:26:24', NULL),
(74, 'ZAR', 5.95850, 1, 'KGS', '2021-04-17 17:26:24', NULL),
(75, 'ZAR', 285.01570, 1, 'KHR', '2021-04-17 17:26:24', NULL),
(76, 'ZAR', 0.09053, 1, 'KID', '2021-04-17 17:26:24', NULL),
(77, 'ZAR', 28.81310, 1, 'KMF', '2021-04-17 17:26:24', NULL),
(78, 'ZAR', 78.34500, 1, 'KRW', '2021-04-17 17:26:24', NULL),
(79, 'ZAR', 0.02102, 1, 'KWD', '2021-04-17 17:26:24', NULL),
(80, 'ZAR', 0.05845, 1, 'KYD', '2021-04-17 17:26:24', NULL),
(81, 'ZAR', 30.37680, 1, 'KZT', '2021-04-17 17:26:24', NULL),
(82, 'ZAR', 661.20530, 1, 'LAK', '2021-04-17 17:26:24', NULL),
(83, 'ZAR', 105.74250, 1, 'LBP', '2021-04-17 17:26:24', NULL),
(84, 'ZAR', 13.82620, 1, 'LKR', '2021-04-17 17:26:24', NULL),
(85, 'ZAR', 12.13410, 1, 'LRD', '2021-04-17 17:26:24', NULL),
(86, 'ZAR', 1.00000, 1, 'LSL', '2021-04-17 17:26:24', NULL),
(87, 'ZAR', 0.31780, 1, 'LYD', '2021-04-17 17:26:24', NULL),
(88, 'ZAR', 0.62660, 1, 'MAD', '2021-04-17 17:26:24', NULL),
(89, 'ZAR', 1.25640, 1, 'MDL', '2021-04-17 17:26:24', NULL),
(90, 'ZAR', 263.46560, 1, 'MGA', '2021-04-17 17:26:24', NULL),
(91, 'ZAR', 3.61280, 1, 'MKD', '2021-04-17 17:26:24', NULL),
(92, 'ZAR', 99.08010, 1, 'MMK', '2021-04-17 17:26:24', NULL),
(93, 'ZAR', 200.59820, 1, 'MNT', '2021-04-17 17:26:24', NULL),
(94, 'ZAR', 0.56140, 1, 'MOP', '2021-04-17 17:26:24', NULL),
(95, 'ZAR', 2.49950, 1, 'MRU', '2021-04-17 17:26:24', NULL),
(96, 'ZAR', 2.83440, 1, 'MUR', '2021-04-17 17:26:24', NULL),
(97, 'ZAR', 1.08120, 1, 'MVR', '2021-04-17 17:26:24', NULL),
(98, 'ZAR', 54.78930, 1, 'MWK', '2021-04-17 17:26:24', NULL),
(99, 'ZAR', 1.39820, 1, 'MXN', '2021-04-17 17:26:24', NULL),
(100, 'ZAR', 0.29010, 1, 'MYR', '2021-04-17 17:26:24', NULL),
(101, 'ZAR', 3.87280, 1, 'MZN', '2021-04-17 17:26:24', NULL),
(102, 'ZAR', 1.00000, 1, 'NAD', '2021-04-17 17:26:24', NULL),
(103, 'ZAR', 28.04390, 1, 'NGN', '2021-04-17 17:26:24', NULL),
(104, 'ZAR', 2.46390, 1, 'NIO', '2021-04-17 17:26:24', NULL),
(105, 'ZAR', 0.58700, 1, 'NOK', '2021-04-17 17:26:24', NULL),
(106, 'ZAR', 8.38010, 1, 'NPR', '2021-04-17 17:26:24', NULL),
(107, 'ZAR', 0.09809, 1, 'NZD', '2021-04-17 17:26:24', NULL),
(108, 'ZAR', 0.02697, 1, 'OMR', '2021-04-17 17:26:24', NULL),
(109, 'ZAR', 0.07014, 1, 'PAB', '2021-04-17 17:26:24', NULL),
(110, 'ZAR', 0.25470, 1, 'PEN', '2021-04-17 17:26:24', NULL),
(111, 'ZAR', 0.24640, 1, 'PGK', '2021-04-17 17:26:24', NULL),
(112, 'ZAR', 3.40050, 1, 'PHP', '2021-04-17 17:26:24', NULL),
(113, 'ZAR', 10.74320, 1, 'PKR', '2021-04-17 17:26:24', NULL),
(114, 'ZAR', 0.26660, 1, 'PLN', '2021-04-17 17:26:24', NULL),
(115, 'ZAR', 446.00920, 1, 'PYG', '2021-04-17 17:26:24', NULL),
(116, 'ZAR', 0.25530, 1, 'QAR', '2021-04-17 17:26:24', NULL),
(117, 'ZAR', 0.28830, 1, 'RON', '2021-04-17 17:26:24', NULL),
(118, 'ZAR', 6.89780, 1, 'RSD', '2021-04-17 17:26:24', NULL),
(119, 'ZAR', 5.32540, 1, 'RUB', '2021-04-17 17:26:24', NULL),
(120, 'ZAR', 69.90120, 1, 'RWF', '2021-04-17 17:26:24', NULL),
(121, 'ZAR', 0.26300, 1, 'SAR', '2021-04-17 17:26:24', NULL),
(122, 'ZAR', 0.56030, 1, 'SBD', '2021-04-17 17:26:24', NULL),
(123, 'ZAR', 1.30400, 1, 'SCR', '2021-04-17 17:26:24', NULL),
(124, 'ZAR', 26.82000, 1, 'SDG', '2021-04-17 17:26:24', NULL),
(125, 'ZAR', 0.59180, 1, 'SEK', '2021-04-17 17:26:24', NULL),
(126, 'ZAR', 0.09346, 1, 'SGD', '2021-04-17 17:26:24', NULL),
(127, 'ZAR', 0.05079, 1, 'SHP', '2021-04-17 17:26:24', NULL),
(128, 'ZAR', 719.03440, 1, 'SLL', '2021-04-17 17:26:24', NULL),
(129, 'ZAR', 40.72890, 1, 'SOS', '2021-04-17 17:26:24', NULL),
(130, 'ZAR', 0.99670, 1, 'SRD', '2021-04-17 17:26:24', NULL),
(131, 'ZAR', 12.41920, 1, 'SSP', '2021-04-17 17:26:24', NULL),
(132, 'ZAR', 1.43490, 1, 'STN', '2021-04-17 17:26:24', NULL),
(133, 'ZAR', 88.38260, 1, 'SYP', '2021-04-17 17:26:24', NULL),
(134, 'ZAR', 1.00000, 1, 'SZL', '2021-04-17 17:26:24', NULL),
(135, 'ZAR', 2.19130, 1, 'THB', '2021-04-17 17:26:24', NULL),
(136, 'ZAR', 0.79450, 1, 'TJS', '2021-04-17 17:26:24', NULL),
(137, 'ZAR', 0.24560, 1, 'TMT', '2021-04-17 17:26:24', NULL),
(138, 'ZAR', 0.19240, 1, 'TND', '2021-04-17 17:26:24', NULL),
(139, 'ZAR', 0.15900, 1, 'TOP', '2021-04-17 17:26:24', NULL),
(140, 'ZAR', 0.56580, 1, 'TRY', '2021-04-17 17:26:24', NULL),
(141, 'ZAR', 0.47570, 1, 'TTD', '2021-04-17 17:26:24', NULL),
(142, 'ZAR', 0.09053, 1, 'TVD', '2021-04-17 17:26:24', NULL),
(143, 'ZAR', 1.99190, 1, 'TWD', '2021-04-17 17:26:24', NULL),
(144, 'ZAR', 162.04330, 1, 'TZS', '2021-04-17 17:26:24', NULL),
(145, 'ZAR', 1.96640, 1, 'UAH', '2021-04-17 17:26:24', NULL),
(146, 'ZAR', 252.83760, 1, 'UGX', '2021-04-17 17:26:24', NULL),
(147, 'ZAR', 0.07015, 1, 'USD', '2021-04-17 17:26:24', NULL),
(148, 'ZAR', 3.11050, 1, 'UYU', '2021-04-17 17:26:24', NULL),
(149, 'ZAR', 733.46320, 1, 'UZS', '2021-04-17 17:26:24', NULL),
(150, 'ZAR', 165607.42190, 1, 'VES', '2021-04-17 17:26:24', NULL),
(151, 'ZAR', 1620.31230, 1, 'VND', '2021-04-17 17:26:24', NULL),
(152, 'ZAR', 7.61980, 1, 'VUV', '2021-04-17 17:26:24', NULL),
(153, 'ZAR', 0.17700, 1, 'WST', '2021-04-17 17:26:24', NULL),
(154, 'ZAR', 38.41750, 1, 'XAF', '2021-04-17 17:26:24', NULL),
(155, 'ZAR', 0.18940, 1, 'XCD', '2021-04-17 17:26:24', NULL),
(156, 'ZAR', 0.04910, 1, 'XDR', '2021-04-17 17:26:24', NULL),
(157, 'ZAR', 38.41750, 1, 'XOF', '2021-04-17 17:26:24', NULL),
(158, 'ZAR', 6.98890, 1, 'XPF', '2021-04-17 17:26:24', NULL),
(159, 'ZAR', 17.59020, 1, 'YER', '2021-04-17 17:26:24', NULL),
(160, 'ZAR', 1.55190, 1, 'ZMW', '2021-04-17 17:26:24', NULL);

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
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `featured` int(11) DEFAULT NULL,
  `timer_status` tinyint(4) DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leadtimes`
--

CREATE TABLE `leadtimes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `leadtime_date_from` date NOT NULL,
  `leadtime_date_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leadtimes`
--

INSERT INTO `leadtimes` (`id`, `user_id`, `leadtime_date_from`, `leadtime_date_to`, `created_at`, `updated_at`) VALUES
(1, 91, '2021-08-11', '2021-08-26', '2021-08-08 13:18:05', '2021-08-09 10:38:26');

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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_05_21_100000_create_teams_table', 1),
(7, '2020_05_21_200000_create_team_user_table', 1),
(8, '2020_05_21_300000_create_team_invitations_table', 1),
(9, '2021_04_12_165608_create_sessions_table', 1),
(10, '2018_08_08_100000_create_telescope_entries_table', 2),
(15, '2021_04_13_213340_create_permission_tables', 3),
(16, '2021_04_16_141730_add_timezone_column_to_users_table', 3),
(18, '2021_04_17_170230_create_exchange_rates_table', 4),
(19, '2021_04_17_174752_create_business_settings_table', 5),
(21, '2021_04_19_072342_create_user_details_table', 6),
(22, '2021_04_26_124912_create_email_templates_table', 7),
(24, '2021_05_06_160626_create_categories_table', 8),
(25, '2021_05_31_020915_create_custom_fields_table', 9),
(29, '2021_06_08_153240_create_category_custom_fields_table', 10),
(64, '2021_06_16_123304_create_products_table', 11),
(65, '2021_06_16_142033_create_product_category_custom_fields_table', 11),
(66, '2021_06_21_195529_create_product_images_table', 11),
(67, '2021_06_26_193100_create_attributes_table', 11),
(68, '2021_06_28_055649_create_category_attributes_table', 11),
(70, '2021_07_31_132809_create_variant_attributes_table', 12),
(72, '2021_07_31_094303_create_seller_requests_table', 13),
(73, '2021_08_02_181804_add_fields_to_user_details', 14),
(74, '2021_08_04_175038_create_bank_details_table', 14),
(75, '2021_08_05_053621_create_addresses_table', 14),
(76, '2021_08_05_064507_create_countries_table', 14),
(77, '2021_08_05_073138_create_business_details_table', 14),
(78, '2021_08_05_200150_create_billing_addresses_table', 14),
(79, '2021_08_06_163508_create_warehouse_addresses_table', 14),
(80, '2021_08_06_191334_create_leadtimes_table', 15),
(81, '2021_08_12_154638_add_fields_seller_requests_table', 16),
(82, '2021_08_18_193932_create_orders_table', 16),
(89, '2021_08_21_104448_create_admin_orders_table', 17),
(90, '2021_08_21_104537_create_seller_orders_table', 17),
(91, '2021_08_21_104621_create_order_detail_table', 17),
(103, '2021_08_24_080645_create_subscribers_table', 18),
(104, '2021_08_26_192258_create_transaction_types_table', 18),
(105, '2021_08_26_192259_create_transactions_table', 18),
(106, '2021_08_26_192544_create_user_balances_table', 18),
(107, '2021_08_28_003935_create_vendor_products_table', 18),
(110, '2021_08_24_075117_create_flash_deals_table', 19),
(111, '2021_08_26_064236_create_subscribers_table', 19),
(112, '2021_08_28_085457_create_volumetric_table', 19),
(113, '2021_08_30_112227_create_pages_table', 19),
(114, '2021_08_30_115614_create_blogs_table', 19),
(123, '2021_08_31_124825_create_flash_deal_products_table', 20),
(124, '2021_09_03_073548_create_blog_categories_table', 20),
(125, '2021_09_28_175018_add_seller_request_id_users_table', 20),
(129, '2021_09_30_173410_add_description_products_table', 21),
(130, '2021_09_30_200717_add_sku_vendor_products_table', 21),
(131, '2021_10_01_111716_add_variant_attribute_to_products_table', 21);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 17);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_order_id` bigint(20) UNSIGNED NOT NULL,
  `seller_order_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `item_order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '100000',
  `product_id` int(11) NOT NULL DEFAULT 0,
  `product_qty` int(11) NOT NULL DEFAULT 0,
  `product_amount` int(11) NOT NULL DEFAULT 0,
  `order_status` enum('In Progress','Dispatched','Completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `admin_order_id`, `seller_order_id`, `seller_id`, `item_order_no`, `product_id`, `product_qty`, `product_amount`, `order_status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 15, '100000', 1, 2, 67, 'In Progress', NULL, '2021-09-24 01:35:43', '2021-12-06 15:35:02'),
(2, 2, 2, 15, '100001', 3, 4, 50, 'Completed', NULL, '2021-09-24 05:34:12', '2021-09-24 06:52:05');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `type`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `keywords`, `meta_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Irure_ex_voluptatibu', 'Irure ex voluptatibu', 'Alias explicabo Per', NULL, 'Qui mollitia veritat', 'Consequatur Quo mol', 'Illo explicabo Quae', NULL, NULL, '2021-08-30 12:46:01', '2021-08-30 12:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('shafeeq.ahmed541@gmail.com', '$2y$10$X7XKC6lKEveNHrkLZRJ.5.zbfrx/5V/8236ccmtnb1lxwJpIZUD56', '2021-09-28 11:04:03'),
('shafeeque.ahmad541@gmail.com', '$2y$10$vIN8lE52.Co9AYbqAErvQeumk7OGiNCZw6enF8rVLHP.YVo6fCxX.', '2021-09-28 11:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(72, 'App\\Models\\User', 1, 'mobile', '4c35e633d78d279468f0327913ed3f84b82c7d7c6344c32534583a562303b627', '[\"*\"]', '2021-09-22 13:52:35', '2021-09-22 12:18:49', '2021-09-22 13:52:35'),
(73, 'App\\Models\\User', 1, 'mobile', 'b1730748cbeca9a236cf490a77530fe338d78f7cb91f1feff0fd3f31610dc76b', '[\"*\"]', '2021-10-01 19:11:08', '2021-09-22 13:46:51', '2021-10-01 19:11:08'),
(76, 'App\\Models\\User', 1, 'mobile', '799e46dbe2e466bb84615d8f22c70d751bfe4d189b0a31da57a7346b871aee26', '[\"*\"]', '2021-09-22 14:50:28', '2021-09-22 14:45:18', '2021-09-22 14:50:28'),
(78, 'App\\Models\\User', 1, 'mobile', '31d48eadf972f1acf677002a11707697a754a4c3265e08a9f7c7e209199049f8', '[\"*\"]', '2021-09-22 16:42:17', '2021-09-22 16:40:07', '2021-09-22 16:42:17'),
(82, 'App\\Models\\User', 1, 'mobile', '82a347be0fca3fad437a8ee4a87c6622eeed28ce1868b31ecb3ab6496df73d41', '[\"*\"]', NULL, '2021-09-23 08:17:34', '2021-09-23 08:17:34'),
(84, 'App\\Models\\User', 2, 'mobile', '7677e90e3edd01455e498d53d145975497150834aea1b88698562d0338486670', '[\"*\"]', '2021-09-23 09:42:55', '2021-09-23 09:42:49', '2021-09-23 09:42:55'),
(86, 'App\\Models\\User', 4, 'mobile', '1ea9247c74410f09bf20ffe48d3b34bbbbec7727cffff13c81126aa69bfb924b', '[\"*\"]', '2021-09-23 12:05:33', '2021-09-23 11:46:09', '2021-09-23 12:05:33'),
(90, 'App\\Models\\User', 8, 'mobile', '7d4e9e38085575ae8cff4001fb42634d71d0790d6a9efd9b635b405228e56bb5', '[\"*\"]', '2021-09-24 00:22:00', '2021-09-24 00:21:55', '2021-09-24 00:22:00'),
(91, 'App\\Models\\User', 10, 'mobile', 'ce6e3cbab146ed6b88d9a7886351d7b9669d17db2f937dbc28262a952a30d725', '[\"*\"]', NULL, '2021-09-24 00:45:31', '2021-09-24 00:45:31'),
(92, 'App\\Models\\User', 11, 'mobile', 'ba5e7d92f93ec640d8439936f3666fb125d254496cb42a95d5e2353cc104901c', '[\"*\"]', '2021-09-24 00:47:48', '2021-09-24 00:47:44', '2021-09-24 00:47:48'),
(93, 'App\\Models\\User', 11, 'mobile', '6a4bc12d6eac0e91faf2b5a6ddfcf4a9184ce8a31d48dbdf278684a842cd97d3', '[\"*\"]', '2021-09-24 01:01:18', '2021-09-24 00:57:27', '2021-09-24 01:01:18'),
(94, 'App\\Models\\User', 15, 'mobile', '190b75b8ddbfaad4b885c10eb7a46c575a806fd06e5a2d251856e752ba0f722f', '[\"*\"]', '2021-09-24 01:33:35', '2021-09-24 01:27:05', '2021-09-24 01:33:35'),
(95, 'App\\Models\\User', 1, 'mobile', '6a859c53bea958cb14d3a5c577b4f55f5dc890e6ba4c0495eaad0fa102539252', '[\"*\"]', '2021-09-24 04:59:07', '2021-09-24 01:34:25', '2021-09-24 04:59:07'),
(97, 'App\\Models\\User', 15, 'mobile', '18c8db72ad09e54b7252af5e24a790933892d87b2b328b81e2028435b38c53d0', '[\"*\"]', '2021-09-24 07:32:27', '2021-09-24 06:32:35', '2021-09-24 07:32:27'),
(99, 'App\\Models\\User', 15, 'mobile', '8ad9bfc63496a15124a01f53447e452366b560e1cfe267909243637c4a042eac', '[\"*\"]', '2021-09-25 06:07:44', '2021-09-25 06:05:48', '2021-09-25 06:07:44'),
(101, 'App\\Models\\User', 15, 'refresh', 'e26ae879591b6e955978d18b74d40fadb126a31ca530b855675f76be8778fd86', '[\"*\"]', NULL, '2021-09-25 06:08:53', '2021-09-25 06:08:53'),
(102, 'App\\Models\\User', 15, 'refresh', 'af6ee9ae425cea7ae1066a0d2bbfe4310d3b63a9a782d72e03f1cd10d0f0e4fe', '[\"*\"]', NULL, '2021-09-25 06:09:13', '2021-09-25 06:09:13'),
(103, 'App\\Models\\User', 15, 'refresh', '200a7e6d8092ca030487b4d1d63fdea56837ad9cbcb18b0c6630887af788e114', '[\"*\"]', NULL, '2021-09-25 06:09:32', '2021-09-25 06:09:32'),
(104, 'App\\Models\\User', 15, 'mobile', '61769189e22fa2354a6b72ba22abdec4869c3046bf785bc7573970cc52fc64d8', '[\"*\"]', '2021-09-25 06:10:53', '2021-09-25 06:10:10', '2021-09-25 06:10:53'),
(105, 'App\\Models\\User', 15, 'refresh', '309283f6264765c6bb432197bce4198be1cc2c0afc415c8facf86a10a3c8f61a', '[\"*\"]', NULL, '2021-09-25 06:10:11', '2021-09-25 06:10:11'),
(106, 'App\\Models\\User', 15, 'refresh', 'ccc4a396fa2b9d8c5cd54fd059e50ad7e5e586feef8bc9d0a11af7d863bbef29', '[\"*\"]', NULL, '2021-09-25 06:10:47', '2021-09-25 06:10:47'),
(107, 'App\\Models\\User', 15, 'refresh', 'bf6d3baff8708597c563b733c671d98832a4536fd272884456746080f8fa287b', '[\"*\"]', NULL, '2021-09-25 06:10:54', '2021-09-25 06:10:54'),
(108, 'App\\Models\\User', 15, 'mobile', '96bb1e9a0e1c7f7d4ab4970ca23cd10a2d8547c1de9a41c77fa9a97b8074df7e', '[\"*\"]', '2021-09-25 09:28:35', '2021-09-25 06:11:05', '2021-09-25 09:28:35'),
(109, 'App\\Models\\User', 15, 'refresh', '3b03b7fac949e56b426051e5971b3d1e07186d13003760c4313fbe097dcfea8f', '[\"*\"]', NULL, '2021-09-25 06:11:06', '2021-09-25 06:11:06'),
(110, 'App\\Models\\User', 1, 'mobile', '9216d53bc5c544058497a87b07c8bfd24eb4ed6661bbe7fb18cdc90d70a453d2', '[\"*\"]', '2021-09-25 06:28:42', '2021-09-25 06:23:16', '2021-09-25 06:28:42'),
(111, 'App\\Models\\User', 1, 'refresh', '0f505a6c7721ddc3a92ebef7b4e34735684fc9da9d3949c38e7b4ddfff2f9a19', '[\"*\"]', NULL, '2021-09-25 06:23:18', '2021-09-25 06:23:18'),
(112, 'App\\Models\\User', 1, 'mobile', 'ff7daf2cb41eb45b3c325bb65ec9038330485cf61cf8c785fae560d52678240a', '[\"*\"]', '2021-09-25 06:29:46', '2021-09-25 06:29:05', '2021-09-25 06:29:46'),
(113, 'App\\Models\\User', 1, 'mobile', '92774a83b4c4dc90f0457ee91d18c12247f785c08273878cef0cadc6d225ec55', '[\"*\"]', '2021-09-25 06:32:37', '2021-09-25 06:29:56', '2021-09-25 06:32:37'),
(114, 'App\\Models\\User', 1, 'mobile', '35acc90813aa29ef20b77ec11cbde89ea804de5ad0ed2fe22878bd9d750e8e16', '[\"*\"]', '2021-09-25 06:33:07', '2021-09-25 06:32:50', '2021-09-25 06:33:07'),
(115, 'App\\Models\\User', 1, 'mobile', '11e9662700a3e9cc6911105dc024bd2108a50405b6396c42f6c9f4a84b22e009', '[\"*\"]', '2021-09-25 06:45:10', '2021-09-25 06:33:25', '2021-09-25 06:45:10'),
(116, 'App\\Models\\User', 1, 'mobile', '69f8abcad475ae1c1fdd5fb554a2ea3cc9085bb5a0ba170781c2656d0928246b', '[\"*\"]', '2021-09-25 06:46:31', '2021-09-25 06:45:23', '2021-09-25 06:46:31'),
(117, 'App\\Models\\User', 1, 'mobile', '8852620f352bc1e8ec98fb7589e5f7869f8da1952f68037a7b6dc8391e23bf58', '[\"*\"]', '2021-09-25 06:47:16', '2021-09-25 06:46:53', '2021-09-25 06:47:16'),
(118, 'App\\Models\\User', 1, 'mobile', '96ba67b0e994a1fb5a5d69a443c0550a3cc4be0b7104ad3a89caa9c1634e2c6a', '[\"*\"]', '2021-09-25 06:49:28', '2021-09-25 06:48:51', '2021-09-25 06:49:28'),
(119, 'App\\Models\\User', 1, 'mobile', 'a3b211da7aa00f9be3a5dd1e5ca4915ef30732c72850b5996b2fbd9d90dde231', '[\"*\"]', '2021-09-25 06:55:29', '2021-09-25 06:55:02', '2021-09-25 06:55:29'),
(120, 'App\\Models\\User', 1, 'mobile', '6b485339ca6747ee7e1dd9426d2e942a930bf2300c7a0c9f91255eda0d3bce44', '[\"*\"]', '2021-09-25 06:59:16', '2021-09-25 06:56:41', '2021-09-25 06:59:16'),
(121, 'App\\Models\\User', 1, 'mobile', 'c9d37c8d4bd24b8af2a3cc29c208db2fd7123e027c1d5d369839a1b0bf4a659e', '[\"*\"]', '2021-09-25 08:28:53', '2021-09-25 06:59:41', '2021-09-25 08:28:53'),
(122, 'App\\Models\\User', 1, 'mobile', '98903d6e85e1385fd5034f478d86ae10b0a9a3bf3085b582c73dc9f5d4d0c837', '[\"*\"]', '2021-09-25 09:30:39', '2021-09-25 09:29:48', '2021-09-25 09:30:39'),
(123, 'App\\Models\\User', 1, 'mobile', '05d8ba4581ddfc61bb732f60422cbea5d6d7d01614ea4a53790fd298fb77e134', '[\"*\"]', '2021-09-25 09:45:13', '2021-09-25 09:31:53', '2021-09-25 09:45:13'),
(125, 'App\\Models\\User', 1, 'mobile', '38fc5d17b625d652bec526714233d83a1174edc0e2da8aea5cb4508be04692c4', '[\"*\"]', NULL, '2021-09-25 09:57:07', '2021-09-25 09:57:07'),
(126, 'App\\Models\\User', 1, 'mobile', '84aa3745fdae32520a029e45f315f1905019137464f6ea39c1005ce532a72382', '[\"*\"]', NULL, '2021-09-25 09:58:05', '2021-09-25 09:58:05'),
(127, 'App\\Models\\User', 1, 'mobile', '16be6966548fe3882ba151754f2cea3a068f27c9d7bb21779220c0f3300924b5', '[\"*\"]', NULL, '2021-09-25 09:59:17', '2021-09-25 09:59:17'),
(128, 'App\\Models\\User', 1, 'mobile', '77810abd49a406d0885a87716543d35023efadcd358ac634b704118a45b105af', '[\"*\"]', NULL, '2021-09-25 09:59:52', '2021-09-25 09:59:52'),
(129, 'App\\Models\\User', 1, 'mobile', '85a67e01807962f49b978872a0661e0cb0ec1d18b1bca3cc5ee362c9348a6c42', '[\"*\"]', NULL, '2021-09-25 10:01:13', '2021-09-25 10:01:13'),
(130, 'App\\Models\\User', 1, 'mobile', 'af2c8189b753b535f8f8b23a16b39143077fe98c1c3b885f42824d3609e031ca', '[\"*\"]', NULL, '2021-09-25 10:01:56', '2021-09-25 10:01:56'),
(131, 'App\\Models\\User', 1, 'mobile', '5acba39d47d77da3fc9c68b7b99212045c1b5ef4d095a033864ee3678314465d', '[\"*\"]', NULL, '2021-09-25 13:29:10', '2021-09-25 13:29:10'),
(132, 'App\\Models\\User', 1, 'mobile', '7c6d8c63a026fa2095b626ebb670a7caaecdf9d9037c46eeb52bf501917b2085', '[\"*\"]', NULL, '2021-09-25 14:08:37', '2021-09-25 14:08:37'),
(133, 'App\\Models\\User', 1, 'mobile', '07ab7173a9e5f546a80d5a0512c4bb78c4116f420c1ce52a18afa670773a7cdb', '[\"*\"]', '2021-09-25 14:10:56', '2021-09-25 14:09:19', '2021-09-25 14:10:56'),
(134, 'App\\Models\\User', 1, 'mobile', '8874a4b4c97bcacd7e6868abecd52f86c0fe79d7e8ea52f70c33bd436c60daac', '[\"*\"]', NULL, '2021-09-26 07:44:37', '2021-09-26 07:44:37'),
(139, 'App\\Models\\User', 1, 'mobile', '9c212648e206b4d08933095be60da94e67a8a3ef18345b92ef4813d5b4fb166b', '[\"*\"]', '2021-09-27 10:40:53', '2021-09-27 08:35:43', '2021-09-27 10:40:53'),
(140, 'App\\Models\\User', 16, 'mobile', 'fcdb06a99c2dfa074303b0edbd7a92c3f13d32199fd32480bb21b971bbc617e4', '[\"*\"]', '2021-09-27 10:44:31', '2021-09-27 10:42:54', '2021-09-27 10:44:31'),
(146, 'App\\Models\\User', 1, 'mobile', '29c58f587c709c31d055b67834ce27bab718971e8e9f0aef2d19001b178053ab', '[\"*\"]', '2021-09-28 14:03:45', '2021-09-28 13:26:40', '2021-09-28 14:03:45'),
(147, 'App\\Models\\User', 1, 'mobile', 'c3aeecc0c64b51ec465acbe65c924af86e3f226253f5a924894d890007648a0b', '[\"*\"]', '2021-09-29 03:58:34', '2021-09-29 03:56:48', '2021-09-29 03:58:34'),
(148, 'App\\Models\\User', 1, 'mobile', 'f37f8983c6e18185e28997576b0e8b274daa56e613f6b7dd4f09608817e36f27', '[\"*\"]', '2021-09-29 06:07:29', '2021-09-29 04:00:43', '2021-09-29 06:07:29'),
(149, 'App\\Models\\User', 15, 'mobile', '4caf1731ca424ee5dc96277740dcc099793f1437e756f45e93b501890666d612', '[\"*\"]', '2021-09-29 08:16:19', '2021-09-29 06:09:59', '2021-09-29 08:16:19'),
(151, 'App\\Models\\User', 1, 'mobile', '3faf9671bcfa730aacd444e3c47ff03e895051f8d93f637cfbe8184d00801759', '[\"*\"]', '2021-09-29 08:36:27', '2021-09-29 08:33:01', '2021-09-29 08:36:27'),
(152, 'App\\Models\\User', 1, 'mobile', 'dda7b4ed83a7ad3bc64065e127f7d8b1bcaac5285c4e045493bda780c030eee3', '[\"*\"]', '2021-09-29 10:39:55', '2021-09-29 08:36:42', '2021-09-29 10:39:55'),
(153, 'App\\Models\\User', 1, 'mobile', '695ffb5a5f46843c6e2346c08f382e9d259f6a0dff8c39c2cf40ec9a6c2ea798', '[\"*\"]', '2021-09-29 09:40:06', '2021-09-29 09:38:58', '2021-09-29 09:40:06'),
(154, 'App\\Models\\User', 1, 'mobile', '569ab4ff4000d4ffb2f9b73a490e9be7f075f93dbdab836ca5f0a0795e6ec6f6', '[\"*\"]', '2021-09-29 09:58:02', '2021-09-29 09:40:38', '2021-09-29 09:58:02'),
(155, 'App\\Models\\User', 1, 'mobile', 'eda1597d5f3e8e9b48fde8cfb265dfee90f62b0d4ed06c16156cbb1f96c6b0e0', '[\"*\"]', '2021-09-29 10:41:30', '2021-09-29 10:41:05', '2021-09-29 10:41:30'),
(156, 'App\\Models\\User', 1, 'mobile', '4ce107d6a99e5057ce1ff3fe04adbbd820fbebd8232374c129f2d9b7147f3bc2', '[\"*\"]', '2021-09-29 12:49:49', '2021-09-29 11:10:07', '2021-09-29 12:49:49'),
(159, 'App\\Models\\User', 1, 'mobile', '245c947ec144c0b2b83dab28f96cf960676b03d5ec51af135b4c1861d6f12830', '[\"*\"]', '2021-09-29 13:39:44', '2021-09-29 13:31:14', '2021-09-29 13:39:44'),
(160, 'App\\Models\\User', 1, 'mobile', 'd881af133c17a36f54d63b1b1a454fca83bca42a5427ad6c7eac2a1305ebbf86', '[\"*\"]', '2021-09-29 13:44:51', '2021-09-29 13:40:00', '2021-09-29 13:44:51'),
(161, 'App\\Models\\User', 1, 'mobile', '83a4c2936aef1f297f2cfe9c8cc40c87909c4d05244a539a7ddaed9db9d1040a', '[\"*\"]', '2021-09-29 13:45:27', '2021-09-29 13:45:02', '2021-09-29 13:45:27'),
(162, 'App\\Models\\User', 1, 'mobile', '8083ce63736e0fda468645a539995c10ca27f559e032f5620fee63c5e1e8be81', '[\"*\"]', '2021-09-29 13:58:37', '2021-09-29 13:50:33', '2021-09-29 13:58:37'),
(163, 'App\\Models\\User', 1, 'mobile', '81890b9747bca9f11d459d8c2c00e99748207bcc52203315700f968f6b4de6bc', '[\"*\"]', '2021-09-29 15:28:42', '2021-09-29 13:59:17', '2021-09-29 15:28:42'),
(164, 'App\\Models\\User', 1, 'mobile', '41bc473e1137acb3eedd83c6a054e13457471b82f638fb726b5e5b5d6886eb48', '[\"*\"]', NULL, '2021-09-29 15:28:48', '2021-09-29 15:28:48'),
(165, 'App\\Models\\User', 1, 'mobile', '2f5a99fbc99a198f2237f4e480c797be41dcb16c4807545ad603370cd6d8f47f', '[\"*\"]', '2021-09-29 15:32:04', '2021-09-29 15:29:02', '2021-09-29 15:32:04'),
(166, 'App\\Models\\User', 1, 'mobile', 'd899b83f4f45ae4e5e1152609ac5395d19911bf99261587c8c6e046efad6162f', '[\"*\"]', '2021-09-29 15:42:56', '2021-09-29 15:32:16', '2021-09-29 15:42:56'),
(167, 'App\\Models\\User', 1, 'mobile', '8876dbde549df637aaf151371a4049ef387859cca0b9c4c40d48532ba1d5eb55', '[\"*\"]', '2021-09-29 15:46:24', '2021-09-29 15:44:18', '2021-09-29 15:46:24'),
(168, 'App\\Models\\User', 1, 'mobile', '43a36f423651b02c5e9701005be631c0773d40e1536ced8e93930a9cb073fef3', '[\"*\"]', '2021-09-29 16:15:02', '2021-09-29 15:46:45', '2021-09-29 16:15:02'),
(169, 'App\\Models\\User', 1, 'mobile', '7244355db0ddd8efa661f9106ed9562707d836a66036bd5d01cbbf5676367f7d', '[\"*\"]', '2021-10-01 18:59:41', '2021-10-01 07:00:40', '2021-10-01 18:59:41'),
(170, 'App\\Models\\User', 1, 'mobile', '63d458ba7411b53d10262113f243d84cedd1ac5b10d61c927d4767a53d0c4712', '[\"*\"]', NULL, '2021-10-01 11:28:42', '2021-10-01 11:28:42'),
(172, 'App\\Models\\User', 1, 'mobile', 'e87d47482309e474581ca4cc357a1929c3673475c06d6c87af55b7956b8cb48f', '[\"*\"]', '2021-10-01 18:41:29', '2021-10-01 11:30:52', '2021-10-01 18:41:29'),
(173, 'App\\Models\\User', 1, 'mobile', '4c36817c5ba22fb4b7dceeda4a2d1ed1fbe4dac9a6dffc15a4d24dae676a2e6c', '[\"*\"]', '2021-10-01 19:11:31', '2021-10-01 19:11:28', '2021-10-01 19:11:31'),
(174, 'App\\Models\\User', 1, 'mobile', 'e350d8985717f8dd3d05c19aaa54758a05f6f7288fe360dbb5bc842576ee18ba', '[\"*\"]', '2021-10-01 19:16:23', '2021-10-01 19:16:18', '2021-10-01 19:16:23'),
(175, 'App\\Models\\User', 1, 'mobile', 'b2bddcaaeabe4cb0b73a01d479792adaf8ef6fa3384e38229197cf09748a427b', '[\"*\"]', '2021-10-01 19:34:24', '2021-10-01 19:34:18', '2021-10-01 19:34:24'),
(176, 'App\\Models\\User', 1, 'mobile', '13049ce7a2f9a885e1a14f116af1725571405b7ab28f1e09463649dc9107385f', '[\"*\"]', '2021-10-01 20:33:07', '2021-10-01 19:34:54', '2021-10-01 20:33:07'),
(177, 'App\\Models\\User', 1, 'mobile', '3bda58f72835df7ea9143a091c6f2c41b2333a5d0f3f10445b7c6c0753a420d8', '[\"*\"]', '2021-10-01 19:39:48', '2021-10-01 19:37:45', '2021-10-01 19:39:48'),
(178, 'App\\Models\\User', 15, 'mobile', 'b1f68cf945719bc90c4d2cbace080cc4818d0653db6ba3cf42dbbc2a793fa1cf', '[\"*\"]', '2021-10-01 20:51:15', '2021-10-01 19:41:36', '2021-10-01 20:51:15'),
(179, 'App\\Models\\User', 1, 'mobile', '92b00df253bedc5407ca413b9bdeae9ddedacf6b6836f17dc267e8f3df2cdb6d', '[\"*\"]', '2021-12-06 15:39:24', '2021-12-06 15:27:34', '2021-12-06 15:39:24'),
(180, 'App\\Models\\User', 1, 'mobile', '929c329cee86b31cbe4457247b4d34064d1e0a6a1f36f2f502c41f0a6fb703ad', '[\"*\"]', '2021-12-06 17:02:53', '2021-12-06 15:51:17', '2021-12-06 17:02:53'),
(181, 'App\\Models\\User', 1, 'mobile', 'bf3636ac440c7c70a1e0ad83cc7427e0760b97328a54e1a756ea106179cb3911', '[\"*\"]', '2021-12-12 12:35:57', '2021-12-06 17:14:50', '2021-12-12 12:35:57'),
(182, 'App\\Models\\User', 1, 'mobile', 'a1b7ed26b686947337ba545269229697f858f40617c0f43612856b2f3d285fad', '[\"*\"]', '2021-12-12 12:36:20', '2021-12-12 12:35:58', '2021-12-12 12:36:20'),
(183, 'App\\Models\\User', 1, 'mobile', '4160588388c82f467679c50a268454a77cccd8618b68def270e6351da18710c1', '[\"*\"]', NULL, '2021-12-12 12:38:47', '2021-12-12 12:38:47'),
(184, 'App\\Models\\User', 1, 'mobile', '98e49968df9f953f67549c83dbca531f721810dfcf219dde25fe73bc8dc87a5c', '[\"*\"]', '2021-12-12 12:46:53', '2021-12-12 12:38:47', '2021-12-12 12:46:53'),
(185, 'App\\Models\\User', 1, 'mobile', '5aa743678a9b3b59b710b9c0d0df83e0f583ffc41fb1e197aac4e96e2e5949fc', '[\"*\"]', '2021-12-12 12:38:49', '2021-12-12 12:38:47', '2021-12-12 12:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED NOT NULL,
  `plid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'product list id',
  `msin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'multi junction standerd identification number each variant have unique msin but same plid',
  `is_variant` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `selling_price` double(8,2) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `low_qty_alert` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` double(8,2) NOT NULL DEFAULT 0.00,
  `height` double(8,2) NOT NULL DEFAULT 0.00,
  `length` double(8,2) NOT NULL DEFAULT 0.00,
  `volumetric_weight` double(8,2) NOT NULL DEFAULT 0.00,
  `weight` double(8,2) NOT NULL DEFAULT 0.00,
  `video_provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','rejected','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `short_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_attribute` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `sub_title`, `added_by`, `plid`, `msin`, `is_variant`, `parent_id`, `price`, `cost`, `selling_price`, `qty`, `low_qty_alert`, `description`, `color`, `width`, `height`, `length`, `volumetric_weight`, `weight`, `video_provider`, `video_url`, `category_id`, `status`, `sku`, `slug`, `deleted_at`, `created_at`, `updated_at`, `short_description`, `long_description`, `variant_attribute`) VALUES
(1, 'Qui eum aut qui labo', 'Pariatur Veniam ve', 15, '10000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.00, 1.00, 1.00, 1.00, 1.00, NULL, NULL, 2, 'approved', 'Qui-eum-aut-qui-labo', 'qui-eum-aut-qui-labo', NULL, '2021-10-01 20:21:40', '2021-10-01 20:22:11', NULL, NULL, NULL),
(2, 'Qui eum aut qui labo - blue-xl', NULL, 15, '10001', NULL, 1, 1, NULL, NULL, NULL, 54, NULL, NULL, 'blue', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Qui eum aut qui labo - blue-xl', 'qui-eum-aut-qui-labo-blue-xl', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59', NULL, NULL, '[\"blue\",\"xl\"]'),
(3, 'Qui eum aut qui labo - blue-sm', NULL, 15, '10002', NULL, 1, 1, NULL, NULL, NULL, 54, NULL, NULL, 'blue', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Qui eum aut qui labo - blue-sm', 'qui-eum-aut-qui-labo-blue-sm', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59', NULL, NULL, '[\"blue\",\"sm\"]'),
(4, 'Qui eum aut qui labo - orange-xl', NULL, 15, '10003', NULL, 1, 1, NULL, NULL, NULL, 54, NULL, NULL, 'orange', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Qui eum aut qui labo - orange-xl', 'qui-eum-aut-qui-labo-orange-xl', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59', NULL, NULL, '[\"orange\",\"xl\"]'),
(5, 'Qui eum aut qui labo - orange-sm', NULL, 15, '10004', NULL, 1, 1, NULL, NULL, NULL, 54, NULL, NULL, 'orange', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Qui eum aut qui labo - orange-sm', 'qui-eum-aut-qui-labo-orange-sm', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59', NULL, NULL, '[\"orange\",\"sm\"]'),
(6, 'Voluptatem laudanti', 'Voluptatem Amet el', 1, '10005', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'rejected', 'Voluptatem-laudanti', 'voluptatem-laudanti', NULL, '2021-12-06 15:30:15', '2021-12-06 15:34:35', '<p>Esse impedit, quod n.</p>', '<p>Rerum cillum tenetur.</p>', NULL),
(7, 'Voluptatem laudanti - red-xl', NULL, 1, '10006', NULL, 1, 6, NULL, NULL, NULL, 50, NULL, NULL, 'red', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Voluptatem laudanti - red-xl', 'voluptatem-laudanti-red-xl', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', NULL, NULL, '[\"red\",\"xl\"]'),
(8, 'Voluptatem laudanti - red-sm', NULL, 1, '10007', NULL, 1, 6, NULL, NULL, NULL, 50, NULL, NULL, 'red', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Voluptatem laudanti - red-sm', 'voluptatem-laudanti-red-sm', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', NULL, NULL, '[\"red\",\"sm\"]'),
(9, 'Voluptatem laudanti - red-xs', NULL, 1, '10008', NULL, 1, 6, NULL, NULL, NULL, 50, NULL, NULL, 'red', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Voluptatem laudanti - red-xs', 'voluptatem-laudanti-red-xs', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', NULL, NULL, '[\"red\",\"xs\"]'),
(10, 'Voluptatem laudanti - green-lg', NULL, 1, '10009', NULL, 1, 6, NULL, NULL, NULL, 50, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Voluptatem laudanti - green-lg', 'voluptatem-laudanti-green-lg', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', NULL, NULL, '[\"green\",\"lg\"]'),
(11, 'Voluptatem laudanti - green-xl', NULL, 1, '10010', NULL, 1, 6, NULL, NULL, NULL, 50, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Voluptatem laudanti - green-xl', 'voluptatem-laudanti-green-xl', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', NULL, NULL, '[\"green\",\"xl\"]'),
(12, 'Voluptatem laudanti - green-sm', NULL, 1, '10011', NULL, 1, 6, NULL, NULL, NULL, 50, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Voluptatem laudanti - green-sm', 'voluptatem-laudanti-green-sm', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', NULL, NULL, '[\"green\",\"sm\"]'),
(13, 'Voluptatem laudanti - green-xs', NULL, 1, '10012', NULL, 1, 6, NULL, NULL, NULL, 50, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Voluptatem laudanti - green-xs', 'voluptatem-laudanti-green-xs', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', NULL, NULL, '[\"green\",\"xs\"]'),
(14, 'Voluptatem laudanti - yellow-lg', NULL, 1, '10013', NULL, 1, 6, NULL, NULL, NULL, 50, NULL, NULL, 'yellow', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Voluptatem laudanti - yellow-lg', 'voluptatem-laudanti-yellow-lg', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', NULL, NULL, '[\"yellow\",\"lg\"]'),
(15, 'Voluptatem laudanti - yellow-xl', NULL, 1, '10014', NULL, 1, 6, NULL, NULL, NULL, 50, NULL, NULL, 'yellow', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Voluptatem laudanti - yellow-xl', 'voluptatem-laudanti-yellow-xl', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', NULL, NULL, '[\"yellow\",\"xl\"]'),
(16, 'Voluptatem laudanti - yellow-sm', NULL, 1, '10015', NULL, 1, 6, NULL, NULL, NULL, 50, NULL, NULL, 'yellow', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Voluptatem laudanti - yellow-sm', 'voluptatem-laudanti-yellow-sm', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', NULL, NULL, '[\"yellow\",\"sm\"]'),
(17, 'Beatae dolores sed a', 'Laborum Adipisicing', 1, '10016', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae-dolores-sed-a', 'beatae-dolores-sed-a', NULL, '2021-12-06 15:54:51', '2021-12-06 15:56:19', '<p>Reprehenderit soluta.</p>', '<p>Recusandae. Consequu.</p>', NULL),
(18, 'Beatae dolores sed a - red-xl', NULL, 1, '10017', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'red', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - red-xl', 'beatae-dolores-sed-a-red-xl', NULL, '2021-12-06 15:58:35', '2021-12-06 15:58:35', NULL, NULL, '[\"red\",\"xl\"]'),
(19, 'Beatae dolores sed a - red-lg', NULL, 1, '10018', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'red', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - red-lg', 'beatae-dolores-sed-a-red-lg', NULL, '2021-12-06 15:58:35', '2021-12-06 15:58:35', NULL, NULL, '[\"red\",\"lg\"]'),
(20, 'Beatae dolores sed a - red-sm', NULL, 1, '10019', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'red', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - red-sm', 'beatae-dolores-sed-a-red-sm', NULL, '2021-12-06 15:58:35', '2021-12-06 15:58:35', NULL, NULL, '[\"red\",\"sm\"]'),
(21, 'Beatae dolores sed a - red-xs', NULL, 1, '10020', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'red', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - red-xs', 'beatae-dolores-sed-a-red-xs', NULL, '2021-12-06 15:58:35', '2021-12-06 15:58:35', NULL, NULL, '[\"red\",\"xs\"]'),
(22, 'Beatae dolores sed a - green-xl', NULL, 1, '10021', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - green-xl', 'beatae-dolores-sed-a-green-xl', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', NULL, NULL, '[\"green\",\"xl\"]'),
(23, 'Beatae dolores sed a - green-lg', NULL, 1, '10022', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - green-lg', 'beatae-dolores-sed-a-green-lg', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', NULL, NULL, '[\"green\",\"lg\"]'),
(24, 'Beatae dolores sed a - green-sm', NULL, 1, '10023', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - green-sm', 'beatae-dolores-sed-a-green-sm', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', NULL, NULL, '[\"green\",\"sm\"]'),
(25, 'Beatae dolores sed a - green-xs', NULL, 1, '10024', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - green-xs', 'beatae-dolores-sed-a-green-xs', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', NULL, NULL, '[\"green\",\"xs\"]'),
(26, 'Beatae dolores sed a - yellow-xl', NULL, 1, '10025', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'yellow', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - yellow-xl', 'beatae-dolores-sed-a-yellow-xl', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', NULL, NULL, '[\"yellow\",\"xl\"]'),
(27, 'Beatae dolores sed a - yellow-lg', NULL, 1, '10026', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'yellow', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - yellow-lg', 'beatae-dolores-sed-a-yellow-lg', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', NULL, NULL, '[\"yellow\",\"lg\"]'),
(28, 'Beatae dolores sed a - yellow-sm', NULL, 1, '10027', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'yellow', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - yellow-sm', 'beatae-dolores-sed-a-yellow-sm', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', NULL, NULL, '[\"yellow\",\"sm\"]'),
(29, 'Beatae dolores sed a - yellow-xs', NULL, 1, '10028', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'yellow', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - yellow-xs', 'beatae-dolores-sed-a-yellow-xs', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', NULL, NULL, '[\"yellow\",\"xs\"]'),
(30, 'Beatae dolores sed a - orange-xl', NULL, 1, '10029', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'orange', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - orange-xl', 'beatae-dolores-sed-a-orange-xl', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', NULL, NULL, '[\"orange\",\"xl\"]'),
(31, 'Beatae dolores sed a - orange-lg', NULL, 1, '10030', NULL, 1, 17, NULL, NULL, NULL, 14, NULL, NULL, 'orange', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Beatae dolores sed a - orange-lg', 'beatae-dolores-sed-a-orange-lg', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', NULL, NULL, '[\"orange\",\"lg\"]'),
(32, 'Nulla nostrud eos si', 'Modi consequat Culp', 1, '10031', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'approved', 'Nulla-nostrud-eos-si', 'nulla-nostrud-eos-si', NULL, '2021-12-06 16:08:33', '2021-12-06 16:08:36', NULL, NULL, NULL),
(33, 'Id enim qui pariatur', 'Dolor aliquip archit', 1, '10032', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id-enim-qui-pariatur', 'id-enim-qui-pariatur', NULL, '2021-12-06 16:10:39', '2021-12-06 16:14:04', NULL, NULL, NULL),
(34, 'Id enim qui pariatur - red-xl', NULL, 1, '10033', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'red', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - red-xl', 'id-enim-qui-pariatur-red-xl', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"red\",\"xl\"]'),
(35, 'Id enim qui pariatur - red-lg', NULL, 1, '10034', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'red', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - red-lg', 'id-enim-qui-pariatur-red-lg', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"red\",\"lg\"]'),
(36, 'Id enim qui pariatur - red-sm', NULL, 1, '10035', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'red', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - red-sm', 'id-enim-qui-pariatur-red-sm', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"red\",\"sm\"]'),
(37, 'Id enim qui pariatur - red-xs', NULL, 1, '10036', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'red', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - red-xs', 'id-enim-qui-pariatur-red-xs', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"red\",\"xs\"]'),
(38, 'Id enim qui pariatur - green-xl', NULL, 1, '10037', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - green-xl', 'id-enim-qui-pariatur-green-xl', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"green\",\"xl\"]'),
(39, 'Id enim qui pariatur - green-lg', NULL, 1, '10038', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - green-lg', 'id-enim-qui-pariatur-green-lg', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"green\",\"lg\"]'),
(40, 'Id enim qui pariatur - green-sm', NULL, 1, '10039', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - green-sm', 'id-enim-qui-pariatur-green-sm', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"green\",\"sm\"]'),
(41, 'Id enim qui pariatur - green-xs', NULL, 1, '10040', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'green', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - green-xs', 'id-enim-qui-pariatur-green-xs', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"green\",\"xs\"]'),
(42, 'Id enim qui pariatur - black-xl', NULL, 1, '10041', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'black', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - black-xl', 'id-enim-qui-pariatur-black-xl', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"black\",\"xl\"]'),
(43, 'Id enim qui pariatur - black-lg', NULL, 1, '10042', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'black', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - black-lg', 'id-enim-qui-pariatur-black-lg', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"black\",\"lg\"]'),
(44, 'Id enim qui pariatur - black-sm', NULL, 1, '10043', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'black', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - black-sm', 'id-enim-qui-pariatur-black-sm', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"black\",\"sm\"]'),
(45, 'Id enim qui pariatur - black-xs', NULL, 1, '10044', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'black', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - black-xs', 'id-enim-qui-pariatur-black-xs', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"black\",\"xs\"]'),
(46, 'Id enim qui pariatur - blue-xl', NULL, 1, '10045', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'blue', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - blue-xl', 'id-enim-qui-pariatur-blue-xl', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"blue\",\"xl\"]'),
(47, 'Id enim qui pariatur - blue-lg', NULL, 1, '10046', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'blue', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - blue-lg', 'id-enim-qui-pariatur-blue-lg', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"blue\",\"lg\"]'),
(48, 'Id enim qui pariatur - blue-sm', NULL, 1, '10047', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'blue', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - blue-sm', 'id-enim-qui-pariatur-blue-sm', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"blue\",\"sm\"]'),
(49, 'Id enim qui pariatur - blue-xs', NULL, 1, '10048', NULL, 1, 33, NULL, NULL, NULL, 34, NULL, NULL, 'blue', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 2, 'approved', 'Id enim qui pariatur - blue-xs', 'id-enim-qui-pariatur-blue-xs', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', NULL, NULL, '[\"blue\",\"xs\"]'),
(50, 'Porro explicabo Adi', 'Rerum illo enim amet', 1, '10049', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'approved', 'Porro-explicabo-Adi', 'porro-explicabo-adi', NULL, '2021-12-12 12:45:50', '2021-12-12 12:45:57', '<p>Sed obcaecati offici.</p>', '<p>Maiores neque evenie.</p>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category_custom_fields`
--

CREATE TABLE `product_category_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_custom_field_id` bigint(20) UNSIGNED NOT NULL,
  `fields` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_category_custom_fields`
--

INSERT INTO `product_category_custom_fields` (`id`, `product_id`, `category_custom_field_id`, `fields`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '{\"id\":1,\"custom_field_id\":1,\"category_id\":2,\"order_level\":0,\"user_id\":null,\"status\":1,\"deleted_at\":null,\"created_at\":\"2021-08-15T12:47:21.000000Z\",\"updated_at\":\"2021-08-15T12:47:21.000000Z\",\"fields\":[{\"id\":1,\"label\":\"First name\",\"name\":\"shafeeque\",\"placeHolder\":\"Enter First Name\",\"requredField\":true,\"type\":\"text\"},{\"id\":2,\"label\":\"Middle Name\",\"placeHolder\":\"Enter Middle Name\",\"requredField\":false,\"type\":\"text\",\"name\":\"\"},{\"id\":3,\"label\":\"Last Name\",\"placeHolder\":\"Enter Last Name\",\"requredField\":false,\"type\":\"text\",\"name\":\"ahmad\"}],\"title\":\"Text Fields\",\"collapse\":\"{\\\"open\\\":false,\\\"submit\\\":false,\\\"loader\\\":false}\",\"hidden\":1}', NULL, '2021-10-01 20:22:11', '2021-10-01 20:22:11'),
(2, 6, 1, '{\"id\":1,\"custom_field_id\":1,\"category_id\":2,\"order_level\":0,\"user_id\":null,\"status\":1,\"deleted_at\":null,\"created_at\":\"2021-08-15T12:47:21.000000Z\",\"updated_at\":\"2021-08-15T12:47:21.000000Z\",\"fields\":[{\"id\":1,\"label\":\"First name\",\"name\":\"shafeeque\",\"placeHolder\":\"Enter First Name\",\"requredField\":true,\"type\":\"text\"},{\"id\":2,\"label\":\"Middle Name\",\"placeHolder\":\"Enter Middle Name\",\"requredField\":false,\"type\":\"text\",\"name\":\"\"},{\"id\":3,\"label\":\"Last Name\",\"placeHolder\":\"Enter Last Name\",\"requredField\":false,\"type\":\"text\",\"name\":\"ahmad\"}],\"title\":\"Text Fields\",\"collapse\":{\"open\":true,\"submit\":false,\"loader\":false},\"hidden\":1}', NULL, '2021-12-06 15:31:44', '2021-12-06 15:31:44'),
(3, 6, 3, '{\"id\":3,\"custom_field_id\":2,\"category_id\":2,\"order_level\":0,\"user_id\":null,\"status\":1,\"deleted_at\":null,\"created_at\":\"2021-08-15T12:47:43.000000Z\",\"updated_at\":\"2021-08-15T12:47:43.000000Z\",\"fields\":[{\"id\":2,\"label\":\"Course\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"select\",\"selectOptions\":[{\"title\":\"PHP\"},{\"title\":\"Dot Net\"},{\"title\":\"Wordpress\"}],\"select\":[{\"title\":\"PHP\"}],\"multiple\":true},{\"id\":3,\"label\":\"Gender\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"select\",\"selectOptions\":[{\"title\":\"Male\"},{\"title\":\"Female\"}],\"select\":{\"title\":\"Male\"},\"multiple\":false}],\"title\":\"Select Fields\",\"collapse\":{\"open\":true,\"submit\":false,\"loader\":false},\"hidden\":0}', NULL, '2021-12-06 15:31:49', '2021-12-06 15:31:49'),
(4, 17, 1, '{\"id\":1,\"custom_field_id\":1,\"category_id\":2,\"order_level\":0,\"user_id\":null,\"status\":1,\"deleted_at\":null,\"created_at\":\"2021-08-15T12:47:21.000000Z\",\"updated_at\":\"2021-08-15T12:47:21.000000Z\",\"fields\":[{\"id\":1,\"label\":\"First name\",\"name\":\"shafeeque\",\"placeHolder\":\"Enter First Name\",\"requredField\":true,\"type\":\"text\"},{\"id\":2,\"label\":\"Middle Name\",\"placeHolder\":\"Enter Middle Name\",\"requredField\":false,\"type\":\"text\",\"name\":\"\"},{\"id\":3,\"label\":\"Last Name\",\"placeHolder\":\"Enter Last Name\",\"requredField\":false,\"type\":\"text\",\"name\":\"ahmad\"}],\"title\":\"Text Fields\",\"collapse\":{\"open\":true,\"submit\":false,\"loader\":false},\"hidden\":1}', NULL, '2021-12-06 15:56:09', '2021-12-06 15:56:09'),
(5, 17, 3, '{\"id\":3,\"custom_field_id\":2,\"category_id\":2,\"order_level\":0,\"user_id\":null,\"status\":1,\"deleted_at\":null,\"created_at\":\"2021-08-15T12:47:43.000000Z\",\"updated_at\":\"2021-08-15T12:47:43.000000Z\",\"fields\":[{\"id\":2,\"label\":\"Course\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"select\",\"selectOptions\":[{\"title\":\"PHP\"},{\"title\":\"Dot Net\"},{\"title\":\"Wordpress\"}],\"select\":[{\"title\":\"PHP\"},{\"title\":\"Dot Net\"}],\"multiple\":true},{\"id\":3,\"label\":\"Gender\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"select\",\"selectOptions\":[{\"title\":\"Male\"},{\"title\":\"Female\"}],\"select\":{\"title\":\"Male\"},\"multiple\":false}],\"title\":\"Select Fields\",\"collapse\":{\"open\":true,\"submit\":false,\"loader\":false},\"hidden\":0}', NULL, '2021-12-06 15:56:19', '2021-12-06 15:56:19'),
(6, 33, 1, '{\"id\":1,\"custom_field_id\":1,\"category_id\":2,\"order_level\":0,\"user_id\":null,\"status\":1,\"deleted_at\":null,\"created_at\":\"2021-08-15T12:47:21.000000Z\",\"updated_at\":\"2021-08-15T12:47:21.000000Z\",\"fields\":[{\"id\":1,\"label\":\"First name\",\"name\":\"shafeeque\",\"placeHolder\":\"Enter First Name\",\"requredField\":true,\"type\":\"text\"},{\"id\":2,\"label\":\"Middle Name\",\"placeHolder\":\"Enter Middle Name\",\"requredField\":false,\"type\":\"text\",\"name\":\"\"},{\"id\":3,\"label\":\"Last Name\",\"placeHolder\":\"Enter Last Name\",\"requredField\":false,\"type\":\"text\",\"name\":\"ahmad\"}],\"title\":\"Text Fields\",\"collapse\":{\"open\":true,\"submit\":false,\"loader\":false},\"hidden\":1}', NULL, '2021-12-06 16:12:14', '2021-12-06 16:12:14'),
(7, 33, 2, '{\"id\":2,\"custom_field_id\":3,\"category_id\":2,\"order_level\":0,\"user_id\":null,\"status\":1,\"deleted_at\":null,\"created_at\":\"2021-08-15T12:47:33.000000Z\",\"updated_at\":\"2021-08-15T12:47:33.000000Z\",\"fields\":[{\"id\":3,\"label\":\"Profile\",\"placeHolder\":\"\",\"requredField\":true,\"type\":\"file\",\"name\":{\"$path\":\"\"},\"select\":[\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/customFields\\/0VBqtQmk5eR1gCzII8c9W0oFDVqNa1.png\"],\"multiple\":false},{\"id\":4,\"label\":\"Cover Photos\",\"placeHolder\":\"\",\"requredField\":false,\"type\":\"file\",\"name\":[{\"$path\":\"\"}],\"select\":[\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/customFields\\/UKupCp5deT7fn9nKRpmpvO6Z3N9pip.png\",\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/customFields\\/Is1bMuKKMEjMcuARCSe2oOHtGWtIiV.png\",\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/customFields\\/WeurSzSQdg7EWswFpUMNhEn3CTPqwy.png\"],\"multiple\":true}],\"title\":\"File Field\",\"collapse\":{\"open\":true,\"submit\":false,\"loader\":false},\"hidden\":0}', NULL, '2021-12-06 16:14:04', '2021-12-06 16:14:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('primary','file1','file2','file3','file4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'primary',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `is_primary`, `url`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/1T5TYd69peGQsKCw6dkqZho2rnppxB.jpg', 'primary', NULL, '2021-10-01 20:21:59', NULL),
(2, 2, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/niPdNR2col6mn5pepzFpAgNFksJvAb.png', 'primary', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59'),
(3, 3, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/niPdNR2col6mn5pepzFpAgNFksJvAb.png', 'primary', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59'),
(4, 4, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/DRr1ThKK7cHeQ7GsHJIBAXbuGbiSgW.png', 'primary', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59'),
(5, 5, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/DRr1ThKK7cHeQ7GsHJIBAXbuGbiSgW.png', 'primary', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59'),
(6, 6, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/84EzHoa94ulp5jq77pYibMZeTxXQas.png', 'primary', NULL, '2021-12-06 15:31:02', NULL),
(7, 6, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/dWKnJZkeFealsuO5C4V9vJkIXMdpVR.jpg', 'file1', NULL, '2021-12-06 15:31:02', NULL),
(8, 6, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/xbf4VQuLEKWwWDTE7eZUFzTET5PTni.png', 'file2', NULL, '2021-12-06 15:31:03', NULL),
(9, 6, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/i0EA3mYtOETB7eDmAZtZToOL2EML9A.png', 'file3', NULL, '2021-12-06 15:31:03', NULL),
(10, 6, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/m4iIj1eKMA5zQqwiLzxbA0JFTBYCEI.png', 'file4', NULL, '2021-12-06 15:31:04', NULL),
(11, 7, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/wwPCq5v1cXkjaEsRbEeHAuxptRj5q0.png', 'primary', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22'),
(12, 8, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/wwPCq5v1cXkjaEsRbEeHAuxptRj5q0.png', 'primary', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22'),
(13, 9, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/wwPCq5v1cXkjaEsRbEeHAuxptRj5q0.png', 'primary', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22'),
(14, 10, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/09kIyk89KhPmszw4jcF24wgiIgphaD.png', 'primary', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22'),
(15, 11, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/09kIyk89KhPmszw4jcF24wgiIgphaD.png', 'primary', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22'),
(16, 12, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/09kIyk89KhPmszw4jcF24wgiIgphaD.png', 'primary', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22'),
(17, 13, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/09kIyk89KhPmszw4jcF24wgiIgphaD.png', 'primary', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22'),
(18, 14, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/7zcRoHDQge66jJISNLYF1X6zrhRQ4Y.png', 'primary', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22'),
(19, 15, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/7zcRoHDQge66jJISNLYF1X6zrhRQ4Y.png', 'primary', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22'),
(20, 16, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/7zcRoHDQge66jJISNLYF1X6zrhRQ4Y.png', 'primary', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22'),
(21, 17, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/kxUEsHiVUnQhaigu4fEMNn42gDi0RI.png', 'primary', NULL, '2021-12-06 15:55:28', NULL),
(22, 17, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/L9SNmqrSgYiS7TQPAJMUDGBg6Qypit.png', 'file1', NULL, '2021-12-06 15:55:28', NULL),
(23, 17, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/rmilZkoFI6EfoAs5epRZQEPhturu10.png', 'file3', NULL, '2021-12-06 15:55:28', NULL),
(24, 18, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/K79SsYwz1NIGDwTsYKyo3DAzw4ddlk.png', 'primary', NULL, '2021-12-06 15:58:35', '2021-12-06 15:58:35'),
(25, 19, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/K79SsYwz1NIGDwTsYKyo3DAzw4ddlk.png', 'primary', NULL, '2021-12-06 15:58:35', '2021-12-06 15:58:35'),
(26, 20, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/K79SsYwz1NIGDwTsYKyo3DAzw4ddlk.png', 'primary', NULL, '2021-12-06 15:58:35', '2021-12-06 15:58:35'),
(27, 21, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/K79SsYwz1NIGDwTsYKyo3DAzw4ddlk.png', 'primary', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36'),
(28, 22, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/ux9iz9esPgxKyTVTQVfW665J8eZ72k.png', 'primary', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36'),
(29, 23, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/ux9iz9esPgxKyTVTQVfW665J8eZ72k.png', 'primary', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36'),
(30, 24, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/ux9iz9esPgxKyTVTQVfW665J8eZ72k.png', 'primary', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36'),
(31, 25, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/ux9iz9esPgxKyTVTQVfW665J8eZ72k.png', 'primary', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36'),
(32, 26, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/zmEzpEvq4mOWuzGxP68TqygWSdfAVa.png', 'primary', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36'),
(33, 27, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/zmEzpEvq4mOWuzGxP68TqygWSdfAVa.png', 'primary', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36'),
(34, 28, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/zmEzpEvq4mOWuzGxP68TqygWSdfAVa.png', 'primary', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36'),
(35, 29, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/zmEzpEvq4mOWuzGxP68TqygWSdfAVa.png', 'primary', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36'),
(36, 30, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/awHf2uIgfR0egBgMzzoEk2cqEK4S4T.png', 'primary', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36'),
(37, 31, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/awHf2uIgfR0egBgMzzoEk2cqEK4S4T.png', 'primary', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36'),
(38, 32, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/XgTr5RHxKzHnhidunel68a5i1zKKma.png', 'primary', NULL, '2021-12-06 16:09:03', NULL),
(39, 32, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/NZNdQcnPwNN06st07v0DGJHU70NdBu.png', 'file1', NULL, '2021-12-06 16:09:03', NULL),
(40, 32, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/t9P7Dqz619T0gCpsWZoZwjjzXX7qYS.png', 'file2', NULL, '2021-12-06 16:09:03', NULL),
(41, 32, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/x7XQuhKzQIIgRNqIDurpecwae1O0Ju.png', 'file3', NULL, '2021-12-06 16:09:03', NULL),
(42, 32, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/Sqig2Rb2RpQLXelrReVvlAg09uRzJo.png', 'file4', NULL, '2021-12-06 16:09:03', NULL),
(43, 33, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/TJv855eZbsCRFpJ0m077VAxVNZppCj.png', 'primary', NULL, '2021-12-06 16:11:12', NULL),
(44, 33, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/jpg75JzLdYWZlUIpXJ0OxNllXU0cMI.png', 'file1', NULL, '2021-12-06 16:11:12', NULL),
(45, 33, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/s1VK1DF4tdWDoP5Y3pCwyI5BynY1e9.png', 'file2', NULL, '2021-12-06 16:11:12', NULL),
(46, 33, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/MbuYUAB1FDxpKqHlk8roOVSXxz4jTN.png', 'file3', NULL, '2021-12-06 16:11:12', NULL),
(47, 33, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/261vzB0k48x34uZ7kDYvzMVtWPvRa7.png', 'file4', NULL, '2021-12-06 16:11:12', NULL),
(48, 34, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/3Q5gz90wn9nFROSLJdkJmTTdjfKL5U.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(49, 35, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/3Q5gz90wn9nFROSLJdkJmTTdjfKL5U.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(50, 36, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/3Q5gz90wn9nFROSLJdkJmTTdjfKL5U.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(51, 37, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/3Q5gz90wn9nFROSLJdkJmTTdjfKL5U.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(52, 38, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/NKFrx8pZYv4311af76KpppV08ox6BM.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(53, 39, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/NKFrx8pZYv4311af76KpppV08ox6BM.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(54, 40, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/NKFrx8pZYv4311af76KpppV08ox6BM.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(55, 41, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/NKFrx8pZYv4311af76KpppV08ox6BM.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(56, 42, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/Y4cc5Ts73sylhZEtw9sJii8YjrEZQk.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(57, 43, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/Y4cc5Ts73sylhZEtw9sJii8YjrEZQk.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(58, 44, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/Y4cc5Ts73sylhZEtw9sJii8YjrEZQk.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(59, 45, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/Y4cc5Ts73sylhZEtw9sJii8YjrEZQk.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(60, 46, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/FtehEVyEtVFisAmo45RVsaklGIzncJ.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(61, 47, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/FtehEVyEtVFisAmo45RVsaklGIzncJ.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(62, 48, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/FtehEVyEtVFisAmo45RVsaklGIzncJ.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(63, 49, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/FtehEVyEtVFisAmo45RVsaklGIzncJ.png', 'primary', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15'),
(64, 50, 1, 'http://localhost/shafeeque/laravel-api/public/storage/product/Zk5BTyCOdvGArp8hmHvbFc2uuc5Ert.png', 'primary', NULL, '2021-12-12 12:46:22', NULL),
(65, 50, 0, 'http://localhost/shafeeque/laravel-api/public/storage/product/v6K2wdRAceNl6QP5h3i3yWcPpZVR6E.png', 'file1', NULL, '2021-12-12 12:46:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_attributes`
--

CREATE TABLE `product_variant_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`tags`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variant_attributes`
--

INSERT INTO `product_variant_attributes` (`id`, `product_id`, `title`, `tags`, `created_at`, `updated_at`) VALUES
(1, 1, 'Size', '[\"xl\",\"sm\"]', '2021-10-01 20:22:59', '2021-10-01 20:22:59'),
(2, 1, 'Colors', '[{\"color\":\"blue\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/niPdNR2col6mn5pepzFpAgNFksJvAb.png\"},{\"color\":\"orange\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/DRr1ThKK7cHeQ7GsHJIBAXbuGbiSgW.png\"}]', '2021-10-01 20:22:59', '2021-10-01 20:22:59'),
(3, 6, 'Size', '[\"lg\",\"xl\",\"sm\",\"xs\"]', '2021-12-06 15:34:21', '2021-12-06 15:34:21'),
(4, 6, 'Colors', '[{\"color\":\"red\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/wwPCq5v1cXkjaEsRbEeHAuxptRj5q0.png\"},{\"color\":\"green\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/09kIyk89KhPmszw4jcF24wgiIgphaD.png\"},{\"color\":\"yellow\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/7zcRoHDQge66jJISNLYF1X6zrhRQ4Y.png\"}]', '2021-12-06 15:34:21', '2021-12-06 15:34:21'),
(5, 17, 'Size', '[\"xl\",\"lg\",\"sm\",\"xs\"]', '2021-12-06 15:58:35', '2021-12-06 15:58:35'),
(6, 17, 'Colors', '[{\"color\":\"red\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/K79SsYwz1NIGDwTsYKyo3DAzw4ddlk.png\"},{\"color\":\"green\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/ux9iz9esPgxKyTVTQVfW665J8eZ72k.png\"},{\"color\":\"yellow\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/zmEzpEvq4mOWuzGxP68TqygWSdfAVa.png\"},{\"color\":\"orange\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/awHf2uIgfR0egBgMzzoEk2cqEK4S4T.png\"}]', '2021-12-06 15:58:35', '2021-12-06 15:58:35'),
(7, 33, 'Size', '[\"xl\",\"lg\",\"sm\",\"xs\"]', '2021-12-06 16:15:14', '2021-12-06 16:15:14'),
(8, 33, 'Colors', '[{\"color\":\"red\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/3Q5gz90wn9nFROSLJdkJmTTdjfKL5U.png\"},{\"color\":\"green\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/NKFrx8pZYv4311af76KpppV08ox6BM.png\"},{\"color\":\"black\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/Y4cc5Ts73sylhZEtw9sJii8YjrEZQk.png\"},{\"color\":\"blue\",\"image\":\"http:\\/\\/localhost\\/shafeeque\\/laravel-api\\/public\\/storage\\/product\\/FtehEVyEtVFisAmo45RVsaklGIzncJ.png\"}]', '2021-12-06 16:15:14', '2021-12-06 16:15:14');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2021-04-21 09:25:16', '2021-04-21 09:25:16'),
(2, 'seller', 'web', '2021-04-21 09:25:16', '2021-04-21 09:25:16'),
(3, 'customer', 'web', '2021-04-21 09:25:16', '2021-04-21 09:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_orders`
--

CREATE TABLE `seller_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `admin_order_id` bigint(20) UNSIGNED NOT NULL,
  `unique_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_product_amount` int(11) NOT NULL DEFAULT 0,
  `total_product_qty` int(11) NOT NULL DEFAULT 0,
  `order_status` enum('In Progress','Dispatched','Completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_orders`
--

INSERT INTO `seller_orders` (`id`, `customer_id`, `seller_id`, `admin_order_id`, `unique_no`, `total_product_amount`, `total_product_qty`, `order_status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 15, 1, 'Or-100000', 164, 2, 'In Progress', NULL, '2021-09-24 01:35:43', '2021-09-24 01:35:43'),
(2, 1, 15, 2, 'Or-100001', 230, 4, 'In Progress', NULL, '2021-09-24 05:34:12', '2021-09-24 05:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `seller_requests`
--

CREATE TABLE `seller_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_request_status` enum('Pending','Rejected','Approved') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seller_standard` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_social_media` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_monthly_revnue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_business_registration_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_business_owner_fname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_business_owner_lname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_business_owner_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_total_products` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_product_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_requests`
--

INSERT INTO `seller_requests` (`id`, `seller_name`, `seller_email`, `seller_phone_number`, `seller_mobile_number`, `seller_company_name`, `seller_request_status`, `created_at`, `updated_at`, `seller_standard`, `seller_website`, `seller_social_media`, `seller_monthly_revnue`, `seller_business_registration_no`, `seller_business_owner_fname`, `seller_business_owner_lname`, `seller_business_owner_email`, `seller_total_products`, `seller_product_description`, `seller_comments`) VALUES
(1, 'Morgan', 'shafeeque.ahmad541@gmail.com', '+1 (825) 559-2469', '494', 'Calderon and Emerson Plc', 'Approved', '2021-09-24 00:15:28', '2021-09-24 01:26:01', 'Fizz', 'https://www.winu.me.uk', 'Corporis aut volupta', 'R50k-R100k', '204', 'Cheyenne', 'Norton', 'jemul@mailinator.com', '982', 'Perferendis nulla mi', 'Commodo consequat R');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2jw2nDeP66IUeASqz9CdYfFzkeSH5OC3jWJcxZE4', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXJNekZWdGVod2RYOWdXbmFWNlBMTjROM3F1QnhKSkxzY1VzVERsbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Qvc2hhZmVlcXVlL2xhcmF2ZWwtYXBpL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1633137998),
('tvPxoBAhq6SDILEb4syylRoSx709CPdRjh7gXjct', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVFuNkRuOWlMeHRLeUhLZTROYTJkNWxubTdOcWVpMkJpU0U1M3FhSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Qvc2hhZmVlcXVlL2xhcmF2ZWwtYXBpIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1639223246),
('WCqilyPN9CK6nAzofnDp2MOzI5WitvotBCmRWLfE', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVlZcWJTMTlGQ3d4VnJET0Zxdmo1UFA5ZkMxdjRuTngwa09ldDRzUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTA3OiJodHRwOi8vbG9jYWxob3N0L3NoYWZlZXF1ZS9sYXJhdmVsLWFwaS90ZWxlc2NvcGUvdGVsZXNjb3BlLWFwaS9xdWVyaWVzLzk0ODg3OWJhLTY2NDAtNDI3Mi04NjRjLTIyZDg2MGZiMDZjMyI7fX0=', 1633138867);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 1, 'Shafeeque\'s Team', 1, '2021-04-12 12:34:43', '2021-04-12 12:34:43'),
(2, 1, 'seller', 0, '2021-04-14 06:27:29', '2021-04-14 06:27:29'),
(3, 2, 'seller\'s Team', 1, '2021-04-14 11:15:06', '2021-04-14 11:15:06'),
(4, 3, 'customer\'s Team', 1, '2021-04-14 11:16:04', '2021-04-14 11:16:04'),
(5, 5, 'test\'s Team', 1, '2021-04-16 16:51:07', '2021-04-16 16:51:07'),
(6, 6, 'test\'s Team', 1, '2021-04-16 16:52:35', '2021-04-16 16:52:35'),
(7, 7, 'test\'s Team', 1, '2021-04-16 13:56:22', '2021-04-16 13:56:22'),
(8, 8, 'test\'s Team', 1, '2021-04-16 17:46:26', '2021-04-16 17:46:26'),
(9, 9, 'test\'s Team', 1, '2021-04-16 17:49:06', '2021-04-16 17:49:06'),
(10, 10, 'ali\'s Team', 1, '2021-04-22 12:29:50', '2021-04-22 12:29:50'),
(11, 11, 'ali\'s Team', 1, '2021-04-22 12:31:49', '2021-04-22 12:31:49'),
(12, 12, 'shafeeque\'s Team', 1, '2021-04-22 12:35:57', '2021-04-22 12:35:57'),
(13, 13, 'shafeeque\'s Team', 1, '2021-04-22 12:48:38', '2021-04-22 12:48:38'),
(14, 14, 'ali\'s Team', 1, '2021-04-22 13:11:55', '2021-04-22 13:11:55'),
(15, 15, 'ali\'s Team', 1, '2021-04-22 13:14:37', '2021-04-22 13:14:37'),
(16, 16, 'ali\'s Team', 1, '2021-04-22 14:15:14', '2021-04-22 14:15:14'),
(17, 17, 'shafeeq\'s Team', 1, '2021-04-22 14:17:29', '2021-04-22 14:17:29'),
(18, 18, 'shafeeque\'s Team', 1, '2021-04-22 14:32:38', '2021-04-22 14:32:38'),
(19, 19, 'shafeeque\'s Team', 1, '2021-04-22 14:34:25', '2021-04-22 14:34:25'),
(20, 20, 'shafee\'s Team', 1, '2021-04-22 14:47:46', '2021-04-22 14:47:46'),
(21, 21, 'shafee\'s Team', 1, '2021-04-22 14:49:57', '2021-04-22 14:49:57'),
(22, 22, 'shafeeque\'s Team', 1, '2021-04-22 15:13:19', '2021-04-22 15:13:19'),
(23, 23, 'shafeeque\'s Team', 1, '2021-04-22 15:29:45', '2021-04-22 15:29:45'),
(24, 24, 'admin@demo.com\'s Team', 1, '2021-04-23 02:19:11', '2021-04-23 02:19:11'),
(25, 25, 'shafeeque\'s Team', 1, '2021-04-26 08:32:31', '2021-04-26 08:32:31'),
(26, 26, 'shafeeque\'s Team', 1, '2021-04-30 01:20:18', '2021-04-30 01:20:18'),
(27, 27, 'shafeeque\'s Team', 1, '2021-04-30 06:03:31', '2021-04-30 06:03:31'),
(28, 28, 'shafeeque\'s Team', 1, '2021-04-30 08:01:37', '2021-04-30 08:01:37'),
(29, 29, 'shafeeque\'s Team', 1, '2021-04-30 11:51:48', '2021-04-30 11:51:48'),
(30, 30, 'shafeeque\'s Team', 1, '2021-05-01 04:38:37', '2021-05-01 04:38:37'),
(31, 31, 'shafeeque\'s Team', 1, '2021-05-01 04:57:32', '2021-05-01 04:57:32'),
(32, 32, 'shafeeque\'s Team', 1, '2021-05-01 07:49:45', '2021-05-01 07:49:45'),
(33, 33, 'shafeeque\'s Team', 1, '2021-05-01 10:53:26', '2021-05-01 10:53:26'),
(34, 34, 'shafeeque\'s Team', 1, '2021-05-01 11:04:34', '2021-05-01 11:04:34'),
(35, 35, 'shafeeque\'s Team', 1, '2021-05-01 12:24:06', '2021-05-01 12:24:06'),
(36, 36, 'shafeeque\'s Team', 1, '2021-05-03 03:18:49', '2021-05-03 03:18:49'),
(37, 37, 'shue\'s Team', 1, '2021-05-03 08:34:29', '2021-05-03 08:34:29'),
(38, 38, 'shafeeque\'s Team', 1, '2021-05-04 11:52:22', '2021-05-04 11:52:22'),
(39, 39, 'shafeeq\'s Team', 1, '2021-05-05 10:50:54', '2021-05-05 10:50:54'),
(40, 40, 'shafeeq\'s Team', 1, '2021-05-05 12:26:22', '2021-05-05 12:26:22'),
(41, 41, 'shafeeq\'s Team', 1, '2021-05-05 12:28:14', '2021-05-05 12:28:14'),
(42, 42, 'shafeeq\'s Team', 1, '2021-05-05 12:40:00', '2021-05-05 12:40:00'),
(43, 43, 'shafeeq\'s Team', 1, '2021-05-05 12:47:43', '2021-05-05 12:47:43'),
(44, 44, 'shafeeq\'s Team', 1, '2021-05-06 03:51:30', '2021-05-06 03:51:30'),
(45, 45, 'shafeeq\'s Team', 1, '2021-05-06 03:53:12', '2021-05-06 03:53:12'),
(46, 46, 'shafeeq\'s Team', 1, '2021-05-06 06:20:25', '2021-05-06 06:20:25'),
(47, 47, 'shafeeq\'s Team', 1, '2021-05-06 13:35:10', '2021-05-06 13:35:10'),
(48, 48, 'shafeeque01\'s Team', 1, '2021-07-15 19:00:47', '2021-07-15 19:00:47'),
(49, 49, 'shafeeque\'s Team', 1, '2021-07-17 06:12:58', '2021-07-17 06:12:58'),
(50, 50, 'shafeeque\'s Team', 1, '2021-07-17 06:14:45', '2021-07-17 06:14:45'),
(51, 51, 'shafeeq\'s Team', 1, '2021-07-17 06:21:46', '2021-07-17 06:21:46'),
(52, 52, 'shafeeque\'s Team', 1, '2021-07-17 06:23:22', '2021-07-17 06:23:22'),
(53, 53, 'shafeeque\'s Team', 1, '2021-07-17 06:38:01', '2021-07-17 06:38:01'),
(54, 54, 'shafeeque\'s Team', 1, '2021-07-17 10:17:57', '2021-07-17 10:17:57'),
(55, 55, 'shafeeque\'s Team', 1, '2021-07-17 10:21:35', '2021-07-17 10:21:35'),
(56, 56, 'shafeeque\'s Team', 1, '2021-07-17 10:23:41', '2021-07-17 10:23:41'),
(57, 57, 'ali\'s Team', 1, '2021-07-24 07:20:35', '2021-07-24 07:20:35'),
(58, 58, 'shafeeque\'s Team', 1, '2021-07-24 08:42:20', '2021-07-24 08:42:20'),
(59, 59, 'shafeeque\'s Team', 1, '2021-07-24 08:53:57', '2021-07-24 08:53:57'),
(60, 60, 'shafeeque\'s Team', 1, '2021-07-24 08:55:39', '2021-07-24 08:55:39'),
(61, 61, 'shafeeque\'s Team', 1, '2021-07-24 08:58:04', '2021-07-24 08:58:04'),
(62, 62, 'shafeeque\'s Team', 1, '2021-07-24 09:00:48', '2021-07-24 09:00:48'),
(63, 63, 'shafeeque\'s Team', 1, '2021-07-24 09:01:57', '2021-07-24 09:01:57'),
(64, 64, 'shafeeque\'s Team', 1, '2021-07-24 09:05:33', '2021-07-24 09:05:33'),
(65, 65, 'shafeeque\'s Team', 1, '2021-07-24 09:23:19', '2021-07-24 09:23:19'),
(66, 66, 'shafeeque\'s Team', 1, '2021-07-24 09:25:30', '2021-07-24 09:25:30'),
(67, 67, 'shafeeque\'s Team', 1, '2021-07-24 09:26:32', '2021-07-24 09:26:32'),
(68, 68, 'shafeeque\'s Team', 1, '2021-07-24 12:36:10', '2021-07-24 12:36:10'),
(69, 69, 'shafeeque\'s Team', 1, '2021-07-24 12:36:44', '2021-07-24 12:36:44'),
(70, 70, 'shafeeque\'s Team', 1, '2021-07-24 12:53:11', '2021-07-24 12:53:11'),
(71, 71, 'shafeeque\'s Team', 1, '2021-07-24 13:29:36', '2021-07-24 13:29:36'),
(72, 72, 'shafeeque\'s Team', 1, '2021-07-24 13:30:56', '2021-07-24 13:30:56'),
(73, 73, 'shafeeque\'s Team', 1, '2021-07-24 13:32:02', '2021-07-24 13:32:02'),
(74, 74, 'shafeeque\'s Team', 1, '2021-07-24 13:33:45', '2021-07-24 13:33:45'),
(75, 75, 'shafeeque\'s Team', 1, '2021-07-24 13:41:29', '2021-07-24 13:41:29'),
(76, 76, 'shafeeque\'s Team', 1, '2021-07-24 14:28:08', '2021-07-24 14:28:08'),
(77, 77, 'shafeeque\'s Team', 1, '2021-07-24 17:37:09', '2021-07-24 17:37:09'),
(78, 78, 'shafeeque\'s Team', 1, '2021-07-29 12:32:27', '2021-07-29 12:32:27'),
(79, 79, 'shafeeque\'s Team', 1, '2021-07-29 12:45:43', '2021-07-29 12:45:43'),
(80, 80, 'shafeeque\'s Team', 1, '2021-07-29 13:09:25', '2021-07-29 13:09:25'),
(81, 81, 'shafeeque\'s Team', 1, '2021-07-29 13:11:13', '2021-07-29 13:11:13'),
(82, 82, 'shafeeque\'s Team', 1, '2021-07-29 13:16:32', '2021-07-29 13:16:32'),
(83, 83, 'shafeeque\'s Team', 1, '2021-07-29 13:21:20', '2021-07-29 13:21:20'),
(84, 84, 'shafeeque\'s Team', 1, '2021-07-29 13:23:38', '2021-07-29 13:23:38'),
(85, 85, 'shafeeque\'s Team', 1, '2021-07-29 13:30:40', '2021-07-29 13:30:40'),
(86, 86, 'shafeeque\'s Team', 1, '2021-07-29 13:38:00', '2021-07-29 13:38:00'),
(87, 87, 'shafeeque\'s Team', 1, '2021-07-29 13:45:19', '2021-07-29 13:45:19'),
(88, 88, 'shafeeque\'s Team', 1, '2021-07-29 13:47:04', '2021-07-29 13:47:04'),
(89, 89, 'shafeeque\'s Team', 1, '2021-07-29 14:03:11', '2021-07-29 14:03:11'),
(90, 9093, 'Rosalyn\'s Team', 1, '2021-08-13 15:16:00', '2021-08-13 15:16:00'),
(91, 9094, 'shafeeque\'s Team', 1, '2021-08-13 16:53:16', '2021-08-13 16:53:16'),
(92, 9095, 'abcde\'s Team', 1, '2021-09-09 22:35:43', '2021-09-09 22:35:43'),
(93, 9096, 'shafeeque\'s Team', 1, '2021-09-09 22:39:28', '2021-09-09 22:39:28'),
(94, 9097, 'pkr\'s Team', 1, '2021-09-09 22:52:43', '2021-09-09 22:52:43'),
(95, 9098, 'pkr\'s Team', 1, '2021-09-10 04:24:33', '2021-09-10 04:24:33'),
(96, 9099, 'gkr\'s Team', 1, '2021-09-10 04:26:21', '2021-09-10 04:26:21'),
(97, 9100, 'rtf\'s Team', 1, '2021-09-10 04:38:15', '2021-09-10 04:38:15'),
(98, 1, 'shafeeq\'s Team', 1, '2021-09-10 14:41:56', '2021-09-10 14:41:56'),
(99, 1, 'shafeeque\'s Team', 1, '2021-09-11 15:31:52', '2021-09-11 15:31:52'),
(100, 1, 'shafeeque\'s Team', 1, '2021-09-11 17:50:58', '2021-09-11 17:50:58'),
(101, 1, 'shafeeque\'s Team', 1, '2021-09-11 18:08:32', '2021-09-11 18:08:32'),
(102, 1, 'shafeeque\'s Team', 1, '2021-09-11 18:39:19', '2021-09-11 18:39:19'),
(103, 1, 'shafeeque\'s Team', 1, '2021-09-13 00:22:35', '2021-09-13 00:22:35'),
(104, 1, 'shafeeque\'s Team', 1, '2021-09-13 00:49:25', '2021-09-13 00:49:25'),
(105, 1, 'shafeeque\'s Team', 1, '2021-09-13 00:50:40', '2021-09-13 00:50:40'),
(106, 1, 'shafeeque\'s Team', 1, '2021-09-13 03:19:21', '2021-09-13 03:19:21'),
(107, 1, 'shafeeque\'s Team', 1, '2021-09-13 03:32:26', '2021-09-13 03:32:26'),
(108, 1, 'shafeeque\'s Team', 1, '2021-09-13 03:39:35', '2021-09-13 03:39:35'),
(109, 2, 'Rylee\'s Team', 1, '2021-09-23 09:39:11', '2021-09-23 09:39:11'),
(110, 3, 'Rylee\'s Team', 1, '2021-09-23 10:52:20', '2021-09-23 10:52:20'),
(111, 4, 'Rylee\'s Team', 1, '2021-09-23 11:11:34', '2021-09-23 11:11:34'),
(112, 5, 'Ian\'s Team', 1, '2021-09-23 23:29:57', '2021-09-23 23:29:57'),
(113, 6, 'Morgan\'s Team', 1, '2021-09-23 23:47:21', '2021-09-23 23:47:21'),
(114, 7, 'Morgan\'s Team', 1, '2021-09-24 00:01:16', '2021-09-24 00:01:16'),
(115, 8, 'Morgan\'s Team', 1, '2021-09-24 00:15:51', '2021-09-24 00:15:51'),
(116, 9, 'Morgan\'s Team', 1, '2021-09-24 00:36:24', '2021-09-24 00:36:24'),
(117, 10, 'Morgan\'s Team', 1, '2021-09-24 00:44:48', '2021-09-24 00:44:48'),
(118, 11, 'Morgan\'s Team', 1, '2021-09-24 00:46:46', '2021-09-24 00:46:46'),
(119, 12, 'Morgan\'s Team', 1, '2021-09-24 01:15:09', '2021-09-24 01:15:09'),
(120, 13, 'Morgan\'s Team', 1, '2021-09-24 01:16:27', '2021-09-24 01:16:27'),
(121, 14, 'Morgan\'s Team', 1, '2021-09-24 01:19:23', '2021-09-24 01:19:23'),
(122, 15, 'Morgan\'s Team', 1, '2021-09-24 01:26:05', '2021-09-24 01:26:05'),
(123, 16, 'shafeeque\'s Team', 1, '2021-09-27 10:42:38', '2021-09-27 10:42:38'),
(124, 17, 'shafeeque\'s Team', 1, '2021-09-28 11:14:34', '2021-09-28 11:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transistion_type_id` bigint(20) UNSIGNED NOT NULL,
  `admin_order_id` bigint(20) UNSIGNED NOT NULL,
  `seller_order_id` bigint(20) UNSIGNED NOT NULL,
  `order_detail_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '100000',
  `transaction_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_amount` int(11) NOT NULL DEFAULT 0,
  `comission_paid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `available_balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `current_balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_type` enum('customer','seller','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('Completed','Dispatched','In Progress') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transistion_type_id`, `admin_order_id`, `seller_order_id`, `order_detail_id`, `user_id`, `transaction_no`, `transaction_description`, `order_amount`, `comission_paid`, `qty`, `available_balance`, `current_balance`, `user_type`, `transaction_type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 15, '10000', 'Your order has been completed', 134, '5.36', 2, '1000', '1128.64', 'seller', 'Completed', NULL, '2021-09-24 06:50:05', '2021-09-24 06:50:05'),
(2, 2, 1, 1, 1, 1, '10001', 'Your order has been completed', 134, '5.36', 2, '1000', '866', 'customer', 'Completed', NULL, '2021-09-24 06:50:05', '2021-09-24 06:50:05'),
(3, 1, 2, 2, 2, 15, '10002', 'Your order has been completed', 200, '8', 4, '1128.64', '1320.64', 'seller', 'Completed', NULL, '2021-09-24 06:52:05', '2021-09-24 06:52:05'),
(4, 2, 2, 2, 2, 1, '10003', 'Your order has been completed', 200, '8', 4, '866', '666', 'customer', 'Completed', NULL, '2021-09-24 06:52:05', '2021-09-24 06:52:05'),
(5, 1, 1, 1, 1, 15, '10004', 'Your order has been completed', 134, '5.36', 2, '1320.64', '1449.28', 'seller', 'Completed', NULL, '2021-12-06 15:34:57', '2021-12-06 15:34:57'),
(6, 2, 1, 1, 1, 1, '10005', 'Your order has been completed', 134, '5.36', 2, '666', '532', 'customer', 'Completed', NULL, '2021-12-06 15:34:57', '2021-12-06 15:34:57'),
(7, 3, 1, 1, 1, 1, '10006', 'Your order has been cancelled', 134, '5.36', 2, '532', '666', 'customer', 'In Progress', NULL, '2021-12-06 15:35:02', '2021-12-06 15:35:02'),
(8, 4, 1, 1, 1, 15, '10007', 'Your order has been cancelled', 134, '5.36', 2, '1449.28', '1315.28', 'seller', 'In Progress', NULL, '2021-12-06 15:35:02', '2021-12-06 15:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

CREATE TABLE `transaction_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('credit','debit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_types`
--

INSERT INTO `transaction_types` (`id`, `title`, `description`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'completed', 'completed', 'credit', NULL, NULL, NULL),
(2, 'completed', 'completed', 'debit', NULL, NULL, NULL),
(3, 'cancel', 'cancel', 'debit', NULL, NULL, NULL),
(4, 'cancel', 'cancel', 'credit', NULL, NULL, NULL);

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
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_auto_approved` tinyint(4) NOT NULL DEFAULT 0,
  `product_on_hold` tinyint(4) NOT NULL DEFAULT 0,
  `is_reseller` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seller_request_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `timezone`, `current_team_id`, `profile_photo_path`, `product_auto_approved`, `product_on_hold`, `is_reseller`, `created_at`, `updated_at`, `seller_request_id`) VALUES
(1, 'shafeeq ahmed', 'shafeeq.ahmed541@gmail.com', '2021-10-01 12:01:55', '$2y$10$deZYQXPpOaUBxTy6lIcPuOfVAoQYCjLKxT038Eaa0APP7wBMIpaEi', NULL, NULL, 'S39RPv508Ae6Z776slArPQsJ0kOdoheqorfZB1VkFKc4D2aWvq4A5k2jqLlI', NULL, NULL, 'http://localhost/shafeeque/laravel-api/public/storage/admin/categories/mYSaYegfeRnxo8DApbW3VJEHS8YULh.png', 1, 0, 1, '2021-09-13 03:39:35', '2021-10-01 19:38:51', NULL),
(15, 'Morgan', 'shafeeque1.ahmad541@gmail.com', '2021-09-24 01:26:05', '$2y$10$gFBXfyEHhVhShcND00RRAe4vn/laZX0DO/xS/9tU5KJhojnUqLGWe', NULL, NULL, 'pA0oFhfzpabLVTD6tuzj01msRxgMoCWWWdu6hH5G6ViVitog365we7pMyfsj', NULL, NULL, NULL, 1, 1, 1, '2021-09-24 01:26:05', '2021-12-06 15:28:32', NULL),
(17, 'shafeeque ahmad', 'shafeeque.ahmad541@gmail.com', '2021-09-28 11:15:16', '$2y$10$jQ.7u03OBS2p78KWDDQJvOiY8vh.jcrbse36EU3svpvVK47Jn68Om', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2021-09-28 11:14:34', '2021-09-28 11:15:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_balances`
--

CREATE TABLE `user_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` enum('customer','seller','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_balances`
--

INSERT INTO `user_balances` (`id`, `user_id`, `balance`, `user_type`, `created_at`, `updated_at`) VALUES
(1, 1, '666', 'customer', '2021-09-10 14:42:01', '2021-12-06 15:35:02'),
(2, 1, '666', 'customer', '2021-09-11 15:31:58', '2021-12-06 15:35:02'),
(3, 1, '666', 'customer', '2021-09-11 17:51:03', '2021-12-06 15:35:02'),
(4, 1, '666', 'customer', '2021-09-11 18:08:37', '2021-12-06 15:35:02'),
(5, 1, '666', 'customer', '2021-09-11 18:39:24', '2021-12-06 15:35:02'),
(6, 1, '666', 'customer', '2021-09-13 00:22:45', '2021-12-06 15:35:02'),
(7, 1, '666', 'customer', '2021-09-13 00:49:30', '2021-12-06 15:35:02'),
(8, 1, '666', 'customer', '2021-09-13 00:50:45', '2021-12-06 15:35:02'),
(9, 1, '666', 'customer', '2021-09-13 03:19:26', '2021-12-06 15:35:02'),
(10, 1, '666', 'customer', '2021-09-13 03:32:31', '2021-12-06 15:35:02'),
(11, 1, '666', 'customer', '2021-09-13 03:39:39', '2021-12-06 15:35:02'),
(12, 2, '1000', 'seller', '2021-09-23 09:39:11', '2021-09-23 09:39:11'),
(13, 3, '1000', 'seller', '2021-09-23 10:52:20', '2021-09-23 10:52:20'),
(14, 4, '1000', 'seller', '2021-09-23 11:11:34', '2021-09-23 11:11:34'),
(15, 5, '1000', 'seller', '2021-09-23 23:29:58', '2021-09-23 23:29:58'),
(16, 6, '1000', 'seller', '2021-09-23 23:47:21', '2021-09-23 23:47:21'),
(17, 7, '1000', 'seller', '2021-09-24 00:01:16', '2021-09-24 00:01:16'),
(18, 8, '1000', 'seller', '2021-09-24 00:15:51', '2021-09-24 00:15:51'),
(19, 9, '1000', 'seller', '2021-09-24 00:36:24', '2021-09-24 00:36:24'),
(20, 10, '1000', 'seller', '2021-09-24 00:44:48', '2021-09-24 00:44:48'),
(21, 11, '1000', 'seller', '2021-09-24 00:46:47', '2021-09-24 00:46:47'),
(22, 14, '1000', 'seller', '2021-09-24 01:19:23', '2021-09-24 01:19:23'),
(23, 15, '1315.28', 'seller', '2021-09-24 01:26:05', '2021-12-06 15:35:02'),
(24, 16, '1000', 'customer', '2021-09-27 10:42:52', '2021-09-27 10:42:52'),
(25, 17, '1000', 'customer', '2021-09-28 11:14:40', '2021-09-28 11:14:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_products`
--

CREATE TABLE `vendor_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `msin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `low_qty_alert` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `list_status` enum('pending','approved','rejected','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_products`
--

INSERT INTO `vendor_products` (`id`, `msin`, `seller_id`, `product_id`, `price`, `cost`, `selling_price`, `qty`, `low_qty_alert`, `status`, `list_status`, `deleted_at`, `created_at`, `updated_at`, `sku`) VALUES
(1, '10000', 15, 1, '31', '58', '40', '7', '81', 'active', 'approved', NULL, '2021-10-01 20:21:40', '2021-10-01 20:21:40', 'Qui-eum-aut-qui-labo'),
(2, '10001', 15, 2, NULL, '0', '56', '54', '0', 'active', 'approved', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59', 'Qui eum aut qui labo - blue-xl'),
(3, '10002', 15, 3, NULL, '0', '56', '54', '0', 'active', 'approved', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59', 'Qui eum aut qui labo - blue-sm'),
(4, '10003', 15, 4, NULL, '0', '56', '54', '0', 'active', 'approved', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59', 'Qui eum aut qui labo - orange-xl'),
(5, '10004', 15, 5, NULL, '0', '56', '54', '0', 'active', 'approved', NULL, '2021-10-01 20:22:59', '2021-10-01 20:22:59', 'Qui eum aut qui labo - orange-sm'),
(6, '10005', 1, 6, '158', '5', '911', '617', '228', 'active', 'approved', NULL, '2021-12-06 15:30:15', '2021-12-06 15:30:15', 'Voluptatem-laudanti'),
(7, '10006', 1, 7, NULL, '0', '12', '50', '0', 'active', 'approved', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', 'Voluptatem laudanti - red-xl'),
(8, '10007', 1, 8, NULL, '0', '12', '50', '0', 'active', 'approved', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', 'Voluptatem laudanti - red-sm'),
(9, '10008', 1, 9, NULL, '0', '12', '50', '0', 'active', 'approved', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', 'Voluptatem laudanti - red-xs'),
(10, '10009', 1, 10, NULL, '0', '12', '50', '0', 'active', 'approved', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', 'Voluptatem laudanti - green-lg'),
(11, '10010', 1, 11, NULL, '0', '12', '50', '0', 'active', 'approved', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', 'Voluptatem laudanti - green-xl'),
(12, '10011', 1, 12, NULL, '0', '12', '50', '0', 'active', 'approved', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', 'Voluptatem laudanti - green-sm'),
(13, '10012', 1, 13, NULL, '0', '12', '50', '0', 'active', 'approved', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', 'Voluptatem laudanti - green-xs'),
(14, '10013', 1, 14, NULL, '0', '12', '50', '0', 'active', 'approved', NULL, '2021-12-06 15:34:22', '2021-12-06 15:34:22', 'Voluptatem laudanti - yellow-lg'),
(15, '10014', 1, 15, NULL, '0', '12', '50', '0', 'inactive', 'approved', NULL, '2021-12-06 15:34:22', '2021-12-06 15:37:27', 'Voluptatem laudanti - yellow-xl'),
(16, '10015', 1, 16, NULL, '0', '12', '50', '0', 'inactive', 'approved', NULL, '2021-12-06 15:34:22', '2021-12-06 15:37:25', 'Voluptatem laudanti - yellow-sm'),
(17, '10016', 1, 17, '161', '89', '488', '240', '486', 'active', 'approved', NULL, '2021-12-06 15:54:51', '2021-12-06 15:54:51', 'Beatae-dolores-sed-a'),
(18, '10017', 1, 18, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:35', '2021-12-06 15:58:35', 'Beatae dolores sed a - red-xl'),
(19, '10018', 1, 19, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:35', '2021-12-06 15:58:35', 'Beatae dolores sed a - red-lg'),
(20, '10019', 1, 20, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:35', '2021-12-06 15:58:35', 'Beatae dolores sed a - red-sm'),
(21, '10020', 1, 21, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', 'Beatae dolores sed a - red-xs'),
(22, '10021', 1, 22, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', 'Beatae dolores sed a - green-xl'),
(23, '10022', 1, 23, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', 'Beatae dolores sed a - green-lg'),
(24, '10023', 1, 24, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', 'Beatae dolores sed a - green-sm'),
(25, '10024', 1, 25, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', 'Beatae dolores sed a - green-xs'),
(26, '10025', 1, 26, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', 'Beatae dolores sed a - yellow-xl'),
(27, '10026', 1, 27, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', 'Beatae dolores sed a - yellow-lg'),
(28, '10027', 1, 28, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', 'Beatae dolores sed a - yellow-sm'),
(29, '10028', 1, 29, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', 'Beatae dolores sed a - yellow-xs'),
(30, '10029', 1, 30, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', 'Beatae dolores sed a - orange-xl'),
(31, '10030', 1, 31, NULL, '0', '12', '14', '0', 'active', 'approved', NULL, '2021-12-06 15:58:36', '2021-12-06 15:58:36', 'Beatae dolores sed a - orange-lg'),
(32, '10031', 1, 32, '56', '52', '504', '468', '954', 'active', 'approved', NULL, '2021-12-06 16:08:33', '2021-12-06 16:08:33', 'Nulla-nostrud-eos-si'),
(33, '10032', 1, 33, '641', '93', '850', '693', '447', 'active', 'approved', NULL, '2021-12-06 16:10:39', '2021-12-06 16:10:39', 'Id-enim-qui-pariatur'),
(34, '10033', 1, 34, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - red-xl'),
(35, '10034', 1, 35, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - red-lg'),
(36, '10035', 1, 36, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - red-sm'),
(37, '10036', 1, 37, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - red-xs'),
(38, '10037', 1, 38, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - green-xl'),
(39, '10038', 1, 39, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - green-lg'),
(40, '10039', 1, 40, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - green-sm'),
(41, '10040', 1, 41, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - green-xs'),
(42, '10041', 1, 42, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - black-xl'),
(43, '10042', 1, 43, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - black-lg'),
(44, '10043', 1, 44, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - black-sm'),
(45, '10044', 1, 45, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - black-xs'),
(46, '10045', 1, 46, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - blue-xl'),
(47, '10046', 1, 47, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - blue-lg'),
(48, '10047', 1, 48, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - blue-sm'),
(49, '10048', 1, 49, NULL, '0', '12', '34', '0', 'active', 'approved', NULL, '2021-12-06 16:15:15', '2021-12-06 16:15:15', 'Id enim qui pariatur - blue-xs'),
(50, '10049', 1, 50, '141', '32', '18', '879', '134', 'active', 'approved', NULL, '2021-12-12 12:45:50', '2021-12-12 12:45:50', 'Porro-explicabo-Adi');

-- --------------------------------------------------------

--
-- Table structure for table `volumetric`
--

CREATE TABLE `volumetric` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `min_weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `per_kg_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_addresses`
--

CREATE TABLE `warehouse_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_address_recipient_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_address_street_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_address_street_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_address_suburb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_address_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_address_country_id` int(11) NOT NULL DEFAULT 0,
  `warehouse_address_postal_code` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_addresses`
--

INSERT INTO `warehouse_addresses` (`id`, `user_id`, `warehouse_address_recipient_name`, `warehouse_address_street_no`, `warehouse_address_street_name`, `warehouse_address_suburb`, `warehouse_address_city`, `warehouse_address_country_id`, `warehouse_address_postal_code`, `created_at`, `updated_at`) VALUES
(1, 91, 'Et ut provident bla', 'Possimus non error', 'Est voluptatem in', 'Quis ad architecto a', 'Dolorem velit except', 15, 656, '2021-08-08 13:25:44', '2021-08-08 13:25:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `admin_orders`
--
ALTER TABLE `admin_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billing_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_details`
--
ALTER TABLE `business_details`
  ADD PRIMARY KEY (`business_id`),
  ADD KEY `business_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_attributes`
--
ALTER TABLE `category_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_attributes_attribute_id_foreign` (`attribute_id`),
  ADD KEY `category_attributes_user_id_foreign` (`user_id`);

--
-- Indexes for table `category_custom_fields`
--
ALTER TABLE `category_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_custom_fields_custom_field_id_foreign` (`custom_field_id`),
  ADD KEY `category_custom_fields_category_id_foreign` (`category_id`),
  ADD KEY `category_custom_fields_user_id_foreign` (`user_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leadtimes`
--
ALTER TABLE `leadtimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leadtimes_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_detail_admin_order_id_foreign` (`admin_order_id`),
  ADD KEY `order_detail_seller_order_id_foreign` (`seller_order_id`),
  ADD KEY `order_detail_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_added_by_foreign` (`added_by`),
  ADD KEY `products_parent_id_foreign` (`parent_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_category_custom_fields`
--
ALTER TABLE `product_category_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_custom_fields_product_id_foreign` (`product_id`),
  ADD KEY `product_category_custom_fields_category_custom_field_id_foreign` (`category_custom_field_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variant_attributes`
--
ALTER TABLE `product_variant_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variant_attributes_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `seller_orders`
--
ALTER TABLE `seller_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_orders_customer_id_foreign` (`customer_id`),
  ADD KEY `seller_orders_seller_id_foreign` (`seller_id`),
  ADD KEY `seller_orders_admin_order_id_foreign` (`admin_order_id`);

--
-- Indexes for table `seller_requests`
--
ALTER TABLE `seller_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_requests_seller_email_index` (`seller_email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_transistion_type_id_foreign` (`transistion_type_id`),
  ADD KEY `transactions_admin_order_id_foreign` (`admin_order_id`),
  ADD KEY `transactions_seller_order_id_foreign` (`seller_order_id`),
  ADD KEY `transactions_order_detail_id_foreign` (`order_detail_id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_balances`
--
ALTER TABLE `user_balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_balances_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `vendor_products`
--
ALTER TABLE `vendor_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_products_seller_id_foreign` (`seller_id`),
  ADD KEY `vendor_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `volumetric`
--
ALTER TABLE `volumetric`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_addresses`
--
ALTER TABLE `warehouse_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_addresses_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_orders`
--
ALTER TABLE `admin_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_details`
--
ALTER TABLE `business_details`
  MODIFY `business_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `category_attributes`
--
ALTER TABLE `category_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category_custom_fields`
--
ALTER TABLE `category_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leadtimes`
--
ALTER TABLE `leadtimes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_category_custom_fields`
--
ALTER TABLE `product_category_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `product_variant_attributes`
--
ALTER TABLE `product_variant_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seller_orders`
--
ALTER TABLE `seller_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_requests`
--
ALTER TABLE `seller_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transaction_types`
--
ALTER TABLE `transaction_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_balances`
--
ALTER TABLE `user_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_products`
--
ALTER TABLE `vendor_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `volumetric`
--
ALTER TABLE `volumetric`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse_addresses`
--
ALTER TABLE `warehouse_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `admin_orders`
--
ALTER TABLE `admin_orders`
  ADD CONSTRAINT `admin_orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD CONSTRAINT `bank_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD CONSTRAINT `billing_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `business_details`
--
ALTER TABLE `business_details`
  ADD CONSTRAINT `business_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `category_attributes`
--
ALTER TABLE `category_attributes`
  ADD CONSTRAINT `category_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `category_attributes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `category_custom_fields`
--
ALTER TABLE `category_custom_fields`
  ADD CONSTRAINT `category_custom_fields_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_custom_fields_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`),
  ADD CONSTRAINT `category_custom_fields_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `leadtimes`
--
ALTER TABLE `leadtimes`
  ADD CONSTRAINT `leadtimes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_admin_order_id_foreign` FOREIGN KEY (`admin_order_id`) REFERENCES `admin_orders` (`id`),
  ADD CONSTRAINT `order_detail_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `order_detail_seller_order_id_foreign` FOREIGN KEY (`seller_order_id`) REFERENCES `seller_orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_category_custom_fields`
--
ALTER TABLE `product_category_custom_fields`
  ADD CONSTRAINT `product_category_custom_fields_category_custom_field_id_foreign` FOREIGN KEY (`category_custom_field_id`) REFERENCES `category_custom_fields` (`id`),
  ADD CONSTRAINT `product_category_custom_fields_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_variant_attributes`
--
ALTER TABLE `product_variant_attributes`
  ADD CONSTRAINT `product_variant_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_orders`
--
ALTER TABLE `seller_orders`
  ADD CONSTRAINT `seller_orders_admin_order_id_foreign` FOREIGN KEY (`admin_order_id`) REFERENCES `admin_orders` (`id`),
  ADD CONSTRAINT `seller_orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `seller_orders_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_admin_order_id_foreign` FOREIGN KEY (`admin_order_id`) REFERENCES `admin_orders` (`id`),
  ADD CONSTRAINT `transactions_order_detail_id_foreign` FOREIGN KEY (`order_detail_id`) REFERENCES `order_detail` (`id`),
  ADD CONSTRAINT `transactions_seller_order_id_foreign` FOREIGN KEY (`seller_order_id`) REFERENCES `seller_orders` (`id`),
  ADD CONSTRAINT `transactions_transistion_type_id_foreign` FOREIGN KEY (`transistion_type_id`) REFERENCES `transaction_types` (`id`),
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_seller_request_id_foreign` FOREIGN KEY (`seller_request_id`) REFERENCES `seller_requests` (`id`);

--
-- Constraints for table `user_balances`
--
ALTER TABLE `user_balances`
  ADD CONSTRAINT `user_balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `vendor_products`
--
ALTER TABLE `vendor_products`
  ADD CONSTRAINT `vendor_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `vendor_products_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `warehouse_addresses`
--
ALTER TABLE `warehouse_addresses`
  ADD CONSTRAINT `warehouse_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
