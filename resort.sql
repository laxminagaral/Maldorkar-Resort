-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2020 at 09:58 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resort`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add activity', 1, 'add_activity'),
(2, 'Can change activity', 1, 'change_activity'),
(3, 'Can delete activity', 1, 'delete_activity'),
(4, 'Can view activity', 1, 'view_activity'),
(5, 'Can add customer', 2, 'add_customer'),
(6, 'Can change customer', 2, 'change_customer'),
(7, 'Can delete customer', 2, 'delete_customer'),
(8, 'Can view customer', 2, 'view_customer'),
(9, 'Can add enquiry', 3, 'add_enquiry'),
(10, 'Can change enquiry', 3, 'change_enquiry'),
(11, 'Can delete enquiry', 3, 'delete_enquiry'),
(12, 'Can view enquiry', 3, 'view_enquiry'),
(13, 'Can add food', 4, 'add_food'),
(14, 'Can change food', 4, 'change_food'),
(15, 'Can delete food', 4, 'delete_food'),
(16, 'Can view food', 4, 'view_food'),
(17, 'Can add package_details', 5, 'add_package_details'),
(18, 'Can change package_details', 5, 'change_package_details'),
(19, 'Can delete package_details', 5, 'delete_package_details'),
(20, 'Can view package_details', 5, 'view_package_details'),
(21, 'Can add purchase_details', 6, 'add_purchase_details'),
(22, 'Can change purchase_details', 6, 'change_purchase_details'),
(23, 'Can delete purchase_details', 6, 'delete_purchase_details'),
(24, 'Can view purchase_details', 6, 'view_purchase_details'),
(25, 'Can add booking', 7, 'add_booking'),
(26, 'Can change booking', 7, 'change_booking'),
(27, 'Can delete booking', 7, 'delete_booking'),
(28, 'Can view booking', 7, 'view_booking'),
(29, 'Can add log entry', 8, 'add_logentry'),
(30, 'Can change log entry', 8, 'change_logentry'),
(31, 'Can delete log entry', 8, 'delete_logentry'),
(32, 'Can view log entry', 8, 'view_logentry'),
(33, 'Can add permission', 9, 'add_permission'),
(34, 'Can change permission', 9, 'change_permission'),
(35, 'Can delete permission', 9, 'delete_permission'),
(36, 'Can view permission', 9, 'view_permission'),
(37, 'Can add group', 10, 'add_group'),
(38, 'Can change group', 10, 'change_group'),
(39, 'Can delete group', 10, 'delete_group'),
(40, 'Can view group', 10, 'view_group'),
(41, 'Can add user', 11, 'add_user'),
(42, 'Can change user', 11, 'change_user'),
(43, 'Can delete user', 11, 'delete_user'),
(44, 'Can view user', 11, 'view_user'),
(45, 'Can add content type', 12, 'add_contenttype'),
(46, 'Can change content type', 12, 'change_contenttype'),
(47, 'Can delete content type', 12, 'delete_contenttype'),
(48, 'Can view content type', 12, 'view_contenttype'),
(49, 'Can add session', 13, 'add_session'),
(50, 'Can change session', 13, 'change_session'),
(51, 'Can delete session', 13, 'delete_session'),
(52, 'Can view session', 13, 'view_session'),
(53, 'Can add employee', 14, 'add_employee'),
(54, 'Can change employee', 14, 'change_employee'),
(55, 'Can delete employee', 14, 'delete_employee'),
(56, 'Can view employee', 14, 'view_employee'),
(57, 'Can add room', 15, 'add_room'),
(58, 'Can change room', 15, 'change_room'),
(59, 'Can delete room', 15, 'delete_room'),
(60, 'Can view room', 15, 'view_room'),
(61, 'Can add designation', 16, 'add_designation'),
(62, 'Can change designation', 16, 'change_designation'),
(63, 'Can delete designation', 16, 'delete_designation'),
(64, 'Can view designation', 16, 'view_designation');

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
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$180000$li1DxbUG48Ne$brMsuqn+0N40cgYIU1O2seJp0gF0yiJCDd3QKFKTtb4=', '2020-03-12 07:54:52.974991', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2020-03-04 15:16:13.667423');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-03-04 15:19:18.143322', '1', 'Food object (1)', 1, '[{\"added\": {}}]', 4, 1),
(2, '2020-03-05 09:32:26.384869', '1', 'Customer object (1)', 1, '[{\"added\": {}}]', 2, 1),
(3, '2020-03-05 09:32:26.658538', '2', 'Customer object (2)', 1, '[{\"added\": {}}]', 2, 1),
(4, '2020-03-05 09:32:48.689136', '1', 'Package_details object (1)', 1, '[{\"added\": {}}]', 5, 1),
(5, '2020-03-05 09:32:54.910689', '1', 'Booking object (1)', 1, '[{\"added\": {}}]', 7, 1),
(6, '2020-03-05 09:33:51.818749', '1', 'Enquiry object (1)', 1, '[{\"added\": {}}]', 3, 1),
(7, '2020-03-05 09:33:51.824754', '3', 'Enquiry object (3)', 1, '[{\"added\": {}}]', 3, 1),
(8, '2020-03-05 09:33:51.833676', '2', 'Enquiry object (2)', 1, '[{\"added\": {}}]', 3, 1),
(9, '2020-03-05 09:34:27.769847', '3', 'Enquiry object (3)', 3, '', 3, 1),
(10, '2020-03-05 09:54:55.969944', '2', 'Enquiry object (2)', 3, '', 3, 1),
(11, '2020-03-05 09:54:57.449175', '2', 'Enquiry object (2)', 3, '', 3, 1),
(12, '2020-03-05 09:56:03.943545', '1', 'Booking object (1)', 2, '[{\"changed\": {\"fields\": [\"Booking status\"]}}]', 7, 1),
(13, '2020-03-07 09:19:43.553965', '1', 'Employee object (1)', 1, '[{\"added\": {}}]', 14, 1),
(14, '2020-03-07 09:19:43.554782', '2', 'Employee object (2)', 1, '[{\"added\": {}}]', 14, 1),
(15, '2020-03-07 09:20:45.735218', '1', 'Employee object (1)', 3, '', 14, 1),
(16, '2020-03-09 07:45:24.045514', '3', 'Employee object (3)', 1, '[{\"added\": {}}]', 14, 1),
(17, '2020-03-09 07:55:22.482786', '3', 'Employee object (3)', 3, '', 14, 1),
(18, '2020-03-09 08:38:27.135446', '4', 'Employee object (4)', 1, '[{\"added\": {}}]', 14, 1),
(19, '2020-03-09 08:38:29.024679', '5', 'Employee object (5)', 1, '[{\"added\": {}}]', 14, 1),
(20, '2020-03-09 08:46:51.494895', '6', 'Employee object (6)', 1, '[{\"added\": {}}]', 14, 1),
(21, '2020-03-09 08:48:18.205119', '7', 'Employee object (7)', 1, '[{\"added\": {}}]', 14, 1),
(22, '2020-03-09 09:55:15.594670', '8', 'Employee object (8)', 1, '[{\"added\": {}}]', 14, 1),
(23, '2020-03-09 09:56:28.101871', '9', 'Employee object (9)', 1, '[{\"added\": {}}]', 14, 1),
(24, '2020-03-09 09:58:20.193780', '10', 'Employee object (10)', 1, '[{\"added\": {}}]', 14, 1),
(25, '2020-03-09 10:30:11.056621', '11', 'Employee object (11)', 1, '[{\"added\": {}}]', 14, 1),
(26, '2020-03-09 11:44:41.997857', '1', 'Designation object (1)', 1, '[{\"added\": {}}]', 16, 1),
(27, '2020-03-09 11:44:59.746119', '2', 'Designation object (2)', 1, '[{\"added\": {}}]', 16, 1),
(28, '2020-03-09 11:45:14.632204', '3', 'Designation object (3)', 1, '[{\"added\": {}}]', 16, 1),
(29, '2020-03-09 11:45:34.930840', '4', 'Designation object (4)', 1, '[{\"added\": {}}]', 16, 1),
(30, '2020-03-11 09:50:28.907069', '1', 'Activity object (1)', 1, '[{\"added\": {}}]', 1, 1),
(31, '2020-03-11 09:52:37.207044', '2', 'Customer object (2)', 3, '', 2, 1),
(32, '2020-03-11 09:54:03.167276', '1', 'Employee object (1)', 1, '[{\"added\": {}}]', 14, 1),
(33, '2020-03-11 09:56:46.992619', '2', 'Booking object (2)', 1, '[{\"added\": {}}]', 7, 1),
(34, '2020-03-11 09:57:29.863337', '1', 'Purchase_details object (1)', 1, '[{\"added\": {}}]', 6, 1),
(35, '2020-03-11 09:58:36.773220', '3', 'Customer object (3)', 1, '[{\"added\": {}}]', 2, 1),
(36, '2020-03-11 09:59:41.001508', '2', 'Employee object (2)', 1, '[{\"added\": {}}]', 14, 1),
(37, '2020-03-11 12:13:09.058190', '1', 'Package_details object (1)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 5, 1),
(38, '2020-03-11 12:13:38.060903', '1', 'Package_details object (1)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 5, 1),
(39, '2020-03-11 12:14:05.844593', '1', 'Package_details object (1)', 2, '[{\"changed\": {\"fields\": [\"Package name\"]}}]', 5, 1),
(40, '2020-03-12 07:40:48.047639', '2', 'Package_details object (2)', 1, '[{\"added\": {}}]', 5, 1),
(41, '2020-03-12 07:43:49.974078', '2', 'Package_details object (2)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 5, 1),
(42, '2020-03-12 07:43:53.892481', '2', 'Package_details object (2)', 2, '[]', 5, 1),
(43, '2020-03-12 07:44:34.174283', '2', 'Package_details object (2)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 5, 1),
(44, '2020-03-12 07:46:22.257027', '2', 'Package_details object (2)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 5, 1),
(45, '2020-03-12 07:46:46.210613', '2', 'Package_details object (2)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 5, 1),
(46, '2020-03-12 07:47:56.001000', '2', 'Package_details object (2)', 2, '[]', 5, 1),
(47, '2020-03-12 07:49:13.629400', '2', 'Package_details object (2)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 5, 1),
(48, '2020-03-12 07:49:13.634500', '2', 'Package_details object (2)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 5, 1),
(49, '2020-03-12 07:49:49.392060', '2', 'Package_details object (2)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 5, 1),
(50, '2020-03-12 07:51:42.615750', '2', 'Package_details object (2)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 5, 1),
(51, '2020-03-12 07:55:24.226506', '2', 'Package_details object (2)', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 5, 1),
(52, '2020-03-12 07:57:05.750851', '3', 'Package_details object (3)', 1, '[{\"added\": {}}]', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'admin', 'logentry'),
(10, 'auth', 'group'),
(9, 'auth', 'permission'),
(11, 'auth', 'user'),
(12, 'contenttypes', 'contenttype'),
(1, 'resortapp', 'activity'),
(7, 'resortapp', 'booking'),
(2, 'resortapp', 'customer'),
(16, 'resortapp', 'designation'),
(14, 'resortapp', 'employee'),
(3, 'resortapp', 'enquiry'),
(4, 'resortapp', 'food'),
(5, 'resortapp', 'package_details'),
(6, 'resortapp', 'purchase_details'),
(15, 'resortapp', 'room'),
(13, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-03-04 15:13:40.186779'),
(2, 'auth', '0001_initial', '2020-03-04 15:13:40.865124'),
(3, 'admin', '0001_initial', '2020-03-04 15:13:43.907430'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-03-04 15:13:44.604382'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-03-04 15:13:44.643016'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-03-04 15:13:45.004798'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-03-04 15:13:45.581353'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-03-04 15:13:45.655195'),
(9, 'auth', '0004_alter_user_username_opts', '2020-03-04 15:13:45.706378'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-03-04 15:13:45.970293'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-03-04 15:13:46.010803'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-03-04 15:13:46.055204'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-03-04 15:13:46.115715'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-03-04 15:13:46.240663'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-03-04 15:13:46.445671'),
(16, 'auth', '0011_update_proxy_permissions', '2020-03-04 15:13:46.487153'),
(17, 'resortapp', '0001_initial', '2020-03-04 15:13:47.129476'),
(18, 'sessions', '0001_initial', '2020-03-04 15:13:48.320747'),
(19, 'resortapp', '0002_auto_20200307_0100', '2020-03-07 09:16:39.381416'),
(20, 'resortapp', '0003_room', '2020-03-07 09:16:39.464608'),
(21, 'resortapp', '0004_auto_20200309_0135', '2020-03-09 08:36:00.434219'),
(22, 'resortapp', '0005_auto_20200309_0144', '2020-03-09 08:44:46.836421'),
(23, 'resortapp', '0006_auto_20200309_0252', '2020-03-09 09:53:03.823577'),
(24, 'resortapp', '0007_auto_20200309_0252', '2020-03-09 09:53:03.836181'),
(25, 'resortapp', '0008_auto_20200309_0328', '2020-03-09 10:29:00.397691'),
(26, 'resortapp', '0009_auto_20200309_0333', '2020-03-09 10:33:22.129052'),
(27, 'resortapp', '0010_auto_20200309_0341', '2020-03-09 10:41:10.521016'),
(28, 'resortapp', '0011_delete_room', '2020-03-09 11:08:49.356991'),
(29, 'resortapp', '0002_auto_20200309_0444', '2020-03-09 11:44:17.431653'),
(30, 'resortapp', '0003_auto_20200311_0642', '2020-03-11 13:42:08.534174');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ptxeed36f9izrddkw3wvusjb3m8recy4', 'NTI2ODUyYmQyNTk4ZDZiZWE2MDM4NmI0NDVhMDJhNmRlZmFmM2Q0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWIyODUzZmIwZGI0ZjFlNGIyODU5NjQ1Y2ViM2ZmZjBhZTNkYzljIn0=', '2020-03-26 07:54:53.045606'),
('srfts5a2qm4i57eqadb7n7d63cp16uum', 'NTI2ODUyYmQyNTk4ZDZiZWE2MDM4NmI0NDVhMDJhNmRlZmFmM2Q0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWIyODUzZmIwZGI0ZjFlNGIyODU5NjQ1Y2ViM2ZmZjBhZTNkYzljIn0=', '2020-03-19 09:30:03.612004');

-- --------------------------------------------------------

--
-- Table structure for table `resortapp_activity`
--

CREATE TABLE `resortapp_activity` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resortapp_activity`
--

INSERT INTO `resortapp_activity` (`id`, `name`, `description`, `photo`) VALUES
(1, 'firecamp', 'firecamp', 'dandeli-nightout-camping-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `resortapp_booking`
--

CREATE TABLE `resortapp_booking` (
  `id` int(11) NOT NULL,
  `booking_date` datetime(6) NOT NULL,
  `checkin_date` datetime(6) NOT NULL,
  `checkout_date` datetime(6) NOT NULL,
  `number_of_people` int(11) NOT NULL,
  `booking_amount` double NOT NULL,
  `paid_status` varchar(100) NOT NULL,
  `mode_of_payment` varchar(60) NOT NULL,
  `booking_status` varchar(1) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resortapp_booking`
--

INSERT INTO `resortapp_booking` (`id`, `booking_date`, `checkin_date`, `checkout_date`, `number_of_people`, `booking_amount`, `paid_status`, `mode_of_payment`, `booking_status`, `customer_id`, `package_id`) VALUES
(2, '2020-03-11 09:55:37.000000', '2020-03-12 12:00:00.000000', '2020-03-13 12:00:00.000000', 8, 8000, 'pending', '', 'b', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `resortapp_customer`
--

CREATE TABLE `resortapp_customer` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(200) NOT NULL,
  `date_of_birth` datetime(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(128) NOT NULL,
  `city` varchar(200) NOT NULL,
  `pincode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resortapp_customer`
--

INSERT INTO `resortapp_customer` (`id`, `customer_name`, `date_of_birth`, `email`, `mobile`, `city`, `pincode`) VALUES
(1, 'pallavi', '2020-03-05 09:31:54.000000', 'p@gmail.com', '987656', 'jkd', 58021),
(3, 'laxmi', '2018-06-11 09:58:07.000000', 'l@gmail.com', '090355 53023', 'jkd', 580121);

-- --------------------------------------------------------

--
-- Table structure for table `resortapp_designation`
--

CREATE TABLE `resortapp_designation` (
  `id` int(11) NOT NULL,
  `designation_name` varchar(60) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resortapp_designation`
--

INSERT INTO `resortapp_designation` (`id`, `designation_name`, `description`) VALUES
(1, 'Cook', 'Cooks'),
(2, 'Manager', 'Manager for Resort'),
(3, 'Accountant', 'Accounts Department'),
(4, 'Receiptionist', 'Enquiry Desk');

-- --------------------------------------------------------

--
-- Table structure for table `resortapp_employee`
--

CREATE TABLE `resortapp_employee` (
  `id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_number` varchar(128) NOT NULL,
  `salary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resortapp_employee`
--

INSERT INTO `resortapp_employee` (`id`, `designation_id`, `name`, `address`, `phone_number`, `salary`) VALUES
(1, 1, 'pal', 'mudhol', '095384 12253', 18000),
(2, 2, 'priya', 'mudhol', '095384 12253', 8000);

-- --------------------------------------------------------

--
-- Table structure for table `resortapp_enquiry`
--

CREATE TABLE `resortapp_enquiry` (
  `id` int(11) NOT NULL,
  `enquiry_date` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(128) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number_of_adults` int(11) NOT NULL,
  `number_of_children` int(11) NOT NULL,
  `enquiry_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resortapp_enquiry`
--

INSERT INTO `resortapp_enquiry` (`id`, `enquiry_date`, `name`, `address`, `mobile`, `email`, `number_of_adults`, `number_of_children`, `enquiry_status`) VALUES
(4, '2020-03-11 06:39:32.788948', 'chandru', 'dwd', '8618218519', 'pallavisn099@gmail.com', 2, 1, 'pending'),
(5, '2020-03-11 06:43:44.159303', 'laxmi', 'dwd', '090355 53023', 'pallavisn099@gmail.com', 2, 0, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `resortapp_food`
--

CREATE TABLE `resortapp_food` (
  `id` int(11) NOT NULL,
  `food_name` varchar(200) NOT NULL,
  `food_category` varchar(100) NOT NULL,
  `food_type` varchar(100) NOT NULL,
  `price_per_unit` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resortapp_food`
--

INSERT INTO `resortapp_food` (`id`, `food_name`, `food_category`, `food_type`, `price_per_unit`) VALUES
(1, 'veg pulav', 'rice', 'meals', 70);

-- --------------------------------------------------------

--
-- Table structure for table `resortapp_package_details`
--

CREATE TABLE `resortapp_package_details` (
  `id` int(11) NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `amount_per_head` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resortapp_package_details`
--

INSERT INTO `resortapp_package_details` (`id`, `package_name`, `description`, `amount_per_head`) VALUES
(1, 'Group Cottages(6,8,10 Person)', 'Food : buffet style    1 breakfast,     1 lunch (Veg)  1 dinner( veg/non-veg buffet)   morning', 10000),
(2, '1 Night & 2 Days', 'Activities: Fire camp,River rafting, Trecking,Nature adventure camp Food : buffet style  breakfast ,', 1500),
(3, '2 days & 3 Night', 'Activities: Fire camp,River rafting, Trecking,Nature adventure camp Food : buffet style  breakfast ,', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `resortapp_purchase_details`
--

CREATE TABLE `resortapp_purchase_details` (
  `id` int(11) NOT NULL,
  `purchase_date` datetime(6) NOT NULL,
  `purchase_description` varchar(100) NOT NULL,
  `purchase_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resortapp_purchase_details`
--

INSERT INTO `resortapp_purchase_details` (`id`, `purchase_date`, `purchase_description`, `purchase_amount`) VALUES
(1, '2020-03-02 09:57:09.000000', 'grocery', 7);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `resortapp_activity`
--
ALTER TABLE `resortapp_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resortapp_booking`
--
ALTER TABLE `resortapp_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resortapp_booking_customer_id_dc22b0e3_fk_resortapp_customer_id` (`customer_id`),
  ADD KEY `resortapp_booking_package_id_55316033_fk_resortapp` (`package_id`);

--
-- Indexes for table `resortapp_customer`
--
ALTER TABLE `resortapp_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resortapp_designation`
--
ALTER TABLE `resortapp_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resortapp_employee`
--
ALTER TABLE `resortapp_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resortapp_enquiry`
--
ALTER TABLE `resortapp_enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resortapp_food`
--
ALTER TABLE `resortapp_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resortapp_package_details`
--
ALTER TABLE `resortapp_package_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resortapp_purchase_details`
--
ALTER TABLE `resortapp_purchase_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `resortapp_activity`
--
ALTER TABLE `resortapp_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `resortapp_booking`
--
ALTER TABLE `resortapp_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resortapp_customer`
--
ALTER TABLE `resortapp_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `resortapp_designation`
--
ALTER TABLE `resortapp_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `resortapp_employee`
--
ALTER TABLE `resortapp_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resortapp_enquiry`
--
ALTER TABLE `resortapp_enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `resortapp_food`
--
ALTER TABLE `resortapp_food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `resortapp_package_details`
--
ALTER TABLE `resortapp_package_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `resortapp_purchase_details`
--
ALTER TABLE `resortapp_purchase_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

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

--
-- Constraints for table `resortapp_booking`
--
ALTER TABLE `resortapp_booking`
  ADD CONSTRAINT `resortapp_booking_customer_id_dc22b0e3_fk_resortapp_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `resortapp_customer` (`id`),
  ADD CONSTRAINT `resortapp_booking_package_id_55316033_fk_resortapp` FOREIGN KEY (`package_id`) REFERENCES `resortapp_package_details` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
