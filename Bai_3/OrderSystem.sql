-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Sep 27, 2022 at 04:20 PM
-- Server version: 8.0.30
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `OrderSystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `BankAccount`
--

CREATE TABLE `BankAccount` (
  `id` int NOT NULL,
  `bank_name` varchar(20) NOT NULL,
  `bank_account` varchar(20) NOT NULL,
  `balance` double NOT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `id_bank_account` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Cus_Order`
--

CREATE TABLE `Cus_Order` (
  `id` int NOT NULL,
  `id_cus` int NOT NULL,
  `id_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Item`
--

CREATE TABLE `Item` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` double NOT NULL,
  `category` varchar(20) NOT NULL,
  `produce_company` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `id` int NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `note` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Order_Item`
--

CREATE TABLE `Order_Item` (
  `id` int NOT NULL,
  `id_order` int NOT NULL,
  `id_item` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Shipper`
--

CREATE TABLE `Shipper` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `nationalID` varchar(20) NOT NULL,
  `start_work_date` date NOT NULL,
  `earning_balance` double NOT NULL,
  `id_bank_account` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Shipper_Order`
--

CREATE TABLE `Shipper_Order` (
  `id` int NOT NULL,
  `id_shipper` int NOT NULL,
  `id_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BankAccount`
--
ALTER TABLE `BankAccount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Customer_id_bank_account_fk` (`id_bank_account`);

--
-- Indexes for table `Cus_Order`
--
ALTER TABLE `Cus_Order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cus_Order_id_cus_fk` (`id_cus`),
  ADD KEY `Cus_Order_id_order_fk` (`id_order`);

--
-- Indexes for table `Item`
--
ALTER TABLE `Item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Order_Item`
--
ALTER TABLE `Order_Item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order_Item_id_order_fk` (`id_order`),
  ADD KEY `Order_Item_id_item_fk` (`id_item`);

--
-- Indexes for table `Shipper`
--
ALTER TABLE `Shipper`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Shipper_id_bank_account_fk` (`id_bank_account`);

--
-- Indexes for table `Shipper_Order`
--
ALTER TABLE `Shipper_Order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Shipper_Order_id_shipper_fk` (`id_shipper`),
  ADD KEY `Shipper_Order_id_order_fk` (`id_order`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BankAccount`
--
ALTER TABLE `BankAccount`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Cus_Order`
--
ALTER TABLE `Cus_Order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Item`
--
ALTER TABLE `Item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Order_Item`
--
ALTER TABLE `Order_Item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Shipper`
--
ALTER TABLE `Shipper`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Shipper_Order`
--
ALTER TABLE `Shipper_Order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `Customer_id_bank_account_fk` FOREIGN KEY (`id_bank_account`) REFERENCES `BankAccount` (`id`);

--
-- Constraints for table `Cus_Order`
--
ALTER TABLE `Cus_Order`
  ADD CONSTRAINT `Cus_Order_id_cus_fk` FOREIGN KEY (`id_cus`) REFERENCES `Customer` (`id`),
  ADD CONSTRAINT `Cus_Order_id_order_fk` FOREIGN KEY (`id_order`) REFERENCES `Orders` (`id`);

--
-- Constraints for table `Order_Item`
--
ALTER TABLE `Order_Item`
  ADD CONSTRAINT `Order_Item_id_item_fk` FOREIGN KEY (`id_item`) REFERENCES `Item` (`id`),
  ADD CONSTRAINT `Order_Item_id_order_fk` FOREIGN KEY (`id_order`) REFERENCES `Orders` (`id`);

--
-- Constraints for table `Shipper`
--
ALTER TABLE `Shipper`
  ADD CONSTRAINT `Shipper_id_bank_account_fk` FOREIGN KEY (`id_bank_account`) REFERENCES `BankAccount` (`id`);

--
-- Constraints for table `Shipper_Order`
--
ALTER TABLE `Shipper_Order`
  ADD CONSTRAINT `Shipper_Order_id_order_fk` FOREIGN KEY (`id_order`) REFERENCES `Orders` (`id`),
  ADD CONSTRAINT `Shipper_Order_id_shipper_fk` FOREIGN KEY (`id_shipper`) REFERENCES `Shipper` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
