<<<<<<< HEAD
-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 30 mai 2022 à 09:15
-- Version du serveur :  8.0.25-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `IENAC21_Bineau_Dagorn_Dauriac_Ledergerber`
--
CREATE DATABASE IF NOT EXISTS `IENAC21_Bineau_Dagorn_Dauriac_Ledergerber` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `IENAC21_Bineau_Dagorn_Dauriac_Ledergerber`;

-- --------------------------------------------------------

--
-- Structure de la table `aeroclub`
--

CREATE TABLE `aeroclub` (
  `idAeroclub` int NOT NULL,
  `nomAeroclub` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aeroclub`
--

INSERT INTO `aeroclub` (`idAeroclub`, `nomAeroclub`, `color`) VALUES
(1, 'acriv', 'rouge'),
(2, 'Aéroclub Polygone 67', 'bleu'),
(3, 'Aéroclub Leognan Saucats', 'vert'),
(4, 'Aéroclub de la côte de granit', 'Fushia'),
(5, 'Aéroclub airbus france', 'gris'),
(6, 'Aéroclub Eric Olivier', 'blanc');

-- --------------------------------------------------------

--
-- Structure de la table `avions`
--

CREATE TABLE `avions` (
  `idAvion` int NOT NULL,
  `immatAvion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `typeAvion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idAeroclub` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `avions`
--

INSERT INTO `avions` (`idAvion`, `immatAvion`, `typeAvion`, `idAeroclub`) VALUES
(1, 'F-BOUD', 'A-380', 2),
(2, 'D-STAR', 'TB-10', 1),
(3, 'F-HZOP', 'CRJ1000', 3),
(4, 'F-HVIU', 'DR-400', 3),
(5, 'F-PLAQ', 'DR-400', 1),
(6, 'F-OZPE', 'DR-400', 4),
(7, 'F-AFZJ', 'Concorde', 5),
(8, 'F-SUUU', 'Cessna 172', 4),
(9, 'F-MUCH', 'Cessna 182', 6),
(10, 'F-OFFI', 'A-330', 2),
(11, 'G-OACI', 'Piper-Arrow', 2);

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `idEvent` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `idAvion` int NOT NULL,
  `idTypeVol` int NOT NULL DEFAULT '1',
  `idUserReserver` int NOT NULL,
  `idUserEnseigner` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`idEvent`, `start_date`, `end_date`, `text`, `idAvion`, `idTypeVol`, `idUserReserver`, `idUserEnseigner`) VALUES
(1, '2022-05-14 10:00:00', '2022-05-14 11:00:00', 'vroum vroum l a trois huit eau', 1, 2, 1, NULL),
(2, '2022-05-14 10:00:00', '2022-05-14 11:00:00', 'DR400 aeroclub de la cote de granit sortie', 6, 1, 10, NULL),
(3, '2022-05-15 14:30:00', '2022-05-15 17:00:00', 'Sortie du coté des alizés', 9, 1, 8, 11),
(4, '2022-05-15 08:00:00', '2022-05-15 08:30:00', 'vol de dérouillage pour la journée', 7, 2, 4, NULL),
(5, '2022-05-15 09:00:00', '2022-05-15 10:30:00', 'sortie pour aller a Nuuk', 7, 2, 6, 11),
(6, '2022-05-15 11:00:00', '2022-05-15 12:00:00', 'vol d initiation avant de manger', 7, 2, 10, 11),
(7, '2022-05-15 12:30:00', '2022-05-15 14:00:00', 'Vol petite sortie à Concarneau', 7, 2, 1, NULL),
(8, '2022-05-15 15:00:00', '2022-05-15 16:00:00', 'looping', 7, 2, 9, NULL),
(9, '2022-05-15 18:00:00', '2022-05-15 18:30:00', 'test vérification des moteurs à l’huile de friture', 7, 2, 4, NULL),
(10, '2022-05-14 07:00:00', '2022-05-14 13:00:00', 'Allé retour a New York pour manger un donut', 7, 2, 5, NULL),
(11, '2022-05-14 15:00:00', '2022-05-14 16:00:00', 'test de vol en IFR', 7, 2, 6, 11),
(33, '2022-05-13 08:00:00', '2022-05-13 08:30:00', 'vol de dérouillage pour la journée', 7, 2, 2, NULL),
(34, '2022-05-13 09:30:00', '2022-05-13 10:30:00', 'sortie rapide', 7, 2, 9, NULL),

-- --------------------------------------------------------

--
-- Structure de la table `identification`
--

CREATE TABLE `identification` (
  `idUser` int NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `motPasse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `statut` int NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `identification`
--

INSERT INTO `identification` (`idUser`, `nom`, `prenom`, `mail`, `login`, `motPasse`, `statut`, `avatar`) VALUES
(1, 'Cujoh', 'Jolyne', 'jo.cujoh@gmail.com', 'JoJo', 'a1261932825216cd8e6467efb76c75cf457ab48cd9f27b3141612b01b45ae1a5', 1, '10'),
(2, 'Roger', 'Gold', 'golddroger@orange.fr', 'groger', '0f50dbd7a4eca96c909c79459d06aa799ce861e202a06307dad0d80b6bf9d987', 1, '9'),
(3, 'Pidou', 'George', 'pompidou@alumni.enac.fr', 'gpidou', '849dc75289b318178843d550a715c8d520064e2dbc98242df2d2c734f0c405fe', 1, '5'),
(4, 'Blues', 'Jake', 'jake.blues@gmail.com', 'JakeChicagoLover', '7f4d5d23ae750c5837b4ad78066a02e670ca060a10b6ef246e85503eaeb80ec7', 2, '11'),
(5, 'Blues', 'Elwood', 'elwood.blues@gmail.com', 'Elwood', '6505cf667b2778a92f45fe1f8db44794e88dd3f6f8867e84c6b3d04885bd9577', 3, '7'),
(6, 'Schultz', 'King', 'docteur.schultz@wanadoo.fr', 'Schultz', '2ac2da2370ddba49b1122b9f9e7fb579eb1df86f9a368e09065bbb684761c3c1', 2, '3'),
(7, 'Goodman', 'Saul', 'itsallgoodman@advocate.us', 'SaulGoodman', '8f859599b7457b3aa662c7c0329e5401a982aca9797582fcce7b6eecffbc61ba', 1, '8'),
(8, 'Alderson', 'Eliott', 'alderson@gmail.com', 'EliottAl', '17c64ee62f8a141ae6ed2d0a33fb3bbc6140c2730294a98bab533ca6fbe7a85f', 2, '2'),
(9, 'Pond', 'Amy', 'amy.pond@uk-police.com', 'Amy', '7281d1e65e4fb38395ffb4326ba1e63b8957f5409fa468262fca91976cbc1ac3', 1, '9'),
(10, 'Shelby', 'Arthur', 'arthur@shelby-inc-int-co.com', 'Fookin_Arthur', 'd22b30f2bc3ee8b4dbb021afc99914573b346c5be3123fc874cd403a6a53ac2c', 2, '4'),
(11, 'Jonàsson', 'Gry', 'gry.jonasson@norge-edda.no', 'Sif', '932f5464e9569db1dff28022d12d42e7bf7a4454c2475ae40f0e21b3848832d3', 1, '6');

-- --------------------------------------------------------

--
-- Structure de la table `typeVol`
--

CREATE TABLE `typeVol` (
  `idTypeVol` int NOT NULL,
  `nomTypeVol` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'VFR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `typeVol`
--

INSERT INTO `typeVol` (`idTypeVol`, `nomTypeVol`) VALUES
(1, 'VFR'),
(2, 'IFR');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aeroclub`
--
ALTER TABLE `aeroclub`
  ADD PRIMARY KEY (`idAeroclub`);

--
-- Index pour la table `avions`
--
ALTER TABLE `avions`
  ADD PRIMARY KEY (`idAvion`),
  ADD UNIQUE KEY `immatAvion` (`immatAvion`),
  ADD KEY `idAeroclub_tableAvion` (`idAeroclub`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`idEvent`),
  ADD KEY `idTypeVol_Event` (`idTypeVol`),
  ADD KEY `idUserReserver_Event` (`idUserReserver`),
  ADD KEY `idUserEnseigner_Event` (`idUserEnseigner`),
  ADD KEY `idAvion_Event` (`idAvion`);

--
-- Index pour la table `identification`
--
ALTER TABLE `identification`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Index pour la table `typeVol`
--
ALTER TABLE `typeVol`
  ADD PRIMARY KEY (`idTypeVol`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aeroclub`
--
ALTER TABLE `aeroclub`
  MODIFY `idAeroclub` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `avions`
--
ALTER TABLE `avions`
  MODIFY `idAvion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `idEvent` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `identification`
--
ALTER TABLE `identification`
  MODIFY `idUser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `typeVol`
--
ALTER TABLE `typeVol`
  MODIFY `idTypeVol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avions`
--
ALTER TABLE `avions`
  ADD CONSTRAINT `idAeroclub_tableAvion` FOREIGN KEY (`idAeroclub`) REFERENCES `aeroclub` (`idAeroclub`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `idAvion_Event` FOREIGN KEY (`idAvion`) REFERENCES `avions` (`idAvion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idTypeVol_Event` FOREIGN KEY (`idTypeVol`) REFERENCES `typeVol` (`idTypeVol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idUserEnseigner_Event` FOREIGN KEY (`idUserEnseigner`) REFERENCES `identification` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idUserReserver_Event` FOREIGN KEY (`idUserReserver`) REFERENCES `identification` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
=======
-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 30 mai 2022 à 09:15
-- Version du serveur :  8.0.25-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `IENAC21_Bineau_Dagorn_Dauriac_Ledergerber`
--
CREATE DATABASE IF NOT EXISTS `IENAC21_Bineau_Dagorn_Dauriac_Ledergerber` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `IENAC21_Bineau_Dagorn_Dauriac_Ledergerber`;

-- --------------------------------------------------------

--
-- Structure de la table `aeroclub`
--

CREATE TABLE `aeroclub` (
  `idAeroclub` int NOT NULL,
  `nomAeroclub` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aeroclub`
--

INSERT INTO `aeroclub` (`idAeroclub`, `nomAeroclub`, `color`) VALUES
(1, 'acriv', 'rouge'),
(2, 'Aéroclub Polygone 67', 'bleu'),
(3, 'Aéroclub Leognan Saucats', 'vert'),
(4, 'Aéroclub de la côte de granit', 'Fushia'),
(5, 'Aéroclub airbus france', 'gris'),
(6, 'Aéroclub Eric Olivier', 'blanc');

-- --------------------------------------------------------

--
-- Structure de la table `avions`
--

CREATE TABLE `avions` (
  `idAvion` int NOT NULL,
  `immatAvion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `typeAvion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idAeroclub` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `avions`
--

INSERT INTO `avions` (`idAvion`, `immatAvion`, `typeAvion`, `idAeroclub`) VALUES
(1, 'F-BOUD', 'A-380', 2),
(2, 'D-STAR', 'TB-10', 1),
(3, 'F-HZOP', 'CRJ1000', 3),
(4, 'F-HVIU', 'DR-400', 3),
(5, 'F-PLAQ', 'DR-400', 1),
(6, 'F-OZPE', 'DR-400', 4),
(7, 'F-AFZJ', 'Concorde', 5),
(8, 'F-SUUU', 'Cessna 172', 4),
(9, 'F-MUCH', 'Cessna 182', 6),
(10, 'F-OFFI', 'A-330', 2),
(11, 'G-OACI', 'Piper-Arrow', 2);

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `idEvent` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `idAvion` int NOT NULL,
  `idTypeVol` int NOT NULL DEFAULT '1',
  `idUserReserver` int NOT NULL,
  `idUserEnseigner` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`idEvent`, `start_date`, `end_date`, `text`, `idAvion`, `idTypeVol`, `idUserReserver`, `idUserEnseigner`) VALUES
(1, '2022-05-14 10:00:00', '2022-05-14 11:00:00', 'vroum vroum l a trois huit eau', 1, 2, 1, NULL),
(2, '2022-05-14 10:00:00', '2022-05-14 11:00:00', 'DR400 aeroclub de la cote de granit sortie', 6, 1, 10, NULL),
(3, '2022-05-15 14:30:00', '2022-05-15 17:00:00', 'Sortie du coté des alizés', 9, 1, 8, 11),
(4, '2022-05-15 08:00:00', '2022-05-15 08:30:00', 'vol de dérouillage pour la journée', 7, 2, 4, NULL),
(5, '2022-05-15 09:00:00', '2022-05-15 10:30:00', 'sortie pour aller a Nuuk', 7, 2, 6, 11),
(6, '2022-05-15 11:00:00', '2022-05-15 12:00:00', 'vol d initiation avant de manger', 7, 2, 10, 11),
(7, '2022-05-15 12:30:00', '2022-05-15 14:00:00', 'Vol petite sortie à Concarneau', 7, 2, 1, NULL),
(8, '2022-05-15 15:00:00', '2022-05-15 16:00:00', 'looping', 7, 2, 9, NULL),
(9, '2022-05-15 18:00:00', '2022-05-15 18:30:00', 'test vérification des moteurs à l’huile de friture', 7, 2, 4, NULL),
(10, '2022-05-14 07:00:00', '2022-05-14 13:00:00', 'Allé retour a New York pour manger un donut', 7, 2, 5, NULL),
(11, '2022-05-14 15:00:00', '2022-05-14 16:00:00', 'test de vol en IFR', 7, 2, 6, 11),
(33, '2022-05-13 08:00:00', '2022-05-13 08:30:00', 'vol de dérouillage pour la journée', 7, 2, 2, NULL),
(34, '2022-05-13 09:30:00', '2022-05-13 10:30:00', 'sortie rapide', 7, 2, 9, NULL),

-- --------------------------------------------------------

--
-- Structure de la table `identification`
--

CREATE TABLE `identification` (
  `idUser` int NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `motPasse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `statut` int NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `identification`
--

INSERT INTO `identification` (`idUser`, `nom`, `prenom`, `mail`, `login`, `motPasse`, `statut`, `avatar`) VALUES
(1, 'Cujoh', 'Jolyne', 'jo.cujoh@gmail.com', 'JoJo', 'a1261932825216cd8e6467efb76c75cf457ab48cd9f27b3141612b01b45ae1a5', 1, '10'),
(2, 'Roger', 'Gold', 'golddroger@orange.fr', 'groger', '0f50dbd7a4eca96c909c79459d06aa799ce861e202a06307dad0d80b6bf9d987', 1, '9'),
(3, 'Pidou', 'George', 'pompidou@alumni.enac.fr', 'gpidou', '849dc75289b318178843d550a715c8d520064e2dbc98242df2d2c734f0c405fe', 1, '5'),
(4, 'Blues', 'Jake', 'jake.blues@gmail.com', 'JakeChicagoLover', '7f4d5d23ae750c5837b4ad78066a02e670ca060a10b6ef246e85503eaeb80ec7', 2, '11'),
(5, 'Blues', 'Elwood', 'elwood.blues@gmail.com', 'Elwood', '6505cf667b2778a92f45fe1f8db44794e88dd3f6f8867e84c6b3d04885bd9577', 3, '7'),
(6, 'Schultz', 'King', 'docteur.schultz@wanadoo.fr', 'Schultz', '2ac2da2370ddba49b1122b9f9e7fb579eb1df86f9a368e09065bbb684761c3c1', 2, '3'),
(7, 'Goodman', 'Saul', 'itsallgoodman@advocate.us', 'SaulGoodman', '8f859599b7457b3aa662c7c0329e5401a982aca9797582fcce7b6eecffbc61ba', 1, '8'),
(8, 'Alderson', 'Eliott', 'alderson@gmail.com', 'EliottAl', '17c64ee62f8a141ae6ed2d0a33fb3bbc6140c2730294a98bab533ca6fbe7a85f', 2, '2'),
(9, 'Pond', 'Amy', 'amy.pond@uk-police.com', 'Amy', '7281d1e65e4fb38395ffb4326ba1e63b8957f5409fa468262fca91976cbc1ac3', 1, '9'),
(10, 'Shelby', 'Arthur', 'arthur@shelby-inc-int-co.com', 'Fookin_Arthur', 'd22b30f2bc3ee8b4dbb021afc99914573b346c5be3123fc874cd403a6a53ac2c', 2, '4'),
(11, 'Jonàsson', 'Gry', 'gry.jonasson@norge-edda.no', 'Sif', '932f5464e9569db1dff28022d12d42e7bf7a4454c2475ae40f0e21b3848832d3', 1, '6');

-- --------------------------------------------------------

--
-- Structure de la table `typeVol`
--

CREATE TABLE `typeVol` (
  `idTypeVol` int NOT NULL,
  `nomTypeVol` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'VFR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `typeVol`
--

INSERT INTO `typeVol` (`idTypeVol`, `nomTypeVol`) VALUES
(1, 'VFR'),
(2, 'IFR');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aeroclub`
--
ALTER TABLE `aeroclub`
  ADD PRIMARY KEY (`idAeroclub`);

--
-- Index pour la table `avions`
--
ALTER TABLE `avions`
  ADD PRIMARY KEY (`idAvion`),
  ADD UNIQUE KEY `immatAvion` (`immatAvion`),
  ADD KEY `idAeroclub_tableAvion` (`idAeroclub`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`idEvent`),
  ADD KEY `idTypeVol_Event` (`idTypeVol`),
  ADD KEY `idUserReserver_Event` (`idUserReserver`),
  ADD KEY `idUserEnseigner_Event` (`idUserEnseigner`),
  ADD KEY `idAvion_Event` (`idAvion`);

--
-- Index pour la table `identification`
--
ALTER TABLE `identification`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Index pour la table `typeVol`
--
ALTER TABLE `typeVol`
  ADD PRIMARY KEY (`idTypeVol`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aeroclub`
--
ALTER TABLE `aeroclub`
  MODIFY `idAeroclub` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `avions`
--
ALTER TABLE `avions`
  MODIFY `idAvion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `idEvent` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `identification`
--
ALTER TABLE `identification`
  MODIFY `idUser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `typeVol`
--
ALTER TABLE `typeVol`
  MODIFY `idTypeVol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avions`
--
ALTER TABLE `avions`
  ADD CONSTRAINT `idAeroclub_tableAvion` FOREIGN KEY (`idAeroclub`) REFERENCES `aeroclub` (`idAeroclub`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `idAvion_Event` FOREIGN KEY (`idAvion`) REFERENCES `avions` (`idAvion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idTypeVol_Event` FOREIGN KEY (`idTypeVol`) REFERENCES `typeVol` (`idTypeVol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idUserEnseigner_Event` FOREIGN KEY (`idUserEnseigner`) REFERENCES `identification` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idUserReserver_Event` FOREIGN KEY (`idUserReserver`) REFERENCES `identification` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
>>>>>>> e94b36460534b4a444578ad25515e110fce4d416
