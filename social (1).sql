-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2023 at 12:13 AM
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
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(70) NOT NULL,
  `posted_to` varchar(70) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'my first comment', 'qwer_trerww', 'first_account_1', '2023-10-30 20:18:05', 'no', 25),
(2, 'hi', 'qwer_trerww', 'first_account_1', '2023-10-30 21:29:12', 'no', 26),
(3, 'hi', 'qwer_trerww', 'first_account_1', '2023-10-30 21:41:55', 'no', 25),
(4, '2', 'qwer_trerww', 'first_account_1', '2023-10-30 21:43:03', 'no', 26),
(5, '3', 'qwer_trerww', 'first_account_1', '2023-10-30 21:43:08', 'no', 25),
(6, '4', 'qwer_trerww', 'first_account_1', '2023-10-30 21:43:13', 'no', 26),
(7, '1', 'qwer_trerww', 'first_account_1', '2023-11-14 08:24:47', 'no', 56),
(8, '2', 'qwer_trerww', 'first_account_1', '2023-11-14 08:24:51', 'no', 56),
(9, 'nice', 'leee_sin', 'qwer_trerww', '2023-11-14 10:01:59', 'no', 20),
(10, 'd', 'qwer_trerww', 'qwer_trerww', '2023-11-30 05:55:01', 'no', 62),
(11, '2', 'qwer_trerww', 'first_account_1', '2023-11-30 19:22:27', 'no', 65),
(12, '2', 'qwer_trerww', 'qwer_trerww', '2023-12-05 09:55:02', 'no', 67),
(13, 'yess', 'qwer_trerww', 'qwer_trerww', '2023-12-05 17:26:43', 'no', 69),
(14, '2', 'qwer_trerww', 'new_new', '2023-12-05 19:01:05', 'no', 71),
(15, 'nice', 'new_new', 'first_account_1', '2023-12-06 04:14:38', 'no', 41),
(16, 'nice', 'qwer_trerww', 'qwer_trerww', '2023-12-07 22:08:46', 'no', 77),
(17, 'yess!', 'new_new', 'qwer_trerww', '2023-12-07 22:13:04', 'no', 77);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `user_to`, `user_from`) VALUES
(7, 'lee_sin', 'qwer_trerww'),
(10, 'leee_sin', 'qwer_trerww');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(70) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `username`, `post_id`) VALUES
(19, 'qwer_trerww', 22),
(30, 'qwer_trerww', 26),
(51, 'qwer_trerww', 62),
(53, 'qwer_trerww', 67),
(54, 'qwer_trerww', 69),
(55, 'new_new', 41),
(56, 'qwer_trerww', 77),
(57, 'new_new', 77);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_to`, `user_from`, `body`, `date`, `opened`, `viewed`, `deleted`) VALUES
(1, 'first_account_1', 'qwer_trerww', 'hey', '2023-11-03 02:02:29', 'yes', 'no', 'no'),
(2, 'first_account_1', 'qwer_trerww', 'fewae', '2023-11-03 02:16:46', 'yes', 'no', 'no'),
(3, 'qwer_trerww', 'first_account_1', 'hey Qwer', '2023-11-03 02:19:41', 'yes', 'yes', 'no'),
(4, 'first_account_1', 'qwer_trerww', 'hi first account', '2023-11-03 03:53:54', 'yes', 'no', 'no'),
(5, 'qwer_trerww', 'first_account_1', 'yup', '2023-11-03 03:54:15', 'yes', 'yes', 'no'),
(6, 'first_account_1', 'qwer_trerww', 'rwe', '2023-11-03 04:05:12', 'yes', 'no', 'no'),
(7, 'first_account_1', 'qwer_trerww', 'rwe', '2023-11-03 04:09:41', 'yes', 'no', 'no'),
(8, 'first_account_1', 'qwer_trerww', 'rwe', '2023-11-03 04:09:47', 'yes', 'no', 'no'),
(9, 'first_account_1', 'qwer_trerww', 'asdf', '2023-11-03 04:09:49', 'yes', 'no', 'no'),
(10, 'first_account_1', 'qwer_trerww', 'ewfw', '2023-11-03 04:09:53', 'yes', 'no', 'no'),
(11, 'first_account_1', 'qwer_trerww', 'qwe', '2023-11-03 04:09:59', 'yes', 'no', 'no'),
(12, 'first_account_1', 'qwer_trerww', 'qwe', '2023-11-03 04:12:46', 'yes', 'no', 'no'),
(13, 'first_account_1', 'qwer_trerww', 'qwe', '2023-11-03 04:12:49', 'yes', 'no', 'no'),
(14, 'first_account_1', 'qwer_trerww', 'qwe', '2023-11-03 04:13:12', 'yes', 'no', 'no'),
(15, 'first_account_1', 'qwer_trerww', 'asd', '2023-11-03 04:13:49', 'yes', 'no', 'no'),
(16, 'first_account_1', 'qwer_trerww', '2', '2023-11-03 20:09:44', 'yes', 'no', 'no'),
(17, 'leee_sin', 'qwer_trerww', 'w', '2023-11-03 20:11:14', 'yes', 'no', 'no'),
(18, 'first_account_1', 'qwer_trerww', 'dc', '2023-11-03 20:14:12', 'yes', 'no', 'no'),
(19, 'leee_sin', 'qwer_trerww', 'a', '2023-11-03 20:14:15', 'yes', 'no', 'no'),
(20, '', 'qwer_trerww', '2', '2023-11-04 14:17:10', 'no', 'no', 'no'),
(21, 'leee_sin', 'qwer_trerww', '2', '2023-11-04 14:18:09', 'yes', 'no', 'no'),
(22, 'leee_sin', 'qwer_trerww', '3', '2023-11-04 14:18:11', 'yes', 'no', 'no'),
(23, 'first_account_1', 'qwer_trerww', '3', '2023-11-04 14:53:19', 'yes', 'no', 'no'),
(24, 'first_account_1', 'qwer_trerww', '3', '2023-11-04 14:53:27', 'yes', 'no', 'no'),
(25, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 14:53:34', 'yes', 'no', 'no'),
(26, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 14:55:06', 'yes', 'no', 'no'),
(27, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 14:56:05', 'yes', 'no', 'no'),
(28, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 14:56:32', 'yes', 'no', 'no'),
(29, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 14:58:17', 'yes', 'no', 'no'),
(30, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 14:58:38', 'yes', 'no', 'no'),
(31, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 15:01:17', 'yes', 'no', 'no'),
(32, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 15:01:21', 'yes', 'no', 'no'),
(33, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 15:01:38', 'yes', 'no', 'no'),
(34, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 15:02:09', 'yes', 'no', 'no'),
(35, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 15:02:57', 'yes', 'no', 'no'),
(36, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 15:03:09', 'yes', 'no', 'no'),
(37, 'leee_sin', 'qwer_trerww', '4', '2023-11-04 15:04:07', 'yes', 'no', 'no'),
(38, 'leee_sin', 'qwer_trerww', 'yes', '2023-11-04 15:04:27', 'yes', 'no', 'no'),
(39, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 09:05:03', 'yes', 'no', 'no'),
(40, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 09:07:49', 'yes', 'no', 'no'),
(41, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 09:14:01', 'yes', 'no', 'no'),
(42, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 09:14:23', 'yes', 'no', 'no'),
(43, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 09:14:40', 'yes', 'no', 'no'),
(44, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 09:15:02', 'yes', 'no', 'no'),
(45, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 09:15:11', 'yes', 'no', 'no'),
(46, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 09:15:25', 'yes', 'no', 'no'),
(47, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 09:15:32', 'yes', 'no', 'no'),
(48, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 09:16:20', 'yes', 'no', 'no'),
(49, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 09:16:34', 'yes', 'no', 'no'),
(50, 'leee_sin', 'qwer_trerww', 'me', '2023-11-14 09:16:47', 'yes', 'no', 'no'),
(51, 'leee_sin', 'qwer_trerww', 'me', '2023-11-14 09:18:32', 'yes', 'no', 'no'),
(52, 'leee_sin', 'qwer_trerww', 'me', '2023-11-14 09:19:48', 'yes', 'no', 'no'),
(53, 'leee_sin', 'qwer_trerww', 'me', '2023-11-14 09:20:11', 'yes', 'no', 'no'),
(54, 'leee_sin', 'qwer_trerww', 'me', '2023-11-14 09:20:24', 'yes', 'no', 'no'),
(55, 'qwer_trerww', 'leee_sin', '2', '2023-11-14 09:34:24', 'yes', 'yes', 'no'),
(56, 'qwer_trerww', 'leee_sin', '2', '2023-11-14 09:35:24', 'yes', 'yes', 'no'),
(57, 'qwer_trerww', 'leee_sin', '2', '2023-11-14 09:35:38', 'yes', 'yes', 'no'),
(58, 'qwer_trerww', 'leee_sin', '2', '2023-11-14 09:35:52', 'yes', 'yes', 'no'),
(59, 'qwer_trerww', 'leee_sin', '2', '2023-11-14 09:36:06', 'yes', 'yes', 'no'),
(60, 'leee_sin', 'qwer_trerww', '2', '2023-11-14 16:11:42', 'no', 'no', 'no'),
(61, 'leee_sin', 'qwer_trerww', '3', '2023-11-21 15:17:29', 'no', 'no', 'no'),
(62, 'leee_sin', 'qwer_trerww', 'k', '2023-12-02 15:06:01', 'no', 'no', 'no'),
(63, 'leee_sin', 'qwer_trerww', '22222', '2023-12-02 15:06:10', 'no', 'no', 'no'),
(64, 'leee_sin', 'qwer_trerww', 'hj', '2023-12-05 11:05:49', 'no', 'no', 'no'),
(65, 'leee_sin', 'qwer_trerww', 'kkk', '2023-12-05 18:49:14', 'no', 'no', 'no'),
(66, '', 'qwer_trerww', '2', '2023-12-05 19:05:18', 'no', 'no', 'no'),
(67, '', 'first_account_1', '2', '2023-12-05 19:08:54', 'no', 'no', 'no'),
(68, 'new_new', 'qwer_trerww', '2', '2023-12-05 19:17:51', 'yes', 'no', 'no'),
(69, 'qwer_trerww', 'new_new', '2', '2023-12-05 19:18:09', 'yes', 'yes', 'no'),
(70, 'qwer_trerww', 'new_new', '2', '2023-12-06 18:38:25', 'yes', 'yes', 'no'),
(71, 'new_new', 'qwer_trerww', 'hi New New', '2023-12-07 22:14:54', 'yes', 'no', 'no'),
(72, 'qwer_trerww', 'new_new', 'hi Quan', '2023-12-07 22:15:28', 'yes', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(70) NOT NULL,
  `user_to` varchar(70) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`) VALUES
(1, 'This is the first post!', 'qwer_trerww', 'none', '2023-10-24 02:48:49', 'no', 'yes', 0),
(2, 'This is the first post!', 'qwer_trerww', 'none', '2023-10-24 04:07:32', 'no', 'no', 0),
(3, 'sdaf\nadsf\n\nadsf\nads\nf\n', 'qwer_trerww', 'none', '2023-10-24 04:07:37', 'no', 'no', 0),
(4, 'sdaf<br />\nadsf<br />\n<br />\nadsf<br />\nads<br />\nf<br />\n', 'qwer_trerww', 'none', '2023-10-24 04:08:57', 'no', 'no', 0),
(5, 'safdas<br />\nasdf<br />\n<br />\nadsf', 'qwer_trerww', 'none', '2023-10-24 04:09:01', 'no', 'no', 0),
(6, 'safdas<br />\nasdf<br />\n<br />\nadsf', 'qwer_trerww', 'none', '2023-10-24 04:10:03', 'no', 'no', 0),
(7, 'hi', 'qwer_trerww', 'none', '2023-10-24 04:10:17', 'no', 'no', 0),
(8, 'hi', 'qwer_trerww', 'none', '2023-10-24 04:10:19', 'no', 'no', 0),
(9, 'hi', 'qwer_trerww', 'none', '2023-10-24 04:10:23', 'no', 'no', 0),
(10, 'hi', 'qwer_trerww', 'none', '2023-10-24 04:12:01', 'no', 'no', 0),
(11, 'hi<br />\nhi<br />\nhi<br />\n', 'qwer_trerww', 'none', '2023-10-24 04:12:16', 'no', 'no', 0),
(12, 'second post', 'qwer_trerww', 'none', '2023-10-25 03:28:43', 'no', 'yes', 0),
(13, 'hi<br />\n', 'qwer_trerww', 'none', '2023-10-25 04:50:25', 'no', 'yes', 0),
(14, '14', 'qwer_trerww', 'none', '2023-10-25 05:06:30', 'no', 'yes', 0),
(15, 'gadfadsafagadfadfd<br />\nfads<br />\nfadsdfsas<br />\n', 'qwer_trerww', 'none', '2023-10-25 05:11:21', 'no', 'yes', 0),
(16, 'fsd', 'qwer_trerww', 'none', '2023-10-25 05:11:25', 'no', 'yes', 0),
(17, 'sadfadsfadfsadfs', 'qwer_trerww', 'none', '2023-10-25 05:11:27', 'no', 'yes', 0),
(18, 'fqewqefweqw<br />\nf<br />\neq<br />\nqef<br />\ner<br />\nfeqw<br />\nef<br />\n<br />\nef<br />\nqew<br />\nef<br />\nfqe<br />\nefq<br />\nf<br />\n', 'qwer_trerww', 'none', '2023-10-25 05:11:32', 'no', 'yes', 0),
(19, '19', 'qwer_trerww', 'none', '2023-10-25 05:14:27', 'no', 'yes', 0),
(20, '123', 'qwer_trerww', 'none', '2023-10-25 18:32:10', 'no', 'yes', 0),
(21, 'third post<br />\n', 'qwer_trerww', 'none', '2023-10-25 23:21:46', 'no', 'yes', 0),
(22, 'hi, i\'m 123@gmail.com', 'rew_quân', 'none', '2023-10-30 18:36:08', 'no', 'no', 1),
(23, 'i\'m your friend', 'rew_quân', 'none', '2023-10-30 18:36:20', 'no', 'no', 0),
(24, 'i don\'t have any friends<br />\n', 'leee_sin', 'none', '2023-10-30 18:37:12', 'no', 'no', 0),
(25, 'i\'m a friend of test@gmail.com not 123@gmail.com', 'first_account_1', 'none', '2023-10-30 18:38:21', 'no', 'no', 0),
(26, 'test@gmail.com can see my posts but 123@gmail.com can\'t', 'first_account_1', 'none', '2023-10-30 18:38:44', 'no', 'no', 1),
(27, '3', 'qwer_trerww', 'none', '2023-10-31 19:38:56', 'no', 'yes', 0),
(28, 'fe', 'first_account_1', 'none', '2023-11-01 14:22:39', 'no', 'no', 0),
(29, 'fe', 'first_account_1', 'none', '2023-11-01 14:22:40', 'no', 'no', 0),
(30, 'fe', 'first_account_1', 'none', '2023-11-01 14:22:40', 'no', 'no', 0),
(31, 'asdf', 'first_account_1', 'none', '2023-11-01 14:23:11', 'no', 'no', 0),
(32, 'asdf', 'first_account_1', 'none', '2023-11-01 14:23:12', 'no', 'no', 0),
(33, 'asdf', 'first_account_1', 'none', '2023-11-01 14:23:12', 'no', 'no', 0),
(34, 'asdf', 'first_account_1', 'none', '2023-11-01 14:23:12', 'no', 'no', 0),
(35, 'asdf', 'first_account_1', 'none', '2023-11-01 14:23:12', 'no', 'no', 0),
(36, 'asdf', 'first_account_1', 'none', '2023-11-01 14:23:12', 'no', 'no', 0),
(37, '23', 'first_account_1', 'none', '2023-11-01 14:23:50', 'no', 'no', 0),
(38, '24', 'first_account_1', 'none', '2023-11-01 14:24:04', 'no', 'no', 0),
(39, '24', 'first_account_1', 'none', '2023-11-01 14:24:04', 'no', 'no', 0),
(40, 'hi', 'first_account_1', 'qwer_trerww', '2023-11-01 14:24:20', 'no', 'no', 0),
(41, 'hi', 'first_account_1', 'qwer_trerww', '2023-11-01 14:24:20', 'no', 'no', 1),
(42, '5', 'first_account_1', 'none', '2023-11-01 14:25:20', 'no', 'no', 0),
(43, '6', 'first_account_1', 'none', '2023-11-01 14:25:27', 'no', 'no', 0),
(44, '6', 'first_account_1', 'none', '2023-11-01 14:25:28', 'no', 'no', 0),
(45, '2', 'first_account_1', 'none', '2023-11-01 14:29:27', 'no', 'no', 0),
(46, '5', 'first_account_1', 'none', '2023-11-01 14:29:31', 'no', 'no', 0),
(47, '6', 'first_account_1', 'none', '2023-11-01 14:30:17', 'no', 'no', 0),
(48, '4', 'first_account_1', 'none', '2023-11-01 14:30:34', 'no', 'no', 0),
(49, '4', 'first_account_1', 'none', '2023-11-01 14:31:00', 'no', 'no', 0),
(50, '66666', 'first_account_1', 'none', '2023-11-01 14:31:07', 'no', 'no', 0),
(51, '66666', 'first_account_1', 'none', '2023-11-01 14:31:07', 'no', 'no', 0),
(52, '777', 'first_account_1', 'none', '2023-11-01 14:32:05', 'no', 'no', 0),
(53, '777', 'first_account_1', 'none', '2023-11-01 14:32:06', 'no', 'no', 0),
(54, '999', 'first_account_1', 'none', '2023-11-01 14:33:28', 'no', 'no', 0),
(55, '999', 'first_account_1', 'none', '2023-11-01 14:33:29', 'no', 'no', 0),
(56, '999', 'first_account_1', 'none', '2023-11-01 14:33:30', 'no', 'no', 0),
(57, '10', 'first_account_1', 'none', '2023-11-01 14:33:46', 'no', 'yes', 0),
(58, '3', 'first_account_1', 'qwer_trerww', '2023-11-01 14:34:02', 'no', 'yes', 0),
(59, '2', 'qwer_trerww', 'first_account_1', '2023-11-01 18:59:26', 'no', 'yes', 0),
(60, 'hi', 'qwer_trerww', 'none', '2023-11-09 14:27:03', 'no', 'yes', 0),
(61, 'hi', 'qwer_trerww', 'leee_sin', '2023-11-14 13:26:59', 'no', 'no', 0),
(62, 'my post', 'qwer_trerww', 'none', '2023-11-21 15:18:35', 'no', 'yes', 1),
(63, 'new', 'qwer_trerww', 'none', '2023-11-30 05:57:16', 'no', 'yes', 0),
(64, '2', 'qwer_trerww', 'none', '2023-11-30 05:57:20', 'no', 'yes', 0),
(65, '2', 'first_account_1', 'none', '2023-11-30 19:20:47', 'no', 'no', 0),
(66, '2', 'qwer_trerww', 'first_account_1', '2023-11-30 19:29:52', 'no', 'yes', 0),
(67, '2', 'qwer_trerww', 'none', '2023-12-05 09:53:25', 'no', 'yes', 1),
(68, 'k', 'qwer_trerww', 'none', '2023-12-05 16:53:38', 'no', 'yes', 0),
(69, 'i will success!', 'qwer_trerww', 'none', '2023-12-05 17:26:38', 'no', 'yes', 1),
(70, '1', 'new_new', 'none', '2023-12-05 18:49:56', 'no', 'yes', 0),
(71, '2', 'new_new', 'none', '2023-12-05 19:00:16', 'no', 'no', 0),
(72, '2', 'qwer_trerww', 'new_new', '2023-12-05 19:01:10', 'no', 'yes', 0),
(73, '2', 'qwer_trerww', 'lee_sin', '2023-12-06 04:06:36', 'no', 'yes', 0),
(74, '2', 'qwer_trerww', 'lee_sin', '2023-12-06 11:52:53', 'no', 'yes', 0),
(75, '3', 'qwer_trerww', 'none', '2023-12-06 17:36:43', 'no', 'no', 0),
(76, '2', 'new_new', 'none', '2023-12-06 18:35:43', 'no', 'no', 0),
(77, 'hello world', 'qwer_trerww', 'none', '2023-12-07 22:08:00', 'no', 'no', 2),
(78, 'hello world 2', 'qwer_trerww', 'none', '2023-12-07 22:08:22', 'no', 'yes', 0),
(79, 'hi New New! I\'m your friend!', 'qwer_trerww', 'new_new', '2023-12-07 22:11:04', 'no', 'yes', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(1, 'quan', 'minh', 'minh_quan', 'minhquan@gmail.com', 'wqeqwe', '2023-10-04', 'wrqw', 1, 1, 'no', ''),
(2, 'Minh', 'Quân', 'minh_quân_1', 'minhquan02052003@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-10-21', 'assets/images/profile_pics/defaults/head_emerald.png', 0, 0, 'no', ','),
(3, 'Lee', 'Sin', 'lee_sin', 'minhquan020520033@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-10-21', 'assets/images/profile_pics/defaults/head_deep_blue.png', 0, 0, 'no', ','),
(4, 'Leee', 'Sin', 'leee_sin', 'minhquan0205200333@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-10-21', 'assets/images/profile_pics/defaults/head_deep_blue.png', 1, 0, 'no', ','),
(5, 'Goofy', 'Mouse', 'goofy_mouse', 'minhquan20205200333@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-10-21', 'assets/images/profile_pics/defaults/head_emerald.png', 0, 0, 'no', ','),
(6, 'Minh', 'Quan', 'qwer_trerww', 'test@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-10-23', 'assets/images/profile_pics/qwer_trerwwe76d838fba245a9caa05cabd1bd0cbfen.jpeg', 39, 5, 'no', ',rew_quân,new_new,'),
(7, 'First', 'Account', 'first_account', 'rand@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-10-24', 'assets/images/profile_pics/defaults/head_emerald.png', 0, 0, 'no', ','),
(8, 'Just', 'Changed', 'first_account_1', 'rand@gmail.comff', '827ccb0eea8a706c4c34a16891f84e7b', '2023-10-24', 'assets/images/profile_pics/defaults/head_emerald.png', 34, 4, 'no', ',rew_quân,'),
(9, 'Rew', 'Quân', 'rew_quân', '123@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-10-25', 'assets/images/profile_pics/defaults/head_deep_blue.png', 2, 1, 'no', ',qwer_trerww,'),
(10, 'Hoang', 'Son', 'new_new', 'new@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-12-05', 'assets/images/profile_pics/new_newe2650c75488290dc7fd97e63d528ffe2n.jpeg', 3, 0, 'no', ',qwer_trerww,');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
