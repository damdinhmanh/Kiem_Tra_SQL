-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Sep 26, 2022 at 01:45 PM
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
-- Database: `damcuoi_damma`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`%` PROCEDURE `cal_equip_spend` (OUT `total_spend` INT)   BEGIN
	SELECT SUM(price) into total_spend
	FROM Equipment;
END$$

CREATE DEFINER=`root`@`%` PROCEDURE `cal_food_spend` (OUT `total_spend` INT)   BEGIN
	SELECT SUM(price) into total_spend
	FROM Foods;
END$$

CREATE DEFINER=`root`@`%` PROCEDURE `cal_total_spend` (IN `food_spend` INT, IN `equip_spend` INT, OUT `total_spend` INT)   BEGIN
	SET total_spend = food_spend + equip_spend;
	INSERT INTO Spending_Statistics VALUES(1, 1, total_spend);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Activities`
--

CREATE TABLE `Activities` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Equipment`
--

CREATE TABLE `Equipment` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `status` varchar(20) NOT NULL,
  `id_event` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Equipment`
--

INSERT INTO `Equipment` (`id`, `name`, `price`, `quantity`, `status`, `id_event`) VALUES
(1, 'Loa', 100000, 1, 'dang muon', 1),
(2, 'do trang tri', 200000, 1, 'dang muon', 1),
(3, 'Ban Ghe', 200000, 5, 'dang muon', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE `Event` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Event`
--

INSERT INTO `Event` (`id`, `name`, `address`) VALUES
(1, 'dam cuoi', 'Cau Giay'),
(2, 'dam ma', 'Tay Ho');

-- --------------------------------------------------------

--
-- Table structure for table `Event_Activity`
--

CREATE TABLE `Event_Activity` (
  `id_event` int DEFAULT NULL,
  `id_activity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Event_Food`
--

CREATE TABLE `Event_Food` (
  `id_event` int DEFAULT NULL,
  `id_food` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Event_Food`
--

INSERT INTO `Event_Food` (`id_event`, `id_food`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Event_Person`
--

CREATE TABLE `Event_Person` (
  `id_event` int DEFAULT NULL,
  `id_person` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Foods`
--

CREATE TABLE `Foods` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Foods`
--

INSERT INTO `Foods` (`id`, `name`, `price`, `quantity`) VALUES
(1, 'Thit Ga', 100000, 1),
(2, 'Thit Cho', 150000, 1),
(3, 'Hoa Qua', 50000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Income_Statistic`
--

CREATE TABLE `Income_Statistic` (
  `id` int NOT NULL,
  `id_person` int DEFAULT NULL,
  `money_amount` int DEFAULT NULL,
  `id_event` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Invitation_card`
--

CREATE TABLE `Invitation_card` (
  `id` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `qr_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Person`
--

CREATE TABLE `Person` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Spending_Statistics`
--

CREATE TABLE `Spending_Statistics` (
  `id` int NOT NULL,
  `id_event` int NOT NULL,
  `total_spending` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Spending_Statistics`
--

INSERT INTO `Spending_Statistics` (`id`, `id_event`, `total_spending`) VALUES
(1, 1, 800000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Activities`
--
ALTER TABLE `Activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Equipment`
--
ALTER TABLE `Equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Equipment_id_event_fk` (`id_event`);

--
-- Indexes for table `Event`
--
ALTER TABLE `Event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Event_Activity`
--
ALTER TABLE `Event_Activity`
  ADD KEY `Event_Activity_id_event_fk` (`id_event`),
  ADD KEY `Event_Activity_id_activity_fk` (`id_activity`);

--
-- Indexes for table `Event_Food`
--
ALTER TABLE `Event_Food`
  ADD KEY `Event_Food_id_event_fk` (`id_event`),
  ADD KEY `Event_Food_id_food_fk` (`id_food`);

--
-- Indexes for table `Event_Person`
--
ALTER TABLE `Event_Person`
  ADD KEY `Event_Person_id_event_fk` (`id_event`),
  ADD KEY `Event_Person_id_person_fk` (`id_person`);

--
-- Indexes for table `Foods`
--
ALTER TABLE `Foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Income_Statistic`
--
ALTER TABLE `Income_Statistic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Income_Statistic_id_person_fk` (`id_person`),
  ADD KEY `Income_Statistic_id_event_fk` (`id_event`);

--
-- Indexes for table `Invitation_card`
--
ALTER TABLE `Invitation_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Person`
--
ALTER TABLE `Person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Spending_Statistics`
--
ALTER TABLE `Spending_Statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Spending_Statistics_id_event_fk` (`id_event`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Activities`
--
ALTER TABLE `Activities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Equipment`
--
ALTER TABLE `Equipment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Event`
--
ALTER TABLE `Event`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Foods`
--
ALTER TABLE `Foods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Income_Statistic`
--
ALTER TABLE `Income_Statistic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Invitation_card`
--
ALTER TABLE `Invitation_card`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Person`
--
ALTER TABLE `Person`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Spending_Statistics`
--
ALTER TABLE `Spending_Statistics`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Equipment`
--
ALTER TABLE `Equipment`
  ADD CONSTRAINT `Equipment_id_event_fk` FOREIGN KEY (`id_event`) REFERENCES `Event` (`id`);

--
-- Constraints for table `Event_Activity`
--
ALTER TABLE `Event_Activity`
  ADD CONSTRAINT `Event_Activity_id_activity_fk` FOREIGN KEY (`id_activity`) REFERENCES `Activities` (`id`),
  ADD CONSTRAINT `Event_Activity_id_event_fk` FOREIGN KEY (`id_event`) REFERENCES `Event` (`id`);

--
-- Constraints for table `Event_Food`
--
ALTER TABLE `Event_Food`
  ADD CONSTRAINT `Event_Food_id_event_fk` FOREIGN KEY (`id_event`) REFERENCES `Event` (`id`),
  ADD CONSTRAINT `Event_Food_id_food_fk` FOREIGN KEY (`id_food`) REFERENCES `Foods` (`id`);

--
-- Constraints for table `Event_Person`
--
ALTER TABLE `Event_Person`
  ADD CONSTRAINT `Event_Person_id_event_fk` FOREIGN KEY (`id_event`) REFERENCES `Event` (`id`),
  ADD CONSTRAINT `Event_Person_id_person_fk` FOREIGN KEY (`id_person`) REFERENCES `Person` (`id`);

--
-- Constraints for table `Income_Statistic`
--
ALTER TABLE `Income_Statistic`
  ADD CONSTRAINT `Income_Statistic_id_event_fk` FOREIGN KEY (`id_event`) REFERENCES `Event` (`id`),
  ADD CONSTRAINT `Income_Statistic_id_person_fk` FOREIGN KEY (`id_person`) REFERENCES `Person` (`id`);

--
-- Constraints for table `Spending_Statistics`
--
ALTER TABLE `Spending_Statistics`
  ADD CONSTRAINT `Spending_Statistics_id_event_fk` FOREIGN KEY (`id_event`) REFERENCES `Event` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
