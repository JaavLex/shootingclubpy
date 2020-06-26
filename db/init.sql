-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 11, 2020 at 07:44 PM
-- Server version: 8.0.19
-- PHP Version: 7.4.1

-- Database: JAVET_ALEXANDRE_SHOOTINGCLUB_BD_104
-- Détection si une autre base de donnée du même nom existe

DROP DATABASE if exists JAVET_ALEXANDRE_SHOOTINGCLUB_BD_104;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS JAVET_ALEXANDRE_SHOOTINGCLUB_BD_104;

-- Utilisation de cette base de donnée

USE JAVET_ALEXANDRE_SHOOTINGCLUB_BD_104;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shootingclub`
--

-- --------------------------------------------------------

--
-- Table structure for table `T_Armes`
--

CREATE TABLE `T_Armes` (
  `id_arme` int NOT NULL,
  `nom_arme` tinytext COLLATE utf8mb4_general_ci NOT NULL,
  `fk_type_arme` int NOT NULL,
  `fk_munition` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Armes`
--

INSERT INTO `T_Armes` (`id_arme`, `nom_arme`, `fk_type_arme`, `fk_munition`) VALUES
(1, 'SIG P210', 1, 1),
(2, 'CZ 75', 1, 1),
(3, 'Pistolet Luger', 1, 1),
(4, 'Glock 17 - Gen. 4', 1, 1),
(5, 'SIG P1911', 1, 3),
(6, 'Colt 1911', 1, 3),
(7, 'SIG P226', 1, 1),
(8, 'H&K MR556 AR15', 3, 5),
(9, 'AK-74u', 3, 6),
(10, 'FN SCAR-H', 3, 8),
(11, 'SIG 550 (FASS 90)', 3, 5),
(12, 'SIG 510 (FASS 57)', 3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `T_Concours`
--

CREATE TABLE `T_Concours` (
  `id_concours` int NOT NULL,
  `date_concours` date NOT NULL,
  `fk_type_concours` int NOT NULL,
  `fk_stand_de_tir` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Concours`
--

INSERT INTO `T_Concours` (`id_concours`, `date_concours`, `fk_type_concours`, `fk_stand_de_tir`) VALUES
(2, '2020-03-01', 1, 1),
(3, '2020-03-09', 1, 1),
(4, '2020-01-22', 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `T_Concours_a_munitions_tirees`
--

CREATE TABLE `T_Concours_a_munitions_tirees` (
  `id_concours_a_munitions_tirees` int NOT NULL,
  `fk_concours` int NOT NULL,
  `fk_munition` int NOT NULL,
  `fk_personne` int NOT NULL,
  `fk_stand_de_tir` int NOT NULL,
  `nb_munitions` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Concours_a_munitions_tirees`
--

INSERT INTO `T_Concours_a_munitions_tirees` (`id_concours_a_munitions_tirees`, `fk_concours`, `fk_munition`, `fk_personne`, `fk_stand_de_tir`, `nb_munitions`) VALUES
(1, 2, 1, 5, 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `T_Concours_a_presence`
--

CREATE TABLE `T_Concours_a_presence` (
  `id_concours_a_presence` int NOT NULL,
  `fk_personne` int NOT NULL,
  `fk_concours` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Concours_a_presence`
--

INSERT INTO `T_Concours_a_presence` (`id_concours_a_presence`, `fk_personne`, `fk_concours`) VALUES
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 8, 3),
(8, 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `T_Concours_location_arme`
--

CREATE TABLE `T_Concours_location_arme` (
  `id_concours_location_arme` int NOT NULL,
  `fk_concours` int NOT NULL,
  `fk_arme` int NOT NULL,
  `fk_stand_de_tir` int NOT NULL,
  `prix_location` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Concours_location_arme`
--

INSERT INTO `T_Concours_location_arme` (`id_concours_location_arme`, `fk_concours`, `fk_arme`, `fk_stand_de_tir`, `prix_location`) VALUES
(1, 2, 1, 1, 25),
(2, 4, 11, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `T_Munition`
--

CREATE TABLE `T_Munition` (
  `id_munition` int NOT NULL,
  `calibre` text COLLATE utf8mb4_general_ci NOT NULL,
  `prix_p_50` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Munition`
--

INSERT INTO `T_Munition` (`id_munition`, `calibre`, `prix_p_50`) VALUES
(1, '9x19mm Parabellum', 25),
(2, '22. LR', 10),
(3, '45. ACP', 25),
(4, '50. AE', 50),
(5, '5,56x45mm NATO', 25),
(6, '5,45x39mm RUS', 25),
(7, '7,62x39mm RUS', 25),
(8, '7,62x51mm NATO', 25),
(9, '7,5x55mm SWISS', 25);

-- --------------------------------------------------------

--
-- Table structure for table `T_Personne`
--

CREATE TABLE `T_Personne` (
  `id_personne` int NOT NULL,
  `nom_pers` tinytext COLLATE utf8mb4_general_ci NOT NULL,
  `prenom_pers` tinytext COLLATE utf8mb4_general_ci NOT NULL,
  `date_de_naissance` date NOT NULL,
  `possession_arme` binary(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Personne`
--

INSERT INTO `T_Personne` (`id_personne`, `nom_pers`, `prenom_pers`, `date_de_naissance`, `possession_arme`) VALUES
(4, 'Javet', 'Alexandre', '1929-02-28', 0x59),
(5, 'Maccaud', 'Olivier', '1912-08-09', 0x4e),
(6, 'Zufferey', 'Christian', '1950-01-01', 0x59),
(7, 'Vujosevic', 'Kristijan', '1999-10-02', 0x4e),
(8, 'Bush', 'George', '1930-01-01', 0x59);

-- --------------------------------------------------------

--
-- Table structure for table `T_Personne_a_scores`
--

CREATE TABLE `T_Personne_a_scores` (
  `id_personne_a_score` int NOT NULL,
  `fk_personne` int NOT NULL,
  `fk_scores` int NOT NULL,
  `fk_concours` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Personne_a_scores`
--

INSERT INTO `T_Personne_a_scores` (`id_personne_a_score`, `fk_personne`, `fk_scores`, `fk_concours`) VALUES
(1, 4, 1, 2),
(2, 5, 3, 2),
(3, 6, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `T_Scores`
--

CREATE TABLE `T_Scores` (
  `id_scores` int NOT NULL,
  `score_cible1` int NOT NULL,
  `score_cible2` int NOT NULL,
  `score_cible3` int NOT NULL,
  `score_cible4` int NOT NULL,
  `score_total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Scores`
--

INSERT INTO `T_Scores` (`id_scores`, `score_cible1`, `score_cible2`, `score_cible3`, `score_cible4`, `score_total`) VALUES
(1, 25, 25, 10, 60, 120),
(2, 24, 26, 9, 61, 120),
(3, 10, 35, 5, 65, 120);

-- --------------------------------------------------------

--
-- Table structure for table `T_Stand_de_tir`
--

CREATE TABLE `T_Stand_de_tir` (
  `id_stand_de_tir` int NOT NULL,
  `nom_stand_de_tir` tinytext COLLATE utf8mb4_general_ci NOT NULL,
  `adresse_stand_de_tir` text COLLATE utf8mb4_general_ci NOT NULL,
  `tel_stand_de_tir` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Stand_de_tir`
--

INSERT INTO `T_Stand_de_tir` (`id_stand_de_tir`, `nom_stand_de_tir`, `adresse_stand_de_tir`, `tel_stand_de_tir`) VALUES
(1, 'Privatir Sàrl', 'Chemin du Petit-Flon 32, 1052 Le Mont-sur-Lausanne', '021 647 37 75'),
(2, 'Stand de tir de Vernand', '1032 Romanel-sur-Lausanne', '021 315 49 71');

-- --------------------------------------------------------

--
-- Table structure for table `T_Type_arme`
--

CREATE TABLE `T_Type_arme` (
  `id_type_arme` int NOT NULL,
  `type_arme` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Type_arme`
--

INSERT INTO `T_Type_arme` (`id_type_arme`, `type_arme`) VALUES
(1, 'Pistolet'),
(2, 'Revolver'),
(3, 'Fusil semi-auto'),
(4, 'Fusil à verrou'),
(5, 'Fusil à pompe'),
(6, 'SMG');

-- --------------------------------------------------------

--
-- Table structure for table `T_Type_concours`
--

CREATE TABLE `T_Type_concours` (
  `id_type_concours` int NOT NULL,
  `type_concours` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `T_Type_concours`
--

INSERT INTO `T_Type_concours` (`id_type_concours`, `type_concours`) VALUES
(1, 'Pistolet - 25m'),
(2, 'Pistolet - 50m'),
(3, 'Pistolet - Tir dynamque'),
(4, 'Fusil - 25m'),
(5, 'Fusil - 50m'),
(6, 'Fusil - 100m'),
(7, 'Fusil - 300m'),
(8, 'Fusil - Tir dynamique');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `T_Armes`
--
ALTER TABLE `T_Armes`
  ADD PRIMARY KEY (`id_arme`),
  ADD KEY `fk_munition` (`fk_munition`),
  ADD KEY `fk_type_arme` (`fk_type_arme`);

--
-- Indexes for table `T_Concours`
--
ALTER TABLE `T_Concours`
  ADD PRIMARY KEY (`id_concours`),
  ADD KEY `fk_stand_de_tir` (`fk_stand_de_tir`),
  ADD KEY `fk_type_concours` (`fk_type_concours`);

--
-- Indexes for table `T_Concours_a_munitions_tirees`
--
ALTER TABLE `T_Concours_a_munitions_tirees`
  ADD PRIMARY KEY (`id_concours_a_munitions_tirees`),
  ADD KEY `fk_concours` (`fk_concours`),
  ADD KEY `fk_munition` (`fk_munition`),
  ADD KEY `fk_personne` (`fk_personne`),
  ADD KEY `fk_stand_de_tir` (`fk_stand_de_tir`);

--
-- Indexes for table `T_Concours_a_presence`
--
ALTER TABLE `T_Concours_a_presence`
  ADD PRIMARY KEY (`id_concours_a_presence`),
  ADD KEY `fk_personne` (`fk_personne`),
  ADD KEY `fk_concours` (`fk_concours`);

--
-- Indexes for table `T_Concours_location_arme`
--
ALTER TABLE `T_Concours_location_arme`
  ADD PRIMARY KEY (`id_concours_location_arme`),
  ADD KEY `fk_concours` (`fk_concours`),
  ADD KEY `fk_stand_de_tir` (`fk_stand_de_tir`),
  ADD KEY `fk_arme` (`fk_arme`);

--
-- Indexes for table `T_Munition`
--
ALTER TABLE `T_Munition`
  ADD PRIMARY KEY (`id_munition`);

--
-- Indexes for table `T_Personne`
--
ALTER TABLE `T_Personne`
  ADD PRIMARY KEY (`id_personne`);

--
-- Indexes for table `T_Personne_a_scores`
--
ALTER TABLE `T_Personne_a_scores`
  ADD PRIMARY KEY (`id_personne_a_score`),
  ADD KEY `fk_personne` (`fk_personne`),
  ADD KEY `fk_concours` (`fk_concours`),
  ADD KEY `fk_scores` (`fk_scores`);

--
-- Indexes for table `T_Scores`
--
ALTER TABLE `T_Scores`
  ADD PRIMARY KEY (`id_scores`);

--
-- Indexes for table `T_Stand_de_tir`
--
ALTER TABLE `T_Stand_de_tir`
  ADD PRIMARY KEY (`id_stand_de_tir`);

--
-- Indexes for table `T_Type_arme`
--
ALTER TABLE `T_Type_arme`
  ADD PRIMARY KEY (`id_type_arme`);

--
-- Indexes for table `T_Type_concours`
--
ALTER TABLE `T_Type_concours`
  ADD PRIMARY KEY (`id_type_concours`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `T_Armes`
--
ALTER TABLE `T_Armes`
  MODIFY `id_arme` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `T_Concours`
--
ALTER TABLE `T_Concours`
  MODIFY `id_concours` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `T_Concours_a_munitions_tirees`
--
ALTER TABLE `T_Concours_a_munitions_tirees`
  MODIFY `id_concours_a_munitions_tirees` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `T_Concours_a_presence`
--
ALTER TABLE `T_Concours_a_presence`
  MODIFY `id_concours_a_presence` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `T_Concours_location_arme`
--
ALTER TABLE `T_Concours_location_arme`
  MODIFY `id_concours_location_arme` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `T_Munition`
--
ALTER TABLE `T_Munition`
  MODIFY `id_munition` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `T_Personne`
--
ALTER TABLE `T_Personne`
  MODIFY `id_personne` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `T_Personne_a_scores`
--
ALTER TABLE `T_Personne_a_scores`
  MODIFY `id_personne_a_score` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `T_Scores`
--
ALTER TABLE `T_Scores`
  MODIFY `id_scores` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `T_Stand_de_tir`
--
ALTER TABLE `T_Stand_de_tir`
  MODIFY `id_stand_de_tir` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `T_Type_arme`
--
ALTER TABLE `T_Type_arme`
  MODIFY `id_type_arme` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `T_Type_concours`
--
ALTER TABLE `T_Type_concours`
  MODIFY `id_type_concours` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `T_Armes`
--
ALTER TABLE `T_Armes`
  ADD CONSTRAINT `T_Armes_ibfk_1` FOREIGN KEY (`fk_munition`) REFERENCES `T_Munition` (`id_munition`),
  ADD CONSTRAINT `T_Armes_ibfk_2` FOREIGN KEY (`fk_type_arme`) REFERENCES `T_Type_arme` (`id_type_arme`);

--
-- Constraints for table `T_Concours`
--
ALTER TABLE `T_Concours`
  ADD CONSTRAINT `T_Concours_ibfk_1` FOREIGN KEY (`fk_stand_de_tir`) REFERENCES `T_Stand_de_tir` (`id_stand_de_tir`),
  ADD CONSTRAINT `T_Concours_ibfk_2` FOREIGN KEY (`fk_type_concours`) REFERENCES `T_Type_concours` (`id_type_concours`);

--
-- Constraints for table `T_Concours_a_munitions_tirees`
--
ALTER TABLE `T_Concours_a_munitions_tirees`
  ADD CONSTRAINT `T_Concours_a_munitions_tirees_ibfk_1` FOREIGN KEY (`fk_concours`) REFERENCES `T_Concours` (`id_concours`),
  ADD CONSTRAINT `T_Concours_a_munitions_tirees_ibfk_2` FOREIGN KEY (`fk_munition`) REFERENCES `T_Munition` (`id_munition`),
  ADD CONSTRAINT `T_Concours_a_munitions_tirees_ibfk_3` FOREIGN KEY (`fk_personne`) REFERENCES `T_Personne` (`id_personne`),
  ADD CONSTRAINT `T_Concours_a_munitions_tirees_ibfk_4` FOREIGN KEY (`fk_stand_de_tir`) REFERENCES `T_Stand_de_tir` (`id_stand_de_tir`);

--
-- Constraints for table `T_Concours_a_presence`
--
ALTER TABLE `T_Concours_a_presence`
  ADD CONSTRAINT `T_Concours_a_presence_ibfk_2` FOREIGN KEY (`fk_personne`) REFERENCES `T_Personne` (`id_personne`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `T_Concours_a_presence_ibfk_3` FOREIGN KEY (`fk_concours`) REFERENCES `T_Concours` (`id_concours`);

--
-- Constraints for table `T_Concours_location_arme`
--
ALTER TABLE `T_Concours_location_arme`
  ADD CONSTRAINT `T_Concours_location_arme_ibfk_2` FOREIGN KEY (`fk_concours`) REFERENCES `T_Concours` (`id_concours`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `T_Concours_location_arme_ibfk_3` FOREIGN KEY (`fk_stand_de_tir`) REFERENCES `T_Stand_de_tir` (`id_stand_de_tir`),
  ADD CONSTRAINT `T_Concours_location_arme_ibfk_4` FOREIGN KEY (`fk_arme`) REFERENCES `T_Armes` (`id_arme`);

--
-- Constraints for table `T_Personne_a_scores`
--
ALTER TABLE `T_Personne_a_scores`
  ADD CONSTRAINT `T_Personne_a_scores_ibfk_3` FOREIGN KEY (`fk_personne`) REFERENCES `T_Personne` (`id_personne`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `T_Personne_a_scores_ibfk_4` FOREIGN KEY (`fk_concours`) REFERENCES `T_Concours` (`id_concours`),
  ADD CONSTRAINT `T_Personne_a_scores_ibfk_5` FOREIGN KEY (`fk_scores`) REFERENCES `T_Scores` (`id_scores`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
