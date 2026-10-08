-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2026 at 03:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE DATABASE game_library;
USE game_library;

CREATE TABLE `developer` (
  `idDeveloper` varchar(45) NOT NULL,
  `namaDeveloper` varchar(45) NOT NULL,
  `negaraAsal` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `developer`
--

INSERT INTO `developer` (`idDeveloper`, `namaDeveloper`, `negaraAsal`) VALUES
('dev001', 'Riot Games', 'Amerika'),
('dev002', 'Valve Corporation', 'Amerika'),
('dev003', 'Capcom ', 'Jepang'),
('dev004', 'NetEase Games', 'Tiongkok'),
('dev005', 'Square Enix', 'Jepang');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `idGame` varchar(45) NOT NULL,
  `namaGame` varchar(100) NOT NULL,
  `idDeveloper` varchar(45) NOT NULL,
  `idGenre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`idGame`, `namaGame`, `idDeveloper`, `idGenre`) VALUES
('game001', 'Valorant', 'dev001', 'gnr004'),
('game002', 'Counter-Strike 2', 'dev002', 'gnr004'),
('game003', 'Devil May Cry 5', 'dev003', 'gnr003'),
('game004', 'Naraka: Bladepoint', 'dev004', 'gnr002'),
('game005', 'Final Fantasy VII Remake', 'dev005', 'gnr001');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `idGenre` varchar(45) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`idGenre`, `genre`, `deskripsi`) VALUES
('gnr001', 'RPG', 'Permainan yang berfokus pada pengembangan karakter, eksplorasi dunia, dan cerita yang mendalam.'),
('gnr002', 'Action', 'Permainan bertempo cepat yang mengandalkan refleks pemain, pertarungan fisik, dan koordinasi mata-tangan.'),
('gnr003', 'Hack and Slash', 'Permainan aksi yang berfokus pada pertarungan jarak dekat secara intens melawan banyak musuh sekaligus, biasanya menggunakan senjata tajam.'),
('gnr004', 'Tactical Shooter', 'Permainan tembak-menembak yang sangat menekankan taktik, eksekusi strategi, dan kerjasama tim dibandingkan aksi serang brutal.'),
('gnr005', 'Sport', 'Permainan yang mensimulasikan praktik olahraga fisik di dunia nyata, lengkap dengan aturan main kompetitifnya.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`idDeveloper`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`idGame`),
  ADD KEY `idGenre` (`idGenre`),
  ADD KEY `idDeveloper` (`idDeveloper`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`idGenre`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `fk_developer` FOREIGN KEY (`idDeveloper`) REFERENCES `developer` (`idDeveloper`),
  ADD CONSTRAINT `fk_genre` FOREIGN KEY (`idGenre`) REFERENCES `genre` (`idGenre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
