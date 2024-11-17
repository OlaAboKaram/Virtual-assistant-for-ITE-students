-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2024 at 07:16 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rasa_chatboot`
--

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
(25, 'Can add employee', 7, 'add_employee'),
(26, 'Can change employee', 7, 'change_employee'),
(27, 'Can delete employee', 7, 'delete_employee'),
(28, 'Can view employee', 7, 'view_employee'),
(29, 'Can add permission', 8, 'add_permission'),
(30, 'Can change permission', 8, 'change_permission'),
(31, 'Can delete permission', 8, 'delete_permission'),
(32, 'Can view permission', 8, 'view_permission');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chatboot_response`
--

CREATE TABLE `chatboot_response` (
  `id` int(11) NOT NULL,
  `intent` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `start_date` varchar(50) DEFAULT NULL,
  `end_date` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chatboot_response`
--

INSERT INTO `chatboot_response` (`id`, `intent`, `description`, `answer`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(86, 'utter_tsgel_moz', 'سؤال عن موعد بدء او انتهاء تسجيل الموازي(المدفوع) في الجامعة', 'none', '1/12/2023', '30/12/2023', '2024-08-13 11:22:14', '2024-08-13 11:22:14'),
(87, 'utter_tsgel_gen', ' سؤال عن موعد بدء او انتهاء تسجيل العام(الغير مدفوع) في الجامعة', 'none', '1/11/2023', '30/11/2023', '2024-08-13 11:23:39', '2024-08-15 10:56:02'),
(88, 'utter_tsgel_gen_pep', 'سؤال عن الاوراق المطلوبة للتسجيل العام (الغير مدفوع)', 'عليمات وثبوتيات تسجيل الطلاب\r\nالثبوتيات المطلوبة للتسجيل\r\nالقدامى\r\n- إحضار الهوية الشخصية + البطاقة الجامعية.\r\nلكافة الطلاب الغير سوريين (فلسطيني مقيم - فلسطيني غير. عرب وأجانب ( إحضار بطاقة انتساب من\r\nاتحاد الطلبة الذي ينتمي إليه الطالب.\r\n(وثيقة حسم أشقا', NULL, NULL, '2024-08-13 11:26:53', '2024-08-13 11:26:53'),
(89, 'utter_tsgel_moz_pep', 'سؤال عن الاوراق المطلوبة للتسجيل الموازي (المدفوع)', 'صورة عن الهوية\r\nصورة عن وصل دفع الموازي', NULL, NULL, '2024-08-13 11:29:22', '2024-08-13 11:29:22'),
(90, 'tsgel_sakan_new_students', ' سؤال عن موعد بدء او انتهاء التسجيل للطلاب الحديثين على السكن الطلابي في جامعة دمشق\r\n', '', '2023/11/5', '2023/11/15', '2024-08-13 11:42:06', '2024-08-13 11:42:06'),
(91, 'tsgel_sakan_old_students', 'سؤال عن موعد بدء او انتهاء التسجيل للطلاب القديمين على السكن الطلابي في جامعة دمشق\r\n', '', '3/10/2023', '15/10/2023', '2024-08-13 11:43:38', '2024-08-13 11:43:38'),
(92, 'tsgel_sakan_pep_new_students', 'سؤال عن الاوراق المطلوبة للتسجيل على السكن الجامعي للطلاب الحديثين\r\n', 'عبر التطبيق الالكتروني #SAKAN :\r\n- صورة شخصية واضحة للوجه.\r\n2- صور هوية شخصية سارية وواضحة(الوجه الامامي+ الخلفي).\r\n3- صورة عن الشهادة الثانوية ( يرجى رفعه مكان الوثيقة 1 ).\r\n4- صورة عن نتيجة القبول في المفاضلة العامة ( يرجى رفعه مكان الوثيقة 2).\r\n5- صورة', NULL, NULL, '2024-08-13 11:47:18', '2024-08-13 11:47:18'),
(93, 'tsgel_sakan_pep_old_students', 'سؤال عن الاوراق المطلوبة للتسجيل على السكن الجامعي للطلاب القديمين\r\n', 'صورتين شخصية\r\nصورة عن وصل التسجيل القديم\r\nوصل الدفع\r\nصورتين هوية', NULL, NULL, '2024-08-13 11:48:34', '2024-08-13 11:48:34'),
(94, 'tsgel_trade', 'سؤال عن موعد صدور قوائم التسجيل المباشر للطلاب الأوائل في الباكالوريوس المهني\r\n', '', '31/10/2021', NULL, '2024-08-13 11:53:57', '2024-08-13 11:53:57'),
(95, 'tsgel_stop_pep', 'سؤال عن الاوراق المطلوبة لأيقاف للتسجيل في الجامعة (بشكل مؤقت)', '1- طلب خاص من ديوان الطلاب\r\n2- يقدم شخصيا أو عن طريق الوكيل القانوني\r\n3- صورة عن هوية الطالب\r\n4- صورة عن هوية الوكيل إن وجد وصورة مصدقة عن الوكالة القانونية\r\n5- طوابع قانونية\r\n6- صورة عن وصل التسجيل\r\n7- صورة عن البطاقة الجامعية', NULL, NULL, '2024-08-15 00:54:33', '2024-08-15 00:54:33'),
(96, 'utter_Ph_link', 'طلب رابط مجموعة (غروب) مادة الفيزياء على منصة الفيسبوك او التلغرام', 't.me/fysic', NULL, NULL, '2024-08-15 00:56:51', '2024-08-15 00:56:51'),
(97, 'utter_circut_link', 'طلب رابط مجموعة (غروب) مادة الدارات الكهربائية على منصة الفيسبوك او التلغرام\r\n', 'https://t.me/joinchat/LPCn_VJg1-xKJ-qrg2qGrQ', NULL, NULL, '2024-08-15 00:56:51', '2024-08-15 13:31:28'),
(98, 'tsgel_gen_sy_no', 'سؤال عن موعد بدء او انتهاء التسجيل للطالب السوري غير المقيم في القطر العربي السوري\r\n', '', '5/11/2023', '30/11/2023', '2024-08-15 01:03:25', '2024-08-15 01:03:25'),
(99, 'utter_protest_on_mark_pep', 'سؤال عن الأوراق المطلوبة للاعتراض على علامة العملي أو النظري\r\n', '1 - طلب خطي من ديوان الطلاب\r\n2 - طوابع قانونيا\r\n3 - يرفق بالبطاقة التالفة \r\n4 - يقدم الطلب شخصيا\r\n5 - يقدم طلب الاعتراض العملي خلال 10 أيام من صدور نتائج العملي\r\n6 - يقدم طلب الاعتراض النظري خلال 15 أيام من صدور نتائج العملي\r\n7 - قطع وصل قيمته 8000', NULL, NULL, '2024-08-15 01:21:09', '2024-08-15 01:21:09'),
(100, 'utter_release_card_instead_of_damaged_pep', 'سؤال عن الأوراق المطلوبة لإصدار بطاقة بدل تالف في الجامعة\r\n', 'طلب خطي من ديوان الطلاب\r\nطوابع\r\nيرفق بالبطاقة التالفة\r\nصورة شخصية\r\nالبطاقة التالفة', NULL, NULL, '2024-08-15 01:21:09', '2024-08-15 01:21:09'),
(101, 'utter_statement_on_university_life_pep', 'سؤال عن الأوراق المطلوبة لاصدار حياة جامعية\r\n', '- يقدم شخصياً أو عن طريق الوكيل القانوني\r\n- طلب خاص من ديوان الطلاب\r\n- طوابع قانونية\r\n- تمنح مرة واحدة في الفصل الدراسي\r\n- يوقع عليها قسم الشؤون ثم الامتحانات ثم عميد الكلية\r\n- صورة عن البطاقة الجامعية لغير الخريجين\r\n5 - صورة مصدقة عن التبرع بالدم أو إعفا', NULL, NULL, '2024-08-15 01:26:27', '2024-08-15 01:26:27'),
(102, 'utter_university_card_instead_of_lost_pep', 'سؤال عن الأوراق المطلوبة لاصدار بطاقة جامعية بدل ضائع \r\n', 'طلب خطي من ديوان الطلاب\r\nصورة مصدقة عن ضبط ضياعها من قسم للشرطة\r\nصورة شخصية\r\nطوابع', NULL, NULL, '2024-08-15 01:29:57', '2024-08-15 01:29:57'),
(103, 'utter_symmetric_transformation_pep', 'سؤال عن الأوراق المطلوبة للتحويل المتماثل \r\n', '- طلب خاص من ديوان الطلاب\r\n- صورة عن هوية الطالب وهوية الوكيل إن وجد\r\nيقدم شخصيا أو عن طريق الوكيل القانوني \r\nطوابع\r\nصورة عن الهوية الشخصية\r\nنقل التدريب الجامعي (ذكور)\r\n- براءة دمة من الكلية المحول منها التحويل المتماثل\r\n- صورة مصدقة عن الشهادة الثانوية\r\n', NULL, NULL, '2024-08-15 01:37:13', '2024-08-15 01:37:13'),
(104, 'utter_asymmetric_transformation_pep', 'سؤال عن الأوراق المطلوبة للتحويل الغير متماثل \r\n', 'طلب خاص من شؤون الطلاب المركزية\r\nموافقة لجنة شؤون الطلاب في الكلية ومجلس شؤون الطلاب في الجامعة التحويل غير المتماثل\r\nطوابع\r\nصورة عن الهوية الشخصية\r\nصورة مصدقة عن الشهادة الثانوية الأصلية\r\nبيان عن الحياة الجامعية من الجامعة التي كان يدرس فيها (مترجمة ومصد', NULL, NULL, '2024-08-15 01:42:48', '2024-08-15 01:42:48'),
(105, 'utter_cancel_tsgel_stop_pep', 'سؤال عن الأوراق المطلوبة لالغاء ايقاف التسجيل في الجامعة \r\n', 'طلب خطي ديوان الطلاب\r\nيقدم شخصياً أو عن طريق الوكيل القانوني\r\nصورة عن هوية الطالب وهوية الوكيل إن وجد\r\nطوابع\r\nبيان عن الحياة الجامعية\r\nيوقع عليه قسمي شؤون الطلاب والامتحانات والنائب الاداري\r\n', NULL, NULL, '2024-08-15 01:48:06', '2024-08-15 01:48:06'),
(106, 'utter_tasgel_graduation_document_pep', 'سؤال عن الأوراق المطلوبة لاصدار وثيقة التخرج \r\n', 'طلب خاص من دیوان الطلاب\r\nقدم شخصياً أو عن طريق الوكيل القانوني\r\nبراءة ذمة من التدريب الجامعي (ذكور)\r\nقطع إيصال من شؤون الطلاب يـ 10000 ل.س\r\nطوابع\r\nبراءة نمة من المدينة الجامعية\r\nحصر كفاءات من ديوان الطلاب\r\nتبرع بالدم او إعفاء\r\nصورة عن البطاقة الشخصية\r\nبرا', NULL, NULL, '2024-08-15 01:53:37', '2024-08-15 01:53:37');

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
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'questions', 'employee'),
(8, 'questions', 'permission'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-08-07 19:22:26.450704'),
(2, 'auth', '0001_initial', '2024-08-07 19:22:26.987271'),
(3, 'admin', '0001_initial', '2024-08-07 19:22:27.153826'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-08-07 19:22:27.164795'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-07 19:22:27.179253'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-08-07 19:22:27.259041'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-08-07 19:22:27.320873'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-08-07 19:22:27.340821'),
(9, 'auth', '0004_alter_user_username_opts', '2024-08-07 19:22:27.350793'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-08-07 19:22:27.426975'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-08-07 19:22:27.429967'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-08-07 19:22:27.446921'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-08-07 19:22:27.476842'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-08-07 19:22:27.494795'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-08-07 19:22:27.515738'),
(16, 'auth', '0011_update_proxy_permissions', '2024-08-07 19:22:27.527706'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-08-07 19:22:27.550644'),
(18, 'questions', '0001_initial', '2024-08-07 19:22:27.664340'),
(19, 'sessions', '0001_initial', '2024-08-07 19:22:27.708959'),
(20, 'questions', '0002_remove_employee_hire_date', '2024-08-07 20:41:11.173865'),
(21, 'questions', '0003_remove_permission_hire_date', '2024-08-07 20:41:43.619778'),
(22, 'questions', '0002_auto_20240808_0032', '2024-08-07 21:34:55.575939'),
(23, 'questions', '0002_auto_20240808_0100', '2024-08-07 22:01:37.636099');

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
('2r1qny4mdnr19tntdacslkk14d0dji1v', 'eyJ1c2VyX2lkIjoxfQ:1sbqZL:sLlyUTcczWozVdjtRcYd2IDbvF3qYNSOIbdkLgCC4Rg', '2024-08-21 23:59:51.878164'),
('af8au47qemj0yfqyfmz23na56mvyja0s', 'e30:1sbqQq:L4GJRx1dgL3nH5HnpqxluXB2mJzOKqgrPSrj83t0d_s', '2024-08-21 23:51:04.934466'),
('er9i1bjmr34v9d2og6ue4bksgzvwxb8t', 'eyJ1c2VyX2lkIjoxfQ:1sbqX6:eWrXI5-yxMvgG6S7SSpiaNjm_290hGg1v2iNh5r7SR8', '2024-08-21 23:57:32.600861'),
('j5yt3ap7sklal2tu0gf4lip9qg8pknbh', 'eyJ1c2VyX2lkIjoxfQ:1sbqTr:hL-Yq1h-JwdFqyOoqZHioRUp4arZ14vga9iCO6_L6HQ', '2024-08-21 23:54:11.444868'),
('rx5le8m6vvxezfrt98o0gz5qggg1bhyk', 'eyJ1c2VyX2lkIjoxfQ:1sbqWh:uEYpd3m8Z-8qpmBWah2DCqAtfupu_WgoCjDQVpPPt14', '2024-08-21 23:57:07.363049'),
('sxpbwocbre6r6ytx0v78y5770mn8ouco', 'e30:1sbqTA:Da5CDL2IhFKTrZUOK_HF1eI0S2VOadrPV1dRyAs81Q0', '2024-08-21 23:53:28.405306'),
('vqn61wgdend5purtf5q82d6h2rf9u9be', 'eyJ1c2VyX2lkIjoxfQ:1sbqXm:9yIxCVlltoOuENI-bEpfFRB_eJ9kyu-RIY5ao1ycul8', '2024-08-21 23:58:14.209058');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Super', 'Admin', 'superadmin@example.com', 'pbkdf2_sha256$720000$VgZyYBk6wXQhSBDYdxpUcv$ULeAPkew+cjYn21w05BvOBGP7FQ9dfNYZUrrupaaMMU=');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `employee_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `employee_id`) VALUES
(1, 'employees_create', 1),
(2, 'employees_read', 1),
(3, 'employees_update', 1),
(4, 'employees_delete', 1),
(5, 'questions_create', 1),
(6, 'questions_read', 1),
(7, 'questions_update', 1),
(8, 'questions_delete', 1);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `chatboot_response`
--
ALTER TABLE `chatboot_response`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `intent` (`intent`);

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
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_employee_id_366e3149_fk_employees_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `chatboot_response`
--
ALTER TABLE `chatboot_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_employee_id_366e3149_fk_employees_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
