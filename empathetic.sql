-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2023 at 05:46 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `empathetic`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_category`
--

CREATE TABLE `app_category` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_category`
--

INSERT INTO `app_category` (`id`, `title`, `created_at`) VALUES
(1, 'homecarosel', '2023-11-28 10:13:02.030508'),
(2, 'container', '2023-11-28 10:46:37.774574'),
(5, 'containertwo', '2023-12-02 09:44:56.058058'),
(7, 'sponsers', '2023-12-05 10:48:47.316981'),
(8, 'our team', '2023-12-06 09:43:18.313645');

-- --------------------------------------------------------

--
-- Table structure for table `app_donor`
--

CREATE TABLE `app_donor` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  `phone_number` bigint(20) NOT NULL,
  `place` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_organization`
--

CREATE TABLE `app_organization` (
  `id` bigint(20) NOT NULL,
  `organization_name` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `phone_number` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `organization_location` varchar(50) NOT NULL,
  `vision` varchar(1000) NOT NULL,
  `mission` varchar(1000) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `organizationtype_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_organization`
--

INSERT INTO `app_organization` (`id`, `organization_name`, `address`, `email`, `website`, `phone_number`, `description`, `organization_location`, `vision`, `mission`, `image`, `created_at`, `organizationtype_id`, `user_id`) VALUES
(1, 'aljamia', 'Perinthalmanna, Poopalam\r\nValambur', 'aljamia@gmail.com', 'https://ajascollege.ac.in/', 4567898468468, 'Al Jamia Arts and Science College (AJAS), a resourceful destination for higher studies in the region, was established in 2010 with the main objective of uplifting the educationally developing Muslims and other communities and moulding them into professionally competent, socially responsible, and morally sound citizens. The college with minority status is affiliated with the University of Calicut and recognised by the Government of Kerala', 'Perinthalmanna, Poopalam', 'Seek to promote and provide value-based quality education to the generation next to enlighten, empower and equip them to be the leaders of tomorrow.', 'Al Jamia Arts and Science College aims at providing education of the highest order in the area of contemporary arts and sciences with a unique value dimension and humane outlook; to build an unparalleled powerhouse of modern learning which will benchmark itself against the best in the country and around the globe.', 'static/images/img.png', '2023-12-18 11:20:53.537948', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `app_organizationgoal`
--

CREATE TABLE `app_organizationgoal` (
  `id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `organization_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_organizationnews`
--

CREATE TABLE `app_organizationnews` (
  `id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `organization_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_organizationstories`
--

CREATE TABLE `app_organizationstories` (
  `id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `organization_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_organizationtype`
--

CREATE TABLE `app_organizationtype` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_organizationtype`
--

INSERT INTO `app_organizationtype` (`id`, `title`) VALUES
(1, 'orphange'),
(2, 'oldagehome'),
(3, 'paliativecare');

-- --------------------------------------------------------

--
-- Table structure for table `app_post`
--

CREATE TABLE `app_post` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `job_title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `description2` longtext NOT NULL,
  `description3` longtext NOT NULL,
  `description4` longtext NOT NULL,
  `description5` longtext NOT NULL,
  `description6` longtext NOT NULL,
  `description7` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_post`
--

INSERT INTO `app_post` (`id`, `title`, `job_title`, `description`, `description2`, `description3`, `description4`, `description5`, `description6`, `description7`, `image`, `created_at`, `category_id`) VALUES
(1, 'BECAUSE THEY NEED YOUR HELP', 'DO NOT LET THEM DOWN', 'active', '0', '0', '0', '0', '0', '0', 'static/images/home-slider-1.jpg', '2023-11-28 10:14:52.969058', 1),
(2, 'Together we can  improve their', 'livesSo let\'s do it', '0', '0', '0', '0', '0', '0', '0', 'static/images/home-slider-2.jpg', '2023-11-28 10:31:17.289990', 1),
(3, 'A penny is a lot of money, if you have not got a penny.', 'You can make the diffrence !', '0', '0', '0', '0', '0', '0', '0', 'static/images/home-slider-3.jpg', '2023-11-28 10:32:16.102016', 1),
(4, 'OUR MISSION', '0', 'Lorem ipsum dolor sit amet consect adipisscin elit proin vel lectus ut eta esami vera dolor sit amet consect', '0', '0', '0', '0', '0', '0', 'static/images/our-mission-icon.png', '2023-11-28 11:24:30.326915', 2),
(5, 'Make donations', '0', 'Lorem ipsum dolor sit amet consect adipisscin elit proin vel lectus ut eta esami vera dolor sit amet consect', '0', '0', '0', '0', '0', '0', 'static/images/make-donation-icon.png', '2023-11-28 11:25:44.672410', 2),
(6, 'Help & support', '0', 'Lorem ipsum dolor sit amet consect adipisscin elit proin vel lectus ut eta esami vera dolor sit amet consect', '0', '0', '0', '0', '0', '0', 'static/images/help-icon.png', '2023-11-28 11:26:34.311336', 2),
(7, 'our programs', '0', 'Lorem ipsum dolor sit amet consect adipisscin elit proin vel lectus ut eta esami vera dolor sit amet consect', '0', '0', '0', '0', '0', '0', 'static/images/programs-icon.png', '2023-11-28 11:28:24.815106', 2),
(12, 'heading', 'WE ARE HUMANS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur praesentium, itaque facilis nesciunt ab omnis cumque similique ipsa veritatis perspiciatis, harum ad at nihil molestias, dignissimos sint consequuntur. Officia, fuga.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur praesentium, itaque facilis nesciunt ab omnis cumque similique ipsa veritatis perspiciatis, harum ad at nihil molestias, dignissimos sint consequuntur. Officia, fuga.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur praesentium, itaque facilis nesciunt ab omnis cumque similique ipsa veritatis perspiciatis, harum ad at nihil molestias, dignissimos sint consequuntur. Officia, fuga.', '0', '0', '0', '0', 'static/images/we-fight-togother_S1hnYAw.jpg', '2023-12-02 09:46:35.075123', 5),
(13, 'WE care about others', 'WE ARE HUMANS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur praesentium, itaque facilis nesciunt ab omnis cumque similique ipsa veritatis perspiciatis, harum ad at nihil molestias, dignissimos sint consequuntur. Officia, fuga', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur praesentium, itaque facilis nesciunt ab omnis cumque similique ipsa veritatis perspiciatis, harum ad at nihil molestias, dignissimos sint consequuntur. Officia, fuga', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur praesentium, itaque facilis nesciunt ab omnis cumque similique ipsa veritatis perspiciatis, harum ad at nihil molestias, dignissimos sint consequuntur. Officia, fuga', '0', '0', '0', '0', 'static/images/we-care-about.jpg', '2023-12-05 10:31:50.995386', 5),
(14, '0', '0', '0', '0', '0', '0', '0', '0', '0', 'static/images/bus_aIgwCxr.png', '2023-12-05 11:01:02.636882', 7),
(15, '0', '0', '0', '0', '0', '0', '0', '0', '0', 'static/images/one-world_gSc2f42.png', '2023-12-05 11:01:19.506934', 7),
(16, '0', '0', '0', '0', '0', '0', '0', '0', '0', 'static/images/sponsor-taous.jpg', '2023-12-05 11:01:32.938638', 7),
(17, '0', '0', '0', '0', '0', '0', '0', '0', '0', 'static/images/sponsor-unilever.jpg', '2023-12-05 11:01:46.492025', 7),
(18, '0', '0', '0', '0', '0', '0', '0', '0', '0', 'static/images/united-nations.png', '2023-12-05 11:01:58.256524', 7),
(19, '0', '0', '0', '0', '0', '0', '0', '0', '0', 'static/images/wikimedia.png', '2023-12-05 11:02:10.398847', 7),
(20, '0', '0', '0', '0', '0', '0', '0', '0', '0', 'static/images/wikiversity.png', '2023-12-05 11:02:34.554874', 7),
(21, 'JASIR SHABEEB', 'co founder', '0', '0', '0', '0', '0', '0', '0', 'static/images/Screenshot_2023-10-04_164500.png', '2023-12-06 09:46:45.348912', 8),
(22, 'MUHAMED ANSHAD', 'co founder', '0', '0', '0', '0', '0', '0', '0', 'static/images/Screenshot_2023-10-04_164500_Rx6VQrG.png', '2023-12-06 09:47:47.159837', 8),
(23, 'SHAHEEL', 'co founder', '0', '0', '0', '0', '0', '0', '0', 'static/images/Screenshot_2023-10-04_164500_ZKPJcH1.png', '2023-12-06 09:48:15.170783', 8),
(24, 'ALI', 'co founder', '0', '0', '0', '0', '0', '0', '0', 'static/images/Screenshot_2023-10-04_164500_lN0yQAB.png', '2023-12-06 09:48:37.054203', 8);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add post', 8, 'add_post'),
(30, 'Can change post', 8, 'change_post'),
(31, 'Can delete post', 8, 'delete_post'),
(32, 'Can view post', 8, 'view_post'),
(33, 'Can add organizationstories', 9, 'add_organizationstories'),
(34, 'Can change organizationstories', 9, 'change_organizationstories'),
(35, 'Can delete organizationstories', 9, 'delete_organizationstories'),
(36, 'Can view organizationstories', 9, 'view_organizationstories'),
(37, 'Can add organization', 10, 'add_organization'),
(38, 'Can change organization', 10, 'change_organization'),
(39, 'Can delete organization', 10, 'delete_organization'),
(40, 'Can view organization', 10, 'view_organization'),
(41, 'Can add organizationgoal', 11, 'add_organizationgoal'),
(42, 'Can change organizationgoal', 11, 'change_organizationgoal'),
(43, 'Can delete organizationgoal', 11, 'delete_organizationgoal'),
(44, 'Can view organizationgoal', 11, 'view_organizationgoal'),
(45, 'Can add organizationnews', 12, 'add_organizationnews'),
(46, 'Can change organizationnews', 12, 'change_organizationnews'),
(47, 'Can delete organizationnews', 12, 'delete_organizationnews'),
(48, 'Can view organizationnews', 12, 'view_organizationnews'),
(49, 'Can add organizationtype', 13, 'add_organizationtype'),
(50, 'Can change organizationtype', 13, 'change_organizationtype'),
(51, 'Can delete organizationtype', 13, 'delete_organizationtype'),
(52, 'Can view organizationtype', 13, 'view_organizationtype'),
(53, 'Can add donor', 14, 'add_donor'),
(54, 'Can change donor', 14, 'change_donor'),
(55, 'Can delete donor', 14, 'delete_donor'),
(56, 'Can view donor', 14, 'view_donor');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$pEmiRFyCuMUsEnUugR5xOm$eg4HOFLeNCQwuq4yYC1D3Hf48XeiIjBNn7QwebwbCVE=', '2023-12-06 09:41:39.461567', 1, 'admin', '', '', '', 1, 1, '2023-11-28 10:07:33.891574'),
(2, 'pbkdf2_sha256$600000$mL9QyYKdU3WjLyY7G9UAh6$HfGPYY3gZ4PzQMkEhFEiipT+Go7SY+gvgNVRDZjnbkI=', NULL, 1, 'user', '', '', '', 1, 1, '2023-12-18 09:48:47.990398'),
(8, 'pbkdf2_sha256$600000$VQf4ljwBqvYIQdoAHDI3Ba$+GUNlQS/nef/tX8mRNj45UYD0WMM3kOOcQOguadiN1w=', NULL, 0, 'aljamia', '', '', 'aljamia@gmail.com', 0, 1, '2023-12-18 11:17:40.771939');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-11-28 10:13:02.033497', '1', 'homecarosel', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-11-28 10:14:52.969058', '1', 'BECAUSE THEY NEED YOUR HELP', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-11-28 10:29:59.366177', '1', 'BECAUSE THEY NEED YOUR HELP', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(4, '2023-11-28 10:31:17.291984', '2', 'Together we can  improve their', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-11-28 10:31:26.800396', '2', 'Together we can  improve their', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(6, '2023-11-28 10:32:16.105008', '3', 'A penny is a lot of money, if you have not got a penny.', 1, '[{\"added\": {}}]', 8, 1),
(7, '2023-11-28 10:39:32.970646', '2', 'Together we can  improve their', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(8, '2023-11-28 10:39:41.492034', '1', 'BECAUSE THEY NEED YOUR HELP', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(9, '2023-11-28 10:46:37.777010', '2', 'container', 1, '[{\"added\": {}}]', 7, 1),
(10, '2023-11-28 10:46:47.813860', '1', 'homecarosel', 2, '[]', 7, 1),
(11, '2023-11-28 10:46:53.460581', '2', 'container', 2, '[]', 7, 1),
(12, '2023-11-28 11:24:30.326915', '4', 'OUR MISSION', 1, '[{\"added\": {}}]', 8, 1),
(13, '2023-11-28 11:25:44.673408', '5', 'Make donations', 1, '[{\"added\": {}}]', 8, 1),
(14, '2023-11-28 11:26:34.313889', '6', 'Help & support', 1, '[{\"added\": {}}]', 8, 1),
(15, '2023-11-28 11:27:04.537260', '6', 'Help & support', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(16, '2023-11-28 11:28:24.816109', '7', 'our programs', 1, '[{\"added\": {}}]', 8, 1),
(17, '2023-11-30 14:02:32.374526', '3', 'container2', 1, '[{\"added\": {}}]', 7, 1),
(18, '2023-11-30 14:03:41.742025', '8', 'WE FIGHT TOGETHER', 1, '[{\"added\": {}}]', 8, 1),
(19, '2023-11-30 14:14:29.483072', '8', 'WE FIGHT TOGETHER', 3, '', 8, 1),
(20, '2023-11-30 14:42:52.101600', '9', 'WE FIGHT TOGETHER', 1, '[{\"added\": {}}]', 8, 1),
(21, '2023-11-30 14:47:58.920456', '3', 'container2', 3, '', 7, 1),
(22, '2023-11-30 14:48:41.622123', '4', 'container2', 1, '[{\"added\": {}}]', 7, 1),
(23, '2023-11-30 14:50:07.684647', '10', 'We fight together', 1, '[{\"added\": {}}]', 8, 1),
(24, '2023-11-30 14:59:14.188271', '10', 'We fight together', 3, '', 8, 1),
(25, '2023-11-30 14:59:52.029387', '11', 'WE FIGHT TOGETHER', 1, '[{\"added\": {}}]', 8, 1),
(26, '2023-12-02 09:43:38.278715', '4', 'container2', 3, '', 7, 1),
(27, '2023-12-02 09:44:56.058058', '5', 'containertwo', 1, '[{\"added\": {}}]', 7, 1),
(28, '2023-12-02 09:46:35.076121', '12', 'heading', 1, '[{\"added\": {}}]', 8, 1),
(29, '2023-12-05 10:31:50.997810', '13', 'WE care about others', 1, '[{\"added\": {}}]', 8, 1),
(30, '2023-12-05 10:34:02.248997', '6', 'OUR CAUSES', 1, '[{\"added\": {}}]', 7, 1),
(31, '2023-12-05 10:37:44.525717', '6', 'OUR SPONSORS', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 7, 1),
(32, '2023-12-05 10:48:26.403538', '6', 'OUR SPONSORS', 3, '', 7, 1),
(33, '2023-12-05 10:48:47.316981', '7', 'sponsers', 1, '[{\"added\": {}}]', 7, 1),
(34, '2023-12-05 11:01:02.636882', '14', '0', 1, '[{\"added\": {}}]', 8, 1),
(35, '2023-12-05 11:01:19.512726', '15', '0', 1, '[{\"added\": {}}]', 8, 1),
(36, '2023-12-05 11:01:32.943065', '16', '0', 1, '[{\"added\": {}}]', 8, 1),
(37, '2023-12-05 11:01:46.492025', '17', '0', 1, '[{\"added\": {}}]', 8, 1),
(38, '2023-12-05 11:01:58.263293', '18', '0', 1, '[{\"added\": {}}]', 8, 1),
(39, '2023-12-05 11:02:10.402382', '19', '0', 1, '[{\"added\": {}}]', 8, 1),
(40, '2023-12-05 11:02:34.560963', '20', '0', 1, '[{\"added\": {}}]', 8, 1),
(41, '2023-12-06 09:43:18.313645', '8', 'our team', 1, '[{\"added\": {}}]', 7, 1),
(42, '2023-12-06 09:46:45.348912', '21', 'JASIR SHABEEB', 1, '[{\"added\": {}}]', 8, 1),
(43, '2023-12-06 09:47:47.159837', '22', 'MUHAMED ANSHAD', 1, '[{\"added\": {}}]', 8, 1),
(44, '2023-12-06 09:48:15.172968', '23', 'SHAHEEL', 1, '[{\"added\": {}}]', 8, 1),
(45, '2023-12-06 09:48:37.054203', '24', 'ALI', 1, '[{\"added\": {}}]', 8, 1),
(46, '2023-12-18 10:18:13.835208', '1', 'orphange', 1, '[{\"added\": {}}]', 13, 1),
(47, '2023-12-18 10:18:23.968070', '2', 'oldagehome', 1, '[{\"added\": {}}]', 13, 1),
(48, '2023-12-18 10:18:30.873696', '3', 'paliativecare', 1, '[{\"added\": {}}]', 13, 1),
(49, '2023-12-18 11:20:53.537948', '1', 'Organization object (1)', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'app', 'category'),
(14, 'app', 'donor'),
(10, 'app', 'organization'),
(11, 'app', 'organizationgoal'),
(12, 'app', 'organizationnews'),
(9, 'app', 'organizationstories'),
(13, 'app', 'organizationtype'),
(8, 'app', 'post'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-09 11:43:22.147963'),
(2, 'auth', '0001_initial', '2023-11-09 11:43:23.209835'),
(3, 'admin', '0001_initial', '2023-11-09 11:43:23.477858'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-09 11:43:23.514982'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-09 11:43:23.535143'),
(6, 'app', '0001_initial', '2023-11-09 11:43:23.654083'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-11-09 11:43:23.827742'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-11-09 11:43:23.920118'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-11-09 11:43:23.974598'),
(10, 'auth', '0004_alter_user_username_opts', '2023-11-09 11:43:23.990820'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-11-09 11:43:24.084836'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-11-09 11:43:24.089598'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-11-09 11:43:24.114222'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-11-09 11:43:24.162822'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-11-09 11:43:24.199086'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-11-09 11:43:24.244559'),
(17, 'auth', '0011_update_proxy_permissions', '2023-11-09 11:43:24.269637'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-11-09 11:43:24.320245'),
(19, 'sessions', '0001_initial', '2023-11-09 11:43:24.384142'),
(20, 'app', '0002_organization_organizationtype_organizationstories_and_more', '2023-12-18 09:45:39.858530'),
(21, 'app', '0003_remove_organizationtype_created_at', '2023-12-18 11:17:24.889332');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('30sgxq2a76trf0fe7i5e0edc08dfqq6n', '.eJxVjEEOwiAQRe_C2hBgQKhL9z0DmWGoVA0kpV0Z765NutDtf-_9l4i4rSVuPS9xZnERWpx-N8L0yHUHfMd6azK1ui4zyV2RB-1ybJyf18P9OyjYy7cGbViTx5DYZCDwmCcdLCOAtdYbVEqT4pSH4M7OTyoBMdjBOOvZEYj3B-DPN4o:1rASyK:peX1Z_Hazt4JAw7ze_dlsKIofHmgYU8d_TXqy7AAKAc', '2023-12-19 10:48:12.956758'),
('kq9jlfu7wvs1pqigwxmzzj76xofmwm16', '.eJxVjEEOwiAQRe_C2hBgQKhL9z0DmWGoVA0kpV0Z765NutDtf-_9l4i4rSVuPS9xZnERWpx-N8L0yHUHfMd6azK1ui4zyV2RB-1ybJyf18P9OyjYy7cGbViTx5DYZCDwmCcdLCOAtdYbVEqT4pSH4M7OTyoBMdjBOOvZEYj3B-DPN4o:1rAoPT:aXu_iLb2BQlu22rLNbFniixjhZiJZW1Na8V5GsRs0J8', '2023-12-20 09:41:39.461567');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_category`
--
ALTER TABLE `app_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_donor`
--
ALTER TABLE `app_donor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `app_organization`
--
ALTER TABLE `app_organization`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `app_organization_organizationtype_id_5ca68f48_fk_app_organ` (`organizationtype_id`);

--
-- Indexes for table `app_organizationgoal`
--
ALTER TABLE `app_organizationgoal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_organizationgoal_organization_id_4700c2df_fk_app_organ` (`organization_id`);

--
-- Indexes for table `app_organizationnews`
--
ALTER TABLE `app_organizationnews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_organizationnews_organization_id_b0956855_fk_app_organ` (`organization_id`);

--
-- Indexes for table `app_organizationstories`
--
ALTER TABLE `app_organizationstories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_organizationstor_organization_id_c20f9842_fk_app_organ` (`organization_id`);

--
-- Indexes for table `app_organizationtype`
--
ALTER TABLE `app_organizationtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_post`
--
ALTER TABLE `app_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_post_category_id_b20d7758_fk_app_category_id` (`category_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_category`
--
ALTER TABLE `app_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `app_donor`
--
ALTER TABLE `app_donor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_organization`
--
ALTER TABLE `app_organization`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_organizationgoal`
--
ALTER TABLE `app_organizationgoal`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_organizationnews`
--
ALTER TABLE `app_organizationnews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_organizationstories`
--
ALTER TABLE `app_organizationstories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_organizationtype`
--
ALTER TABLE `app_organizationtype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_post`
--
ALTER TABLE `app_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_donor`
--
ALTER TABLE `app_donor`
  ADD CONSTRAINT `app_donor_user_id_52f60e37_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `app_organization`
--
ALTER TABLE `app_organization`
  ADD CONSTRAINT `app_organization_organizationtype_id_5ca68f48_fk_app_organ` FOREIGN KEY (`organizationtype_id`) REFERENCES `app_organizationtype` (`id`),
  ADD CONSTRAINT `app_organization_user_id_b8d41a17_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `app_organizationgoal`
--
ALTER TABLE `app_organizationgoal`
  ADD CONSTRAINT `app_organizationgoal_organization_id_4700c2df_fk_app_organ` FOREIGN KEY (`organization_id`) REFERENCES `app_organization` (`id`);

--
-- Constraints for table `app_organizationnews`
--
ALTER TABLE `app_organizationnews`
  ADD CONSTRAINT `app_organizationnews_organization_id_b0956855_fk_app_organ` FOREIGN KEY (`organization_id`) REFERENCES `app_organization` (`id`);

--
-- Constraints for table `app_organizationstories`
--
ALTER TABLE `app_organizationstories`
  ADD CONSTRAINT `app_organizationstor_organization_id_c20f9842_fk_app_organ` FOREIGN KEY (`organization_id`) REFERENCES `app_organization` (`id`);

--
-- Constraints for table `app_post`
--
ALTER TABLE `app_post`
  ADD CONSTRAINT `app_post_category_id_b20d7758_fk_app_category_id` FOREIGN KEY (`category_id`) REFERENCES `app_category` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
