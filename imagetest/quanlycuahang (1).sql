-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 05, 2024 lúc 02:17 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlycuahang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(100) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(100) DEFAULT NULL,
  `CustomerEmail` varchar(45) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `CustomersPassword` varchar(20) DEFAULT NULL,
  `CustomersAddress` varchar(200) DEFAULT NULL,
  `CustomerImage` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `img` blob DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Gender` int(11) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `PhoneNumber` varchar(12) DEFAULT NULL,
  `Salary` decimal(6,5) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(11,2) DEFAULT NULL,
  `TotalPrice` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `TotalPrice` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productimages`
--

CREATE TABLE `productimages` (
  `ProductImagesID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `QInStore` int(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `revenue`
--

CREATE TABLE `revenue` (
  `RevenueID` int(11) NOT NULL,
  `RevenueDate` datetime DEFAULT NULL,
  `RevenueMonth` datetime DEFAULT NULL,
  `RevenueWeek` datetime DEFAULT NULL,
  `TotalRevenue` decimal(20,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `salaries`
--

CREATE TABLE `salaries` (
  `SalaryID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `TotalHours` double DEFAULT NULL,
  `TotalSalary` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shifts`
--

CREATE TABLE `shifts` (
  `ShiftID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `ShiftDate` date DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `TotalHours` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`UserID`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Chỉ mục cho bảng `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`ProductImagesID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Chỉ mục cho bảng `revenue`
--
ALTER TABLE `revenue`
  ADD PRIMARY KEY (`RevenueID`);

--
-- Chỉ mục cho bảng `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`SalaryID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Chỉ mục cho bảng `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`ShiftID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `productimages`
--
ALTER TABLE `productimages`
  MODIFY `ProductImagesID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `revenue`
--
ALTER TABLE `revenue`
  MODIFY `RevenueID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `salaries`
--
ALTER TABLE `salaries`
  MODIFY `SalaryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `shifts`
--
ALTER TABLE `shifts`
  MODIFY `ShiftID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`);

--
-- Các ràng buộc cho bảng `productimages`
--
ALTER TABLE `productimages`
  ADD CONSTRAINT `productimages_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);

--
-- Các ràng buộc cho bảng `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`);

--
-- Các ràng buộc cho bảng `shifts`
--
ALTER TABLE `shifts`
  ADD CONSTRAINT `shifts_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
