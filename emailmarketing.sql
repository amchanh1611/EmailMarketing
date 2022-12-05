-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2022 at 08:25 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emailmarketing`
--

-- --------------------------------------------------------

--
-- Table structure for table `aggregatedcounter`
--

CREATE TABLE `aggregatedcounter` (
  `Id` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` int(11) NOT NULL,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aggregatedcounter`
--

INSERT INTO `aggregatedcounter` (`Id`, `Key`, `Value`, `ExpireAt`) VALUES
(1, 'stats:succeeded', 9, NULL),
(2, 'stats:succeeded:2022-12-03', 2, '2023-01-03 14:06:50'),
(5, 'stats:succeeded:2022-12-05', 7, '2023-01-05 07:19:19'),
(6, 'stats:succeeded:2022-12-05-02', 5, '2022-12-06 02:56:04'),
(12, 'stats:succeeded:2022-12-05-07', 2, '2022-12-06 07:19:19');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `Male` tinyint(4) DEFAULT NULL,
  `GroupContactId` int(11) DEFAULT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`Id`, `Name`, `Email`, `Male`, `GroupContactId`, `UserId`) VALUES
(2, 'Âu Minh Chánh', 'am.chanh1199@gmail.com', 1, 1, 3),
(4, 'Chanh', 'am.chanh16111@gmail.com', 1, 2, 3),
(5, 'minh minh', 'ngocsminh5577@gmail.com', 2, NULL, 3),
(6, 'Chanh', '0468191099@caothang.edu.vn', 1, 2, 3),
(7, 'Au Chanh', 'auminhchanh99@gmail.com', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `Id` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` int(11) NOT NULL,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`Id`, `Key`, `Value`, `ExpireAt`) VALUES
(28, 'stats:succeeded:2022-12-05', 1, '2023-01-05 07:21:57'),
(29, 'stats:succeeded:2022-12-05-07', 1, '2022-12-06 07:21:57'),
(30, 'stats:succeeded', 1, NULL),
(31, 'stats:succeeded:2022-12-05', 1, '2023-01-05 07:21:58'),
(32, 'stats:succeeded:2022-12-05-07', 1, '2022-12-06 07:21:58'),
(33, 'stats:succeeded', 1, NULL),
(34, 'stats:succeeded:2022-12-05', 1, '2023-01-05 07:21:59'),
(35, 'stats:succeeded:2022-12-05-07', 1, '2022-12-06 07:21:59'),
(36, 'stats:succeeded', 1, NULL),
(37, 'stats:succeeded:2022-12-05', 1, '2023-01-05 07:25:01'),
(38, 'stats:succeeded:2022-12-05-07', 1, '2022-12-06 07:25:01'),
(39, 'stats:succeeded', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `distributedlock`
--

CREATE TABLE `distributedlock` (
  `Resource` varchar(100) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `google_account`
--

CREATE TABLE `google_account` (
  `Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `RefreshToken` varchar(512) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Position` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `google_account`
--

INSERT INTO `google_account` (`Id`, `Name`, `Email`, `RefreshToken`, `UserId`, `Position`) VALUES
(3, 'Chánh Âu Minh', '0468191090@caothang.edu.vn', '1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_contact`
--

CREATE TABLE `group_contact` (
  `Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `group_contact`
--

INSERT INTO `group_contact` (`Id`, `Name`, `UserId`) VALUES
(1, 'Demo', 3),
(2, 'SendMail', 3);

-- --------------------------------------------------------

--
-- Table structure for table `hash`
--

CREATE TABLE `hash` (
  `Id` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Field` varchar(40) NOT NULL,
  `Value` longtext DEFAULT NULL,
  `ExpireAt` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `Id` int(11) NOT NULL,
  `StateId` int(11) DEFAULT NULL,
  `StateName` varchar(20) DEFAULT NULL,
  `InvocationData` longtext NOT NULL,
  `Arguments` longtext NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `ExpireAt` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`Id`, `StateId`, `StateName`, `InvocationData`, `Arguments`, `CreatedAt`, `ExpireAt`) VALUES
(3, 9, 'Succeeded', '{\"Type\":\"EmailMarketing.Common.GoogleServices.GoogleService, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]], System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"0468191090@caothang.edu.vn\\\\\\\"\\\",\\\"[\\\\\\\"am.chanh1199@gmail.com\\\\\\\",\\\\\\\"am.chanh16111@gmail.com\\\\\\\",\\\\\\\"auminhchanh99@gmail.com\\\\\\\"]\\\",\\\"\\\\\\\"Chanh\\\\\\\"\\\",\\\"\\\\\\\"Chanh\\\\\\\"\\\",\\\"\\\\\\\"1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU\\\\\\\"\\\"]\"}', '[\"\\\"0468191090@caothang.edu.vn\\\"\",\"[\\\"am.chanh1199@gmail.com\\\",\\\"am.chanh16111@gmail.com\\\",\\\"auminhchanh99@gmail.com\\\"]\",\"\\\"Chanh\\\"\",\"\\\"Chanh\\\"\",\"\\\"1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU\\\"\"]', '2022-12-05 02:20:14.260609', '2022-12-06 02:21:36.852275'),
(4, 12, 'Succeeded', '{\"Type\":\"EmailMarketing.Common.GoogleServices.GoogleService, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]], System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"0468191090@caothang.edu.vn\\\\\\\"\\\",\\\"[\\\\\\\"0468191099@caothang.edu.vn\\\\\\\"]\\\",\\\"\\\\\\\"Chanh\\\\\\\"\\\",\\\"\\\\\\\"Chanh\\\\\\\"\\\",\\\"\\\\\\\"1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU\\\\\\\"\\\"]\"}', '[\"\\\"0468191090@caothang.edu.vn\\\"\",\"[\\\"0468191099@caothang.edu.vn\\\"]\",\"\\\"Chanh\\\"\",\"\\\"Chanh\\\"\",\"\\\"1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU\\\"\"]', '2022-12-05 02:34:05.134326', '2022-12-06 02:34:46.388263'),
(5, 16, 'Succeeded', '{\"Type\":\"EmailMarketing.Common.GoogleServices.GoogleService, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]], System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"0468191090@caothang.edu.vn\\\\\\\"\\\",\\\"[\\\\\\\"am.chanh1199@gmail.com\\\\\\\",\\\\\\\"am.chanh16111@gmail.com\\\\\\\",\\\\\\\"auminhchanh99@gmail.com\\\\\\\"]\\\",\\\"\\\\\\\"Chanh\\\\\\\"\\\",\\\"\\\\\\\"Chanh\\\\\\\"\\\",\\\"\\\\\\\"1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU\\\\\\\"\\\"]\"}', '[\"\\\"0468191090@caothang.edu.vn\\\"\",\"[\\\"am.chanh1199@gmail.com\\\",\\\"am.chanh16111@gmail.com\\\",\\\"auminhchanh99@gmail.com\\\"]\",\"\\\"Chanh\\\"\",\"\\\"Chanh\\\"\",\"\\\"1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU\\\"\"]', '2022-12-05 02:49:13.779919', '2022-12-06 02:50:58.187520'),
(6, 20, 'Succeeded', '{\"Type\":\"EmailMarketing.Common.GoogleServices.GoogleService, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]], System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"0468191090@caothang.edu.vn\\\\\\\"\\\",\\\"[\\\\\\\"am.chanh1199@gmail.com\\\\\\\",\\\\\\\"am.chanh16111@gmail.com\\\\\\\",\\\\\\\"auminhchanh99@gmail.com\\\\\\\"]\\\",\\\"\\\\\\\"Chanh\\\\\\\"\\\",\\\"\\\\\\\"Chanh\\\\\\\"\\\",\\\"\\\\\\\"1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU\\\\\\\"\\\"]\"}', '[\"\\\"0468191090@caothang.edu.vn\\\"\",\"[\\\"am.chanh1199@gmail.com\\\",\\\"am.chanh16111@gmail.com\\\",\\\"auminhchanh99@gmail.com\\\"]\",\"\\\"Chanh\\\"\",\"\\\"Chanh\\\"\",\"\\\"1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU\\\"\"]', '2022-12-05 02:53:19.556873', '2022-12-06 02:53:33.543554'),
(7, 24, 'Succeeded', '{\"Type\":\"EmailMarketing.Common.GoogleServices.GoogleService, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]], System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"0468191090@caothang.edu.vn\\\\\\\"\\\",\\\"[\\\\\\\"am.chanh1199@gmail.com\\\\\\\",\\\\\\\"am.chanh16111@gmail.com\\\\\\\",\\\\\\\"auminhchanh99@gmail.com\\\\\\\"]\\\",\\\"\\\\\\\"Chanh\\\\\\\"\\\",\\\"\\\\\\\"Chanh\\\\\\\"\\\",\\\"\\\\\\\"1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU\\\\\\\"\\\"]\"}', '[\"\\\"0468191090@caothang.edu.vn\\\"\",\"[\\\"am.chanh1199@gmail.com\\\",\\\"am.chanh16111@gmail.com\\\",\\\"auminhchanh99@gmail.com\\\"]\",\"\\\"Chanh\\\"\",\"\\\"Chanh\\\"\",\"\\\"1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU\\\"\"]', '2022-12-05 02:55:36.189647', '2022-12-06 02:56:04.101647'),
(8, 98, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"6\\\"]\"}', '[\"6\"]', '2022-12-05 06:54:25.802302', '2022-12-06 07:21:59.113774'),
(9, 96, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"8\\\"]\"}', '[\"8\"]', '2022-12-05 07:10:36.494667', '2022-12-06 07:21:57.271922'),
(10, 88, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"9\\\"]\"}', '[\"9\"]', '2022-12-05 07:14:30.287947', '2022-12-06 07:19:19.263698'),
(11, 80, 'Processing', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"10\\\"]\"}', '[\"10\"]', '2022-12-05 07:16:01.898205', NULL),
(12, 82, 'Processing', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"11\\\"]\"}', '[\"11\"]', '2022-12-05 07:16:56.773495', NULL),
(13, 87, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"12\\\"]\"}', '[\"12\"]', '2022-12-05 07:18:39.798416', '2022-12-06 07:19:18.954169'),
(14, 97, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"13\\\"]\"}', '[\"13\"]', '2022-12-05 07:21:46.432540', '2022-12-06 07:21:58.067452'),
(15, 102, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"14\\\"]\"}', '[\"14\"]', '2022-12-05 07:24:27.150425', '2022-12-06 07:25:01.804576');

-- --------------------------------------------------------

--
-- Table structure for table `jobparameter`
--

CREATE TABLE `jobparameter` (
  `Id` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobparameter`
--

INSERT INTO `jobparameter` (`Id`, `JobId`, `Name`, `Value`) VALUES
(5, 3, 'CurrentCulture', '\"en-US\"'),
(6, 3, 'CurrentUICulture', '\"en-US\"'),
(7, 4, 'CurrentCulture', '\"en-US\"'),
(8, 4, 'CurrentUICulture', '\"en-US\"'),
(9, 5, 'CurrentCulture', '\"en-US\"'),
(10, 5, 'CurrentUICulture', '\"en-US\"'),
(11, 6, 'CurrentCulture', '\"en-US\"'),
(12, 6, 'CurrentUICulture', '\"en-US\"'),
(13, 7, 'CurrentCulture', '\"en-US\"'),
(14, 7, 'CurrentUICulture', '\"en-US\"'),
(15, 8, 'CurrentCulture', '\"en-US\"'),
(16, 8, 'CurrentUICulture', '\"en-US\"'),
(17, 8, 'RetryCount', '6'),
(23, 9, 'CurrentCulture', '\"en-US\"'),
(24, 9, 'CurrentUICulture', '\"en-US\"'),
(25, 9, 'RetryCount', '5'),
(29, 10, 'CurrentCulture', '\"en-US\"'),
(30, 10, 'CurrentUICulture', '\"en-US\"'),
(31, 10, 'RetryCount', '2'),
(34, 11, 'CurrentCulture', '\"en-US\"'),
(35, 11, 'CurrentUICulture', '\"en-US\"'),
(36, 12, 'CurrentCulture', '\"en-US\"'),
(37, 12, 'CurrentUICulture', '\"en-US\"'),
(38, 13, 'CurrentCulture', '\"en-US\"'),
(39, 13, 'CurrentUICulture', '\"en-US\"'),
(40, 14, 'CurrentCulture', '\"en-US\"'),
(41, 14, 'CurrentUICulture', '\"en-US\"'),
(42, 15, 'CurrentCulture', '\"en-US\"'),
(43, 15, 'CurrentUICulture', '\"en-US\"');

-- --------------------------------------------------------

--
-- Table structure for table `jobqueue`
--

CREATE TABLE `jobqueue` (
  `Id` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `FetchedAt` datetime(6) DEFAULT NULL,
  `Queue` varchar(50) NOT NULL,
  `FetchToken` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobqueue`
--

INSERT INTO `jobqueue` (`Id`, `JobId`, `FetchedAt`, `Queue`, `FetchToken`) VALUES
(21, 11, '2022-12-05 07:16:02.000000', 'default', '5b9e02ce-a432-4c98-9b30-d6deda831085'),
(22, 12, '2022-12-05 07:17:07.000000', 'default', '1de3719d-b80e-4c97-8c40-0ce9bead8424');

-- --------------------------------------------------------

--
-- Table structure for table `jobstate`
--

CREATE TABLE `jobstate` (
  `Id` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `Data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `list`
--

CREATE TABLE `list` (
  `Id` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` longtext DEFAULT NULL,
  `ExpireAt` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

CREATE TABLE `operation` (
  `Id` int(11) NOT NULL,
  `ProjectId` int(11) NOT NULL,
  `Name` text NOT NULL,
  `GoogleAccountId` int(11) NOT NULL,
  `Subject` text NOT NULL,
  `GroupContactId` int(11) NOT NULL,
  `Content` longtext NOT NULL,
  `DateSend` datetime(6) NOT NULL,
  `CreatedDate` datetime(6) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`Id`, `ProjectId`, `Name`, `GoogleAccountId`, `Subject`, `GroupContactId`, `Content`, `DateSend`, `CreatedDate`, `UserId`, `Status`) VALUES
(3, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 09:50:00.000000', '2022-12-05 09:55:35.947090', 3, 3),
(4, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 13:36:00.000000', '2022-12-05 13:44:17.583486', 3, 3),
(5, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 13:36:00.000000', '2022-12-05 13:45:48.305765', 3, 3),
(6, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 13:36:00.000000', '2022-12-05 13:53:52.629300', 3, 1),
(7, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 13:36:00.000000', '2022-12-05 13:58:26.414803', 3, 1),
(8, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:10:35.095300', 3, 1),
(9, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:14:30.052871', 3, 1),
(10, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:16:01.874609', 3, 3),
(11, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:16:56.532643', 3, 3),
(12, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:18:39.558759', 3, 1),
(13, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:21:46.200062', 3, 1),
(14, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:24:27.127215', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `operation_detail`
--

CREATE TABLE `operation_detail` (
  `Id` int(11) NOT NULL,
  `OperationId` int(11) NOT NULL,
  `ContactId` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `StatusMessage` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `operation_detail`
--

INSERT INTO `operation_detail` (`Id`, `OperationId`, `ContactId`, `Status`, `StatusMessage`) VALUES
(1, 6, 2, 1, 'Complete'),
(2, 6, 4, 1, 'Complete'),
(3, 6, 7, 1, 'Complete'),
(4, 7, 2, 1, 'Complete'),
(5, 7, 4, 1, 'Complete'),
(6, 7, 7, 1, 'Complete'),
(7, 8, 6, 1, 'Complete'),
(8, 9, 4, 1, 'Complete'),
(9, 9, 6, 1, 'Complete'),
(10, 10, 4, 3, 'Processing'),
(11, 10, 6, 3, 'Processing'),
(12, 11, 4, 3, 'Processing'),
(13, 11, 6, 3, 'Processing'),
(14, 12, 4, 1, 'Complete'),
(15, 12, 6, 1, 'Complete'),
(16, 13, 2, 1, 'Complete'),
(17, 13, 7, 1, 'Complete'),
(18, 14, 2, 1, 'Complete'),
(19, 14, 7, 1, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `Code` char(25) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UserType` char(100) NOT NULL,
  `Modules` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`Code`, `Name`, `UserType`, `Modules`) VALUES
('CreateAccount', 'Create new account', 'Admin', 'Account'),
('CreateCustommer', 'Create new custommer', 'Admin,System', 'Custommer'),
('CreateProject', 'Create new project', 'Admin,System', 'Project'),
('CreateServicePackage', 'Create new ServicePackage', 'Admin', 'ServicePackage'),
('DeleteAccount', 'Delete specified account', 'Admin', 'Account'),
('DeleteCustommer', 'Delete specified custommer', 'Admin,System', 'Custommer'),
('DeleteProject', 'Delete specifeld project ', 'Admin,System', 'Project'),
('DeleteServicePackage', 'Delete specifeld servicePackage', 'Admin', 'ServicePackage'),
('UpdateAccount', 'Update account detail', 'Admin', 'Account'),
('UpdateCustommer', 'Update custommer detail', 'Admin,System', 'Custommer'),
('UpdateProject', 'Update project detail', 'Admin,System', 'Project'),
('UpdateServicePackage', 'Update servicePackage detail', 'Admin', 'ServicePackage'),
('ViewAccount', 'View account in system', 'Admin', 'Account'),
('ViewCustommer', 'View custommer in system', 'Admin,System', 'Custommer'),
('ViewProject', 'View project in system', 'Admin,System,Customer', 'Project'),
('ViewServicePackage', 'View servicePackage in system', 'Admin,System', 'ServicePackage');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `OwnerId` int(11) NOT NULL,
  `CodeContract` varchar(50) NOT NULL,
  `ServicePackageId` int(11) NOT NULL,
  `Used` int(11) NOT NULL,
  `CreatedDate` datetime(6) NOT NULL,
  `DateStart` datetime(6) NOT NULL,
  `DateEnd` datetime(6) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`Id`, `Name`, `OwnerId`, `CodeContract`, `ServicePackageId`, `Used`, `CreatedDate`, `DateStart`, `DateEnd`, `Status`) VALUES
(1, 'VietJet Booking Tool', 3, 'ALTA-VJ-009', 4, 20, '2022-11-29 13:48:15.377993', '2022-11-29 00:00:00.000000', '2022-12-29 00:00:00.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `UserType` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Id`, `Name`, `UserType`) VALUES
(1, 'Quản trị viên cấp cao', 1),
(2, 'Nhân Viên', 2),
(3, 'Khách hàng', 3),
(4, 'Nhân Viên - Sale', 2),
(6, 'Nhân Viên - PartTime', 2);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `RoleId` int(11) NOT NULL,
  `PermissionCode` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`RoleId`, `PermissionCode`) VALUES
(1, 'CreateAccount'),
(1, 'CreateCustommer'),
(1, 'CreateProject'),
(1, 'CreateServicePackage'),
(1, 'DeleteAccount'),
(1, 'DeleteCustommer'),
(1, 'DeleteProject'),
(1, 'DeleteServicePackage'),
(1, 'UpdateAccount'),
(1, 'UpdateCustommer'),
(1, 'UpdateProject'),
(1, 'UpdateServicePackage'),
(1, 'ViewAccount'),
(1, 'ViewCustommer'),
(1, 'ViewProject'),
(1, 'ViewServicePackage'),
(2, 'CreateCustommer'),
(2, 'CreateProject'),
(2, 'DeleteCustommer'),
(2, 'DeleteProject'),
(2, 'UpdateCustommer'),
(2, 'UpdateProject'),
(2, 'ViewCustommer'),
(2, 'ViewProject'),
(2, 'ViewServicePackage'),
(3, 'ViewProject'),
(4, 'ViewCustommer'),
(4, 'ViewProject'),
(6, 'ViewProject');

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `Id` varchar(100) NOT NULL,
  `Data` longtext NOT NULL,
  `LastHeartbeat` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`Id`, `Data`, `LastHeartbeat`) VALUES
('a610441b-7455-4a0a-bfe7-cd382a86d7e8', '{\"WorkerCount\":5,\"Queues\":[\"default\",\"default\",\"notdefault\"],\"StartedAt\":\"2022-12-05T07:18:33.0682755Z\"}', '2022-12-05 07:21:08.934283'),
('d2d6c9b0-eeb9-48bf-aaed-24941f77d164', '{\"WorkerCount\":5,\"Queues\":[\"default\",\"default\",\"notdefault\"],\"StartedAt\":\"2022-12-05T07:21:36.8831812Z\"}', '2022-12-05 07:25:07.156796');

-- --------------------------------------------------------

--
-- Table structure for table `service_packages`
--

CREATE TABLE `service_packages` (
  `Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_packages`
--

INSERT INTO `service_packages` (`Id`, `Name`, `Quantity`) VALUES
(2, 'Normal', 500),
(3, 'Premium', 1000),
(4, 'Start', 100);

-- --------------------------------------------------------

--
-- Table structure for table `set`
--

CREATE TABLE `set` (
  `Id` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Score` float NOT NULL,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `Id` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `Data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`Id`, `JobId`, `Name`, `Reason`, `CreatedAt`, `Data`) VALUES
(7, 3, 'Enqueued', NULL, '2022-12-05 02:20:14.300809', '{\"EnqueuedAt\":\"2022-12-05T02:20:14.2374630Z\",\"Queue\":\"default\"}'),
(8, 3, 'Processing', NULL, '2022-12-05 02:21:32.628852', '{\"StartedAt\":\"2022-12-05T02:21:32.5143341Z\",\"ServerId\":\"182ff6df-0951-4741-b3e4-c1096fa87d17\",\"WorkerId\":\"ab11f63a-5bb4-4457-a15d-77ff85df02af\"}'),
(9, 3, 'Succeeded', NULL, '2022-12-05 02:21:36.849191', '{\"SucceededAt\":\"2022-12-05T02:21:36.8328416Z\",\"PerformanceDuration\":\"4198\",\"Latency\":\"78374\",\"Result\":\"true\"}'),
(10, 4, 'Enqueued', NULL, '2022-12-05 02:34:05.163458', '{\"EnqueuedAt\":\"2022-12-05T02:34:05.1087037Z\",\"Queue\":\"default\"}'),
(11, 4, 'Processing', NULL, '2022-12-05 02:34:30.894014', '{\"StartedAt\":\"2022-12-05T02:34:30.8615368Z\",\"ServerId\":\"f0504d49-5f05-4672-aaa5-99c0017cbfe3\",\"WorkerId\":\"a52b98ba-86de-4dfa-969b-4c6a0a954d99\"}'),
(12, 4, 'Succeeded', NULL, '2022-12-05 02:34:46.385875', '{\"SucceededAt\":\"2022-12-05T02:34:46.3752193Z\",\"PerformanceDuration\":\"15476\",\"Latency\":\"25764\",\"Result\":\"true\"}'),
(13, 5, 'Scheduled', NULL, '2022-12-05 02:49:13.808977', '{\"EnqueueAt\":\"2022-12-05T02:50:00.0000000Z\",\"ScheduledAt\":\"2022-12-05T02:49:13.7438317Z\"}'),
(14, 5, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 02:50:42.052992', '{\"EnqueuedAt\":\"2022-12-05T02:50:42.0418188Z\",\"Queue\":\"default\"}'),
(15, 5, 'Processing', NULL, '2022-12-05 02:50:56.946307', '{\"StartedAt\":\"2022-12-05T02:50:56.9433342Z\",\"ServerId\":\"20dce8a5-f992-4f63-84fe-5a9ae48d117b\",\"WorkerId\":\"64099a5c-ad13-4e94-9b1e-3e4d31d7ccd1\"}'),
(16, 5, 'Succeeded', NULL, '2022-12-05 02:50:58.185117', '{\"SucceededAt\":\"2022-12-05T02:50:58.1769876Z\",\"PerformanceDuration\":\"1226\",\"Latency\":\"103170\",\"Result\":\"true\"}'),
(17, 6, 'Scheduled', NULL, '2022-12-05 02:53:19.586143', '{\"EnqueueAt\":\"2022-12-05T02:50:00.0000000Z\",\"ScheduledAt\":\"2022-12-05T02:53:19.5220230Z\"}'),
(18, 6, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 02:53:32.563806', '{\"EnqueuedAt\":\"2022-12-05T02:53:32.4882444Z\",\"Queue\":\"default\"}'),
(19, 6, 'Processing', NULL, '2022-12-05 02:53:32.691967', '{\"StartedAt\":\"2022-12-05T02:53:32.6884479Z\",\"ServerId\":\"5b0bd782-1e64-44a6-82dd-735653c05d24\",\"WorkerId\":\"64fcb686-6a94-4a4a-afff-f41c6614e230\"}'),
(20, 6, 'Succeeded', NULL, '2022-12-05 02:53:33.540645', '{\"SucceededAt\":\"2022-12-05T02:53:33.5310253Z\",\"PerformanceDuration\":\"833\",\"Latency\":\"13140\",\"Result\":\"false\"}'),
(21, 7, 'Scheduled', NULL, '2022-12-05 02:55:36.211646', '{\"EnqueueAt\":\"2022-12-05T02:50:00.0000000Z\",\"ScheduledAt\":\"2022-12-05T02:55:36.1697612Z\"}'),
(22, 7, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 02:55:37.966503', '{\"EnqueuedAt\":\"2022-12-05T02:55:37.9574828Z\",\"Queue\":\"default\"}'),
(23, 7, 'Processing', NULL, '2022-12-05 02:55:52.942836', '{\"StartedAt\":\"2022-12-05T02:55:52.9398987Z\",\"ServerId\":\"52cdda74-6075-46b9-9380-f24d39c8c614\",\"WorkerId\":\"e02fe4b9-5a22-4559-b87a-bc6903eb6cb8\"}'),
(24, 7, 'Succeeded', NULL, '2022-12-05 02:56:04.098702', '{\"SucceededAt\":\"2022-12-05T02:56:04.0893324Z\",\"PerformanceDuration\":\"11142\",\"Latency\":\"16757\",\"Result\":\"false\"}'),
(25, 8, 'Scheduled', NULL, '2022-12-05 06:54:25.844373', '{\"EnqueueAt\":\"2022-12-05T06:36:00.0000000Z\",\"ScheduledAt\":\"2022-12-05T06:54:25.7605927Z\"}'),
(26, 8, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 06:54:30.787556', '{\"EnqueuedAt\":\"2022-12-05T06:54:30.7771564Z\",\"Queue\":\"default\"}'),
(27, 8, 'Processing', NULL, '2022-12-05 06:54:40.783188', '{\"StartedAt\":\"2022-12-05T06:54:40.7805347Z\",\"ServerId\":\"f850b501-aa44-46c4-a273-ce4cc4b127ca\",\"WorkerId\":\"8375278b-568e-46f6-b890-42414726cd54\"}'),
(28, 8, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 06:54:40.894335', '{\"FailedAt\":\"2022-12-05T06:54:40.8372613Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(29, 8, 'Scheduled', 'Retry attempt 1 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 06:54:40.897345', '{\"EnqueueAt\":\"2022-12-05T06:55:19.8426815Z\",\"ScheduledAt\":\"2022-12-05T06:54:40.8426817Z\"}'),
(30, 8, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 06:56:28.480377', '{\"EnqueuedAt\":\"2022-12-05T06:56:28.3689343Z\",\"Queue\":\"default\"}'),
(31, 8, 'Processing', NULL, '2022-12-05 06:56:43.367446', '{\"StartedAt\":\"2022-12-05T06:56:43.3648239Z\",\"ServerId\":\"5d75898c-874a-45b8-8697-8da54f59beb2\",\"WorkerId\":\"d7f30e8e-ba68-4db4-b4bd-d19982c74bcd\"}'),
(32, 8, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 06:56:43.922132', '{\"FailedAt\":\"2022-12-05T06:56:43.8777229Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(33, 8, 'Scheduled', 'Retry attempt 2 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 06:56:43.925991', '{\"EnqueueAt\":\"2022-12-05T06:57:45.8834221Z\",\"ScheduledAt\":\"2022-12-05T06:56:43.8834223Z\"}'),
(34, 8, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 06:58:11.652165', '{\"EnqueuedAt\":\"2022-12-05T06:58:11.5450240Z\",\"Queue\":\"default\"}'),
(35, 8, 'Processing', NULL, '2022-12-05 06:58:26.536983', '{\"StartedAt\":\"2022-12-05T06:58:26.5325730Z\",\"ServerId\":\"ff5e91af-7d40-4975-9fa8-279443d05311\",\"WorkerId\":\"dc1d1e89-88ab-4d96-9d57-7d2beb780fac\"}'),
(36, 8, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 06:58:26.649832', '{\"FailedAt\":\"2022-12-05T06:58:26.6021581Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(37, 8, 'Scheduled', 'Retry attempt 3 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 06:58:26.653778', '{\"EnqueueAt\":\"2022-12-05T06:59:33.6087844Z\",\"ScheduledAt\":\"2022-12-05T06:58:26.6087846Z\"}'),
(38, 8, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:01:07.400535', '{\"EnqueuedAt\":\"2022-12-05T07:01:07.3742100Z\",\"Queue\":\"default\"}'),
(39, 8, 'Processing', NULL, '2022-12-05 07:01:32.546784', '{\"StartedAt\":\"2022-12-05T07:01:32.5303148Z\",\"ServerId\":\"ff5e91af-7d40-4975-9fa8-279443d05311\",\"WorkerId\":\"dc1d1e89-88ab-4d96-9d57-7d2beb780fac\"}'),
(40, 8, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 07:01:34.535720', '{\"FailedAt\":\"2022-12-05T07:01:34.5288453Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(41, 8, 'Scheduled', 'Retry attempt 4 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 07:01:34.536406', '{\"EnqueueAt\":\"2022-12-05T07:03:18.5320015Z\",\"ScheduledAt\":\"2022-12-05T07:01:34.5320023Z\"}'),
(42, 8, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:02:26.196019', '{\"EnqueuedAt\":\"2022-12-05T07:02:26.1946406Z\",\"Queue\":\"default\"}'),
(43, 8, 'Processing', NULL, '2022-12-05 07:02:35.595040', '{\"StartedAt\":\"2022-12-05T07:02:35.5933583Z\",\"ServerId\":\"ff5e91af-7d40-4975-9fa8-279443d05311\",\"WorkerId\":\"09a3dec0-d939-4479-bee2-94665f234ad7\"}'),
(44, 8, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 07:02:35.623181', '{\"FailedAt\":\"2022-12-05T07:02:35.6173004Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(45, 8, 'Scheduled', 'Retry attempt 5 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 07:02:35.623946', '{\"EnqueueAt\":\"2022-12-05T07:08:06.6206892Z\",\"ScheduledAt\":\"2022-12-05T07:02:35.6206895Z\"}'),
(46, 8, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:08:49.292602', '{\"EnqueuedAt\":\"2022-12-05T07:08:49.1839036Z\",\"Queue\":\"default\"}'),
(47, 8, 'Processing', NULL, '2022-12-05 07:08:54.160879', '{\"StartedAt\":\"2022-12-05T07:08:54.1570972Z\",\"ServerId\":\"2c152865-7ae2-484e-8f48-02eb50e3cf0d\",\"WorkerId\":\"c29a9101-cb4d-4e46-8c6e-0177e0807443\"}'),
(48, 8, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 07:08:55.710370', '{\"FailedAt\":\"2022-12-05T07:08:55.6661629Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(49, 8, 'Scheduled', 'Retry attempt 6 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 07:08:55.714079', '{\"EnqueueAt\":\"2022-12-05T07:21:41.6715732Z\",\"ScheduledAt\":\"2022-12-05T07:08:55.6715735Z\"}'),
(50, 9, 'Scheduled', NULL, '2022-12-05 07:10:36.507595', '{\"EnqueueAt\":\"2022-12-05T07:10:33.1212832Z\",\"ScheduledAt\":\"2022-12-05T07:10:36.4800451Z\"}'),
(51, 9, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:10:56.708108', '{\"EnqueuedAt\":\"2022-12-05T07:10:56.7065050Z\",\"Queue\":\"default\"}'),
(52, 9, 'Processing', NULL, '2022-12-05 07:11:03.093482', '{\"StartedAt\":\"2022-12-05T07:11:03.0919623Z\",\"ServerId\":\"2c152865-7ae2-484e-8f48-02eb50e3cf0d\",\"WorkerId\":\"fcdb5330-0275-4192-98c2-f9c81c835283\"}'),
(53, 9, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 07:11:03.118288', '{\"FailedAt\":\"2022-12-05T07:11:03.1133481Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(54, 9, 'Scheduled', 'Retry attempt 1 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 07:11:03.118916', '{\"EnqueueAt\":\"2022-12-05T07:11:42.1158174Z\",\"ScheduledAt\":\"2022-12-05T07:11:03.1158176Z\"}'),
(55, 9, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:11:06.743598', '{\"EnqueuedAt\":\"2022-12-05T07:11:06.7415426Z\",\"Queue\":\"default\"}'),
(56, 9, 'Processing', NULL, '2022-12-05 07:11:18.107463', '{\"StartedAt\":\"2022-12-05T07:11:18.1058821Z\",\"ServerId\":\"2c152865-7ae2-484e-8f48-02eb50e3cf0d\",\"WorkerId\":\"70e20693-0e9d-4d4a-b8dd-0c4611b98631\"}'),
(57, 9, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 07:11:18.134082', '{\"FailedAt\":\"2022-12-05T07:11:18.1282333Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(58, 9, 'Scheduled', 'Retry attempt 2 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 07:11:18.134825', '{\"EnqueueAt\":\"2022-12-05T07:11:36.1315924Z\",\"ScheduledAt\":\"2022-12-05T07:11:18.1315925Z\"}'),
(59, 9, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:11:21.773686', '{\"EnqueuedAt\":\"2022-12-05T07:11:21.7723101Z\",\"Queue\":\"default\"}'),
(60, 9, 'Processing', NULL, '2022-12-05 07:11:33.120740', '{\"StartedAt\":\"2022-12-05T07:11:33.1183975Z\",\"ServerId\":\"2c152865-7ae2-484e-8f48-02eb50e3cf0d\",\"WorkerId\":\"14405342-1d5c-4a65-b0d6-f727fc43c983\"}'),
(61, 9, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 07:11:33.145895', '{\"FailedAt\":\"2022-12-05T07:11:33.1411259Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(62, 9, 'Scheduled', 'Retry attempt 3 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 07:11:33.146435', '{\"EnqueueAt\":\"2022-12-05T07:12:43.1433999Z\",\"ScheduledAt\":\"2022-12-05T07:11:33.1434002Z\"}'),
(63, 9, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:13:07.004579', '{\"EnqueuedAt\":\"2022-12-05T07:13:07.0031451Z\",\"Queue\":\"default\"}'),
(64, 9, 'Processing', NULL, '2022-12-05 07:13:47.787716', '{\"StartedAt\":\"2022-12-05T07:13:47.6914572Z\",\"ServerId\":\"418fa1c2-a57b-42eb-98c2-9e6cdc75032e\",\"WorkerId\":\"a32e0312-3a11-4299-8dd8-89a978b2630c\"}'),
(65, 9, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 07:13:49.385908', '{\"FailedAt\":\"2022-12-05T07:13:49.3351116Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(66, 9, 'Scheduled', 'Retry attempt 4 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 07:13:49.390405', '{\"EnqueueAt\":\"2022-12-05T07:15:33.3437512Z\",\"ScheduledAt\":\"2022-12-05T07:13:49.3437514Z\"}'),
(67, 10, 'Enqueued', NULL, '2022-12-05 07:14:30.299449', '{\"EnqueuedAt\":\"2022-12-05T07:14:30.2731956Z\",\"Queue\":\"default\"}'),
(68, 10, 'Processing', NULL, '2022-12-05 07:14:32.699717', '{\"StartedAt\":\"2022-12-05T07:14:32.6982863Z\",\"ServerId\":\"418fa1c2-a57b-42eb-98c2-9e6cdc75032e\",\"WorkerId\":\"1446cad0-3fa0-42f7-84c5-0024d2eb315d\"}'),
(69, 10, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 07:14:32.731348', '{\"FailedAt\":\"2022-12-05T07:14:32.7235138Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(70, 10, 'Scheduled', 'Retry attempt 1 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 07:14:32.732438', '{\"EnqueueAt\":\"2022-12-05T07:15:09.7266555Z\",\"ScheduledAt\":\"2022-12-05T07:14:32.7266557Z\"}'),
(71, 9, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:15:15.158408', '{\"EnqueuedAt\":\"2022-12-05T07:15:15.1549264Z\",\"Queue\":\"default\"}'),
(72, 10, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:15:15.163857', '{\"EnqueuedAt\":\"2022-12-05T07:15:15.1622514Z\",\"Queue\":\"default\"}'),
(73, 9, 'Processing', NULL, '2022-12-05 07:15:17.745903', '{\"StartedAt\":\"2022-12-05T07:15:17.7440751Z\",\"ServerId\":\"418fa1c2-a57b-42eb-98c2-9e6cdc75032e\",\"WorkerId\":\"cd6241f2-0375-4848-a8f1-e69089f723ee\"}'),
(74, 10, 'Processing', NULL, '2022-12-05 07:15:17.746384', '{\"StartedAt\":\"2022-12-05T07:15:17.7444932Z\",\"ServerId\":\"418fa1c2-a57b-42eb-98c2-9e6cdc75032e\",\"WorkerId\":\"38b57df2-f1f5-4ded-aeb3-93dff95e581e\"}'),
(75, 9, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 07:15:17.788351', '{\"FailedAt\":\"2022-12-05T07:15:17.7814507Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(76, 10, 'Failed', 'An exception occurred during performance of the job.', '2022-12-05 07:15:17.788263', '{\"FailedAt\":\"2022-12-05T07:15:17.7814679Z\",\"ExceptionType\":\"System.ArgumentNullException\",\"ExceptionMessage\":\"Value cannot be null. (Parameter \'source\')\",\"ExceptionDetails\":\"System.ArgumentNullException: Value cannot be null. (Parameter \'source\')\\r\\n   at System.Linq.ThrowHelper.ThrowArgumentNullException(ExceptionArgument argument)\\r\\n   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)\\r\\n   at EmailMarketing.Modules.Operations.Services.OperationServices.SendMailAsync(Int32 operationId) in C:\\\\Users\\\\PC 01\\\\Desktop\\\\MinhChanh\\\\EmailMarketing\\\\EmailMarketing\\\\Modules\\\\Operations\\\\Services\\\\OperationServices.cs:line 113\\r\\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()\"}'),
(77, 9, 'Scheduled', 'Retry attempt 5 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 07:15:17.788975', '{\"EnqueueAt\":\"2022-12-05T07:21:08.7851025Z\",\"ScheduledAt\":\"2022-12-05T07:15:17.7851026Z\"}'),
(78, 10, 'Scheduled', 'Retry attempt 2 of 10: Value cannot be null. (Parameter \'source\')', '2022-12-05 07:15:17.789000', '{\"EnqueueAt\":\"2022-12-05T07:16:17.7839054Z\",\"ScheduledAt\":\"2022-12-05T07:15:17.7839055Z\"}'),
(79, 11, 'Enqueued', NULL, '2022-12-05 07:16:01.901768', '{\"EnqueuedAt\":\"2022-12-05T07:16:01.8961438Z\",\"Queue\":\"default\"}'),
(80, 11, 'Processing', NULL, '2022-12-05 07:16:02.762018', '{\"StartedAt\":\"2022-12-05T07:16:02.7596515Z\",\"ServerId\":\"418fa1c2-a57b-42eb-98c2-9e6cdc75032e\",\"WorkerId\":\"676ffcad-f1d9-44bb-97e2-db3c0d1e17c2\"}'),
(81, 12, 'Enqueued', NULL, '2022-12-05 07:16:56.811300', '{\"EnqueuedAt\":\"2022-12-05T07:16:56.7499649Z\",\"Queue\":\"default\"}'),
(82, 12, 'Processing', NULL, '2022-12-05 07:17:07.141031', '{\"StartedAt\":\"2022-12-05T07:17:07.1319554Z\",\"ServerId\":\"51ebd6b9-4747-4e13-af31-9d3c6276a043\",\"WorkerId\":\"92b790d2-2f33-4f76-a095-c148c05c476d\"}'),
(83, 10, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:18:33.524399', '{\"EnqueuedAt\":\"2022-12-05T07:18:33.4087944Z\",\"Queue\":\"default\"}'),
(84, 13, 'Enqueued', NULL, '2022-12-05 07:18:39.809908', '{\"EnqueuedAt\":\"2022-12-05T07:18:39.7855222Z\",\"Queue\":\"default\"}'),
(85, 13, 'Processing', NULL, '2022-12-05 07:18:48.378689', '{\"StartedAt\":\"2022-12-05T07:18:48.3751141Z\",\"ServerId\":\"a610441b-7455-4a0a-bfe7-cd382a86d7e8\",\"WorkerId\":\"d42311bf-a7e6-42bc-a309-e6a4ca91db7d\"}'),
(86, 10, 'Processing', NULL, '2022-12-05 07:18:48.378564', '{\"StartedAt\":\"2022-12-05T07:18:48.3749100Z\",\"ServerId\":\"a610441b-7455-4a0a-bfe7-cd382a86d7e8\",\"WorkerId\":\"eb584377-8105-4d6c-b2e6-03cd259aec26\"}'),
(87, 13, 'Succeeded', NULL, '2022-12-05 07:19:18.951711', '{\"SucceededAt\":\"2022-12-05T07:19:18.9424084Z\",\"PerformanceDuration\":\"30556\",\"Latency\":\"8587\"}'),
(88, 10, 'Succeeded', NULL, '2022-12-05 07:19:19.263317', '{\"SucceededAt\":\"2022-12-05T07:19:19.2614233Z\",\"PerformanceDuration\":\"30874\",\"Latency\":\"258099\"}'),
(89, 8, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:21:37.242567', '{\"EnqueuedAt\":\"2022-12-05T07:21:37.1325438Z\",\"Queue\":\"default\"}'),
(90, 9, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:21:37.263040', '{\"EnqueuedAt\":\"2022-12-05T07:21:37.2612320Z\",\"Queue\":\"default\"}'),
(91, 14, 'Scheduled', NULL, '2022-12-05 07:21:46.447264', '{\"EnqueueAt\":\"2022-12-05T07:21:46.1929060Z\",\"ScheduledAt\":\"2022-12-05T07:21:46.4188339Z\"}'),
(92, 14, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:21:47.291427', '{\"EnqueuedAt\":\"2022-12-05T07:21:47.2887763Z\",\"Queue\":\"default\"}'),
(93, 9, 'Processing', NULL, '2022-12-05 07:21:52.115023', '{\"StartedAt\":\"2022-12-05T07:21:52.1117455Z\",\"ServerId\":\"d2d6c9b0-eeb9-48bf-aaed-24941f77d164\",\"WorkerId\":\"01313ecf-05bf-43c9-b8ca-7f70e644a5ed\"}'),
(94, 8, 'Processing', NULL, '2022-12-05 07:21:52.115017', '{\"StartedAt\":\"2022-12-05T07:21:52.1118311Z\",\"ServerId\":\"d2d6c9b0-eeb9-48bf-aaed-24941f77d164\",\"WorkerId\":\"1457545a-56f0-4d7d-ae18-5d54283b406c\"}'),
(95, 14, 'Processing', NULL, '2022-12-05 07:21:52.115025', '{\"StartedAt\":\"2022-12-05T07:21:52.1119542Z\",\"ServerId\":\"d2d6c9b0-eeb9-48bf-aaed-24941f77d164\",\"WorkerId\":\"04483e26-3303-4271-a8b2-4c382358ce4c\"}'),
(96, 9, 'Succeeded', NULL, '2022-12-05 07:21:57.268186', '{\"SucceededAt\":\"2022-12-05T07:21:57.2600187Z\",\"PerformanceDuration\":\"5137\",\"Latency\":\"675627\"}'),
(97, 14, 'Succeeded', NULL, '2022-12-05 07:21:58.067095', '{\"SucceededAt\":\"2022-12-05T07:21:58.0646173Z\",\"PerformanceDuration\":\"5942\",\"Latency\":\"5689\"}'),
(98, 8, 'Succeeded', NULL, '2022-12-05 07:21:59.113507', '{\"SucceededAt\":\"2022-12-05T07:21:59.1114167Z\",\"PerformanceDuration\":\"6989\",\"Latency\":\"1646319\"}'),
(99, 15, 'Scheduled', NULL, '2022-12-05 07:24:27.154155', '{\"EnqueueAt\":\"2022-12-05T07:24:27.1271930Z\",\"ScheduledAt\":\"2022-12-05T07:24:27.1486542Z\"}'),
(100, 15, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-05 07:24:31.552926', '{\"EnqueuedAt\":\"2022-12-05T07:24:31.5511151Z\",\"Queue\":\"default\"}'),
(101, 15, 'Processing', NULL, '2022-12-05 07:24:37.226469', '{\"StartedAt\":\"2022-12-05T07:24:37.2249220Z\",\"ServerId\":\"d2d6c9b0-eeb9-48bf-aaed-24941f77d164\",\"WorkerId\":\"7cb9d872-a617-4cb1-8693-7c6f78dda4d0\"}'),
(102, 15, 'Succeeded', NULL, '2022-12-05 07:25:01.804234', '{\"SucceededAt\":\"2022-12-05T07:25:01.8011861Z\",\"PerformanceDuration\":\"24572\",\"Latency\":\"10078\"}');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `Password` text NOT NULL,
  `RoleId` int(11) NOT NULL,
  `Phone` char(11) DEFAULT NULL,
  `Male` tinyint(4) DEFAULT NULL,
  `CreatedDate` datetime(6) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `Avatar` text DEFAULT NULL,
  `RefreshToken` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `Name`, `Email`, `Password`, `RoleId`, `Phone`, `Male`, `CreatedDate`, `Status`, `Avatar`, `RefreshToken`) VALUES
(1, 'Minh Chánh', 'am.chanh16111@gmail.com', '$2a$11$4lJw8eMZIY.D5Oo2D5GQau4RZogri33zy5FyZDKE.bWg2ZYggZ6hK', 1, NULL, 1, '2022-11-25 10:57:43.571082', 1, 'https://localhost:7069/https://localhost:7069/', NULL),
(2, 'Huỳnh Văn Tới', 'toi.huynh@alta.com.vn', '$2a$11$7KoqxWcSLjV3d4vq5T69vuCEoHlh3/x2zzJ0TSxbj7GMLirvGYOhO', 2, NULL, 1, '2022-11-25 10:58:22.805547', 1, NULL, NULL),
(3, 'Huỳnh Văn Tới', 'toi.huynh@hotmail.com', '$2a$11$MrtjErMC1667zlV4I26yTer/I.iV7ldqrvxE3PDjNmSrjiKas4hHm', 3, '0359330868', 1, '2022-11-25 11:03:54.545147', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20221125033712_UpdateDatabase2', '6.0.11'),
('20221127091249_CreateModelProjectServicePackage', '6.0.11'),
('20221129064636_AddUsedInModelProject', '6.0.11'),
('20221129074612_CreateModuleContact', '6.0.11'),
('20221129074936_CreateModuleContact', '6.0.11'),
('20221129075056_CreateModuleContact', '6.0.11'),
('20221129081913_GroupContactIdNullable', '6.0.11'),
('20221130094310_Init', '6.0.11'),
('20221201044347_Init', '6.0.11'),
('20221201085531_DeleteNumberContact', '6.0.11'),
('20221202052447_CreateModelGoogleAccount', '6.0.11'),
('20221203054115_CreateModelOperation', '6.0.11'),
('20221203054505_EditModeDelete', '6.0.11'),
('20221205024121_CreateColumnRefreshToken', '6.0.11'),
('20221205024617_EditColumnRefreshToken', '6.0.11'),
('20221205064024_CreateStatusMessage', '6.0.11'),
('20221205064239_CreateOperationDetail', '6.0.11'),
('20221205064310_CreateOperationDetail1', '6.0.11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aggregatedcounter`
--
ALTER TABLE `aggregatedcounter`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_CounterAggregated_Key` (`Key`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_contact_GroupContactId` (`GroupContactId`),
  ADD KEY `IX_contact_UserId` (`UserId`);

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Counter_Key` (`Key`);

--
-- Indexes for table `google_account`
--
ALTER TABLE `google_account`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_google_account_UserId` (`UserId`);

--
-- Indexes for table `group_contact`
--
ALTER TABLE `group_contact`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_group_contact_UserId` (`UserId`);

--
-- Indexes for table `hash`
--
ALTER TABLE `hash`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_Hash_Key_Field` (`Key`,`Field`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Job_StateName` (`StateName`);

--
-- Indexes for table `jobparameter`
--
ALTER TABLE `jobparameter`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_JobParameter_JobId_Name` (`JobId`,`Name`),
  ADD KEY `FK_JobParameter_Job` (`JobId`);

--
-- Indexes for table `jobqueue`
--
ALTER TABLE `jobqueue`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_JobQueue_QueueAndFetchedAt` (`Queue`,`FetchedAt`);

--
-- Indexes for table `jobstate`
--
ALTER TABLE `jobstate`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_JobState_Job` (`JobId`);

--
-- Indexes for table `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_operation_GoogleAccountId` (`GoogleAccountId`),
  ADD KEY `IX_operation_GroupContactId` (`GroupContactId`),
  ADD KEY `IX_operation_ProjectId` (`ProjectId`),
  ADD KEY `IX_operation_UserId` (`UserId`);

--
-- Indexes for table `operation_detail`
--
ALTER TABLE `operation_detail`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_operation_detail_ContactId` (`ContactId`),
  ADD KEY `IX_operation_detail_OperationId` (`OperationId`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_project_OwnerId` (`OwnerId`),
  ADD KEY `IX_project_ServicePackageId` (`ServicePackageId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`RoleId`,`PermissionCode`),
  ADD KEY `IX_role_permission_PermissionCode` (`PermissionCode`);

--
-- Indexes for table `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `service_packages`
--
ALTER TABLE `service_packages`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `set`
--
ALTER TABLE `set`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_Set_Key_Value` (`Key`,`Value`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_HangFire_State_Job` (`JobId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_user_RoleId` (`RoleId`);

--
-- Indexes for table `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aggregatedcounter`
--
ALTER TABLE `aggregatedcounter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `google_account`
--
ALTER TABLE `google_account`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_contact`
--
ALTER TABLE `group_contact`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hash`
--
ALTER TABLE `hash`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jobparameter`
--
ALTER TABLE `jobparameter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `jobqueue`
--
ALTER TABLE `jobqueue`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `jobstate`
--
ALTER TABLE `jobstate`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `list`
--
ALTER TABLE `list`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation`
--
ALTER TABLE `operation`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `operation_detail`
--
ALTER TABLE `operation_detail`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_packages`
--
ALTER TABLE `service_packages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `set`
--
ALTER TABLE `set`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_contact_group_contact_GroupContactId` FOREIGN KEY (`GroupContactId`) REFERENCES `group_contact` (`Id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_contact_user_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `google_account`
--
ALTER TABLE `google_account`
  ADD CONSTRAINT `FK_google_account_user_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `group_contact`
--
ALTER TABLE `group_contact`
  ADD CONSTRAINT `FK_group_contact_user_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `jobparameter`
--
ALTER TABLE `jobparameter`
  ADD CONSTRAINT `FK_JobParameter_Job` FOREIGN KEY (`JobId`) REFERENCES `job` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobstate`
--
ALTER TABLE `jobstate`
  ADD CONSTRAINT `FK_JobState_Job` FOREIGN KEY (`JobId`) REFERENCES `job` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `operation`
--
ALTER TABLE `operation`
  ADD CONSTRAINT `FK_operation_google_account_GoogleAccountId` FOREIGN KEY (`GoogleAccountId`) REFERENCES `google_account` (`Id`),
  ADD CONSTRAINT `FK_operation_group_contact_GroupContactId` FOREIGN KEY (`GroupContactId`) REFERENCES `group_contact` (`Id`),
  ADD CONSTRAINT `FK_operation_project_ProjectId` FOREIGN KEY (`ProjectId`) REFERENCES `project` (`Id`),
  ADD CONSTRAINT `FK_operation_user_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`);

--
-- Constraints for table `operation_detail`
--
ALTER TABLE `operation_detail`
  ADD CONSTRAINT `FK_operation_detail_contact_ContactId` FOREIGN KEY (`ContactId`) REFERENCES `contact` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_operation_detail_operation_OperationId` FOREIGN KEY (`OperationId`) REFERENCES `operation` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `FK_project_service_packages_ServicePackageId` FOREIGN KEY (`ServicePackageId`) REFERENCES `service_packages` (`Id`),
  ADD CONSTRAINT `FK_project_user_OwnerId` FOREIGN KEY (`OwnerId`) REFERENCES `user` (`Id`);

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `FK_role_permission_permission_PermissionCode` FOREIGN KEY (`PermissionCode`) REFERENCES `permission` (`Code`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_role_permission_role_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `FK_HangFire_State_Job` FOREIGN KEY (`JobId`) REFERENCES `job` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_role_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
