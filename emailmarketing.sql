-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2022 at 05:02 PM
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
(1, 'stats:succeeded', 112, NULL),
(2, 'stats:succeeded:2022-12-03', 2, '2023-01-03 14:06:50'),
(5, 'stats:succeeded:2022-12-05', 13, '2023-01-05 13:22:06'),
(15, 'stats:succeeded:2022-12-06', 75, '2023-01-06 13:46:07'),
(39, 'stats:succeeded:2022-12-08', 22, '2023-01-08 14:35:06'),
(40, 'stats:succeeded:2022-12-08-13', 6, '2022-12-09 13:38:15'),
(43, 'stats:succeeded:2022-12-08-14', 16, '2022-12-09 14:35:06');

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
(337, 'stats:succeeded:2022-12-08', 1, '2023-01-08 15:07:20'),
(338, 'stats:succeeded:2022-12-08-15', 1, '2022-12-09 15:07:20'),
(339, 'stats:succeeded', 1, NULL);

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
(9, 'recurring-job:updateuse', 'LastJobId', '19', NULL);

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
(91, 344, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 13:32:36.620115', '2022-12-09 13:33:07.901189'),
(92, 343, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 13:33:00.193695', '2022-12-09 13:33:07.897520'),
(93, 347, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 13:35:24.281253', '2022-12-09 13:35:39.419170'),
(94, 350, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 13:36:00.072777', '2022-12-09 13:36:57.323235'),
(95, 353, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 13:37:41.270320', '2022-12-09 13:38:15.636892'),
(96, 356, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 13:38:15.601995', '2022-12-09 13:38:15.808293'),
(97, 359, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:12:48.331362', '2022-12-09 14:13:20.122466'),
(98, 362, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:13:20.554021', '2022-12-09 14:13:34.028147'),
(99, 365, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:14:00.045706', '2022-12-09 14:14:03.517525'),
(100, 368, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:15:28.624342', '2022-12-09 14:15:38.709725'),
(101, 371, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:16:00.029215', '2022-12-09 14:16:09.174685'),
(102, 374, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:18:49.838577', '2022-12-09 14:19:23.937315'),
(103, 377, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:19:46.648773', '2022-12-09 14:19:48.857803'),
(104, 380, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:20:00.021509', '2022-12-09 14:20:03.882882'),
(105, 385, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:21:55.725020', '2022-12-09 14:22:04.071713'),
(106, 386, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:22:00.007668', '2022-12-09 14:22:04.099507'),
(107, 390, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:25:04.471227', '2022-12-09 14:31:55.964950'),
(108, 392, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:31:50.197095', '2022-12-09 14:31:56.093010'),
(109, 395, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:32:40.342545', '2022-12-09 14:32:44.892227'),
(110, 398, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:33:04.941754', '2022-12-09 14:33:35.366465'),
(111, 412, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"18\\\"]\"}', '[\"18\"]', '2022-12-08 14:33:35.387945', '2022-12-09 15:07:20.643539'),
(112, 406, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:34:44.709097', '2022-12-09 14:35:06.086683'),
(113, 407, 'Succeeded', '{\"Type\":\"EmailMarketing.Modules.Projects.Services.ProjectServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"UpdateUsedDaily\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"3\\\"]\"}', '[\"3\"]', '2022-12-08 14:35:00.019039', '2022-12-09 14:35:06.091733'),
(114, 410, 'Processing', '{\"Type\":\"EmailMarketing.Modules.Operations.Services.OperationServices, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.Int32, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"19\\\"]\"}', '[\"19\"]', '2022-12-08 14:53:16.332337', NULL);

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
(338, 91, 'RecurringJobId', '\"updateuseminute\"'),
(339, 91, 'Time', '1670506355'),
(340, 91, 'CurrentCulture', '\"en-US\"'),
(341, 91, 'CurrentUICulture', '\"en-US\"'),
(342, 92, 'RecurringJobId', '\"updateuseminute\"'),
(343, 92, 'Time', '1670506380'),
(344, 92, 'CurrentCulture', '\"en-US\"'),
(345, 92, 'CurrentUICulture', '\"en-US\"'),
(346, 93, 'RecurringJobId', '\"updateuseminute\"'),
(347, 93, 'Time', '1670506524'),
(348, 93, 'CurrentCulture', '\"en-US\"'),
(349, 93, 'CurrentUICulture', '\"en-US\"'),
(350, 94, 'RecurringJobId', '\"updateuseminute\"'),
(351, 94, 'Time', '1670506560'),
(352, 94, 'CurrentCulture', '\"en-US\"'),
(353, 94, 'CurrentUICulture', '\"en-US\"'),
(354, 95, 'RecurringJobId', '\"updateuseminute\"'),
(355, 95, 'Time', '1670506627'),
(356, 95, 'CurrentCulture', '\"en-US\"'),
(357, 95, 'CurrentUICulture', '\"en-US\"'),
(358, 96, 'RecurringJobId', '\"updateuseminute\"'),
(359, 96, 'Time', '1670506695'),
(360, 96, 'CurrentCulture', '\"en-US\"'),
(361, 96, 'CurrentUICulture', '\"en-US\"'),
(362, 97, 'RecurringJobId', '\"updateuseminute\"'),
(363, 97, 'Time', '1670508767'),
(364, 97, 'CurrentCulture', '\"en-US\"'),
(365, 97, 'CurrentUICulture', '\"en-US\"'),
(366, 98, 'RecurringJobId', '\"updateuseminute\"'),
(367, 98, 'Time', '1670508800'),
(368, 98, 'CurrentCulture', '\"en-US\"'),
(369, 98, 'CurrentUICulture', '\"en-US\"'),
(370, 99, 'RecurringJobId', '\"updateuseminute\"'),
(371, 99, 'Time', '1670508840'),
(372, 99, 'CurrentCulture', '\"en-US\"'),
(373, 99, 'CurrentUICulture', '\"en-US\"'),
(374, 100, 'RecurringJobId', '\"updateuseminute\"'),
(375, 100, 'Time', '1670508928'),
(376, 100, 'CurrentCulture', '\"en-US\"'),
(377, 100, 'CurrentUICulture', '\"en-US\"'),
(378, 101, 'RecurringJobId', '\"updateuseminute\"'),
(379, 101, 'Time', '1670508960'),
(380, 101, 'CurrentCulture', '\"en-US\"'),
(381, 101, 'CurrentUICulture', '\"en-US\"'),
(382, 102, 'RecurringJobId', '\"updateuseminute\"'),
(383, 102, 'Time', '1670509128'),
(384, 102, 'CurrentCulture', '\"en-US\"'),
(385, 102, 'CurrentUICulture', '\"en-US\"'),
(386, 103, 'RecurringJobId', '\"updateuseminute\"'),
(387, 103, 'Time', '1670509186'),
(388, 103, 'CurrentCulture', '\"en-US\"'),
(389, 103, 'CurrentUICulture', '\"en-US\"'),
(390, 104, 'RecurringJobId', '\"updateuseminute\"'),
(391, 104, 'Time', '1670509200'),
(392, 104, 'CurrentCulture', '\"en-US\"'),
(393, 104, 'CurrentUICulture', '\"en-US\"'),
(394, 105, 'RecurringJobId', '\"updateuseminute\"'),
(395, 105, 'Time', '1670509315'),
(396, 105, 'CurrentCulture', '\"en-US\"'),
(397, 105, 'CurrentUICulture', '\"en-US\"'),
(398, 106, 'RecurringJobId', '\"updateuseminute\"'),
(399, 106, 'Time', '1670509320'),
(400, 106, 'CurrentCulture', '\"en-US\"'),
(401, 106, 'CurrentUICulture', '\"en-US\"'),
(402, 107, 'RecurringJobId', '\"updateuseminute\"'),
(403, 107, 'Time', '1670509504'),
(404, 107, 'CurrentCulture', '\"en-US\"'),
(405, 107, 'CurrentUICulture', '\"en-US\"'),
(406, 108, 'RecurringJobId', '\"updateuseminute\"'),
(407, 108, 'Time', '1670509909'),
(408, 108, 'CurrentCulture', '\"en-US\"'),
(409, 108, 'CurrentUICulture', '\"en-US\"'),
(410, 109, 'RecurringJobId', '\"updateuseminute\"'),
(411, 109, 'Time', '1670509958'),
(412, 109, 'CurrentCulture', '\"en-US\"'),
(413, 109, 'CurrentUICulture', '\"en-US\"'),
(414, 110, 'RecurringJobId', '\"updateuseminute\"'),
(415, 110, 'Time', '1670509984'),
(416, 110, 'CurrentCulture', '\"en-US\"'),
(417, 110, 'CurrentUICulture', '\"en-US\"'),
(418, 111, 'CurrentCulture', '\"en-US\"'),
(419, 111, 'CurrentUICulture', '\"en-US\"'),
(420, 112, 'RecurringJobId', '\"updateuseminute\"'),
(421, 112, 'Time', '1670510084'),
(422, 112, 'CurrentCulture', '\"en-US\"'),
(423, 112, 'CurrentUICulture', '\"en-US\"'),
(424, 113, 'RecurringJobId', '\"updateuseminute\"'),
(425, 113, 'Time', '1670510100'),
(426, 113, 'CurrentCulture', '\"en-US\"'),
(427, 113, 'CurrentUICulture', '\"en-US\"'),
(428, 114, 'CurrentCulture', '\"en-US\"'),
(429, 114, 'CurrentUICulture', '\"en-US\"');

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
(127, 114, '2022-12-08 14:53:23.000000', 'default', '37fec09d-b4f4-43bf-9adf-3307e7c31f8f');

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
  `Status` tinyint(4) NOT NULL,
  `FileContent` text DEFAULT NULL,
  `FileName` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`Id`, `ProjectId`, `Name`, `GoogleAccountId`, `Subject`, `GroupContactId`, `Content`, `DateSend`, `CreatedDate`, `UserId`, `Status`, `FileContent`, `FileName`) VALUES
(3, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 09:50:00.000000', '2022-12-05 09:55:35.947090', 3, 3, NULL, NULL),
(4, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 13:36:00.000000', '2022-12-05 13:44:17.583486', 3, 3, NULL, NULL),
(5, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 13:36:00.000000', '2022-12-05 13:45:48.305765', 3, 3, NULL, NULL),
(6, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 13:36:00.000000', '2022-12-05 13:53:52.629300', 3, 1, NULL, NULL),
(7, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 13:36:00.000000', '2022-12-05 13:58:26.414803', 3, 1, NULL, NULL),
(8, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:10:35.095300', 3, 1, NULL, NULL),
(9, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:14:30.052871', 3, 1, NULL, NULL),
(10, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:16:01.874609', 3, 1, NULL, NULL),
(11, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:16:56.532643', 3, 1, NULL, NULL),
(12, 1, 'Chanh', 3, 'Chanh', 2, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:18:39.558759', 3, 1, NULL, NULL),
(13, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:21:46.200062', 3, 1, NULL, NULL),
(14, 1, 'Chanh', 3, 'Chanh', 1, 'Chanh', '2022-12-05 07:08:49.519000', '2022-12-05 14:24:27.127215', 3, 1, NULL, NULL),
(15, 1, 'Chanh', 3, 'Chanh', 1, 'Dear [gender] chao [name]', '2022-12-05 13:08:49.765000', '2022-12-05 20:12:39.825848', 3, 1, NULL, NULL),
(16, 1, 'Chanh', 3, 'Chanh', 1, 'Dear [gender] chao [name]', '2022-12-05 13:08:49.765000', '2022-12-05 20:16:06.906585', 3, 1, NULL, NULL),
(17, 1, 'Chanh', 3, 'Chanh', 1, 'Dear [gender] chao [name]', '2022-12-05 13:08:49.765000', '2022-12-05 20:34:04.651268', 3, 1, NULL, NULL),
(18, 1, 'SendFie', 3, 'Gửi File', 1, 'Minh Chánh gửi file', '2022-12-08 21:25:00.000000', '2022-12-08 21:32:40.378865', 3, 1, 'FileContents/638061067626112353ChữKí.png', 'ChữKí.png'),
(19, 1, 'SendFie', 3, 'Gửi File', 1, 'Minh Chánh gửi file', '2022-12-08 21:25:00.000000', '2022-12-08 21:53:15.981844', 3, 3, 'FileContents/638061079959836590key-metamask.txt', 'key-metamask.txt');

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
(25, 17, 7, 1, 'Complete'),
(26, 18, 2, 1, 'Complete'),
(27, 18, 7, 1, 'Complete'),
(28, 19, 2, 3, 'Processing'),
(29, 19, 7, 3, 'Processing');

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
(1, 'VietJet Booking Tool', 3, 'ALTA-VJ-009', 4, 3, '2022-11-29 13:48:15.377993', '2022-11-29 00:00:00.000000', '2022-12-29 00:00:00.000000', 1),
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
('5a1ed5bf-d73c-4d32-b348-a59125d3c2cf', '{\"WorkerCount\":5,\"Queues\":[\"default\",\"default\",\"notdefault\"],\"StartedAt\":\"2022-12-08T15:00:55.1020019Z\"}', '2022-12-08 15:11:09.817939');

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
(36, 'recurring-jobs', 'updateuse', 1672960000, NULL);

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
(339, 91, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 13:32:36.835907', '{\"EnqueuedAt\":\"2022-12-08T13:32:36.7323271Z\",\"Queue\":\"default\"}'),
(340, 91, 'Processing', NULL, '2022-12-08 13:32:51.097294', '{\"StartedAt\":\"2022-12-08T13:32:51.0367472Z\",\"ServerId\":\"9eaea32f-fcae-4d4f-bc47-9df4c1f58886\",\"WorkerId\":\"1b5c4645-1921-496f-88a7-63ff65bbc559\"}'),
(341, 92, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 13:33:00.257273', '{\"EnqueuedAt\":\"2022-12-08T13:33:00.2555527Z\",\"Queue\":\"default\"}'),
(342, 92, 'Processing', NULL, '2022-12-08 13:33:06.112598', '{\"StartedAt\":\"2022-12-08T13:33:06.0681728Z\",\"ServerId\":\"9eaea32f-fcae-4d4f-bc47-9df4c1f58886\",\"WorkerId\":\"51ef35b7-0a7f-4e1b-9a40-6f16c2953389\"}'),
(343, 92, 'Succeeded', NULL, '2022-12-08 13:33:07.869706', '{\"SucceededAt\":\"2022-12-08T13:33:07.8287816Z\",\"PerformanceDuration\":\"1663\",\"Latency\":\"5970\"}'),
(344, 91, 'Succeeded', NULL, '2022-12-08 13:33:07.885632', '{\"SucceededAt\":\"2022-12-08T13:33:07.8287909Z\",\"PerformanceDuration\":\"16685\",\"Latency\":\"14522\"}'),
(345, 93, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 13:35:24.331578', '{\"EnqueuedAt\":\"2022-12-08T13:35:24.3230408Z\",\"Queue\":\"default\"}'),
(346, 93, 'Processing', NULL, '2022-12-08 13:35:39.289500', '{\"StartedAt\":\"2022-12-08T13:35:39.2639629Z\",\"ServerId\":\"9eaea32f-fcae-4d4f-bc47-9df4c1f58886\",\"WorkerId\":\"e5c6358d-a572-4f4f-8395-651bea9fc844\"}'),
(347, 93, 'Succeeded', NULL, '2022-12-08 13:35:39.406167', '{\"SucceededAt\":\"2022-12-08T13:35:39.3849125Z\",\"PerformanceDuration\":\"55\",\"Latency\":\"15048\"}'),
(348, 94, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 13:36:00.117179', '{\"EnqueuedAt\":\"2022-12-08T13:36:00.1150375Z\",\"Queue\":\"default\"}'),
(349, 94, 'Processing', NULL, '2022-12-08 13:36:57.143458', '{\"StartedAt\":\"2022-12-08T13:36:57.0662434Z\",\"ServerId\":\"9eaea32f-fcae-4d4f-bc47-9df4c1f58886\",\"WorkerId\":\"b85a283a-f18d-4adf-89ec-e52f1746aeb0\"}'),
(350, 94, 'Succeeded', NULL, '2022-12-08 13:36:57.322137', '{\"SucceededAt\":\"2022-12-08T13:36:57.2670153Z\",\"PerformanceDuration\":\"43\",\"Latency\":\"57150\"}'),
(351, 95, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 13:37:42.218843', '{\"EnqueuedAt\":\"2022-12-08T13:37:42.2178311Z\",\"Queue\":\"default\"}'),
(352, 95, 'Processing', NULL, '2022-12-08 13:38:15.535939', '{\"StartedAt\":\"2022-12-08T13:37:58.2891868Z\",\"ServerId\":\"9eaea32f-fcae-4d4f-bc47-9df4c1f58886\",\"WorkerId\":\"1b5c4645-1921-496f-88a7-63ff65bbc559\"}'),
(353, 95, 'Succeeded', NULL, '2022-12-08 13:38:15.635212', '{\"SucceededAt\":\"2022-12-08T13:38:15.5955250Z\",\"PerformanceDuration\":\"15\",\"Latency\":\"34310\"}'),
(354, 96, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 13:38:15.671507', '{\"EnqueuedAt\":\"2022-12-08T13:38:15.6698933Z\",\"Queue\":\"default\"}'),
(355, 96, 'Processing', NULL, '2022-12-08 13:38:15.742929', '{\"StartedAt\":\"2022-12-08T13:38:15.7301864Z\",\"ServerId\":\"9eaea32f-fcae-4d4f-bc47-9df4c1f58886\",\"WorkerId\":\"1b5c4645-1921-496f-88a7-63ff65bbc559\"}'),
(356, 96, 'Succeeded', NULL, '2022-12-08 13:38:15.805879', '{\"SucceededAt\":\"2022-12-08T13:38:15.7965257Z\",\"PerformanceDuration\":\"14\",\"Latency\":\"179\"}'),
(357, 97, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:12:48.577169', '{\"EnqueuedAt\":\"2022-12-08T14:12:48.4582223Z\",\"Queue\":\"default\"}'),
(358, 97, 'Processing', NULL, '2022-12-08 14:13:03.113368', '{\"StartedAt\":\"2022-12-08T14:13:02.7952301Z\",\"ServerId\":\"22d676a5-e314-4344-afc0-03202c757abb\",\"WorkerId\":\"f8a0f6fc-ec8c-4c34-b6a8-5cfdda8f7f2b\"}'),
(359, 97, 'Succeeded', NULL, '2022-12-08 14:13:20.109581', '{\"SucceededAt\":\"2022-12-08T14:13:20.0800817Z\",\"PerformanceDuration\":\"16775\",\"Latency\":\"14972\"}'),
(360, 98, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:13:20.591071', '{\"EnqueuedAt\":\"2022-12-08T14:13:20.5877672Z\",\"Queue\":\"default\"}'),
(361, 98, 'Processing', NULL, '2022-12-08 14:13:32.984172', '{\"StartedAt\":\"2022-12-08T14:13:32.9593847Z\",\"ServerId\":\"22d676a5-e314-4344-afc0-03202c757abb\",\"WorkerId\":\"be52f123-cfbf-4510-96de-0c1410c75e25\"}'),
(362, 98, 'Succeeded', NULL, '2022-12-08 14:13:34.016188', '{\"SucceededAt\":\"2022-12-08T14:13:33.9694959Z\",\"PerformanceDuration\":\"401\",\"Latency\":\"13013\"}'),
(363, 99, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:14:00.099481', '{\"EnqueuedAt\":\"2022-12-08T14:14:00.0957824Z\",\"Queue\":\"default\"}'),
(364, 99, 'Processing', NULL, '2022-12-08 14:14:03.201519', '{\"StartedAt\":\"2022-12-08T14:14:03.0806992Z\",\"ServerId\":\"22d676a5-e314-4344-afc0-03202c757abb\",\"WorkerId\":\"06220adb-2fb3-425c-92ed-534bdc39a9e0\"}'),
(365, 99, 'Succeeded', NULL, '2022-12-08 14:14:03.494509', '{\"SucceededAt\":\"2022-12-08T14:14:03.4636079Z\",\"PerformanceDuration\":\"103\",\"Latency\":\"3314\"}'),
(366, 100, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:15:28.647339', '{\"EnqueuedAt\":\"2022-12-08T14:15:28.6468520Z\",\"Queue\":\"default\"}'),
(367, 100, 'Processing', NULL, '2022-12-08 14:15:38.624776', '{\"StartedAt\":\"2022-12-08T14:15:38.6105808Z\",\"ServerId\":\"22d676a5-e314-4344-afc0-03202c757abb\",\"WorkerId\":\"7b03524d-116b-489d-abfa-958e3b03f561\"}'),
(368, 100, 'Succeeded', NULL, '2022-12-08 14:15:38.708657', '{\"SucceededAt\":\"2022-12-08T14:15:38.6972763Z\",\"PerformanceDuration\":\"20\",\"Latency\":\"10052\"}'),
(369, 101, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:16:00.072246', '{\"EnqueuedAt\":\"2022-12-08T14:16:00.0684345Z\",\"Queue\":\"default\"}'),
(370, 101, 'Processing', NULL, '2022-12-08 14:16:08.782115', '{\"StartedAt\":\"2022-12-08T14:16:08.7651107Z\",\"ServerId\":\"22d676a5-e314-4344-afc0-03202c757abb\",\"WorkerId\":\"be52f123-cfbf-4510-96de-0c1410c75e25\"}'),
(371, 101, 'Succeeded', NULL, '2022-12-08 14:16:09.170535', '{\"SucceededAt\":\"2022-12-08T14:16:09.0739973Z\",\"PerformanceDuration\":\"130\",\"Latency\":\"8913\"}'),
(372, 102, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:18:50.216469', '{\"EnqueuedAt\":\"2022-12-08T14:18:49.9904169Z\",\"Queue\":\"default\"}'),
(373, 102, 'Processing', NULL, '2022-12-08 14:19:03.742457', '{\"StartedAt\":\"2022-12-08T14:19:03.6383464Z\",\"ServerId\":\"6c6bbe66-4d4b-4f46-8f14-4a01a7f197a6\",\"WorkerId\":\"cf7969e5-0ad9-4eb5-983a-f43540d598bd\"}'),
(374, 102, 'Succeeded', NULL, '2022-12-08 14:19:23.921372', '{\"SucceededAt\":\"2022-12-08T14:19:23.8750367Z\",\"PerformanceDuration\":\"20074\",\"Latency\":\"13961\"}'),
(375, 103, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:19:46.683081', '{\"EnqueuedAt\":\"2022-12-08T14:19:46.6822007Z\",\"Queue\":\"default\"}'),
(376, 103, 'Processing', NULL, '2022-12-08 14:19:48.791945', '{\"StartedAt\":\"2022-12-08T14:19:48.7782167Z\",\"ServerId\":\"6c6bbe66-4d4b-4f46-8f14-4a01a7f197a6\",\"WorkerId\":\"2cf9fb38-93dc-4235-aa25-348a2eee7201\"}'),
(377, 103, 'Succeeded', NULL, '2022-12-08 14:19:48.856840', '{\"SucceededAt\":\"2022-12-08T14:19:48.8434911Z\",\"PerformanceDuration\":\"19\",\"Latency\":\"2174\"}'),
(378, 104, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:20:00.060139', '{\"EnqueuedAt\":\"2022-12-08T14:20:00.0528241Z\",\"Queue\":\"default\"}'),
(379, 104, 'Processing', NULL, '2022-12-08 14:20:03.811770', '{\"StartedAt\":\"2022-12-08T14:20:03.8019204Z\",\"ServerId\":\"6c6bbe66-4d4b-4f46-8f14-4a01a7f197a6\",\"WorkerId\":\"c4ed5135-74ac-46d1-a7ce-ea5775a832aa\"}'),
(380, 104, 'Succeeded', NULL, '2022-12-08 14:20:03.880565', '{\"SucceededAt\":\"2022-12-08T14:20:03.8682511Z\",\"PerformanceDuration\":\"25\",\"Latency\":\"3821\"}'),
(381, 105, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:21:55.759732', '{\"EnqueuedAt\":\"2022-12-08T14:21:55.7582765Z\",\"Queue\":\"default\"}'),
(382, 106, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:22:00.032462', '{\"EnqueuedAt\":\"2022-12-08T14:22:00.0320741Z\",\"Queue\":\"default\"}'),
(383, 105, 'Processing', NULL, '2022-12-08 14:22:04.017613', '{\"StartedAt\":\"2022-12-08T14:22:04.0026664Z\",\"ServerId\":\"6c6bbe66-4d4b-4f46-8f14-4a01a7f197a6\",\"WorkerId\":\"3d8ab6ff-e0e2-48ac-adf4-8c818cb93b2b\"}'),
(384, 106, 'Processing', NULL, '2022-12-08 14:22:04.020190', '{\"StartedAt\":\"2022-12-08T14:22:04.0099536Z\",\"ServerId\":\"6c6bbe66-4d4b-4f46-8f14-4a01a7f197a6\",\"WorkerId\":\"2cf9fb38-93dc-4235-aa25-348a2eee7201\"}'),
(385, 105, 'Succeeded', NULL, '2022-12-08 14:22:04.070226', '{\"SucceededAt\":\"2022-12-08T14:22:04.0485006Z\",\"PerformanceDuration\":\"7\",\"Latency\":\"8316\"}'),
(386, 106, 'Succeeded', NULL, '2022-12-08 14:22:04.097656', '{\"SucceededAt\":\"2022-12-08T14:22:04.0875808Z\",\"PerformanceDuration\":\"42\",\"Latency\":\"4037\"}'),
(387, 107, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:25:04.993397', '{\"EnqueuedAt\":\"2022-12-08T14:25:04.9623582Z\",\"Queue\":\"default\"}'),
(388, 107, 'Processing', NULL, '2022-12-08 14:31:50.281799', '{\"StartedAt\":\"2022-12-08T14:31:49.7991208Z\",\"ServerId\":\"92436b52-8df4-4d32-9cad-b447b657dea2\",\"WorkerId\":\"5881d012-e48d-461d-b485-96f695eacfd2\"}'),
(389, 108, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:31:50.349316', '{\"EnqueuedAt\":\"2022-12-08T14:31:50.3403292Z\",\"Queue\":\"default\"}'),
(390, 107, 'Succeeded', NULL, '2022-12-08 14:31:55.947900', '{\"SucceededAt\":\"2022-12-08T14:31:55.9246194Z\",\"PerformanceDuration\":\"5548\",\"Latency\":\"405905\"}'),
(391, 108, 'Processing', NULL, '2022-12-08 14:31:56.032442', '{\"StartedAt\":\"2022-12-08T14:31:56.0173913Z\",\"ServerId\":\"92436b52-8df4-4d32-9cad-b447b657dea2\",\"WorkerId\":\"5881d012-e48d-461d-b485-96f695eacfd2\"}'),
(392, 108, 'Succeeded', NULL, '2022-12-08 14:31:56.091740', '{\"SucceededAt\":\"2022-12-08T14:31:56.0786517Z\",\"PerformanceDuration\":\"21\",\"Latency\":\"5860\"}'),
(393, 109, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:32:40.846419', '{\"EnqueuedAt\":\"2022-12-08T14:32:40.3823925Z\",\"Queue\":\"default\"}'),
(394, 109, 'Processing', NULL, '2022-12-08 14:32:42.609100', '{\"StartedAt\":\"2022-12-08T14:32:42.5939649Z\",\"ServerId\":\"92436b52-8df4-4d32-9cad-b447b657dea2\",\"WorkerId\":\"5881d012-e48d-461d-b485-96f695eacfd2\"}'),
(395, 109, 'Succeeded', NULL, '2022-12-08 14:32:44.825956', '{\"SucceededAt\":\"2022-12-08T14:32:43.2161950Z\",\"PerformanceDuration\":\"553\",\"Latency\":\"2319\"}'),
(396, 110, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:33:04.975412', '{\"EnqueuedAt\":\"2022-12-08T14:33:04.9748447Z\",\"Queue\":\"default\"}'),
(397, 110, 'Processing', NULL, '2022-12-08 14:33:35.197705', '{\"StartedAt\":\"2022-12-08T14:33:35.1477014Z\",\"ServerId\":\"92436b52-8df4-4d32-9cad-b447b657dea2\",\"WorkerId\":\"d9e2536f-97da-454d-9671-07a00bcf87ea\"}'),
(398, 110, 'Succeeded', NULL, '2022-12-08 14:33:35.365959', '{\"SucceededAt\":\"2022-12-08T14:33:35.3583776Z\",\"PerformanceDuration\":\"86\",\"Latency\":\"30330\"}'),
(399, 111, 'Scheduled', NULL, '2022-12-08 14:33:35.409315', '{\"EnqueueAt\":\"2022-12-08T14:25:00.0000000Z\",\"ScheduledAt\":\"2022-12-08T14:33:35.3592771Z\"}'),
(400, 111, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-08 14:34:01.830503', '{\"EnqueuedAt\":\"2022-12-08T14:34:01.8114607Z\",\"Queue\":\"default\"}'),
(401, 111, 'Processing', NULL, '2022-12-08 14:34:16.820029', '{\"StartedAt\":\"2022-12-08T14:34:16.8115904Z\",\"ServerId\":\"92436b52-8df4-4d32-9cad-b447b657dea2\",\"WorkerId\":\"d9e2536f-97da-454d-9671-07a00bcf87ea\"}'),
(402, 112, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:34:51.001240', '{\"EnqueuedAt\":\"2022-12-08T14:34:51.0001167Z\",\"Queue\":\"default\"}'),
(403, 113, 'Enqueued', 'Triggered by recurring job scheduler', '2022-12-08 14:35:00.055548', '{\"EnqueuedAt\":\"2022-12-08T14:35:00.0544698Z\",\"Queue\":\"default\"}'),
(404, 112, 'Processing', NULL, '2022-12-08 14:35:06.014611', '{\"StartedAt\":\"2022-12-08T14:35:06.0005917Z\",\"ServerId\":\"92436b52-8df4-4d32-9cad-b447b657dea2\",\"WorkerId\":\"5881d012-e48d-461d-b485-96f695eacfd2\"}'),
(405, 113, 'Processing', NULL, '2022-12-08 14:35:06.040118', '{\"StartedAt\":\"2022-12-08T14:35:06.0288004Z\",\"ServerId\":\"92436b52-8df4-4d32-9cad-b447b657dea2\",\"WorkerId\":\"902bd623-dec3-4f53-9a00-d6593ab74fc9\"}'),
(406, 112, 'Succeeded', NULL, '2022-12-08 14:35:06.085444', '{\"SucceededAt\":\"2022-12-08T14:35:06.0722378Z\",\"PerformanceDuration\":\"16\",\"Latency\":\"21346\"}'),
(407, 113, 'Succeeded', NULL, '2022-12-08 14:35:06.090782', '{\"SucceededAt\":\"2022-12-08T14:35:06.0797928Z\",\"PerformanceDuration\":\"10\",\"Latency\":\"6050\"}'),
(408, 114, 'Scheduled', NULL, '2022-12-08 14:53:16.425912', '{\"EnqueueAt\":\"2022-12-08T14:25:00.0000000Z\",\"ScheduledAt\":\"2022-12-08T14:53:16.2799447Z\"}'),
(409, 114, 'Enqueued', 'Triggered by DelayedJobScheduler', '2022-12-08 14:53:21.435044', '{\"EnqueuedAt\":\"2022-12-08T14:53:21.0050537Z\",\"Queue\":\"default\"}'),
(410, 114, 'Processing', NULL, '2022-12-08 14:53:23.211666', '{\"StartedAt\":\"2022-12-08T14:53:23.2004915Z\",\"ServerId\":\"22408930-54e9-493d-95df-41f7b3e0df4c\",\"WorkerId\":\"1497bd62-47fa-4448-8171-59647ebc3b09\"}'),
(411, 111, 'Processing', NULL, '2022-12-08 15:05:31.608248', '{\"StartedAt\":\"2022-12-08T15:05:31.2297981Z\",\"ServerId\":\"5a1ed5bf-d73c-4d32-b348-a59125d3c2cf\",\"WorkerId\":\"f4307e07-40f2-4d71-9cb6-0022aff7af65\"}'),
(412, 111, 'Succeeded', NULL, '2022-12-08 15:07:20.639603', '{\"SucceededAt\":\"2022-12-08T15:07:20.6184548Z\",\"PerformanceDuration\":\"108945\",\"Latency\":\"1916285\"}');

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
(3, 'Huỳnh Văn Tới', 'toi.huynh@hotmail.com', '$2a$11$MrtjErMC1667zlV4I26yTer/I.iV7ldqrvxE3PDjNmSrjiKas4hHm', 3, '0359330868', 1, '2022-11-25 11:03:54.545147', 1, NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2NzA1MDg5MDcsImV4cCI6MTY4NjIzMzcwNywiaWF0IjoxNjcwNTA4OTA3LCJpc3MiOiJodHRwczovL0VtYWlsTWVya2V0aW5nLmNvbSJ9.YkTlj9EPk0SZGGkvNoD_xSOKA3EgUDkAFlj4jpPvypA');

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
('20221206045025_DeletePositionGoogleAccount', '6.0.11'),
('20221208143049_CreateFileContentInOperation', '6.0.11');

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `jobparameter`
--
ALTER TABLE `jobparameter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;

--
-- AUTO_INCREMENT for table `jobqueue`
--
ALTER TABLE `jobqueue`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `operation_detail`
--
ALTER TABLE `operation_detail`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35392;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;

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
