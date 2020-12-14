-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2020 at 05:13 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `protonic`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add category', 1, 'add_category'),
(2, 'Can change category', 1, 'change_category'),
(3, 'Can delete category', 1, 'delete_category'),
(4, 'Can add product', 2, 'add_product'),
(5, 'Can change product', 2, 'change_product'),
(6, 'Can delete product', 2, 'delete_product'),
(7, 'Can add log entry', 3, 'add_logentry'),
(8, 'Can change log entry', 3, 'change_logentry'),
(9, 'Can delete log entry', 3, 'delete_logentry'),
(10, 'Can add permission', 4, 'add_permission'),
(11, 'Can change permission', 4, 'change_permission'),
(12, 'Can delete permission', 4, 'delete_permission'),
(13, 'Can add group', 5, 'add_group'),
(14, 'Can change group', 5, 'change_group'),
(15, 'Can delete group', 5, 'delete_group'),
(16, 'Can add user', 6, 'add_user'),
(17, 'Can change user', 6, 'change_user'),
(18, 'Can delete user', 6, 'delete_user'),
(19, 'Can add content type', 7, 'add_contenttype'),
(20, 'Can change content type', 7, 'change_contenttype'),
(21, 'Can delete content type', 7, 'delete_contenttype'),
(22, 'Can add session', 8, 'add_session'),
(23, 'Can change session', 8, 'change_session'),
(24, 'Can delete session', 8, 'delete_session'),
(25, 'Can add reviews', 9, 'add_reviews'),
(26, 'Can change reviews', 9, 'change_reviews'),
(27, 'Can delete reviews', 9, 'delete_reviews'),
(28, 'Can add order', 10, 'add_order'),
(29, 'Can change order', 10, 'change_order'),
(30, 'Can delete order', 10, 'delete_order'),
(31, 'Can add order details', 11, 'add_orderdetails'),
(32, 'Can change order details', 11, 'change_orderdetails'),
(33, 'Can delete order details', 11, 'delete_orderdetails'),
(34, 'Can add mail', 12, 'add_mail'),
(35, 'Can change mail', 12, 'change_mail'),
(36, 'Can delete mail', 12, 'delete_mail');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'bcrypt_sha256$$2b$12$grx6PRQ0uxWkuGQKj3UGlurBD85QIN49n3nrqwy8.WKlM7YoqiBJa', '2020-06-14 15:00:07.767962', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2020-05-19 16:28:39.597485'),
(2, 'bcrypt_sha256$$2b$12$cc32lBobqfhVP6.9bqzGyuieACWUXH3tgiitMd0HgXKurk74gxqWS', '2020-05-22 18:26:04.613011', 0, 'umer3d', 'Umer', 'Saeed', 'umersaeed3d@gmail.com', 0, 1, '2020-05-22 16:25:06.894043'),
(3, 'bcrypt_sha256$$2b$12$1wCcS.vVZQNczBPBFjIqEOSXNfmGbZzUXfuq86Nk5zb8adpETFfCO', '2020-06-06 12:41:02.845217', 0, 'umer', 'umer', 'saeed', 'umer@yopmail.com', 0, 1, '2020-06-06 12:41:01.878817'),
(4, 'bcrypt_sha256$$2b$12$.DkP4xiquH/Qi82ys0aYxeTp908/wQV7lvPY3owds6wtmT08/zm0K', '2020-06-14 14:56:01.829054', 0, 'abm', 'abdullah', 'mazhar', 'abdullahmazharbulc@gmail.com', 0, 1, '2020-06-06 13:09:02.644847');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'admin', 'logentry'),
(5, 'auth', 'group'),
(4, 'auth', 'permission'),
(6, 'auth', 'user'),
(7, 'contenttypes', 'contenttype'),
(1, 'polls', 'category'),
(12, 'polls', 'mail'),
(10, 'polls', 'order'),
(11, 'polls', 'orderdetails'),
(2, 'polls', 'product'),
(9, 'polls', 'reviews'),
(8, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-05-19 16:26:56.676086'),
(2, 'auth', '0001_initial', '2020-05-19 16:27:03.617687'),
(3, 'admin', '0001_initial', '2020-05-19 16:27:06.037313'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-05-19 16:27:06.093549'),
(5, 'contenttypes', '0002_remove_content_type_name', '2020-05-19 16:27:06.930843'),
(6, 'auth', '0002_alter_permission_name_max_length', '2020-05-19 16:27:07.619512'),
(7, 'auth', '0003_alter_user_email_max_length', '2020-05-19 16:27:08.371603'),
(8, 'auth', '0004_alter_user_username_opts', '2020-05-19 16:27:08.427568'),
(9, 'auth', '0005_alter_user_last_login_null', '2020-05-19 16:27:08.730165'),
(10, 'auth', '0006_require_contenttypes_0002', '2020-05-19 16:27:08.767143'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2020-05-19 16:27:08.804121'),
(12, 'auth', '0008_alter_user_username_max_length', '2020-05-19 16:27:09.323928'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2020-05-19 16:27:09.795508'),
(14, 'polls', '0001_initial', '2020-05-19 16:27:10.508767'),
(15, 'polls', '0002_remove_category_p_desc', '2020-05-19 16:27:10.847629'),
(16, 'sessions', '0001_initial', '2020-05-19 16:27:11.215785'),
(17, 'polls', '0003_auto_20200519_2220', '2020-05-19 17:20:37.270455'),
(18, 'polls', '0004_reviews', '2020-05-19 21:12:00.303738'),
(19, 'polls', '0005_auto_20200520_0232', '2020-05-19 21:32:58.617984'),
(20, 'polls', '0006_order_orderdetails', '2020-05-21 18:32:24.755150'),
(21, 'polls', '0007_auto_20200521_2337', '2020-05-21 18:37:31.662571'),
(22, 'polls', '0008_orderdetails_price', '2020-05-21 18:48:45.499578'),
(23, 'polls', '0009_auto_20200522_0038', '2020-05-21 19:38:05.210264'),
(24, 'polls', '0010_mail_user_id', '2020-05-22 17:43:22.465028'),
(25, 'polls', '0011_orderdetails_user_id', '2020-05-22 18:24:48.886487');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('k3ilsbi6si1d0wulo4pqqzkdni5lnwcc', 'MGZjNjc3YmM3ZTA5ODJjMzdiNDMyNzBlZjQ2M2I5NjdmMTAxNDIxMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YzYxNjg4ZWZjOTViNjBiNWE0ZjZiNzhhMzZjNzliNGJmMGQ0ZjI2IiwiY2FydCI6W1siMiIsIm9ud2hleTVfMXVZRG8wTC5qcGciLCJPTiBXaGV5IFByb3RlaW4iLCJXaGV5IGlzIHRoZSBsaXF1aWQgcmVtYWluaW5nIGFmdGVyIG1pbGsgaGFzIGJlZW4gY3VyZGxlZCBhbmQgc3RyYWluZWQuIEl0IGlzIGEgYnlwcm9kdWN0IG9mIHRoZSBtYW51ZmFjdHVyZSBvZiBjaGVlc2Ugb3IgY2FzZWluIGFuZCBoYXMgc2V2ZXJhbCBjb21tZXJjaWFsIHVzZXMuIiwiMSIsODUwMF1dfQ==', '2020-06-05 18:26:12.178972');

-- --------------------------------------------------------

--
-- Table structure for table `polls_category`
--

CREATE TABLE `polls_category` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `polls_category`
--

INSERT INTO `polls_category` (`c_id`, `c_name`) VALUES
(2, 'Mass Gainers'),
(3, 'Bcaas'),
(4, 'Whey Protein'),
(5, 'Pre-Workout'),
(6, 'Fat Burners'),
(7, 'Multivitamins');

-- --------------------------------------------------------

--
-- Table structure for table `polls_contact`
--

CREATE TABLE `polls_contact` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `body` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `polls_contact`
--

INSERT INTO `polls_contact` (`id`, `subject`, `body`, `email`, `telephone`, `name`) VALUES
(1, 'hello', 'asdad', 'umersaeed3d@gmail.com', '0304343', 'Umer'),
(2, 'Testing', 'testing body', 'umer@yopmail.com', '03234343', 'Umer');

-- --------------------------------------------------------

--
-- Table structure for table `polls_mail`
--

CREATE TABLE `polls_mail` (
  `m_id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `body` varchar(50) NOT NULL,
  `from_email` varchar(50) NOT NULL,
  `to_email` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `polls_mail`
--

INSERT INTO `polls_mail` (`m_id`, `subject`, `body`, `from_email`, `to_email`, `user_id`) VALUES
(1, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'fsdfsd@ghfdgfd', ''),
(2, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'lahore@gmail', ''),
(3, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'lahore@gmail', ''),
(4, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'abdullahmazharbulc@gmail.com', ''),
(5, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'abdullahmazharbulc@gmail.com', ''),
(6, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'abdullahmazharbulc@gmail.com', ''),
(7, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'abdullahmazharbulc@gmail.com', ''),
(8, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'abdullahmazharbulc@gmail.com', ''),
(9, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'abdullahmazharbulc@gmail.com', ''),
(10, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'abdullahmazharbulc@gmail.com', ''),
(11, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'abdullahmazharbulc@gmail.com', ''),
(12, 'Order Confirmation At Protonic Nutrition', '<h1 style=\"text-align:center\">Thank you for shoppi', 'protonicnutrition@gmail.com', 'abdullahmazharbulc@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `polls_order`
--

CREATE TABLE `polls_order` (
  `o_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `polls_order`
--

INSERT INTO `polls_order` (`o_id`, `name`, `mobile`, `email`, `city`, `address`, `method`, `date`, `user_id_id`) VALUES
(4, 'abdullah', '03046584342', 'abdullahmazharbulc@gmail.com', 'lahore', '16-b', 'Cash On Delivery', '2020-06-05 19:00:00', 4),
(5, 'abdullah', '03046584342', 'abdullahmazharbulc@gmail.com', 'lahore', 'lahore', 'Cash On Delivery', '2020-06-05 19:00:00', 4),
(6, 'umer', '0303053445234', 'abdullahmazharbulc@gmail.com', 'lahore', '13-b', 'Cash On Delivery', '2020-06-05 19:00:00', 4),
(7, 'abdullah', '03046584342', 'abdullahmazharbulc@gmail.com', 'lahore', 'lahore', 'Cash On Delivery', '2020-06-10 19:00:00', 1),
(8, 'abdullah', '03046584342', 'abdullahmazharbulc@gmail.com', 'lahore', 'lahore', 'Cash On Delivery', '2020-06-10 19:00:00', 1),
(9, 'abdullah', '03046584342', 'abdullahmazharbulc@gmail.com', 'lahore', 'lahore', 'Cash On Delivery', '2020-06-10 19:00:00', 4),
(10, 'abdullah', '03046584342', 'abdullahmazharbulc@gmail.com', 'lahore', 'lahore', 'Cash On Delivery', '2020-06-10 19:00:00', 4),
(11, 'abdullah', '03046584342', 'abdullahmazharbulc@gmail.com', 'lahore', 'lahore', 'Cash On Delivery', '2020-06-13 19:00:00', 4),
(12, 'abdullah', '03046584342', 'abdullahmazharbulc@gmail.com', 'lahore', 'lahore', 'Cash On Delivery', '2020-06-13 19:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `polls_orderdetails`
--

CREATE TABLE `polls_orderdetails` (
  `od_id` int(11) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `order_id_id` int(11) DEFAULT NULL,
  `p_id_id` int(11) DEFAULT NULL,
  `price` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `polls_orderdetails`
--

INSERT INTO `polls_orderdetails` (`od_id`, `quantity`, `order_id_id`, `p_id_id`, `price`, `user_id`) VALUES
(8, '1', 7, 20, '12000', ''),
(9, '1', 7, 5, '6200', ''),
(10, '1', 7, 33, '4300', ''),
(11, '1', 8, 6, '8200', ''),
(12, '1', 9, 5, '6200', ''),
(13, '1', 10, 15, '7500', ''),
(14, '1', 10, 21, '4000', ''),
(15, '1', 11, 6, '8200', ''),
(16, '1', 12, 5, '6200', '4');

-- --------------------------------------------------------

--
-- Table structure for table `polls_product`
--

CREATE TABLE `polls_product` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `p_desc` varchar(500) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `d_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `polls_product`
--

INSERT INTO `polls_product` (`p_id`, `p_name`, `p_desc`, `cat_id`, `price`, `d_price`, `discount`, `image`) VALUES
(5, 'Anabolic Peak / Hard Mass 6lbs By Inner Armour', 'Description Anabolic Peak is a gainer suitable only for athletes and most demanding athletes, those who are willing to try a unique product, with more than 25,000 calories and more than one million mg of amino acids. Anabolic Peak also has glutamine, BCAAs, creatine and Waxi Maize, with these amounts, you build lean muscle mass, increase your athletic performance, strength and size of your muscles.', 2, 7000, 6200, 800, 'a.jpg'),
(6, 'Anabolic Peak 12lbs By Inner Armour', 'Anabolic Peak is a gainer suitable only for athletes and most demanding athletes, those who are willing to try a unique product, with more than 25,000 calories and more than one million mg of amino acids. Anabolic Peak also has glutamine, BCAAs, creatine and Waxi Maize, with these amounts, you build lean muscle mass, increase your athletic performance, strength and size of your muscles.', 2, 9000, 8200, 800, 'b.jpg'),
(7, 'Carnivor Mass 5.99lbs By MuscleMeds', 'Ignite Anabolism: Faster Protein, Faster Carbs and iSpike Promote Explosive Muscle Growth!* It takes more than just calories to gain muscle mass. In order to stimulate rapid muscle growth (and not fat) it takes both calories and precise nutrient partitioning to create a highly anabolic environment.', 2, 7000, 6200, 800, '3.jpg'),
(8, 'Combat XL Mass Gainer 12lbs By MusclePharm', 'Description MusclePharm® Combat XL™ is a revolutionary weight gaining supplement formulated with dense, functional calories and essential nutrients partitioned precisely to create the perfect muscle building environment an athlete needs. Featuring essential fatty acids, complex carbohydrates, and 4 sources of protein, Combat XL works to promote muscle recovery allowing you to get big – and stay big!', 2, 9000, 7000, 2000, 'd.jpg'),
(9, 'Combat XL Mass Gainer 6lbs By MusclePharm', 'MusclePharm® Combat XL™ is a revolutionary weight gaining supplement formulated with dense, functional calories and essential nutrients partitioned precisely to create the perfect muscle building environment an athlete needs. Featuring essential fatty acids, complex carbohydrates, and 4 sources of protein, Combat XL works to promote muscle recovery allowing you to get big – and stay big!', 2, 6000, 5000, 1000, 'e.jpg'),
(10, 'Gain Fast 10lbs By Universal', 'Gain Fast comes enhanced with muscle boosters, performance factors, natural plant sterols, EFAs, digestive enzymes, and muscle optimizers. So, whether you want to bulk up in the off-season, or you just want to add some quality mass, turn to Gain Fast 3100.', 2, 9000, 8000, 1000, 'f.jpg'),
(11, 'Gain Fast 5.1lbs By Universal Nutrition', 'Gain Fast comes enhanced with muscle boosters, performance factors, natural plant sterols, EFAs, digestive enzymes, and muscle optimizers. So, whether you want to bulk up in the off-season, or you just want to add some quality mass, turn to Gain Fast 3100.', 2, 6000, 5000, 1000, 'g.jpg'),
(12, 'Gainer Xtreme 12lbs By Api', 'Description GAINER XTREME is a powerhouse hard gainer. Each serving provides 1,290 calories (varies slightly by flavor) and 51g of protein derived from whey and casein to provide a quick and sustained-release. GAINER XTREME is loaded with complex and simple carbohydrates for extended energy levels to pack on lean muscle mass.', 2, 9000, 8000, 1000, 'h.jpg'),
(13, 'Animal Whey 10lbs By Universal Nutrition', 'Animal Whey, just like any other protein powder supplement made from whey protein isolate, contains nothing but pure protein. It undergoes a unique micro filtration process that gets rids of any impurities along with the extra fat, and carbs. As a result, you get pure protein plus other essential nutrients which are as follows:  121 calories 1 gram fat 3 grams of carbs 1 gram of sugar 25 grams of protein Vitamin A, C, and other important minerals', 4, 16000, 14000, 2000, 'i.jpg'),
(14, 'Best Protein 5lbs By Bpi Sports', 'BEST PROTEIN™ BPI Sports’ BEST PROTEIN™ is the perfect blend of high-quality 100% whey proteins for the best tasting, best formulated, and best overall value protein.  The Best Combination of “Quality + Value”! High-Quality 100% Whey Proteins! Helps Build Lean Muscle & Promotes Muscle Recovery!', 4, 8000, 7000, 1000, 'j.jpg'),
(15, 'Carnivor Beef Protein 4.5lbs By MuscleMeds', 'MuscleMeds reveals the exciting behind-the-scene developments of their revolutionary scientific breakthroughs in Protein Supplement technology, which led to the invention of the world’s first pharmaceutical grade beef protein isolate supplement – CARNIVOR. It all started when the MuscleMeds Research Team embarked on their ambitious research project to develop the most concentrated beef protein isolate supplement ever created. Scientists have established that when designing protein products, a ma', 4, 9000, 7500, 1500, 'k.jpg'),
(16, 'Carnivor Beef Protein 8lbs By MuscleMeds', 'MuscleMeds reveals the exciting behind-the-scene developments of their revolutionary scientific breakthroughs in Protein Supplement technology, which led to the invention of the world’s first pharmaceutical grade beef protein isolate supplement – CARNIVOR. It all started when the MuscleMeds Research Team embarked on their ambitious research project to develop the most concentrated beef protein isolate supplement ever created. Scientists have established that when designing protein products, a ma', 4, 15000, 13000, 2000, 'l.jpg'),
(17, 'Combat 100% Casein 4lbs By MusclePharm', '100% MICELLAR CASEIN: Combat 100% Casein protein powder delivers sustained, slow-digesting protein and amino acids that work hard to rebuild and repair muscle while you sleep. It’s made with 28 grams of Micellar Casein per serving REPAIRS & REBUILDS MUSCLE: Sleeping is an optimal time to repair and rebuild muscles. To assist this natural process, taking a potent casein protein powder will feed your muscles with a powerful supplement', 4, 9000, 8000, 1000, 'm.jpg'),
(18, 'Combat 100% isolate By MusclePharm', 'MusclePharm®’s Combat 100% Isolate® is scientifically-engineered to deliver 24 grams of 100% whey protein isolate per 27 gram serving— high-quality protein with no added fillers. After an intense workout session, your muscles are starved for nutrients and need true results fast. Isolates are of the most refined protein sources, scientifically filtered to remove fats, sugars, and carbohydrates making them a fast-digesting source of protein and an ideal solution to help deliver superior results.', 4, 10000, 9000, 1000, 'lol.jpg'),
(19, 'Gold Standard 100% whey 10lbs By Optimum Nutrition', 'Whey Protein Isolates (WPI) are the purest form of whey protein that currently exists. WPIs are costly to use, but rate among the best proteins that money can buy. That’s why they’re the first ingredient you read on the Gold Standard 100% Whey™ label. By using WPI as the primary ingredient along with premium ultra-filtered whey protein concentrate (WPC), we’re able to pack 24 grams of protein into every serving to support your muscle building needs after training. ON’s attention to detail also e', 4, 18000, 16000, 2000, 'n.jpg'),
(20, 'Iso100 Hydrolyzed Whey Protein 4.9lbs By Dymatize', 'ISO100® is simply muscle-building fuel. Each serving contains 25 grams of protein and 5.5g of BCAAs including 2.7g of L-Leucine. Known worldwide for quality, taste and purity, ISO100 is produced to our highest quality standards. ISO100 is formulated using a cross-flow micro filtration, multi-step purification process that preserves important muscle-building protein fractions while removing excess carbohydrates, fat, lactose and cholesterol. ISO100 is made with pre-hydrolyzed protein sources to e', 4, 13000, 12000, 1000, 'o.jpg'),
(21, 'AminoX Edge 28 Servings By Bsn', 'AMINOx EDGE has been designed to aid endurance and give you the energy and focus boost you need to tackle today’s workout, along with the recovery support essential to grind it out again tomorrow. This unique performance blend combines 10g of Amino Acids, 125mg of caffeine, and Euphoria Longana & Lindera Aggregata, ingredients used for centuries in ancient Chinese medicine.', 3, 5000, 4000, 1000, 'p.jpg'),
(22, 'Bcaa 30 Servings By MusclePharm', 'Reduce muscle soreness post workout Perfect for anytime use – before, during or after workout Train harder, recover faster, build more muscle Support muscle endurance during workout', 3, 5000, 4000, 1000, 'q.jpg'),
(23, 'Best Bcaa 30 Servings By Bpi Sports', 'Peptide Linked Branched Chain Amino Acids to help you recover faster, preserve lean muscle mass, and improve exercise performance.  The branched chain amino acids found in BEST BCAA™ (leucine, isoleucine, and valine) cannot be produced naturally in the body – therefore we have to supplement with them in order to enhance protein synthesis and increase muscle growth over time. The Oligopeptide-Enzymatic Technology™ takes the 3 amino acids, concentrates them, and bonds them together to maximize mus', 3, 5000, 4000, 1000, 'r.jpg'),
(24, 'Essential Amino Energy 30 Servings By Optimum Nutr', 'Mix up ESSENTIAL AMIN.O. ENERGY™ anytime you want a fruit flavored or coffeehouse inspired boost of energy and alertness. You can determine what’s appropriate for any situation, adding a 2-scoop serving to water for an afternoon pick-me-up or increasing the amino acid matrix to 10 grams with a 4-scoop pre-workout energy supplement that delivers 200 mg of caffeine from green coffee and/or green tea extracts', 3, 4000, 3500, 500, 't.jpg'),
(25, 'Flavored BCAA 12,000 Powder 30 Servings By Ultimat', 'During long-term and sustained exercise, muscles use large amounts of amino acids as a source for energy. The body prefers to use BCAAs for energy, since they readily replace glucose in the energy production pathways. As muscles begin to use BCAAs, the amounts of these amino acids drop, which allows tryptophan to enter the brain, inducing fatigue and tiredness. Research shows that supplementation with branched-chain amino acids can prevent central fatigue by tightly regulating the amount of tryp', 3, 5000, 3200, 1800, 'u.jpg'),
(26, 'FlexX BCAAs 60 Servings By Gat Sport', 'GAT SPORT brings you the most delicious fermented BCAAs drink on the market in candy flavors providing lasting taste satisfaction. FLEXX BCAAs deliver 7 grams of essential amino acids to protect athletes hard-earned muscles. FLEXX BCAAs 2:1:1 ratio of Leucine to Isoleucine and Valine is the most scientifically studied ratio for athletic performance. This combination has been shown to be effective in numerous studies to reduce muscle damage and accelerate recovery from resistance training.', 3, 6000, 5000, 1000, 'v.jpg'),
(27, 'Xtend X The Original 30 Servings By Scivation', 'For over 10 years, XTEND® has been making the best recovery products in the world. The award-winning XTEND® Original formula is powered by 7 grams of branched-chain amino acids (BCAAs), which have been clinically shown to support muscle repair, recovery, and growth. XTEND® Original also contains a unique blend of hydrating electrolytes and additional performance ingredients to help you refuel, repair, and recover.', 3, 5000, 4000, 1000, 'w.jpg'),
(28, 'Xtend X The Original 90 Servings By Scivation', 'For over 10 years, XTEND® has been making the best recovery products in the world. The award-winning XTEND® Original formula is powered by 7 grams of branched-chain amino acids (BCAAs), which have been clinically shown to support muscle repair, recovery, and growth. XTEND® Original also contains a unique blend of hydrating electrolytes and additional performance ingredients to help you refuel, repair, and recover.', 3, 9000, 8000, 1000, 'x.jpg'),
(29, 'AminoX Edge 28 Servings By Bsn', 'AMINOx EDGE has been designed to aid endurance and give you the energy and focus boost you need to tackle today’s workout, along with the recovery support essential to grind it out again tomorrow. This unique performance blend combines 10g of Amino Acids, 125mg of caffeine, and Euphoria Longana & Lindera Aggregata, ingredients used for centuries in ancient Chinese medicine.', 5, 5000, 4500, 500, 'y.jpg'),
(30, 'Athlete’s Pre 25 Servings By Dymatize', 'Energy – Strength – Pump – Intensity Dietary Supplement Naturally Flavored Informed-Sport.com Trusted by Sport Banned Substance Tested Citrulline Malate  4 g Beta-Alanine: CarnoSyn 1.6 g TeaCrine 125 mg 25 Servings Gluten Free/No Dyes TeaCrine', 5, 5000, 4000, 1000, 'z.jpg'),
(31, 'C4 Extreme Energy 30 Servings By Cellucor', 'We know that for some, just a little bit of energy isn’t enough.  This product is here to help you get up and go, and rise to any challenge. It’s the next step for those who want that extra rush. Its formula features more focus and more endurance than C4 Original.', 5, 5000, 4000, 1000, 'aa.jpg'),
(32, 'C4 Original 30 Servings By Cellucor', 'Explosive energy, heightened focus and an overwhelming urge to tackle any challenge…that’s the C4 experience. Millions of people—ranging from beginners all the way up to the elite competitors, have relied on C4 to help them turn their ambitions into achievements.', 5, 4000, 3000, 1000, 'ab.jpg'),
(33, 'Cla + Carnitine 50 Servings By Bpi Health', 'Reduces Body Fat. Promotes Lean Muscle. Supports Athletic Performance. BPI Health’s CLA + Carnitine is the Ultimate, Non-Stim Weight Loss Formula With this powerful combination you can now transformyour body into a fat burning machine. CLA and Carnitine have both been Clinically Studied and shown to help burn stored body fat for fuel. Carnitine can also Help Improve Strength, Lean Muscle Growth and Athletic Performance.', 5, 5000, 4300, 700, 'ac.jpg'),
(34, 'Creatine Monohydrate 300g (60 Servings) By Ultimat', 'To perform optimally, muscles need a lot of energy. The body provides this energy, in situations like high-intensity exercise, in the form of ATP or adenosine triphosphate. Since the body stores only a limited supply of ATP, which lasts for only a few seconds of intense exercise, ATP must then be continuously produced to supply enough energy for the muscles to function. A burst of energy is produced by the breakdown of ATP, when one phosphate group is released, creating metabolic energy. The bod', 5, 5000, 3000, 2000, 'ad.jpg'),
(35, 'Cell-Tech Sx-7 Revolution 50 Servings By MuscleTec', 'CELL-TECH™ SX-7® Revolution is a powerful formula that features dual-phase ActivSphere® technology and delivers advanced key ingredients for increased muscle size, enhanced strength and superior recovery. This exclusive formula carries on the iconic name synonymous with the creatine game, CELL-TECH, to deliver unprecedented gains in muscle size and strength!', 5, 5000, 4000, 1000, 'ae.jpg'),
(36, 'Cell-Tech 6lbs By MuscleTech', 'Years of study by top human performance researchers has confirmed that insulin is one of the body’s most powerful muscle building hormones. In fact, research published in the Journal of Clinical Investigation found that insulin is so potent it could support protein synthesis in skeletal muscle! Insulin is also very anti-catabolic and suppresses protein degradation and stimulates cellular hydration – causing water retention within the muscle cells that translates into greater protein synthesis.', 5, 7000, 6000, 1000, 'af.jpg'),
(37, 'Animal Cuts 42 Packs By Universal Nutrition', 'For bodybuilders, all the muscle in the world means little if it is shrouded by layers of bodyfat. There comes a time when what has been built and hard-earned through the heaviest weights and most intense training sessions, must be displayed to the world. There’s going to be some strict dieting on the horizon, some serious cardio in your future. But it might take something extra to deliver that grainy, striated look of etched musculature. That’s when you add Animal Cuts.', 6, 5000, 4000, 1000, 'ag.jpg'),
(38, 'C4 Ripped 30 Servings By Cellucor', 'C4 Ripped is a pre-workout that combines the explosive energy of C4 with ingredients specific to fat loss. This formula helps you train harder while supporting your body’s ability to burn fat.', 6, 4000, 3000, 1000, 'ah.jpg'),
(39, 'Carnitine 31 Servings By MusclePharm', 'MAXIMUM BENEFIT Turn fat into energy Balanced Carnitine Formula- with raspberry keytones Supports the reduction of body fat and amplifies metabolism Improves Thermogenesis', 6, 3000, 2000, 1000, 'ai.jpg'),
(40, 'Cla + Carnitine 50 Servings By Bpi Health', 'Reduces Body Fat. Promotes Lean Muscle. Supports Athletic Performance. BPI Health’s CLA + Carnitine is the Ultimate, Non-Stim Weight Loss Formula With this powerful combination you can now transformyour body into a fat burning machine. CLA and Carnitine have both been Clinically Studied and shown to help burn stored body fat for fuel. Carnitine can also Help Improve Strength, Lean Muscle Growth and Athletic Performance.', 6, 5000, 4300, 700, 'ac_YrR9PPH.jpg'),
(41, 'Cla 90 SoftGels By Nutrex Research', 'LIPO-6 CLA is a highly concentrated form of the naturally occurring Conjugated Linoleic Acid. When combined with regular exercise CLA can help you get a lean body. It assists in lean muscle development which in turn supports natural fat-burning as the body burns calories to sustain proper muscle function. By supporting a higher metabolic activity LIPO-6 CLA helps dieters to achieve their body composition goals.', 6, 5000, 4000, 1000, 'aj.jpg'),
(42, 'Hydroxycut Hardcore Elite 110 Capsules By MuscleTe', 'Hydroxycut Hardcore® Elite is designed with a key weight loss ingredient, green coffee extract, that has been tested in separate scientific studies for effectiveness. Our formula will give you jacked up energy levels for a boost in intensity, enhanced focus, and a supercharged thermogenic driver (caffeine anhydrous). The result is more energy for your workout, plus a key weight loss driver backed by two scientific studies.', 6, 5000, 3000, 2000, 'ak.jpg'),
(44, 'Hydroxycut LeanX 90 Capsules By MuscleTech', 'For 20 years, the HYDROXYCUT® name has been synonymous with results. And now the next evolution is here: HYDROXYCUT® LEAN X NEXT GEN. The researchers at MuscleTech® have created a potent non-stimulant formula that harnesses the weight loss power of C. canephora robusta without overstimulation.The science speaks for itself: subjects taking the key ingredient in HYDROXYCUT LEAN X NEXT GEN (green coffee extract [C. canephora robusta]) lost 10.95 lbs. in 60 days with a low-calorie diet, and 3.7 lbs.', 6, 4000, 3000, 1000, 'al.jpg'),
(45, 'Lipo6 Black 60 Black Capsules By Nutrex Research', 'Extreme Caution Advised: This is the strongest Fat Destroyer Nutrex Research ever released. It’s so strong that you can never take more than one pill. This is an ultra-concentrated super potent one pill formula that is designed to rapidly destroy body fat deposits.  To help ensure that your diet becomes a huge success, LIPO-6 Black Ultra Concentrate also exert a powerful appetite suppressing effect. Next an intense feeling of energy will overcome your entire physique and keep you going for hours', 6, 4000, 3000, 1000, 'am.jpg'),
(46, 'Daily Formula 100 Tablets By Universal Nutrition', 'Advanced multiple vitamin and mineral daily Balanced nutritional formula 100 percent natural, dietary supplement Product of USA', 7, 2000, 1800, 200, 'an.jpg'),
(47, 'Fish Oil 100 Soft Gels By Optimum Nutrition', 'Fish Oils contain long-chain fatty acids, including docosahexaenoic acid (DHA) and eiscosapentaenoic acid (EPA). DHA and EPA are omega-3 fatty acids with important roles in numerous metabolic functions. They are found in foods like salmon and supplements such as ON Fish Oil Softgels. Our Fish Oil Softgels are mercury-free and enteric-coated, which means that you get all the benefits of fish oils without the fishy aftertaste that you might encounter without this special coating.', 7, 3000, 2000, 1000, 'ao.jpg'),
(48, 'L-Arginine 100 Tablets By MuscleTech', 'The skin stretches. The muscle aches. The veins pop. The muscle bellies start to swell, you know the feeling. When the veins are bulging out, the muscle looks full and the skin over your muscles gets very thin. It’s the greatest feeling – the natural high you get from hitting the weights hard. It’s called the Pump, and for years bodybuilders and other athletes have relied on L-arginine to enhance these muscle-swelling pumps to feed their muscles the nutrients they need to perform, recover and gr', 7, 3000, 2000, 1000, 'ap.jpg'),
(49, 'Mens Multi + Test 150 Tablets By Gat Sport', 'Men’s Multi+Test is a complete vitamin, mineral and energy multivitamin with added men’s virility ingredient Tribulus Terristis. Men’s Multi+Test offers athletes solid support for nutrient deficiencies they may need with an added testosterone support.', 7, 5000, 4000, 1000, 'aq.jpg'),
(50, 'Nano X9 Next Gen 120 Capsules By MuscleTech', 'If you’ve ever felt a pump while training, then you’ve experienced the unexplainable muscular expansion that takes place as muscles are flooded with anabolically charged blood. In that very moment, you’re primed for unrestrained growth – the normal slow and steady supply of nutrients your muscles received throughout the day is dramatically cranked up as your muscle fibers become engorged with blood!', 7, 4000, 3000, 1000, 'ar.jpg'),
(51, 'Opti Men 150 Tablets By Optimum Nutrition', 'Opti-Men is a comprehensive Nutrient Optimization System providing 75+ active ingredients in 4 blends specifically designed to support the nutrient needs of active men. Each serving includes free form amino acids, antioxidant vitamins, essential minerals and botanical extracts in foundational amounts that can be built upon through consumption of a healthy balanced diet. Think of Opti-Men® as nutritional insurance for your fit lifestyle.', 7, 6000, 4500, 1500, 'as.jpg'),
(52, 'Opti Women 120 Tablets By Optimum Nutrition', 'Optimum Nutrition’s Opti-Women™ combines 23 Vitamins and Essential Minerals with 17 specialty ingredients to create a comprehensive multivitamin for the active woman. Each serving of wide-reaching nutrient support is delivered in Vegetarian Society approved Vcaps.', 7, 5000, 3000, 2000, 'at.jpg'),
(53, 'Platinum Multi Vitamins 90 Tablets By MuscleTech', 'High potency formula designed for athletes 865mg of amino acid support Vitamins C & E as antioxidants Full 30 day supply Platinum Multivitamin Platinum Multivitamin packs high-potency vitamins and minerals into each serving. Platinum Multivitamin has been engineered to deliver 20 vitamins and minerals, including antioxidant vitamins C & E to support general health. THE PLATINUM MULTIVITAMIN ADVANTAGE The complete 30-day supply of this advanced multi-vitamin formula also delivers 865mg of amino s', 7, 3000, 2500, 500, 'au.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `polls_reviews`
--

CREATE TABLE `polls_reviews` (
  `r_id` int(11) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `text` varchar(50) NOT NULL,
  `p_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `polls_reviews`
--

INSERT INTO `polls_reviews` (`r_id`, `user_id_id`, `text`, `p_id_id`) VALUES
(5, 4, 'best product', 5);

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
-- Indexes for table `polls_category`
--
ALTER TABLE `polls_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `polls_contact`
--
ALTER TABLE `polls_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `polls_mail`
--
ALTER TABLE `polls_mail`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `polls_order`
--
ALTER TABLE `polls_order`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `polls_order_user_id_id_23b92e2e_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `polls_orderdetails`
--
ALTER TABLE `polls_orderdetails`
  ADD PRIMARY KEY (`od_id`),
  ADD KEY `polls_orderdetails_order_id_id_f86fec48_fk_polls_order_o_id` (`order_id_id`),
  ADD KEY `polls_orderdetails_p_id_id_20e35fe2_fk_polls_product_p_id` (`p_id_id`);

--
-- Indexes for table `polls_product`
--
ALTER TABLE `polls_product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `polls_product_cat_id_5aa3d196` (`cat_id`);

--
-- Indexes for table `polls_reviews`
--
ALTER TABLE `polls_reviews`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `polls_reviews_p_id_id_a42d844f_fk_polls_product_p_id` (`p_id_id`),
  ADD KEY `polls_reviews_user_id_id_f82d5d78` (`user_id_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `polls_category`
--
ALTER TABLE `polls_category`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `polls_contact`
--
ALTER TABLE `polls_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `polls_mail`
--
ALTER TABLE `polls_mail`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `polls_order`
--
ALTER TABLE `polls_order`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `polls_orderdetails`
--
ALTER TABLE `polls_orderdetails`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `polls_product`
--
ALTER TABLE `polls_product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `polls_reviews`
--
ALTER TABLE `polls_reviews`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `polls_order`
--
ALTER TABLE `polls_order`
  ADD CONSTRAINT `polls_order_user_id_id_23b92e2e_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `polls_orderdetails`
--
ALTER TABLE `polls_orderdetails`
  ADD CONSTRAINT `polls_orderdetails_order_id_id_f86fec48_fk_polls_order_o_id` FOREIGN KEY (`order_id_id`) REFERENCES `polls_order` (`o_id`),
  ADD CONSTRAINT `polls_orderdetails_p_id_id_20e35fe2_fk_polls_product_p_id` FOREIGN KEY (`p_id_id`) REFERENCES `polls_product` (`p_id`);

--
-- Constraints for table `polls_product`
--
ALTER TABLE `polls_product`
  ADD CONSTRAINT `polls_product_cat_id_5aa3d196_fk_polls_category_c_id` FOREIGN KEY (`cat_id`) REFERENCES `polls_category` (`c_id`);

--
-- Constraints for table `polls_reviews`
--
ALTER TABLE `polls_reviews`
  ADD CONSTRAINT `polls_reviews_p_id_id_a42d844f_fk_polls_product_p_id` FOREIGN KEY (`p_id_id`) REFERENCES `polls_product` (`p_id`),
  ADD CONSTRAINT `polls_reviews_user_id_id_f82d5d78_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
