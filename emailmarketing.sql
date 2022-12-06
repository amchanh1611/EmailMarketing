-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2022 at 02:48 PM
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
(1, 'stats:succeeded', 88, NULL),
(2, 'stats:succeeded:2022-12-03', 2, '2023-01-03 14:06:50'),
(5, 'stats:succeeded:2022-12-05', 13, '2023-01-05 13:22:06'),
(15, 'stats:succeeded:2022-12-06', 73, '2023-01-06 13:44:07'),
(16, 'stats:succeeded:2022-12-06-05', 10, '2022-12-07 05:35:01'),
(21, 'stats:succeeded:2022-12-06-10', 3, '2022-12-07 10:59:49'),
(24, 'stats:succeeded:2022-12-06-11', 34, '2022-12-07 11:59:06'),
(31, 'stats:succeeded:2022-12-06-12', 12, '2022-12-07 12:12:08'),
(35, 'stats:succeeded:2022-12-06-13', 14, '2022-12-07 13:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `Male` tinyint(4) NOT NULL DEFAULT 0,
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
(265, 'stats:succeeded:2022-12-06', 1, '2023-01-06 13:45:52'),
(266, 'stats:succeeded:2022-12-06-13', 1, '2022-12-07 13:45:52'),
(267, 'stats:succeeded', 1, NULL),
(268, 'stats:succeeded:2022-12-06', 1, '2023-01-06 13:46:07'),
(269, 'stats:succeeded:2022-12-06-13', 1, '2022-12-07 13:46:07'),
(270, 'stats:succeeded', 1, NULL);

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
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `google_account`
--

INSERT INTO `google_account` (`Id`, `Name`, `Email`, `RefreshToken`, `UserId`) VALUES
(3, 'Chánh Âu Minh', '0468191090@caothang.edu.vn', '1//0eo2TA4k70VLQCgYIARAAGA4SNwF-L9IrNC0Tr_S9vbaVVidqUOHc7ZL4WE4tjTHYMDaJtBCQP65vci31wybep58RA8_4q8BYvDU', 3);

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

--
-- Dumping data for table `hash`
--

INSERT INTO `hash` (`Id`, `Key`, `Field`, `Value`, `ExpireAt`) VALUES
(1, 'recurring-job:updateuse', 'Queue', 'default', NULL),
(2, 'recurring-job:updateuse', 'Cron', '0 0 6 * *', NULL),
(3, 'recurring-job:updateuse', 'TimeZoneId', 'UTC', NULL),
(4, 'recurring-job:updateuse', 'Job', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"2\\\"]\"}', NULL),
(5, 'recurring-job:updateuse', 'CreatedAt', '2022-12-06T05:24:31.2290898Z', NULL),
(6, 'recurring-job:updateuse', 'NextExecution', '2023-01-06T00:00:00.0000000Z', NULL),
(7, 'recurring-job:updateuse', 'V', '2', NULL),
(8, 'recurring-job:updateuse', 'LastExecution', '2022-12-06T05:24:31.3734063Z', NULL),
(9, 'recurring-job:updateuse', 'LastJobId', '19', NULL),
(10, 'recurring-job:updateuseminute', 'Queue', 'default', NULL),
(11, 'recurring-job:updateuseminute', 'Cron', '* * * * *', NULL),
(12, 'recurring-job:updateuseminute', 'TimeZoneId', 'UTC', NULL),
(13, 'recurring-job:updateuseminute', 'Job', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', NULL),
(14, 'recurring-job:updateuseminute', 'CreatedAt', '2022-12-06T05:29:23.5870445Z', NULL),
(15, 'recurring-job:updateuseminute', 'NextExecution', '2022-12-06T13:47:00.0000000Z', NULL),
(16, 'recurring-job:updateuseminute', 'V', '2', NULL),
(17, 'recurring-job:updateuseminute', 'LastExecution', '2022-12-06T13:46:00.0008545Z', NULL),
(18, 'recurring-job:updateuseminute', 'LastJobId', '90', NULL);

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
(11, 122, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"10\\\"]\"}', '[\"10\"]', '2022-12-05 07:16:01.898205', '2022-12-07 05:15:50.924108'),
(12, 121, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"11\\\"]\"}', '[\"11\"]', '2022-12-05 07:16:56.773495', '2022-12-07 05:15:50.803791'),
(18, 120, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"17\\\"]\"}', '[\"17\"]', '2022-12-05 13:34:32.805478', '2022-12-07 05:15:49.709465'),
(19, 125, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"2\\\"]\"}', '[\"2\"]', '2022-12-06 05:24:31.469013', '2022-12-07 05:24:46.333299'),
(20, 128, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 05:29:29.417716', '2022-12-07 05:29:34.000959'),
(21, 131, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 05:30:43.974712', '2022-12-07 05:30:46.246203'),
(22, 134, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 05:31:00.137164', '2022-12-07 05:31:01.151751'),
(23, 139, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 05:32:51.220427', '2022-12-07 05:33:01.438194'),
(24, 140, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 05:33:00.011594', '2022-12-07 05:33:01.485532'),
(25, 143, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 05:35:00.777155', '2022-12-07 05:35:01.661180'),
(26, 146, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 10:55:20.091336', '2022-12-07 10:55:44.682514'),
(27, 149, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 10:57:07.462390', '2022-12-07 10:57:43.251943'),
(28, 152, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 10:59:01.900469', '2022-12-07 10:59:49.734058'),
(29, 155, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:07:08.172404', '2022-12-07 11:07:38.257776'),
(30, 158, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:08:00.037398', '2022-12-07 11:08:08.345500'),
(31, 163, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:09:56.215641', '2022-12-07 11:10:08.483050'),
(32, 164, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:10:00.023690', '2022-12-07 11:10:08.485093'),
(33, 167, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:12:00.788059', '2022-12-07 11:12:08.571706'),
(34, 170, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:13:00.024411', '2022-12-07 11:13:08.632659'),
(35, 173, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:14:10.431023', '2022-12-07 11:14:23.777446'),
(36, 176, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:15:00.018812', '2022-12-07 11:15:08.786159'),
(37, 179, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:16:20.517703', '2022-12-07 11:16:23.876157'),
(38, 182, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:17:00.017351', '2022-12-07 11:17:08.918958'),
(39, 185, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:18:25.591488', '2022-12-07 11:18:39.057950'),
(40, 188, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:36:47.262646', '2022-12-07 11:37:20.180446'),
(41, 191, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:37:39.042660', '2022-12-07 11:37:46.516441'),
(42, 194, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:38:00.424683', '2022-12-07 11:38:01.667788'),
(43, 197, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:39:47.998603', '2022-12-07 11:39:49.609448'),
(44, 200, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:40:00.029167', '2022-12-07 11:40:02.724213'),
(45, 205, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:41:54.158775', '2022-12-07 11:42:17.887474'),
(46, 206, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:42:02.833841', '2022-12-07 11:42:17.888902'),
(47, 209, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:44:03.588024', '2022-12-07 11:44:17.966607'),
(48, 212, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:45:00.101197', '2022-12-07 11:45:03.244984'),
(49, 215, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:46:10.890252', '2022-12-07 11:46:18.411327'),
(50, 218, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:47:00.046824', '2022-12-07 11:47:03.547144'),
(51, 221, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:48:20.764918', '2022-12-07 11:48:33.975562'),
(52, 224, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:49:00.133803', '2022-12-07 11:49:03.791199'),
(53, 227, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:50:26.190987', '2022-12-07 11:50:34.294050'),
(54, 230, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:51:00.063718', '2022-12-07 11:51:04.912218'),
(55, 233, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:52:36.361067', '2022-12-07 11:52:49.770694'),
(56, 236, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:53:00.038478', '2022-12-07 11:53:05.545380'),
(57, 239, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:54:41.471039', '2022-12-07 11:54:50.584641'),
(58, 242, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:55:00.244381', '2022-12-07 11:55:05.990967'),
(59, 248, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:56:52.503415', '2022-12-07 11:57:07.207217'),
(60, 247, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:57:00.250635', '2022-12-07 11:57:07.207135'),
(61, 252, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:58:56.485199', '2022-12-07 11:59:06.871426'),
(62, 254, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 11:59:00.007217', '2022-12-07 11:59:06.954668'),
(63, 257, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:01:05.796926', '2022-12-07 12:01:07.123966'),
(64, 260, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:02:00.289559', '2022-12-07 12:02:08.463305'),
(65, 263, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:03:12.201512', '2022-12-07 12:03:22.859129'),
(66, 266, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:04:00.018643', '2022-12-07 12:04:08.047661'),
(67, 269, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:05:20.653095', '2022-12-07 12:05:23.196895'),
(68, 272, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:06:00.030909', '2022-12-07 12:06:08.258877'),
(69, 275, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:07:30.648166', '2022-12-07 12:07:38.435600'),
(70, 278, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:08:00.030978', '2022-12-07 12:08:08.513180'),
(71, 281, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:09:40.766212', '2022-12-07 12:09:53.670731'),
(72, 284, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:10:00.009376', '2022-12-07 12:10:08.696073'),
(73, 287, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:11:45.648260', '2022-12-07 12:11:53.852202'),
(74, 290, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 12:12:00.030764', '2022-12-07 12:12:08.881057'),
(75, 295, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:30:21.985029', '2022-12-07 13:31:06.800452'),
(76, 296, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:31:01.540902', '2022-12-07 13:31:06.800463'),
(77, 299, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:32:48.476341', '2022-12-07 13:32:51.686390'),
(78, 302, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:33:00.024610', '2022-12-07 13:33:06.664878'),
(79, 305, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:35:00.723108', '2022-12-07 13:35:06.779811'),
(80, 308, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:36:00.021187', '2022-12-07 13:36:06.859037'),
(81, 311, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:37:05.392741', '2022-12-07 13:37:06.972806'),
(82, 314, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:38:00.011416', '2022-12-07 13:38:07.121499'),
(83, 317, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:39:15.488074', '2022-12-07 13:39:22.180151'),
(84, 320, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:40:00.019929', '2022-12-07 13:40:07.278644'),
(85, 323, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:41:20.491622', '2022-12-07 13:41:22.396920'),
(86, 326, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:42:00.021873', '2022-12-07 13:42:07.454956'),
(87, 329, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:43:30.561513', '2022-12-07 13:43:37.542850'),
(88, 332, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:44:00.037756', '2022-12-07 13:44:07.565721'),
(89, 335, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:45:40.596994', '2022-12-07 13:45:52.661846'),
(90, 338, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-06 13:46:00.007242', '2022-12-07 13:46:07.714741');

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
(34, 11, 'CurrentCulture', '\"en-US\"'),
(35, 11, 'CurrentUICulture', '\"en-US\"'),
(36, 12, 'CurrentCulture', '\"en-US\"'),
(37, 12, 'CurrentUICulture', '\"en-US\"'),
(48, 18, 'CurrentCulture', '\"en-US\"'),
(49, 18, 'CurrentUICulture', '\"en-US\"'),
(50, 19, 'RecurringJobId', '\"updateuse\"'),
(51, 19, 'Time', '1670304271'),
(52, 19, 'CurrentCulture', '\"en-US\"'),
(53, 19, 'CurrentUICulture', '\"en-US\"'),
(54, 20, 'RecurringJobId', '\"updateuseminute\"'),
(55, 20, 'Time', '1670304565'),
(56, 20, 'CurrentCulture', '\"en-US\"'),
(57, 20, 'CurrentUICulture', '\"en-US\"'),
(58, 21, 'RecurringJobId', '\"updateuseminute\"'),
(59, 21, 'Time', '1670304643'),
(60, 21, 'CurrentCulture', '\"en-US\"'),
(61, 21, 'CurrentUICulture', '\"en-US\"'),
(62, 22, 'RecurringJobId', '\"updateuseminute\"'),
(63, 22, 'Time', '1670304660'),
(64, 22, 'CurrentCulture', '\"en-US\"'),
(65, 22, 'CurrentUICulture', '\"en-US\"'),
(66, 23, 'RecurringJobId', '\"updateuseminute\"'),
(67, 23, 'Time', '1670304771'),
(68, 23, 'CurrentCulture', '\"en-US\"'),
(69, 23, 'CurrentUICulture', '\"en-US\"'),
(70, 24, 'RecurringJobId', '\"updateuseminute\"'),
(71, 24, 'Time', '1670304780'),
(72, 24, 'CurrentCulture', '\"en-US\"'),
(73, 24, 'CurrentUICulture', '\"en-US\"'),
(74, 25, 'RecurringJobId', '\"updateuseminute\"'),
(75, 25, 'Time', '1670304900'),
(76, 25, 'CurrentCulture', '\"en-US\"'),
(77, 25, 'CurrentUICulture', '\"en-US\"'),
(78, 26, 'RecurringJobId', '\"updateuseminute\"'),
(79, 26, 'Time', '1670324119'),
(80, 26, 'CurrentCulture', '\"en-US\"'),
(81, 26, 'CurrentUICulture', '\"en-US\"'),
(82, 27, 'RecurringJobId', '\"updateuseminute\"'),
(83, 27, 'Time', '1670324226'),
(84, 27, 'CurrentCulture', '\"en-US\"'),
(85, 27, 'CurrentUICulture', '\"en-US\"'),
(86, 28, 'RecurringJobId', '\"updateuseminute\"'),
(87, 28, 'Time', '1670324340'),
(88, 28, 'CurrentCulture', '\"en-US\"'),
(89, 28, 'CurrentUICulture', '\"en-US\"'),
(90, 29, 'RecurringJobId', '\"updateuseminute\"'),
(91, 29, 'Time', '1670324827'),
(92, 29, 'CurrentCulture', '\"en-US\"'),
(93, 29, 'CurrentUICulture', '\"en-US\"'),
(94, 30, 'RecurringJobId', '\"updateuseminute\"'),
(95, 30, 'Time', '1670324880'),
(96, 30, 'CurrentCulture', '\"en-US\"'),
(97, 30, 'CurrentUICulture', '\"en-US\"'),
(98, 31, 'RecurringJobId', '\"updateuseminute\"'),
(99, 31, 'Time', '1670324996'),
(100, 31, 'CurrentCulture', '\"en-US\"'),
(101, 31, 'CurrentUICulture', '\"en-US\"'),
(102, 32, 'RecurringJobId', '\"updateuseminute\"'),
(103, 32, 'Time', '1670325000'),
(104, 32, 'CurrentCulture', '\"en-US\"'),
(105, 32, 'CurrentUICulture', '\"en-US\"'),
(106, 33, 'RecurringJobId', '\"updateuseminute\"'),
(107, 33, 'Time', '1670325120'),
(108, 33, 'CurrentCulture', '\"en-US\"'),
(109, 33, 'CurrentUICulture', '\"en-US\"'),
(110, 34, 'RecurringJobId', '\"updateuseminute\"'),
(111, 34, 'Time', '1670325180'),
(112, 34, 'CurrentCulture', '\"en-US\"'),
(113, 34, 'CurrentUICulture', '\"en-US\"'),
(114, 35, 'RecurringJobId', '\"updateuseminute\"'),
(115, 35, 'Time', '1670325250'),
(116, 35, 'CurrentCulture', '\"en-US\"'),
(117, 35, 'CurrentUICulture', '\"en-US\"'),
(118, 36, 'RecurringJobId', '\"updateuseminute\"'),
(119, 36, 'Time', '1670325300'),
(120, 36, 'CurrentCulture', '\"en-US\"'),
(121, 36, 'CurrentUICulture', '\"en-US\"'),
(122, 37, 'RecurringJobId', '\"updateuseminute\"'),
(123, 37, 'Time', '1670325380'),
(124, 37, 'CurrentCulture', '\"en-US\"'),
(125, 37, 'CurrentUICulture', '\"en-US\"'),
(126, 38, 'RecurringJobId', '\"updateuseminute\"'),
(127, 38, 'Time', '1670325420'),
(128, 38, 'CurrentCulture', '\"en-US\"'),
(129, 38, 'CurrentUICulture', '\"en-US\"'),
(130, 39, 'RecurringJobId', '\"updateuseminute\"'),
(131, 39, 'Time', '1670325505'),
(132, 39, 'CurrentCulture', '\"en-US\"'),
(133, 39, 'CurrentUICulture', '\"en-US\"'),
(134, 40, 'RecurringJobId', '\"updateuseminute\"'),
(135, 40, 'Time', '1670326606'),
(136, 40, 'CurrentCulture', '\"en-US\"'),
(137, 40, 'CurrentUICulture', '\"en-US\"'),
(138, 41, 'RecurringJobId', '\"updateuseminute\"'),
(139, 41, 'Time', '1670326659'),
(140, 41, 'CurrentCulture', '\"en-US\"'),
(141, 41, 'CurrentUICulture', '\"en-US\"'),
(142, 42, 'RecurringJobId', '\"updateuseminute\"'),
(143, 42, 'Time', '1670326680'),
(144, 42, 'CurrentCulture', '\"en-US\"'),
(145, 42, 'CurrentUICulture', '\"en-US\"'),
(146, 43, 'RecurringJobId', '\"updateuseminute\"'),
(147, 43, 'Time', '1670326787'),
(148, 43, 'CurrentCulture', '\"en-US\"'),
(149, 43, 'CurrentUICulture', '\"en-US\"'),
(150, 44, 'RecurringJobId', '\"updateuseminute\"'),
(151, 44, 'Time', '1670326800'),
(152, 44, 'CurrentCulture', '\"en-US\"'),
(153, 44, 'CurrentUICulture', '\"en-US\"'),
(154, 45, 'RecurringJobId', '\"updateuseminute\"'),
(155, 45, 'Time', '1670326914'),
(156, 45, 'CurrentCulture', '\"en-US\"'),
(157, 45, 'CurrentUICulture', '\"en-US\"'),
(158, 46, 'RecurringJobId', '\"updateuseminute\"'),
(159, 46, 'Time', '1670326922'),
(160, 46, 'CurrentCulture', '\"en-US\"'),
(161, 46, 'CurrentUICulture', '\"en-US\"'),
(162, 47, 'RecurringJobId', '\"updateuseminute\"'),
(163, 47, 'Time', '1670327043'),
(164, 47, 'CurrentCulture', '\"en-US\"'),
(165, 47, 'CurrentUICulture', '\"en-US\"'),
(166, 48, 'RecurringJobId', '\"updateuseminute\"'),
(167, 48, 'Time', '1670327100'),
(168, 48, 'CurrentCulture', '\"en-US\"'),
(169, 48, 'CurrentUICulture', '\"en-US\"'),
(170, 49, 'RecurringJobId', '\"updateuseminute\"'),
(171, 49, 'Time', '1670327170'),
(172, 49, 'CurrentCulture', '\"en-US\"'),
(173, 49, 'CurrentUICulture', '\"en-US\"'),
(174, 50, 'RecurringJobId', '\"updateuseminute\"'),
(175, 50, 'Time', '1670327220'),
(176, 50, 'CurrentCulture', '\"en-US\"'),
(177, 50, 'CurrentUICulture', '\"en-US\"'),
(178, 51, 'RecurringJobId', '\"updateuseminute\"'),
(179, 51, 'Time', '1670327300'),
(180, 51, 'CurrentCulture', '\"en-US\"'),
(181, 51, 'CurrentUICulture', '\"en-US\"'),
(182, 52, 'RecurringJobId', '\"updateuseminute\"'),
(183, 52, 'Time', '1670327340'),
(184, 52, 'CurrentCulture', '\"en-US\"'),
(185, 52, 'CurrentUICulture', '\"en-US\"'),
(186, 53, 'RecurringJobId', '\"updateuseminute\"'),
(187, 53, 'Time', '1670327426'),
(188, 53, 'CurrentCulture', '\"en-US\"'),
(189, 53, 'CurrentUICulture', '\"en-US\"'),
(190, 54, 'RecurringJobId', '\"updateuseminute\"'),
(191, 54, 'Time', '1670327460'),
(192, 54, 'CurrentCulture', '\"en-US\"'),
(193, 54, 'CurrentUICulture', '\"en-US\"'),
(194, 55, 'RecurringJobId', '\"updateuseminute\"'),
(195, 55, 'Time', '1670327556'),
(196, 55, 'CurrentCulture', '\"en-US\"'),
(197, 55, 'CurrentUICulture', '\"en-US\"'),
(198, 56, 'RecurringJobId', '\"updateuseminute\"'),
(199, 56, 'Time', '1670327580'),
(200, 56, 'CurrentCulture', '\"en-US\"'),
(201, 56, 'CurrentUICulture', '\"en-US\"'),
(202, 57, 'RecurringJobId', '\"updateuseminute\"'),
(203, 57, 'Time', '1670327681'),
(204, 57, 'CurrentCulture', '\"en-US\"'),
(205, 57, 'CurrentUICulture', '\"en-US\"'),
(206, 58, 'RecurringJobId', '\"updateuseminute\"'),
(207, 58, 'Time', '1670327700'),
(208, 58, 'CurrentCulture', '\"en-US\"'),
(209, 58, 'CurrentUICulture', '\"en-US\"'),
(210, 59, 'RecurringJobId', '\"updateuseminute\"'),
(211, 59, 'Time', '1670327812'),
(212, 59, 'CurrentCulture', '\"en-US\"'),
(213, 59, 'CurrentUICulture', '\"en-US\"'),
(214, 60, 'RecurringJobId', '\"updateuseminute\"'),
(215, 60, 'Time', '1670327820'),
(216, 60, 'CurrentCulture', '\"en-US\"'),
(217, 60, 'CurrentUICulture', '\"en-US\"'),
(218, 61, 'RecurringJobId', '\"updateuseminute\"'),
(219, 61, 'Time', '1670327936'),
(220, 61, 'CurrentCulture', '\"en-US\"'),
(221, 61, 'CurrentUICulture', '\"en-US\"'),
(222, 62, 'RecurringJobId', '\"updateuseminute\"'),
(223, 62, 'Time', '1670327940'),
(224, 62, 'CurrentCulture', '\"en-US\"'),
(225, 62, 'CurrentUICulture', '\"en-US\"'),
(226, 63, 'RecurringJobId', '\"updateuseminute\"'),
(227, 63, 'Time', '1670328065'),
(228, 63, 'CurrentCulture', '\"en-US\"'),
(229, 63, 'CurrentUICulture', '\"en-US\"'),
(230, 64, 'RecurringJobId', '\"updateuseminute\"'),
(231, 64, 'Time', '1670328120'),
(232, 64, 'CurrentCulture', '\"en-US\"'),
(233, 64, 'CurrentUICulture', '\"en-US\"'),
(234, 65, 'RecurringJobId', '\"updateuseminute\"'),
(235, 65, 'Time', '1670328192'),
(236, 65, 'CurrentCulture', '\"en-US\"'),
(237, 65, 'CurrentUICulture', '\"en-US\"'),
(238, 66, 'RecurringJobId', '\"updateuseminute\"'),
(239, 66, 'Time', '1670328240'),
(240, 66, 'CurrentCulture', '\"en-US\"'),
(241, 66, 'CurrentUICulture', '\"en-US\"'),
(242, 67, 'RecurringJobId', '\"updateuseminute\"'),
(243, 67, 'Time', '1670328320'),
(244, 67, 'CurrentCulture', '\"en-US\"'),
(245, 67, 'CurrentUICulture', '\"en-US\"'),
(246, 68, 'RecurringJobId', '\"updateuseminute\"'),
(247, 68, 'Time', '1670328360'),
(248, 68, 'CurrentCulture', '\"en-US\"'),
(249, 68, 'CurrentUICulture', '\"en-US\"'),
(250, 69, 'RecurringJobId', '\"updateuseminute\"'),
(251, 69, 'Time', '1670328450'),
(252, 69, 'CurrentCulture', '\"en-US\"'),
(253, 69, 'CurrentUICulture', '\"en-US\"'),
(254, 70, 'RecurringJobId', '\"updateuseminute\"'),
(255, 70, 'Time', '1670328480'),
(256, 70, 'CurrentCulture', '\"en-US\"'),
(257, 70, 'CurrentUICulture', '\"en-US\"'),
(258, 71, 'RecurringJobId', '\"updateuseminute\"'),
(259, 71, 'Time', '1670328580'),
(260, 71, 'CurrentCulture', '\"en-US\"'),
(261, 71, 'CurrentUICulture', '\"en-US\"'),
(262, 72, 'RecurringJobId', '\"updateuseminute\"'),
(263, 72, 'Time', '1670328600'),
(264, 72, 'CurrentCulture', '\"en-US\"'),
(265, 72, 'CurrentUICulture', '\"en-US\"'),
(266, 73, 'RecurringJobId', '\"updateuseminute\"'),
(267, 73, 'Time', '1670328705'),
(268, 73, 'CurrentCulture', '\"en-US\"'),
(269, 73, 'CurrentUICulture', '\"en-US\"'),
(270, 74, 'RecurringJobId', '\"updateuseminute\"'),
(271, 74, 'Time', '1670328720'),
(272, 74, 'CurrentCulture', '\"en-US\"'),
(273, 74, 'CurrentUICulture', '\"en-US\"'),
(274, 75, 'RecurringJobId', '\"updateuseminute\"'),
(275, 75, 'Time', '1670333421'),
(276, 75, 'CurrentCulture', '\"en-US\"'),
(277, 75, 'CurrentUICulture', '\"en-US\"'),
(278, 76, 'RecurringJobId', '\"updateuseminute\"'),
(279, 76, 'Time', '1670333461'),
(280, 76, 'CurrentCulture', '\"en-US\"'),
(281, 76, 'CurrentUICulture', '\"en-US\"'),
(282, 77, 'RecurringJobId', '\"updateuseminute\"'),
(283, 77, 'Time', '1670333568'),
(284, 77, 'CurrentCulture', '\"en-US\"'),
(285, 77, 'CurrentUICulture', '\"en-US\"'),
(286, 78, 'RecurringJobId', '\"updateuseminute\"'),
(287, 78, 'Time', '1670333580'),
(288, 78, 'CurrentCulture', '\"en-US\"'),
(289, 78, 'CurrentUICulture', '\"en-US\"'),
(290, 79, 'RecurringJobId', '\"updateuseminute\"'),
(291, 79, 'Time', '1670333700'),
(292, 79, 'CurrentCulture', '\"en-US\"'),
(293, 79, 'CurrentUICulture', '\"en-US\"'),
(294, 80, 'RecurringJobId', '\"updateuseminute\"'),
(295, 80, 'Time', '1670333760'),
(296, 80, 'CurrentCulture', '\"en-US\"'),
(297, 80, 'CurrentUICulture', '\"en-US\"'),
(298, 81, 'RecurringJobId', '\"updateuseminute\"'),
(299, 81, 'Time', '1670333825'),
(300, 81, 'CurrentCulture', '\"en-US\"'),
(301, 81, 'CurrentUICulture', '\"en-US\"'),
(302, 82, 'RecurringJobId', '\"updateuseminute\"'),
(303, 82, 'Time', '1670333880'),
(304, 82, 'CurrentCulture', '\"en-US\"'),
(305, 82, 'CurrentUICulture', '\"en-US\"'),
(306, 83, 'RecurringJobId', '\"updateuseminute\"'),
(307, 83, 'Time', '1670333955'),
(308, 83, 'CurrentCulture', '\"en-US\"'),
(309, 83, 'CurrentUICulture', '\"en-US\"'),
(310, 84, 'RecurringJobId', '\"updateuseminute\"'),
(311, 84, 'Time', '1670334000'),
(312, 84, 'CurrentCulture', '\"en-US\"'),
(313, 84, 'CurrentUICulture', '\"en-US\"'),
(314, 85, 'RecurringJobId', '\"updateuseminute\"'),
(315, 85, 'Time', '1670334080'),
(316, 85, 'CurrentCulture', '\"en-US\"'),
(317, 85, 'CurrentUICulture', '\"en-US\"'),
(318, 86, 'RecurringJobId', '\"updateuseminute\"'),
(319, 86, 'Time', '1670334120'),
(320, 86, 'CurrentCulture', '\"en-US\"'),
(321, 86, 'CurrentUICulture', '\"en-US\"'),
(322, 87, 'RecurringJobId', '\"updateuseminute\"'),
(323, 87, 'Time', '1670334210'),
(324, 87, 'CurrentCulture', '\"en-US\"'),
(325, 87, 'CurrentUICulture', '\"en-US\"'),
(326, 88, 'RecurringJobId', '\"updateuseminute\"'),
(327, 88, 'Time', '1670334240'),
(328, 88, 'CurrentCulture', '\"en-US\"'),
(329, 88, 'CurrentUICulture', '\"en-US\"'),
(330, 89, 'RecurringJobId', '\"updateuseminute\"'),
(331, 89, 'Time', '1670334340'),
(332, 89, 'CurrentCulture', '\"en-US\"'),
(333, 89, 'CurrentUICulture', '\"en-US\"'),
(334, 90, 'RecurringJobId', '\"updateuseminute\"'),
(335, 90, 'Time', '1670334360'),
(336, 90, 'CurrentCulture', '\"en-US\"'),
(337, 90, 'CurrentUICulture', '\"en-US\"');

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
(10, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:16:01.874609', 3, 1),
(11, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:16:56.532643', 3, 1),
(12, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:18:39.558759', 3, 1),
(13, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:21:46.200062', 3, 1),
(14, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:24:27.127215', 3, 1),
(15, 1, 'Chanh', 3, 'Chanh', 1, 'Dear [gender] chao [name]', '2022-12-05 13:08:49.765000', '2022-12-05 20:12:39.825848', 3, 1),
(16, 1, 'Chanh', 3, 'Chanh', 1, 'Dear [gender] chao [name]', '2022-12-05 13:08:49.765000', '2022-12-05 20:16:06.906585', 3, 1),
(17, 1, 'Chanh', 3, 'Chanh', 1, 'Dear [gender] chao [name]', '2022-12-05 13:08:49.765000', '2022-12-05 20:34:04.651268', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `operation_detail`
--

CREATE TABLE `operation_detail` (
  `Id` int(11) NOT NULL,
  `OperationId` int(11) NOT NULL,
  `ContactId` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `StatusMessage` char(20) NOT NULL
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
(10, 10, 4, 1, 'Complete'),
(11, 10, 6, 1, 'Complete'),
(12, 11, 4, 1, 'Complete'),
(13, 11, 6, 1, 'Complete'),
(14, 12, 4, 1, 'Complete'),
(15, 12, 6, 1, 'Complete'),
(16, 13, 2, 1, 'Complete'),
(17, 13, 7, 1, 'Complete'),
(18, 14, 2, 1, 'Complete'),
(19, 14, 7, 1, 'Complete'),
(20, 15, 2, 1, 'Complete'),
(21, 15, 7, 1, 'Complete'),
(22, 16, 2, 1, 'Complete'),
(23, 16, 7, 1, 'Complete'),
(24, 17, 2, 1, 'Complete'),
(25, 17, 7, 1, 'Complete');

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
('CreateContact', 'Create new Contact', 'Customer', 'Contact'),
('CreateCustommer', 'Create new custommer', 'Admin,System', 'Custommer'),
('CreateOperation', 'Create new operation', 'Customer', 'Operation'),
('CreateProject', 'Create new project', 'Admin,System', 'Project'),
('CreateRole', 'Create new Role', 'Admin', 'Role'),
('CreateServicePackage', 'Create new ServicePackage', 'Admin', 'ServicePackage'),
('DeleteAccount', 'Delete specified account', 'Admin', 'Account'),
('DeleteContact', 'Delete specified contact', 'Customer', 'Contact'),
('DeleteCustommer', 'Delete specified custommer', 'Admin,System', 'Custommer'),
('DeleteOperation', 'Delete specified operation', 'Customer', 'Operation'),
('DeleteProject', 'Delete specifeld project ', 'Admin,System', 'Project'),
('DeleteRole', 'Delete specified role', 'Admin', 'Role'),
('DeleteServicePackage', 'Delete specifeld servicePackage', 'Admin', 'ServicePackage'),
('UpdateAccount', 'Update account detail', 'Admin', 'Account'),
('UpdateContact', 'Update specified contact', 'Customer', 'Contact'),
('UpdateCustommer', 'Update custommer detail', 'Admin,System', 'Custommer'),
('UpdateOperation', 'Update specified operation', 'Customer', 'Operation'),
('UpdateProject', 'Update project detail', 'Admin,System', 'Project'),
('UpdateRole', 'Update specified role', 'Admin', 'Role'),
('UpdateServicePackage', 'Update servicePackage detail', 'Admin', 'ServicePackage'),
('ViewAccount', 'View account in system', 'Admin', 'Account'),
('ViewContact', 'View contact detail', 'Customer', 'Contact'),
('ViewCustommer', 'View custommer in system', 'Admin,System', 'Custommer'),
('ViewOperation', 'View operation detail', 'Customer', 'Operation'),
('ViewProject', 'View project in system', 'Admin,System,Customer', 'Project'),
('ViewRole', 'View role detail', 'Admin', 'Role'),
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
(1, 'VietJet Booking Tool', 3, 'ALTA-VJ-009', 4, 0, '2022-11-29 13:48:15.377993', '2022-11-29 00:00:00.000000', '2022-12-29 00:00:00.000000', 1),
(2, 'Daily Update Use', 3, 'TT1401', 3, 0, '2022-12-06 12:23:48.887990', '2022-12-06 04:00:00.000000', '2023-12-06 04:00:00.000000', 1),
(3, 'Test Daily Update Use', 3, 'TT1901', 3, 0, '2022-12-06 12:29:14.808135', '2022-12-06 04:00:00.000000', '2023-12-06 04:00:00.000000', 1);

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
('4e43da59-b437-46ce-91fb-be49915c3949', '{\"WorkerCount\":5,\"Queues\":[\"default\",\"default\",\"notdefault\"],\"StartedAt\":\"2022-12-06T13:30:19.4508821Z\"}', '2022-12-06 13:46:51.989623');

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

--
-- Dumping data for table `set`
--

INSERT INTO `set` (`Id`, `Key`, `Value`, `Score`, `ExpireAt`) VALUES
(36, 'recurring-jobs', 'updateuse', 1672960000, NULL),
(38, 'recurring-jobs', 'updateuseminute', 1670330000, NULL);

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
(79, 11, 'Enqueued', NULL, '2022-12-05 07:16:01.901768', '{\"EnqueuedAt\":\"2022-12-05T07:16:01.8961438Z\",\"Queue\":\"default\"}'),
(80, 11, 'Processing', NULL, '2022-12-05 07:16:02.762018', '{\"StartedAt\":\"2022-12-05T07:16:02.7596515Z\",\"ServerId\":\"418fa1c2-a57b-42eb-98c2-9e6cdc75032e\",\"WorkerId\":\"676ffcad-f1d9-44bb-97e2-db3c0d1e17c2\"}'),
(81, 12, 'Enqueued', NULL, '2022-12-05 07:16:56.811300', '{\"EnqueuedAt\":\"2022-12-05T07:16:56.7499649Z\",\"Queue\":\"default\"}'),
(82, 12, 'Processing', NULL, '2022-12-05 07:17:07.141031', '{\"StartedAt\":\"2022-12-05T07:17:07.1319554Z\",\"ServerId\":\"51ebd6b9-4747-4e13-af31-9d3c6276a043\",\"WorkerId\":\"92b790d2-2f33-4f76-a095-c148c05c476d\"}'),
(103, 12, 'Processing', NULL, '2022-12-05 12:58:17.279300', '{\"StartedAt\":\"2022-12-05T12:58:15.8999943Z\",\"ServerId\":\"e04dc1d3-996c-4530-a7ff-fe17bd65490e\",\"WorkerId\":\"257a6bb9-6477-4b26-ba7c-eb3d615718b9\"}'),
(104, 11, 'Processing', NULL, '2022-12-05 12:58:17.279293', '{\"StartedAt\":\"2022-12-05T12:58:15.8956555Z\",\"ServerId\":\"e04dc1d3-996c-4530-a7ff-fe17bd65490e\",\"WorkerId\":\"56209ff6-fc07-4246-ba23-21c1ba222c67\"}'),
(113, 11, 'Processing', NULL, '2022-12-05 13:30:29.711476', '{\"StartedAt\":\"2022-12-05T13:30:26.6608548Z\",\"ServerId\":\"3a3c21d3-8fd5-47d4-a702-2f843e6fdd8b\",\"WorkerId\":\"5d23fd24-ca93-48fb-9814-6dc515c12f09\"}'),
(114, 12, 'Processing', NULL, '2022-12-05 13:30:29.708254', '{\"StartedAt\":\"2022-12-05T13:30:26.6608544Z\",\"ServerId\":\"3a3c21d3-8fd5-47d4-a702-2f843e6fdd8b\",\"WorkerId\":\"f019ddd3-83b7-4310-98ab-d5fbc18b7fe3\"}'),
(115, 18, 'Enqueued', NULL, '2022-12-05 13:34:33.119059', '{\"EnqueuedAt\":\"2022-12-05T13:34:32.6968292Z\",\"Queue\":\"default\"}'),
(116, 18, 'Processing', NULL, '2022-12-05 13:34:42.127647', '{\"StartedAt\":\"2022-12-05T13:34:42.0859534Z\",\"ServerId\":\"bcca8e81-d5d2-4057-ab45-7c0710997b48\",\"WorkerId\":\"eb8535d1-4d7f-402d-ace5-de82440e2e78\"}'),
(117, 18, 'Processing', NULL, '2022-12-06 05:15:10.194976', '{\"StartedAt\":\"2022-12-06T05:15:09.6044882Z\",\"ServerId\":\"f5667457-afd3-44f7-84a0-6264ccbd1d70\",\"WorkerId\":\"116d035f-aeba-40cb-aa2e-8ee0bafbea9e\"}'),
(118, 12, 'Processing', NULL, '2022-12-06 05:15:10.194889', '{\"StartedAt\":\"2022-12-06T05:15:09.6129801Z\",\"ServerId\":\"f5667457-afd3-44f7-84a0-6264ccbd1d70\",\"WorkerId\":\"4ce8915a-f193-4922-8401-89fafdcc055b\"}'),
(119, 11, 'Processing', NULL, '2022-12-06 05:15:10.194906', '{\"StartedAt\":\"2022-12-06T05:15:09.6045040Z\",\"ServerId\":\"f5667457-afd3-44f7-84a0-6264ccbd1d70\",\"WorkerId\":\"0131606c-9303-4cd1-ab95-c714eb32e31f\"}'),
(120, 18, 'Succeeded', NULL, '2022-12-06 05:15:49.676021', '{\"SucceededAt\":\"2022-12-06T05:15:49.5314246Z\",\"PerformanceDuration\":\"39194\",\"Latency\":\"56437531\"}'),
(121, 12, 'Succeeded', NULL, '2022-12-06 05:15:50.800739', '{\"SucceededAt\":\"2022-12-06T05:15:50.7304761Z\",\"PerformanceDuration\":\"40396\",\"Latency\":\"79093560\"}'),
(122, 11, 'Succeeded', NULL, '2022-12-06 05:15:50.921981', '{\"SucceededAt\":\"2022-12-06T05:15:50.9024927Z\",\"PerformanceDuration\":\"40572\",\"Latency\":\"79148431\"}'),
(123, 19, 'Enqueued', 'Triggered using recurring job manager', '2022-12-06 05:24:31.522270', '{\"EnqueuedAt\":\"2022-12-06T05:24:31.5090034Z\",\"Queue\":\"default\"}'),
(124, 19, 'Processing', NULL, '2022-12-06 05:24:46.188654', '{\"StartedAt\":\"2022-12-06T05:24:46.1677445Z\",\"ServerId\":\"d5e1dfee-87ba-415e-8881-e2786cda7d75\",\"WorkerId\":\"b10631e8-9418-43f4-aa69-d5bd6f2369d3\"}'),
(125, 19, 'Succeeded', NULL, '2022-12-06 05:24:46.320287', '{\"SucceededAt\":\"2022-12-06T05:24:46.2997877Z\",\"PerformanceDuration\":\"84\",\"Latency\":\"14746\"}'),
(126, 20, 'Enqueued', 'Triggered using recurring job manager', '2022-12-06 05:29:30.031336', '{\"EnqueuedAt\":\"2022-12-06T05:29:29.7339922Z\",\"Queue\":\"default\"}'),
(127, 20, 'Processing', NULL, '2022-12-06 05:29:30.954050', '{\"StartedAt\":\"2022-12-06T05:29:30.7911282Z\",\"ServerId\":\"6ce185bd-dc46-492b-8b79-cf04d166cb17\",\"WorkerId\":\"4fe6a309-d709-4774-96c1-d84057422737\"}'),
(128, 20, 'Succeeded', NULL, '2022-12-06 05:29:33.891507', '{\"SucceededAt\":\"2022-12-06T05:29:33.3180938Z\",\"PerformanceDuration\":\"2301\",\"Latency\":\"1597\"}'),
(129, 21, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 05:30:44.014278', '{\"EnqueuedAt\":\"2022-12-06T05:30:44.0131628Z\",\"Queue\":\"default\"}'),
(130, 21, 'Processing', NULL, '2022-12-06 05:30:46.048270', '{\"StartedAt\":\"2022-12-06T05:30:46.0359535Z\",\"ServerId\":\"6ce185bd-dc46-492b-8b79-cf04d166cb17\",\"WorkerId\":\"9c5be166-b56b-4dba-9a02-edca32ed207d\"}'),
(131, 21, 'Succeeded', NULL, '2022-12-06 05:30:46.214557', '{\"SucceededAt\":\"2022-12-06T05:30:46.2016677Z\",\"PerformanceDuration\":\"120\",\"Latency\":\"2106\"}'),
(132, 22, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 05:31:00.213843', '{\"EnqueuedAt\":\"2022-12-06T05:31:00.1992019Z\",\"Queue\":\"default\"}'),
(133, 22, 'Processing', NULL, '2022-12-06 05:31:01.070371', '{\"StartedAt\":\"2022-12-06T05:31:01.0506420Z\",\"ServerId\":\"6ce185bd-dc46-492b-8b79-cf04d166cb17\",\"WorkerId\":\"1376ca4a-a51e-4609-bf66-de80195cdc67\"}'),
(134, 22, 'Succeeded', NULL, '2022-12-06 05:31:01.136851', '{\"SucceededAt\":\"2022-12-06T05:31:01.1171298Z\",\"PerformanceDuration\":\"21\",\"Latency\":\"958\"}'),
(135, 23, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 05:32:51.258034', '{\"EnqueuedAt\":\"2022-12-06T05:32:51.2570817Z\",\"Queue\":\"default\"}'),
(136, 24, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 05:33:00.057280', '{\"EnqueuedAt\":\"2022-12-06T05:33:00.0562135Z\",\"Queue\":\"default\"}'),
(137, 23, 'Processing', NULL, '2022-12-06 05:33:01.364478', '{\"StartedAt\":\"2022-12-06T05:33:01.3530339Z\",\"ServerId\":\"6ce185bd-dc46-492b-8b79-cf04d166cb17\",\"WorkerId\":\"cf3d4bd2-d33a-463a-a758-e5bd0de80572\"}'),
(138, 24, 'Processing', NULL, '2022-12-06 05:33:01.423977', '{\"StartedAt\":\"2022-12-06T05:33:01.4075739Z\",\"ServerId\":\"6ce185bd-dc46-492b-8b79-cf04d166cb17\",\"WorkerId\":\"1376ca4a-a51e-4609-bf66-de80195cdc67\"}'),
(139, 23, 'Succeeded', NULL, '2022-12-06 05:33:01.436656', '{\"SucceededAt\":\"2022-12-06T05:33:01.4162522Z\",\"PerformanceDuration\":\"32\",\"Latency\":\"10163\"}'),
(140, 24, 'Succeeded', NULL, '2022-12-06 05:33:01.483962', '{\"SucceededAt\":\"2022-12-06T05:33:01.4713564Z\",\"PerformanceDuration\":\"12\",\"Latency\":\"1447\"}'),
(141, 25, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 05:35:00.802677', '{\"EnqueuedAt\":\"2022-12-06T05:35:00.8023605Z\",\"Queue\":\"default\"}'),
(142, 25, 'Processing', NULL, '2022-12-06 05:35:01.607352', '{\"StartedAt\":\"2022-12-06T05:35:01.5995093Z\",\"ServerId\":\"6ce185bd-dc46-492b-8b79-cf04d166cb17\",\"WorkerId\":\"cf3d4bd2-d33a-463a-a758-e5bd0de80572\"}'),
(143, 25, 'Succeeded', NULL, '2022-12-06 05:35:01.652461', '{\"SucceededAt\":\"2022-12-06T05:35:01.6457267Z\",\"PerformanceDuration\":\"16\",\"Latency\":\"851\"}'),
(144, 26, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 10:55:20.304951', '{\"EnqueuedAt\":\"2022-12-06T10:55:20.1848375Z\",\"Queue\":\"default\"}'),
(145, 26, 'Processing', NULL, '2022-12-06 10:55:34.446384', '{\"StartedAt\":\"2022-12-06T10:55:34.3017907Z\",\"ServerId\":\"1c8376f3-3478-4b2c-b8fb-a209bb95e4d2\",\"WorkerId\":\"7e3df153-efc5-48cd-8d43-ffe09aee0427\"}'),
(146, 26, 'Succeeded', NULL, '2022-12-06 10:55:44.668920', '{\"SucceededAt\":\"2022-12-06T10:55:44.6455600Z\",\"PerformanceDuration\":\"10146\",\"Latency\":\"14407\"}'),
(147, 27, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 10:57:08.168825', '{\"EnqueuedAt\":\"2022-12-06T10:57:07.6457597Z\",\"Queue\":\"default\"}'),
(148, 27, 'Processing', NULL, '2022-12-06 10:57:19.239397', '{\"StartedAt\":\"2022-12-06T10:57:19.0981265Z\",\"ServerId\":\"8a1aaab9-4b07-4d5b-9530-ced45f57df27\",\"WorkerId\":\"13a7bc54-3ca4-4b28-b924-b940acaa8866\"}'),
(149, 27, 'Succeeded', NULL, '2022-12-06 10:57:43.225459', '{\"SucceededAt\":\"2022-12-06T10:57:42.7384620Z\",\"PerformanceDuration\":\"23384\",\"Latency\":\"11891\"}'),
(150, 28, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 10:59:02.350335', '{\"EnqueuedAt\":\"2022-12-06T10:59:02.1061087Z\",\"Queue\":\"default\"}'),
(151, 28, 'Processing', NULL, '2022-12-06 10:59:16.373051', '{\"StartedAt\":\"2022-12-06T10:59:15.8689822Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"309f5e5f-24cc-4419-8031-f5e1b10c60af\"}'),
(152, 28, 'Succeeded', NULL, '2022-12-06 10:59:49.706551', '{\"SucceededAt\":\"2022-12-06T10:59:49.1127585Z\",\"PerformanceDuration\":\"31890\",\"Latency\":\"15047\"}'),
(153, 29, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:07:08.205176', '{\"EnqueuedAt\":\"2022-12-06T11:07:08.2046732Z\",\"Queue\":\"default\"}'),
(154, 29, 'Processing', NULL, '2022-12-06 11:07:38.210598', '{\"StartedAt\":\"2022-12-06T11:07:38.2009021Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"84536d1d-aae1-4c17-92aa-c6f8267415b5\"}'),
(155, 29, 'Succeeded', NULL, '2022-12-06 11:07:38.248916', '{\"SucceededAt\":\"2022-12-06T11:07:38.2417835Z\",\"PerformanceDuration\":\"16\",\"Latency\":\"30052\"}'),
(156, 30, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:08:00.233764', '{\"EnqueuedAt\":\"2022-12-06T11:08:00.1152698Z\",\"Queue\":\"default\"}'),
(157, 30, 'Processing', NULL, '2022-12-06 11:08:08.274309', '{\"StartedAt\":\"2022-12-06T11:08:08.2646393Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"dae52bd5-3061-473f-a96a-f3170a1ead05\"}'),
(158, 30, 'Succeeded', NULL, '2022-12-06 11:08:08.331535', '{\"SucceededAt\":\"2022-12-06T11:08:08.3191003Z\",\"PerformanceDuration\":\"26\",\"Latency\":\"8255\"}'),
(159, 31, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:09:56.239193', '{\"EnqueuedAt\":\"2022-12-06T11:09:56.2388113Z\",\"Queue\":\"default\"}'),
(160, 32, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:10:00.071078', '{\"EnqueuedAt\":\"2022-12-06T11:10:00.0706024Z\",\"Queue\":\"default\"}'),
(161, 31, 'Processing', NULL, '2022-12-06 11:10:08.424771', '{\"StartedAt\":\"2022-12-06T11:10:08.4145423Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"84536d1d-aae1-4c17-92aa-c6f8267415b5\"}'),
(162, 32, 'Processing', NULL, '2022-12-06 11:10:08.429473', '{\"StartedAt\":\"2022-12-06T11:10:08.4192344Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"06fcb40d-0284-4b86-9b02-5a5cb75f3c0f\"}'),
(163, 31, 'Succeeded', NULL, '2022-12-06 11:10:08.473302', '{\"SucceededAt\":\"2022-12-06T11:10:08.4597558Z\",\"PerformanceDuration\":\"7\",\"Latency\":\"12236\"}'),
(164, 32, 'Succeeded', NULL, '2022-12-06 11:10:08.483918', '{\"SucceededAt\":\"2022-12-06T11:10:08.4666544Z\",\"PerformanceDuration\":\"8\",\"Latency\":\"8434\"}'),
(165, 33, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:12:00.820696', '{\"EnqueuedAt\":\"2022-12-06T11:12:00.8195850Z\",\"Queue\":\"default\"}'),
(166, 33, 'Processing', NULL, '2022-12-06 11:12:08.511041', '{\"StartedAt\":\"2022-12-06T11:12:08.4956264Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"fa6420e5-ee82-45db-b46d-c5e89fa81060\"}'),
(167, 33, 'Succeeded', NULL, '2022-12-06 11:12:08.571200', '{\"SucceededAt\":\"2022-12-06T11:12:08.5641326Z\",\"PerformanceDuration\":\"27\",\"Latency\":\"7748\"}'),
(168, 34, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:13:00.057718', '{\"EnqueuedAt\":\"2022-12-06T11:13:00.0562470Z\",\"Queue\":\"default\"}'),
(169, 34, 'Processing', NULL, '2022-12-06 11:13:08.579462', '{\"StartedAt\":\"2022-12-06T11:13:08.5633510Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"309f5e5f-24cc-4419-8031-f5e1b10c60af\"}'),
(170, 34, 'Succeeded', NULL, '2022-12-06 11:13:08.623578', '{\"SucceededAt\":\"2022-12-06T11:13:08.6144906Z\",\"PerformanceDuration\":\"7\",\"Latency\":\"8582\"}'),
(171, 35, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:14:10.456468', '{\"EnqueuedAt\":\"2022-12-06T11:14:10.4557649Z\",\"Queue\":\"default\"}'),
(172, 35, 'Processing', NULL, '2022-12-06 11:14:23.658131', '{\"StartedAt\":\"2022-12-06T11:14:23.6435388Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"dae52bd5-3061-473f-a96a-f3170a1ead05\"}'),
(173, 35, 'Succeeded', NULL, '2022-12-06 11:14:23.761850', '{\"SucceededAt\":\"2022-12-06T11:14:23.7432933Z\",\"PerformanceDuration\":\"28\",\"Latency\":\"13284\"}'),
(174, 36, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:15:00.052710', '{\"EnqueuedAt\":\"2022-12-06T11:15:00.0516945Z\",\"Queue\":\"default\"}'),
(175, 36, 'Processing', NULL, '2022-12-06 11:15:08.756177', '{\"StartedAt\":\"2022-12-06T11:15:08.7492387Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"84536d1d-aae1-4c17-92aa-c6f8267415b5\"}'),
(176, 36, 'Succeeded', NULL, '2022-12-06 11:15:08.785404', '{\"SucceededAt\":\"2022-12-06T11:15:08.7763928Z\",\"PerformanceDuration\":\"5\",\"Latency\":\"8752\"}'),
(177, 37, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:16:20.547270', '{\"EnqueuedAt\":\"2022-12-06T11:16:20.5461320Z\",\"Queue\":\"default\"}'),
(178, 37, 'Processing', NULL, '2022-12-06 11:16:23.821827', '{\"StartedAt\":\"2022-12-06T11:16:23.8077689Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"06fcb40d-0284-4b86-9b02-5a5cb75f3c0f\"}'),
(179, 37, 'Succeeded', NULL, '2022-12-06 11:16:23.875290', '{\"SucceededAt\":\"2022-12-06T11:16:23.8628141Z\",\"PerformanceDuration\":\"11\",\"Latency\":\"3333\"}'),
(180, 38, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:17:00.045035', '{\"EnqueuedAt\":\"2022-12-06T11:17:00.0439670Z\",\"Queue\":\"default\"}'),
(181, 38, 'Processing', NULL, '2022-12-06 11:17:08.882249', '{\"StartedAt\":\"2022-12-06T11:17:08.8759642Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"309f5e5f-24cc-4419-8031-f5e1b10c60af\"}'),
(182, 38, 'Succeeded', NULL, '2022-12-06 11:17:08.918315', '{\"SucceededAt\":\"2022-12-06T11:17:08.9105095Z\",\"PerformanceDuration\":\"5\",\"Latency\":\"8887\"}'),
(183, 39, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:18:25.618197', '{\"EnqueuedAt\":\"2022-12-06T11:18:25.6174249Z\",\"Queue\":\"default\"}'),
(184, 39, 'Processing', NULL, '2022-12-06 11:18:38.980070', '{\"StartedAt\":\"2022-12-06T11:18:38.9697765Z\",\"ServerId\":\"ee8a1907-5f0f-41f4-8eae-b819b18f4545\",\"WorkerId\":\"fa6420e5-ee82-45db-b46d-c5e89fa81060\"}'),
(185, 39, 'Succeeded', NULL, '2022-12-06 11:18:39.056627', '{\"SucceededAt\":\"2022-12-06T11:18:39.0440072Z\",\"PerformanceDuration\":\"9\",\"Latency\":\"13442\"}'),
(186, 40, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:36:47.539534', '{\"EnqueuedAt\":\"2022-12-06T11:36:47.3778884Z\",\"Queue\":\"default\"}'),
(187, 40, 'Processing', NULL, '2022-12-06 11:37:01.229916', '{\"StartedAt\":\"2022-12-06T11:37:01.1778983Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"9f8c1e10-1725-4d2e-bac8-cc2b2c2383a4\"}'),
(188, 40, 'Succeeded', NULL, '2022-12-06 11:37:20.166758', '{\"SucceededAt\":\"2022-12-06T11:37:20.0512422Z\",\"PerformanceDuration\":\"18790\",\"Latency\":\"13997\"}'),
(189, 41, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:37:39.107499', '{\"EnqueuedAt\":\"2022-12-06T11:37:39.0953022Z\",\"Queue\":\"default\"}'),
(190, 41, 'Processing', NULL, '2022-12-06 11:37:46.305688', '{\"StartedAt\":\"2022-12-06T11:37:46.2875644Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"152b3c8a-d54a-474a-8718-5852c2cf2168\"}'),
(191, 41, 'Succeeded', NULL, '2022-12-06 11:37:46.488956', '{\"SucceededAt\":\"2022-12-06T11:37:46.4423627Z\",\"PerformanceDuration\":\"99\",\"Latency\":\"7300\"}'),
(192, 42, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:38:00.547561', '{\"EnqueuedAt\":\"2022-12-06T11:38:00.5457781Z\",\"Queue\":\"default\"}'),
(193, 42, 'Processing', NULL, '2022-12-06 11:38:01.531347', '{\"StartedAt\":\"2022-12-06T11:38:01.5182721Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"db6177d3-faa6-404a-9005-93bf45d040ae\"}'),
(194, 42, 'Succeeded', NULL, '2022-12-06 11:38:01.663352', '{\"SucceededAt\":\"2022-12-06T11:38:01.6401825Z\",\"PerformanceDuration\":\"58\",\"Latency\":\"1156\"}'),
(195, 43, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:39:48.025247', '{\"EnqueuedAt\":\"2022-12-06T11:39:48.0246207Z\",\"Queue\":\"default\"}'),
(196, 43, 'Processing', NULL, '2022-12-06 11:39:49.559139', '{\"StartedAt\":\"2022-12-06T11:39:49.5503738Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"9f8c1e10-1725-4d2e-bac8-cc2b2c2383a4\"}'),
(197, 43, 'Succeeded', NULL, '2022-12-06 11:39:49.608159', '{\"SucceededAt\":\"2022-12-06T11:39:49.5910061Z\",\"PerformanceDuration\":\"7\",\"Latency\":\"1584\"}'),
(198, 44, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:40:00.096412', '{\"EnqueuedAt\":\"2022-12-06T11:40:00.0847879Z\",\"Queue\":\"default\"}'),
(199, 44, 'Processing', NULL, '2022-12-06 11:40:02.676674', '{\"StartedAt\":\"2022-12-06T11:40:02.6656821Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"4dd36b7d-ffc5-4465-bad9-868d845f4b5d\"}'),
(200, 44, 'Succeeded', NULL, '2022-12-06 11:40:02.722903', '{\"SucceededAt\":\"2022-12-06T11:40:02.7110703Z\",\"PerformanceDuration\":\"15\",\"Latency\":\"2666\"}'),
(201, 45, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:42:02.796428', '{\"EnqueuedAt\":\"2022-12-06T11:42:02.7958601Z\",\"Queue\":\"default\"}'),
(202, 46, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:42:02.858952', '{\"EnqueuedAt\":\"2022-12-06T11:42:02.8577158Z\",\"Queue\":\"default\"}'),
(203, 46, 'Processing', NULL, '2022-12-06 11:42:17.830727', '{\"StartedAt\":\"2022-12-06T11:42:17.8079859Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"3673fe5f-0c4a-4817-91ff-36dc875604af\"}'),
(204, 45, 'Processing', NULL, '2022-12-06 11:42:17.831183', '{\"StartedAt\":\"2022-12-06T11:42:17.7910732Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"152b3c8a-d54a-474a-8718-5852c2cf2168\"}'),
(205, 45, 'Succeeded', NULL, '2022-12-06 11:42:17.887045', '{\"SucceededAt\":\"2022-12-06T11:42:17.8772727Z\",\"PerformanceDuration\":\"10\",\"Latency\":\"23707\"}'),
(206, 46, 'Succeeded', NULL, '2022-12-06 11:42:17.888537', '{\"SucceededAt\":\"2022-12-06T11:42:17.8787456Z\",\"PerformanceDuration\":\"19\",\"Latency\":\"15025\"}'),
(207, 47, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:44:03.622790', '{\"EnqueuedAt\":\"2022-12-06T11:44:03.6219000Z\",\"Queue\":\"default\"}'),
(208, 47, 'Processing', NULL, '2022-12-06 11:44:17.912395', '{\"StartedAt\":\"2022-12-06T11:44:17.8995075Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"db6177d3-faa6-404a-9005-93bf45d040ae\"}'),
(209, 47, 'Succeeded', NULL, '2022-12-06 11:44:17.965908', '{\"SucceededAt\":\"2022-12-06T11:44:17.9507929Z\",\"PerformanceDuration\":\"9\",\"Latency\":\"14352\"}'),
(210, 48, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:45:00.182897', '{\"EnqueuedAt\":\"2022-12-06T11:45:00.1621495Z\",\"Queue\":\"default\"}'),
(211, 48, 'Processing', NULL, '2022-12-06 11:45:03.034200', '{\"StartedAt\":\"2022-12-06T11:45:03.0160677Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"4dd36b7d-ffc5-4465-bad9-868d845f4b5d\"}'),
(212, 48, 'Succeeded', NULL, '2022-12-06 11:45:03.240971', '{\"SucceededAt\":\"2022-12-06T11:45:03.1493307Z\",\"PerformanceDuration\":\"78\",\"Latency\":\"2969\"}'),
(213, 49, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:46:10.922574', '{\"EnqueuedAt\":\"2022-12-06T11:46:10.9212473Z\",\"Queue\":\"default\"}'),
(214, 49, 'Processing', NULL, '2022-12-06 11:46:18.306393', '{\"StartedAt\":\"2022-12-06T11:46:18.2885900Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"9f8c1e10-1725-4d2e-bac8-cc2b2c2383a4\"}'),
(215, 49, 'Succeeded', NULL, '2022-12-06 11:46:18.406038', '{\"SucceededAt\":\"2022-12-06T11:46:18.3726381Z\",\"PerformanceDuration\":\"31\",\"Latency\":\"7450\"}'),
(216, 50, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:47:00.107514', '{\"EnqueuedAt\":\"2022-12-06T11:47:00.1054441Z\",\"Queue\":\"default\"}'),
(217, 50, 'Processing', NULL, '2022-12-06 11:47:03.426337', '{\"StartedAt\":\"2022-12-06T11:47:03.4107417Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"db6177d3-faa6-404a-9005-93bf45d040ae\"}'),
(218, 50, 'Succeeded', NULL, '2022-12-06 11:47:03.526681', '{\"SucceededAt\":\"2022-12-06T11:47:03.4795872Z\",\"PerformanceDuration\":\"25\",\"Latency\":\"3407\"}'),
(219, 51, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:48:20.811210', '{\"EnqueuedAt\":\"2022-12-06T11:48:20.8086012Z\",\"Queue\":\"default\"}'),
(220, 51, 'Processing', NULL, '2022-12-06 11:48:33.705995', '{\"StartedAt\":\"2022-12-06T11:48:33.5939743Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"152b3c8a-d54a-474a-8718-5852c2cf2168\"}'),
(221, 51, 'Succeeded', NULL, '2022-12-06 11:48:33.955616', '{\"SucceededAt\":\"2022-12-06T11:48:33.8591458Z\",\"PerformanceDuration\":\"75\",\"Latency\":\"13018\"}'),
(222, 52, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:49:00.197069', '{\"EnqueuedAt\":\"2022-12-06T11:49:00.1943695Z\",\"Queue\":\"default\"}'),
(223, 52, 'Processing', NULL, '2022-12-06 11:49:03.703717', '{\"StartedAt\":\"2022-12-06T11:49:03.6634994Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"3673fe5f-0c4a-4817-91ff-36dc875604af\"}'),
(224, 52, 'Succeeded', NULL, '2022-12-06 11:49:03.775357', '{\"SucceededAt\":\"2022-12-06T11:49:03.7585332Z\",\"PerformanceDuration\":\"30\",\"Latency\":\"3594\"}'),
(225, 53, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:50:26.263854', '{\"EnqueuedAt\":\"2022-12-06T11:50:26.2515608Z\",\"Queue\":\"default\"}'),
(226, 53, 'Processing', NULL, '2022-12-06 11:50:34.169209', '{\"StartedAt\":\"2022-12-06T11:50:34.1437204Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"db6177d3-faa6-404a-9005-93bf45d040ae\"}'),
(227, 53, 'Succeeded', NULL, '2022-12-06 11:50:34.281985', '{\"SucceededAt\":\"2022-12-06T11:50:34.2559525Z\",\"PerformanceDuration\":\"47\",\"Latency\":\"8017\"}'),
(228, 54, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:51:00.225531', '{\"EnqueuedAt\":\"2022-12-06T11:51:00.2192515Z\",\"Queue\":\"default\"}'),
(229, 54, 'Processing', NULL, '2022-12-06 11:51:04.537046', '{\"StartedAt\":\"2022-12-06T11:51:04.5124523Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"4dd36b7d-ffc5-4465-bad9-868d845f4b5d\"}'),
(230, 54, 'Succeeded', NULL, '2022-12-06 11:51:04.906663', '{\"SucceededAt\":\"2022-12-06T11:51:04.7591749Z\",\"PerformanceDuration\":\"160\",\"Latency\":\"4535\"}'),
(231, 55, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:52:36.404384', '{\"EnqueuedAt\":\"2022-12-06T11:52:36.4005399Z\",\"Queue\":\"default\"}'),
(232, 55, 'Processing', NULL, '2022-12-06 11:52:49.676735', '{\"StartedAt\":\"2022-12-06T11:52:49.6544594Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"3673fe5f-0c4a-4817-91ff-36dc875604af\"}'),
(233, 55, 'Succeeded', NULL, '2022-12-06 11:52:49.767141', '{\"SucceededAt\":\"2022-12-06T11:52:49.7438931Z\",\"PerformanceDuration\":\"33\",\"Latency\":\"13349\"}'),
(234, 56, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:53:00.117589', '{\"EnqueuedAt\":\"2022-12-06T11:53:00.0796674Z\",\"Queue\":\"default\"}'),
(235, 56, 'Processing', NULL, '2022-12-06 11:53:04.968835', '{\"StartedAt\":\"2022-12-06T11:53:04.9325811Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"3673fe5f-0c4a-4817-91ff-36dc875604af\"}'),
(236, 56, 'Succeeded', NULL, '2022-12-06 11:53:05.510171', '{\"SucceededAt\":\"2022-12-06T11:53:05.2369489Z\",\"PerformanceDuration\":\"210\",\"Latency\":\"4988\"}'),
(237, 57, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:54:41.512502', '{\"EnqueuedAt\":\"2022-12-06T11:54:41.5092904Z\",\"Queue\":\"default\"}'),
(238, 57, 'Processing', NULL, '2022-12-06 11:54:50.489528', '{\"StartedAt\":\"2022-12-06T11:54:50.4691865Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"4dd36b7d-ffc5-4465-bad9-868d845f4b5d\"}'),
(239, 57, 'Succeeded', NULL, '2022-12-06 11:54:50.569814', '{\"SucceededAt\":\"2022-12-06T11:54:50.5536785Z\",\"PerformanceDuration\":\"30\",\"Latency\":\"9052\"}'),
(240, 58, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:55:00.320683', '{\"EnqueuedAt\":\"2022-12-06T11:55:00.3151764Z\",\"Queue\":\"default\"}'),
(241, 58, 'Processing', NULL, '2022-12-06 11:55:05.740160', '{\"StartedAt\":\"2022-12-06T11:55:05.7145286Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"4dd36b7d-ffc5-4465-bad9-868d845f4b5d\"}'),
(242, 58, 'Succeeded', NULL, '2022-12-06 11:55:05.983659', '{\"SucceededAt\":\"2022-12-06T11:55:05.8461564Z\",\"PerformanceDuration\":\"70\",\"Latency\":\"5531\"}'),
(243, 59, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:56:52.553676', '{\"EnqueuedAt\":\"2022-12-06T11:56:52.5521326Z\",\"Queue\":\"default\"}'),
(244, 60, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:57:00.316539', '{\"EnqueuedAt\":\"2022-12-06T11:57:00.3065231Z\",\"Queue\":\"default\"}'),
(245, 59, 'Processing', NULL, '2022-12-06 11:57:06.700218', '{\"StartedAt\":\"2022-12-06T11:57:06.6193391Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"9f8c1e10-1725-4d2e-bac8-cc2b2c2383a4\"}'),
(246, 60, 'Processing', NULL, '2022-12-06 11:57:06.709956', '{\"StartedAt\":\"2022-12-06T11:57:06.6262733Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"3673fe5f-0c4a-4817-91ff-36dc875604af\"}'),
(247, 60, 'Succeeded', NULL, '2022-12-06 11:57:07.187031', '{\"SucceededAt\":\"2022-12-06T11:57:07.0859819Z\",\"PerformanceDuration\":\"125\",\"Latency\":\"6709\"}'),
(248, 59, 'Succeeded', NULL, '2022-12-06 11:57:07.188749', '{\"SucceededAt\":\"2022-12-06T11:57:06.9606473Z\",\"PerformanceDuration\":\"174\",\"Latency\":\"14282\"}'),
(249, 61, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:58:56.511336', '{\"EnqueuedAt\":\"2022-12-06T11:58:56.5103682Z\",\"Queue\":\"default\"}'),
(250, 62, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 11:59:00.034675', '{\"EnqueuedAt\":\"2022-12-06T11:59:00.0342386Z\",\"Queue\":\"default\"}'),
(251, 61, 'Processing', NULL, '2022-12-06 11:59:06.827011', '{\"StartedAt\":\"2022-12-06T11:59:06.8204223Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"152b3c8a-d54a-474a-8718-5852c2cf2168\"}'),
(252, 61, 'Succeeded', NULL, '2022-12-06 11:59:06.870669', '{\"SucceededAt\":\"2022-12-06T11:59:06.8591154Z\",\"PerformanceDuration\":\"7\",\"Latency\":\"10366\"}'),
(253, 62, 'Processing', NULL, '2022-12-06 11:59:06.913456', '{\"StartedAt\":\"2022-12-06T11:59:06.9054537Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"152b3c8a-d54a-474a-8718-5852c2cf2168\"}'),
(254, 62, 'Succeeded', NULL, '2022-12-06 11:59:06.954020', '{\"SucceededAt\":\"2022-12-06T11:59:06.9387985Z\",\"PerformanceDuration\":\"8\",\"Latency\":\"6922\"}'),
(255, 63, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:01:05.828412', '{\"EnqueuedAt\":\"2022-12-06T12:01:05.8276252Z\",\"Queue\":\"default\"}'),
(256, 63, 'Processing', NULL, '2022-12-06 12:01:07.070613', '{\"StartedAt\":\"2022-12-06T12:01:07.0575492Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"152b3c8a-d54a-474a-8718-5852c2cf2168\"}'),
(257, 63, 'Succeeded', NULL, '2022-12-06 12:01:07.123043', '{\"SucceededAt\":\"2022-12-06T12:01:07.1117279Z\",\"PerformanceDuration\":\"12\",\"Latency\":\"1302\"}'),
(258, 64, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:02:00.511882', '{\"EnqueuedAt\":\"2022-12-06T12:02:00.4734709Z\",\"Queue\":\"default\"}'),
(259, 64, 'Processing', NULL, '2022-12-06 12:02:07.703381', '{\"StartedAt\":\"2022-12-06T12:02:07.3885629Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"4dd36b7d-ffc5-4465-bad9-868d845f4b5d\"}'),
(260, 64, 'Succeeded', NULL, '2022-12-06 12:02:08.458932', '{\"SucceededAt\":\"2022-12-06T12:02:08.0544024Z\",\"PerformanceDuration\":\"278\",\"Latency\":\"7485\"}'),
(261, 65, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:03:12.237240', '{\"EnqueuedAt\":\"2022-12-06T12:03:12.2364135Z\",\"Queue\":\"default\"}'),
(262, 65, 'Processing', NULL, '2022-12-06 12:03:22.775645', '{\"StartedAt\":\"2022-12-06T12:03:22.7593372Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"152b3c8a-d54a-474a-8718-5852c2cf2168\"}'),
(263, 65, 'Succeeded', NULL, '2022-12-06 12:03:22.857585', '{\"SucceededAt\":\"2022-12-06T12:03:22.8314593Z\",\"PerformanceDuration\":\"17\",\"Latency\":\"10612\"}'),
(264, 66, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:04:00.066072', '{\"EnqueuedAt\":\"2022-12-06T12:04:00.0635618Z\",\"Queue\":\"default\"}'),
(265, 66, 'Processing', NULL, '2022-12-06 12:04:07.982983', '{\"StartedAt\":\"2022-12-06T12:04:07.9749048Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"152b3c8a-d54a-474a-8718-5852c2cf2168\"}'),
(266, 66, 'Succeeded', NULL, '2022-12-06 12:04:08.034883', '{\"SucceededAt\":\"2022-12-06T12:04:08.0208544Z\",\"PerformanceDuration\":\"19\",\"Latency\":\"7982\"}'),
(267, 67, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:05:20.684100', '{\"EnqueuedAt\":\"2022-12-06T12:05:20.6830040Z\",\"Queue\":\"default\"}'),
(268, 67, 'Processing', NULL, '2022-12-06 12:05:23.123476', '{\"StartedAt\":\"2022-12-06T12:05:23.0777270Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"9f8c1e10-1725-4d2e-bac8-cc2b2c2383a4\"}'),
(269, 67, 'Succeeded', NULL, '2022-12-06 12:05:23.195084', '{\"SucceededAt\":\"2022-12-06T12:05:23.1837259Z\",\"PerformanceDuration\":\"14\",\"Latency\":\"2515\"}'),
(270, 68, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:06:00.126294', '{\"EnqueuedAt\":\"2022-12-06T12:06:00.1126365Z\",\"Queue\":\"default\"}'),
(271, 68, 'Processing', NULL, '2022-12-06 12:06:08.184558', '{\"StartedAt\":\"2022-12-06T12:06:08.1694535Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"db6177d3-faa6-404a-9005-93bf45d040ae\"}'),
(272, 68, 'Succeeded', NULL, '2022-12-06 12:06:08.256275', '{\"SucceededAt\":\"2022-12-06T12:06:08.2410800Z\",\"PerformanceDuration\":\"26\",\"Latency\":\"8183\"}'),
(273, 69, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:07:30.679131', '{\"EnqueuedAt\":\"2022-12-06T12:07:30.6776298Z\",\"Queue\":\"default\"}'),
(274, 69, 'Processing', NULL, '2022-12-06 12:07:38.344890', '{\"StartedAt\":\"2022-12-06T12:07:38.3272409Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"152b3c8a-d54a-474a-8718-5852c2cf2168\"}'),
(275, 69, 'Succeeded', NULL, '2022-12-06 12:07:38.417559', '{\"SucceededAt\":\"2022-12-06T12:07:38.4009976Z\",\"PerformanceDuration\":\"21\",\"Latency\":\"7731\"}'),
(276, 70, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:08:00.070563', '{\"EnqueuedAt\":\"2022-12-06T12:08:00.0663373Z\",\"Queue\":\"default\"}'),
(277, 70, 'Processing', NULL, '2022-12-06 12:08:08.448175', '{\"StartedAt\":\"2022-12-06T12:08:08.4379205Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"9f8c1e10-1725-4d2e-bac8-cc2b2c2383a4\"}'),
(278, 70, 'Succeeded', NULL, '2022-12-06 12:08:08.498553', '{\"SucceededAt\":\"2022-12-06T12:08:08.4836084Z\",\"PerformanceDuration\":\"16\",\"Latency\":\"8436\"}'),
(279, 71, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:09:40.798596', '{\"EnqueuedAt\":\"2022-12-06T12:09:40.7977190Z\",\"Queue\":\"default\"}'),
(280, 71, 'Processing', NULL, '2022-12-06 12:09:53.581766', '{\"StartedAt\":\"2022-12-06T12:09:53.5628812Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"db6177d3-faa6-404a-9005-93bf45d040ae\"}'),
(281, 71, 'Succeeded', NULL, '2022-12-06 12:09:53.654453', '{\"SucceededAt\":\"2022-12-06T12:09:53.6371116Z\",\"PerformanceDuration\":\"17\",\"Latency\":\"12853\"}'),
(282, 72, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:10:00.047656', '{\"EnqueuedAt\":\"2022-12-06T12:10:00.0469991Z\",\"Queue\":\"default\"}'),
(283, 72, 'Processing', NULL, '2022-12-06 12:10:08.655109', '{\"StartedAt\":\"2022-12-06T12:10:08.6480964Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"152b3c8a-d54a-474a-8718-5852c2cf2168\"}'),
(284, 72, 'Succeeded', NULL, '2022-12-06 12:10:08.695613', '{\"SucceededAt\":\"2022-12-06T12:10:08.6877407Z\",\"PerformanceDuration\":\"4\",\"Latency\":\"8673\"}'),
(285, 73, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:11:45.669774', '{\"EnqueuedAt\":\"2022-12-06T12:11:45.6694747Z\",\"Queue\":\"default\"}'),
(286, 73, 'Processing', NULL, '2022-12-06 12:11:53.807273', '{\"StartedAt\":\"2022-12-06T12:11:53.7769531Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"9f8c1e10-1725-4d2e-bac8-cc2b2c2383a4\"}'),
(287, 73, 'Succeeded', NULL, '2022-12-06 12:11:53.851713', '{\"SucceededAt\":\"2022-12-06T12:11:53.8455358Z\",\"PerformanceDuration\":\"11\",\"Latency\":\"8186\"}'),
(288, 74, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 12:12:00.071718', '{\"EnqueuedAt\":\"2022-12-06T12:12:00.0709895Z\",\"Queue\":\"default\"}'),
(289, 74, 'Processing', NULL, '2022-12-06 12:12:08.836945', '{\"StartedAt\":\"2022-12-06T12:12:08.8212435Z\",\"ServerId\":\"c98fd7e7-15b0-478f-8fa0-c09248c04ef0\",\"WorkerId\":\"db6177d3-faa6-404a-9005-93bf45d040ae\"}'),
(290, 74, 'Succeeded', NULL, '2022-12-06 12:12:08.870135', '{\"SucceededAt\":\"2022-12-06T12:12:08.8618110Z\",\"PerformanceDuration\":\"8\",\"Latency\":\"8822\"}'),
(291, 75, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:30:22.242590', '{\"EnqueuedAt\":\"2022-12-06T13:30:22.1141072Z\",\"Queue\":\"default\"}'),
(292, 75, 'Processing', NULL, '2022-12-06 13:30:36.440770', '{\"StartedAt\":\"2022-12-06T13:30:36.3961826Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"5bb07f53-4987-4aa9-ba80-0dbf838bbda6\"}'),
(293, 76, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:31:01.960716', '{\"EnqueuedAt\":\"2022-12-06T13:31:01.8931775Z\",\"Queue\":\"default\"}'),
(294, 76, 'Processing', NULL, '2022-12-06 13:31:06.459641', '{\"StartedAt\":\"2022-12-06T13:31:06.4495208Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"c4c90a34-01b8-4fb8-9fc6-64dc8136660c\"}'),
(295, 75, 'Succeeded', NULL, '2022-12-06 13:31:06.776477', '{\"SucceededAt\":\"2022-12-06T13:31:06.7076845Z\",\"PerformanceDuration\":\"30239\",\"Latency\":\"14482\"}'),
(296, 76, 'Succeeded', NULL, '2022-12-06 13:31:06.785305', '{\"SucceededAt\":\"2022-12-06T13:31:06.7076927Z\",\"PerformanceDuration\":\"213\",\"Latency\":\"4952\"}'),
(297, 77, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:32:48.505297', '{\"EnqueuedAt\":\"2022-12-06T13:32:48.5043331Z\",\"Queue\":\"default\"}'),
(298, 77, 'Processing', NULL, '2022-12-06 13:32:51.592456', '{\"StartedAt\":\"2022-12-06T13:32:51.5769957Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"8f25a88a-c076-41df-8d6b-f025e031986a\"}'),
(299, 77, 'Succeeded', NULL, '2022-12-06 13:32:51.685795', '{\"SucceededAt\":\"2022-12-06T13:32:51.6621108Z\",\"PerformanceDuration\":\"16\",\"Latency\":\"3169\"}'),
(300, 78, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:33:00.053384', '{\"EnqueuedAt\":\"2022-12-06T13:33:00.0529452Z\",\"Queue\":\"default\"}'),
(301, 78, 'Processing', NULL, '2022-12-06 13:33:06.617822', '{\"StartedAt\":\"2022-12-06T13:33:06.6071595Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"5ef5a680-c888-4e2e-a698-82412145a90d\"}'),
(302, 78, 'Succeeded', NULL, '2022-12-06 13:33:06.663866', '{\"SucceededAt\":\"2022-12-06T13:33:06.6539003Z\",\"PerformanceDuration\":\"11\",\"Latency\":\"6617\"}'),
(303, 79, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:35:00.756250', '{\"EnqueuedAt\":\"2022-12-06T13:35:00.7551123Z\",\"Queue\":\"default\"}'),
(304, 79, 'Processing', NULL, '2022-12-06 13:35:06.704906', '{\"StartedAt\":\"2022-12-06T13:35:06.6925397Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"0daa0421-f0dd-42cd-88cd-6f224d5e4bee\"}'),
(305, 79, 'Succeeded', NULL, '2022-12-06 13:35:06.766781', '{\"SucceededAt\":\"2022-12-06T13:35:06.7530245Z\",\"PerformanceDuration\":\"18\",\"Latency\":\"6011\"}'),
(306, 80, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:36:00.047929', '{\"EnqueuedAt\":\"2022-12-06T13:36:00.0472767Z\",\"Queue\":\"default\"}'),
(307, 80, 'Processing', NULL, '2022-12-06 13:36:06.808102', '{\"StartedAt\":\"2022-12-06T13:36:06.8009417Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"5ef5a680-c888-4e2e-a698-82412145a90d\"}'),
(308, 80, 'Succeeded', NULL, '2022-12-06 13:36:06.848904', '{\"SucceededAt\":\"2022-12-06T13:36:06.8367084Z\",\"PerformanceDuration\":\"12\",\"Latency\":\"6803\"}'),
(309, 81, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:37:05.414269', '{\"EnqueuedAt\":\"2022-12-06T13:37:05.4137970Z\",\"Queue\":\"default\"}'),
(310, 81, 'Processing', NULL, '2022-12-06 13:37:06.914722', '{\"StartedAt\":\"2022-12-06T13:37:06.9043556Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"0daa0421-f0dd-42cd-88cd-6f224d5e4bee\"}'),
(311, 81, 'Succeeded', NULL, '2022-12-06 13:37:06.959922', '{\"SucceededAt\":\"2022-12-06T13:37:06.9454596Z\",\"PerformanceDuration\":\"7\",\"Latency\":\"1545\"}'),
(312, 82, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:38:00.049787', '{\"EnqueuedAt\":\"2022-12-06T13:38:00.0481769Z\",\"Queue\":\"default\"}'),
(313, 82, 'Processing', NULL, '2022-12-06 13:38:07.052321', '{\"StartedAt\":\"2022-12-06T13:38:07.0419951Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"5ef5a680-c888-4e2e-a698-82412145a90d\"}'),
(314, 82, 'Succeeded', NULL, '2022-12-06 13:38:07.119173', '{\"SucceededAt\":\"2022-12-06T13:38:07.0966331Z\",\"PerformanceDuration\":\"21\",\"Latency\":\"7063\"}'),
(315, 83, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:39:15.511801', '{\"EnqueuedAt\":\"2022-12-06T13:39:15.5113631Z\",\"Queue\":\"default\"}'),
(316, 83, 'Processing', NULL, '2022-12-06 13:39:22.126780', '{\"StartedAt\":\"2022-12-06T13:39:22.1109103Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"8f25a88a-c076-41df-8d6b-f025e031986a\"}'),
(317, 83, 'Succeeded', NULL, '2022-12-06 13:39:22.179281', '{\"SucceededAt\":\"2022-12-06T13:39:22.1690288Z\",\"PerformanceDuration\":\"13\",\"Latency\":\"6667\"}'),
(318, 84, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:40:00.048372', '{\"EnqueuedAt\":\"2022-12-06T13:40:00.0477790Z\",\"Queue\":\"default\"}'),
(319, 84, 'Processing', NULL, '2022-12-06 13:40:07.231691', '{\"StartedAt\":\"2022-12-06T13:40:07.2193229Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"0daa0421-f0dd-42cd-88cd-6f224d5e4bee\"}'),
(320, 84, 'Succeeded', NULL, '2022-12-06 13:40:07.277796', '{\"SucceededAt\":\"2022-12-06T13:40:07.2646561Z\",\"PerformanceDuration\":\"13\",\"Latency\":\"7231\"}'),
(321, 85, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:41:20.517105', '{\"EnqueuedAt\":\"2022-12-06T13:41:20.5160024Z\",\"Queue\":\"default\"}'),
(322, 85, 'Processing', NULL, '2022-12-06 13:41:22.343837', '{\"StartedAt\":\"2022-12-06T13:41:22.3319930Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"5bb07f53-4987-4aa9-ba80-0dbf838bbda6\"}'),
(323, 85, 'Succeeded', NULL, '2022-12-06 13:41:22.396395', '{\"SucceededAt\":\"2022-12-06T13:41:22.3822621Z\",\"PerformanceDuration\":\"14\",\"Latency\":\"1876\"}'),
(324, 86, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:42:00.047953', '{\"EnqueuedAt\":\"2022-12-06T13:42:00.0473037Z\",\"Queue\":\"default\"}'),
(325, 86, 'Processing', NULL, '2022-12-06 13:42:07.392894', '{\"StartedAt\":\"2022-12-06T13:42:07.3838359Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"8f25a88a-c076-41df-8d6b-f025e031986a\"}'),
(326, 86, 'Succeeded', NULL, '2022-12-06 13:42:07.445333', '{\"SucceededAt\":\"2022-12-06T13:42:07.4282679Z\",\"PerformanceDuration\":\"6\",\"Latency\":\"7399\"}'),
(327, 87, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:43:30.601293', '{\"EnqueuedAt\":\"2022-12-06T13:43:30.6003756Z\",\"Queue\":\"default\"}'),
(328, 87, 'Processing', NULL, '2022-12-06 13:43:37.481115', '{\"StartedAt\":\"2022-12-06T13:43:37.4683578Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"5ef5a680-c888-4e2e-a698-82412145a90d\"}'),
(329, 87, 'Succeeded', NULL, '2022-12-06 13:43:37.542363', '{\"SucceededAt\":\"2022-12-06T13:43:37.5281867Z\",\"PerformanceDuration\":\"11\",\"Latency\":\"6955\"}'),
(330, 88, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:44:00.064141', '{\"EnqueuedAt\":\"2022-12-06T13:44:00.0637856Z\",\"Queue\":\"default\"}'),
(331, 88, 'Processing', NULL, '2022-12-06 13:44:07.521225', '{\"StartedAt\":\"2022-12-06T13:44:07.5127833Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"c4c90a34-01b8-4fb8-9fc6-64dc8136660c\"}'),
(332, 88, 'Succeeded', NULL, '2022-12-06 13:44:07.564967', '{\"SucceededAt\":\"2022-12-06T13:44:07.5551941Z\",\"PerformanceDuration\":\"7\",\"Latency\":\"7510\"}'),
(333, 89, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:45:40.629214', '{\"EnqueuedAt\":\"2022-12-06T13:45:40.6282284Z\",\"Queue\":\"default\"}'),
(334, 89, 'Processing', NULL, '2022-12-06 13:45:52.606967', '{\"StartedAt\":\"2022-12-06T13:45:52.5940852Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"0daa0421-f0dd-42cd-88cd-6f224d5e4bee\"}'),
(335, 89, 'Succeeded', NULL, '2022-12-06 13:45:52.660826', '{\"SucceededAt\":\"2022-12-06T13:45:52.6509681Z\",\"PerformanceDuration\":\"11\",\"Latency\":\"12042\"}'),
(336, 90, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-06 13:46:00.042899', '{\"EnqueuedAt\":\"2022-12-06T13:46:00.0424069Z\",\"Queue\":\"default\"}'),
(337, 90, 'Processing', NULL, '2022-12-06 13:46:07.674653', '{\"StartedAt\":\"2022-12-06T13:46:07.6680239Z\",\"ServerId\":\"4e43da59-b437-46ce-91fb-be49915c3949\",\"WorkerId\":\"5bb07f53-4987-4aa9-ba80-0dbf838bbda6\"}'),
(338, 90, 'Succeeded', NULL, '2022-12-06 13:46:07.703737', '{\"SucceededAt\":\"2022-12-06T13:46:07.6950811Z\",\"PerformanceDuration\":\"5\",\"Latency\":\"7682\"}');

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
(1, 'Minh Chánh', 'am.chanh16111@gmail.com', '$2a$11$UDSTRqYQrUZ/kixA7dZGR.XpPBGt/bcHVQoeCgZgqNP7WVzEIR8oy', 1, NULL, 1, '2022-11-25 10:57:43.571082', 1, 'https://localhost:7069/https://localhost:7069/', NULL),
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
('20221205064310_CreateOperationDetail1', '6.0.11'),
('20221206045025_DeletePositionGoogleAccount', '6.0.11');

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `jobparameter`
--
ALTER TABLE `jobparameter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `jobqueue`
--
ALTER TABLE `jobqueue`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `operation_detail`
--
ALTER TABLE `operation_detail`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31442;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

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
