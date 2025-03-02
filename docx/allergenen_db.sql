-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 02, 2025 at 09:30 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `allergenen_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `allergenen`
--

CREATE TABLE `allergenen` (
  `id` bigint UNSIGNED NOT NULL,
  `naam` varchar(255) NOT NULL,
  `omschrijving` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `allergenen`
--

INSERT INTO `allergenen` (`id`, `naam`, `omschrijving`, `created_at`, `updated_at`) VALUES
(1, 'Gluten', 'Bevat gluten', '2025-03-02 20:34:00', '2025-03-02 20:34:00'),
(2, 'Lactose', 'Bevat lactose', '2025-03-02 20:34:00', '2025-03-02 20:34:00'),
(3, 'Soja', 'Bevat soja', '2025-03-02 20:34:00', '2025-03-02 20:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `contacten`
--

CREATE TABLE `contacten` (
  `id` bigint UNSIGNED NOT NULL,
  `straat` varchar(255) NOT NULL,
  `huisnummer` varchar(10) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `stad` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contacten`
--

INSERT INTO `contacten` (`id`, `straat`, `huisnummer`, `postcode`, `stad`, `created_at`, `updated_at`) VALUES
(1, 'Van Gilslaan', '34', '1045CB', 'Hilvarenbeek', '2025-03-02 20:34:00', '2025-03-02 20:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `leveranciers`
--

CREATE TABLE `leveranciers` (
  `id` bigint UNSIGNED NOT NULL,
  `naam` varchar(255) NOT NULL,
  `contact_persoon` varchar(255) DEFAULT NULL,
  `leverancier_nummer` varchar(255) NOT NULL,
  `mobiel` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `leveranciers`
--

INSERT INTO `leveranciers` (`id`, `naam`, `contact_persoon`, `leverancier_nummer`, `mobiel`, `created_at`, `updated_at`) VALUES
(1, 'Venco', 'Bert van Linge', 'L1029384719', '06-28493827', '2025-03-02 20:34:00', '2025-03-02 20:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `magazijn`
--

CREATE TABLE `magazijn` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `verpakkings_eenheid` decimal(5,2) NOT NULL,
  `aantal_aanwezig` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `magazijn`
--

INSERT INTO `magazijn` (`id`, `product_id`, `verpakkings_eenheid`, `aantal_aanwezig`, `created_at`, `updated_at`) VALUES
(1, 1, 5.00, 453, '2025-03-02 20:34:00', '2025-03-02 20:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `naam` varchar(255) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `naam`, `barcode`, `created_at`, `updated_at`) VALUES
(1, 'Mintnopjes', '8719587231278', '2025-03-02 20:34:00', '2025-03-02 20:34:00'),
(2, 'Schoolkrijt', '8719587326713', '2025-03-02 20:34:00', '2025-03-02 20:34:00'),
(3, 'Honingdrop', '8719587327836', '2025-03-02 20:34:00', '2025-03-02 20:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_per_allergeen`
--

CREATE TABLE `product_per_allergeen` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `allergeen_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_per_allergeen`
--

INSERT INTO `product_per_allergeen` (`id`, `product_id`, `allergeen_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-03-02 20:34:00', '2025-03-02 20:34:00'),
(2, 2, 2, '2025-03-02 20:34:00', '2025-03-02 20:34:00'),
(3, 3, 3, '2025-03-02 20:34:00', '2025-03-02 20:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_per_leverancier`
--

CREATE TABLE `product_per_leverancier` (
  `id` bigint UNSIGNED NOT NULL,
  `leverancier_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `datum_levering` date NOT NULL,
  `aantal` int NOT NULL,
  `datum_eerst_volgende_levering` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_per_leverancier`
--

INSERT INTO `product_per_leverancier` (`id`, `leverancier_id`, `product_id`, `datum_levering`, `aantal`, `datum_eerst_volgende_levering`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-04-09', 23, NULL, '2025-03-02 20:34:00', '2025-03-02 20:34:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allergenen`
--
ALTER TABLE `allergenen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacten`
--
ALTER TABLE `contacten`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leveranciers`
--
ALTER TABLE `leveranciers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leverancier_nummer` (`leverancier_nummer`);

--
-- Indexes for table `magazijn`
--
ALTER TABLE `magazijn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Magazijn_Product` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`);

--
-- Indexes for table `product_per_allergeen`
--
ALTER TABLE `product_per_allergeen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ProductPerAllergeen_Product` (`product_id`),
  ADD KEY `FK_ProductPerAllergeen_Allergeen` (`allergeen_id`);

--
-- Indexes for table `product_per_leverancier`
--
ALTER TABLE `product_per_leverancier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ProductPerLeverancier_Leverancier` (`leverancier_id`),
  ADD KEY `FK_ProductPerLeverancier_Product` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allergenen`
--
ALTER TABLE `allergenen`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacten`
--
ALTER TABLE `contacten`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leveranciers`
--
ALTER TABLE `leveranciers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `magazijn`
--
ALTER TABLE `magazijn`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_per_allergeen`
--
ALTER TABLE `product_per_allergeen`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_per_leverancier`
--
ALTER TABLE `product_per_leverancier`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `magazijn`
--
ALTER TABLE `magazijn`
  ADD CONSTRAINT `FK_Magazijn_Product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_per_allergeen`
--
ALTER TABLE `product_per_allergeen`
  ADD CONSTRAINT `FK_ProductPerAllergeen_Allergeen` FOREIGN KEY (`allergeen_id`) REFERENCES `allergenen` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ProductPerAllergeen_Product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_per_leverancier`
--
ALTER TABLE `product_per_leverancier`
  ADD CONSTRAINT `FK_ProductPerLeverancier_Leverancier` FOREIGN KEY (`leverancier_id`) REFERENCES `leveranciers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ProductPerLeverancier_Product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
