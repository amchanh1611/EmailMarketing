-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2022 at 01:02 PM
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
(1, 'stats:succeeded', 2, NULL),
(2, 'stats:succeeded:2022-12-03', 2, '2023-01-03 14:06:50'),
(3, 'stats:succeeded:2022-12-03-14', 2, '2022-12-04 14:06:50');

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
(4, 'Chanh', 'am.chanh16111@gmail.com', 1, 1, 3),
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
(1, 3, 'Succeeded', '{\"Type\":\"EmailMarketing.Common.GoogleServices.GoogleService, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]], System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"0468191090@caothang.edu.vn\\\\\\\"\\\",\\\"[\\\\\\\"am.chanh1199@gmail.com\\\\\\\",\\\\\\\"am.chanh16111@gmail.com\\\\\\\",\\\\\\\"0468191099@caothang.edu.vn\\\\\\\",\\\\\\\"auminhchanh99@gmail.com\\\\\\\"]\\\",\\\"\\\\\\\"EmailMarketing\\\\\\\"\\\",\\\"\\\\\\\"This is test emailmarketing\\\\\\\"\\\",\\\"\\\\\\\"1//0e0t-FeAXIr3HCgYIARAAGA4SNwF-L9IrWlXe_-dNx9iXMO7lojVB_IQkNX0PQ3-BR838bbCP0onwL_Gl0yOnut5kbDqBeBbW7jU\\\\\\\"\\\"]\"}', '[\"\\\"0468191090@caothang.edu.vn\\\"\",\"[\\\"am.chanh1199@gmail.com\\\",\\\"am.chanh16111@gmail.com\\\",\\\"0468191099@caothang.edu.vn\\\",\\\"auminhchanh99@gmail.com\\\"]\",\"\\\"EmailMarketing\\\"\",\"\\\"This is test emailmarketing\\\"\",\"\\\"1//0e0t-FeAXIr3HCgYIARAAGA4SNwF-L9IrWlXe_-dNx9iXMO7lojVB_IQkNX0PQ3-BR838bbCP0onwL_Gl0yOnut5kbDqBeBbW7jU\\\"\"]', '2022-12-03 13:52:25.024676', '2022-12-04 14:01:34.743960'),
(2, 6, 'Succeeded', '{\"Type\":\"EmailMarketing.Common.GoogleServices.GoogleService, EmailMarketing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"SendMailAsync\",\"ParameterTypes\":\"[\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]], System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=6.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"0468191090@caothang.edu.vn\\\\\\\"\\\",\\\"[\\\\\\\"am.chanh16111@gmail.com\\\\\\\"]\\\",\\\"\\\\\\\"EmailMarketing\\\\\\\"\\\",\\\"\\\\\\\"This is test emailmarketing\\\\\\\"\\\",\\\"\\\\\\\"1//0e0t-FeAXIr3HCgYIARAAGA4SNwF-L9IrWlXe_-dNx9iXMO7lojVB_IQkNX0PQ3-BR838bbCP0onwL_Gl0yOnut5kbDqBeBbW7jU\\\\\\\"\\\"]\"}', '[\"\\\"0468191090@caothang.edu.vn\\\"\",\"[\\\"am.chanh16111@gmail.com\\\"]\",\"\\\"EmailMarketing\\\"\",\"\\\"This is test emailmarketing\\\"\",\"\\\"1//0e0t-FeAXIr3HCgYIARAAGA4SNwF-L9IrWlXe_-dNx9iXMO7lojVB_IQkNX0PQ3-BR838bbCP0onwL_Gl0yOnut5kbDqBeBbW7jU\\\"\"]', '2022-12-03 14:05:26.391099', '2022-12-04 14:06:50.537026');

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
(1, 1, 'CurrentCulture', '\"en-US\"'),
(2, 1, 'CurrentUICulture', '\"en-US\"'),
(3, 2, 'CurrentCulture', '\"en-US\"'),
(4, 2, 'CurrentUICulture', '\"en-US\"');

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
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'VietJet Booking Tool', 3, 'ALTA-VJ-009', 4, 10, '2022-11-29 13:48:15.377993', '2022-11-29 00:00:00.000000', '2022-12-29 00:00:00.000000', 1);

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
('74a6350c-004b-43db-bfe6-d106e59ac579', '{\"WorkerCount\":5,\"Queues\":[\"default\",\"default\",\"notdefault\"],\"StartedAt\":\"2022-12-04T08:52:53.0574507Z\"}', '2022-12-04 09:04:56.914188');

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
(1, 1, 'Enqueued', NULL, '2022-12-03 13:52:25.071360', '{\"EnqueuedAt\":\"2022-12-03T13:52:24.9988327Z\",\"Queue\":\"default\"}'),
(2, 1, 'Processing', NULL, '2022-12-03 14:01:26.365654', '{\"StartedAt\":\"2022-12-03T14:01:25.2683523Z\",\"ServerId\":\"c0f6694f-aa67-420f-951a-aa3449e5a49e\",\"WorkerId\":\"1a93b1aa-1465-42a1-8288-8c112b0e2ce9\"}'),
(3, 1, 'Succeeded', NULL, '2022-12-03 14:01:34.713190', '{\"SucceededAt\":\"2022-12-03T14:01:34.4846442Z\",\"PerformanceDuration\":\"7940\",\"Latency\":\"541518\"}'),
(4, 2, 'Enqueued', NULL, '2022-12-03 14:05:26.427928', '{\"EnqueuedAt\":\"2022-12-03T14:05:26.3372469Z\",\"Queue\":\"default\"}'),
(5, 2, 'Processing', NULL, '2022-12-03 14:06:47.296495', '{\"StartedAt\":\"2022-12-03T14:06:46.4086990Z\",\"ServerId\":\"dc83a5f6-fba1-4f2c-bce8-b8a0f36586f9\",\"WorkerId\":\"3185872b-cc30-43eb-a6e6-f03b88d16919\"}'),
(6, 2, 'Succeeded', NULL, '2022-12-03 14:06:50.522680', '{\"SucceededAt\":\"2022-12-03T14:06:50.4482678Z\",\"PerformanceDuration\":\"2962\",\"Latency\":\"81094\"}');

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
  `Avatar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `Name`, `Email`, `Password`, `RoleId`, `Phone`, `Male`, `CreatedDate`, `Status`, `Avatar`) VALUES
(1, 'Minh Chánh', 'am.chanh16111@gmail.com', '$2a$11$4lJw8eMZIY.D5Oo2D5GQau4RZogri33zy5FyZDKE.bWg2ZYggZ6hK', 1, NULL, 1, '2022-11-25 10:57:43.571082', 1, 'https://localhost:7069/https://localhost:7069/'),
(2, 'Huỳnh Văn Tới', 'toi.huynh@alta.com.vn', '$2a$11$7KoqxWcSLjV3d4vq5T69vuCEoHlh3/x2zzJ0TSxbj7GMLirvGYOhO', 2, NULL, 1, '2022-11-25 10:58:22.805547', 1, NULL),
(3, 'Huỳnh Văn Tới', 'toi.huynh@hotmail.com', '$2a$11$MrtjErMC1667zlV4I26yTer/I.iV7ldqrvxE3PDjNmSrjiKas4hHm', 3, '0359330868', 1, '2022-11-25 11:03:54.545147', 1, NULL);

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
('20221203054505_EditModeDelete', '6.0.11');

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `google_account`
--
ALTER TABLE `google_account`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobparameter`
--
ALTER TABLE `jobparameter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobqueue`
--
ALTER TABLE `jobqueue`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
