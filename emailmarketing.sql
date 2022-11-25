-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2022 at 07:36 AM
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
('DeleteAccount', 'Delete specified account', 'Admin', 'Account'),
('DeleteCustommer', 'Delete specified custommer', 'Admin,System', 'Custommer'),
('UpdateAccount', 'Update account detail', 'Admin', 'Account'),
('UpdateCustommer', 'Update custommer detail', 'Admin,System', 'Custommer'),
('ViewAccount', 'View account in system', 'Admin', 'Account'),
('ViewCustommer', 'View custommer in system', 'Admin,System', 'Custommer'),
('ViewProject', 'View project in system', 'Admin,System,Customer', 'Project');

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
(1, 'Quản trị viên cáp cao', 1),
(2, 'Nhân Viên', 2),
(3, 'Khách hàng', 3);

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
(1, 'DeleteAccount'),
(1, 'DeleteCustommer'),
(1, 'UpdateAccount'),
(1, 'UpdateCustommer'),
(1, 'ViewAccount'),
(1, 'ViewCustommer'),
(2, 'CreateCustommer'),
(2, 'DeleteCustommer'),
(2, 'UpdateCustommer'),
(2, 'ViewCustommer'),
(3, 'ViewProject');

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
('20221125033712_UpdateDatabase2', '6.0.11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`Code`);

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
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `FK_role_permission_permission_PermissionCode` FOREIGN KEY (`PermissionCode`) REFERENCES `permission` (`Code`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_role_permission_role_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_role_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
