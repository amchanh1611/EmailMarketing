-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2022 at 07:43 AM
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

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`Id`, `Name`, `Email`, `Male`, `GroupContactId`, `UserId`) VALUES
(2, 'Âu Minh Chánh', 'am.chanh1199@gmail.com', 1, NULL, 3),
(4, 'Chanh', 'am.chanh0077@gmail.com', 2, NULL, 3),
(5, 'minh minh', 'ngocminh77@gmail.com', 2, 1, 3),
(6, 'Chanh', '0468191099@caothang.edu.vn', 1, 1, 3),
(7, 'Au Chanh', 'auminhchanh11@gmail.com', 1, 1, 3);

--
-- Dumping data for table `group_contact`
--

INSERT INTO `group_contact` (`Id`, `Name`, `UserId`) VALUES
(1, 'Demo', 3);

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

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`Id`, `Name`, `OwnerId`, `CodeContract`, `ServicePackageId`, `Used`, `CreatedDate`, `DateStart`, `DateEnd`, `Status`) VALUES
(1, 'VietJet Booking Tool', 3, 'ALTA-VJ-009', 4, 10, '2022-11-29 13:48:15.377993', '2022-11-29 00:00:00.000000', '2022-12-29 00:00:00.000000', 1);

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Id`, `Name`, `UserType`) VALUES
(1, 'Quản trị viên cấp cao', 1),
(2, 'Nhân Viên', 2),
(3, 'Khách hàng', 3),
(4, 'Nhân Viên - Sale', 2),
(6, 'Nhân Viên - PartTime', 2);

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

--
-- Dumping data for table `service_packages`
--

INSERT INTO `service_packages` (`Id`, `Name`, `Quantity`) VALUES
(2, 'Normal', 500),
(3, 'Premium', 1000),
(4, 'Start', 100);

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `Name`, `Email`, `Password`, `RoleId`, `Phone`, `Male`, `CreatedDate`, `Status`, `Avatar`) VALUES
(1, 'Minh Chánh', 'am.chanh16111@gmail.com', '$2a$11$4lJw8eMZIY.D5Oo2D5GQau4RZogri33zy5FyZDKE.bWg2ZYggZ6hK', 1, NULL, 1, '2022-11-25 10:57:43.571082', 1, 'https://localhost:7069/https://localhost:7069/'),
(2, 'Huỳnh Văn Tới', 'toi.huynh@alta.com.vn', '$2a$11$7KoqxWcSLjV3d4vq5T69vuCEoHlh3/x2zzJ0TSxbj7GMLirvGYOhO', 2, NULL, 1, '2022-11-25 10:58:22.805547', 1, NULL),
(3, 'Huỳnh Văn Tới', 'toi.huynh@hotmail.com', '$2a$11$MrtjErMC1667zlV4I26yTer/I.iV7ldqrvxE3PDjNmSrjiKas4hHm', 3, '0359330868', 1, '2022-11-25 11:03:54.545147', 1, NULL);

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
('20221202052447_CreateModelGoogleAccount', '6.0.11');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
