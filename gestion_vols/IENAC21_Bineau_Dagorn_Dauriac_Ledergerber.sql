-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 22 avr. 2022 à 10:04
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

-- --------------------------------------------------------

--
-- Structure de la table `aeroclub`
--

CREATE TABLE `aeroclub` (
  `idAeroclub` int NOT NULL,
  `nomAeroclub` varchar(50) NOT NULL,
  `color` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `aeroclub`
--

INSERT INTO `aeroclub` (`idAeroclub`, `nomAeroclub`, `color`) VALUES
(1, 'acriv', 'rouge'),
(2, 'Aéroclub Polygone 67', 'bleu'),
(3, 'Aéroclub Leognan Saucats', 'vert');

-- --------------------------------------------------------

--
-- Structure de la table `avions`
--

CREATE TABLE `avions` (
  `idAvion` int NOT NULL,
  `immatAvion` varchar(20) NOT NULL,
  `typeAvion` varchar(20) NOT NULL,
  `idAeroclub` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `avions`
--

INSERT INTO `avions` (`idAvion`, `immatAvion`, `typeAvion`, `idAeroclub`) VALUES
(1, 'F-BOUD', 'A380', 2),
(2, 'D-STAR', 'TB10', 1),
(3, 'F-HZOP', 'CRJ1000', 3),
(4, 'F-HVIU', 'DR400', 3),
(5, 'F-PLAQ', 'DR400', 1);

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `idEvent` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `text` text,
  `idAvion` int NOT NULL,
  `idType` varchar(10) NOT NULL,
  `idUserReserver` int NOT NULL,
  `idUserEnseigner` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`idEvent`, `start_date`, `end_date`, `text`, `idAvion`, `idType`, `idUserReserver`, `idUserEnseigner`) VALUES
(1, '2022-05-14 10:00:00', '2022-05-14 11:00:00', 'vroum vroum l\'a trois huit eau', 1, 'TV2', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `identification`
--

CREATE TABLE `identification` (
  `idUser` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `motPasse` varchar(100) NOT NULL,
  `statut` int NOT NULL,
  `avatar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `identification`
--

INSERT INTO `identification` (`idUser`, `nom`, `prenom`, `mail`, `login`, `motPasse`, `statut`, `avatar`) VALUES
(1, 'Cujoh', 'Jolyne', 'jo.cujoh@gmail.com', 'JoJo', 'secudeouf', 1, 'avatar 1 je capte pas quoi mettre ici'),
(2, 'Roger', 'Gold', 'golddroger@orange.fr', 'groger', 'secudeoufAUSSI', 1, 'Je sais toujours pas quoi mettre merci à tous');

-- --------------------------------------------------------

--
-- Structure de la table `typeVol`
--

CREATE TABLE `typeVol` (
  `idType` varchar(10) NOT NULL,
  `nomType` varchar(100) NOT NULL DEFAULT 'VFR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `typeVol`
--

INSERT INTO `typeVol` (`idType`, `nomType`) VALUES
('TV1', 'VFR'),
('TV2', 'IFR');

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
  ADD UNIQUE KEY `immatAvion` (`immatAvion`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`idEvent`);

--
-- Index pour la table `identification`
--
ALTER TABLE `identification`
  ADD PRIMARY KEY (`idUser`);

--
-- Index pour la table `typeVol`
--
ALTER TABLE `typeVol`
  ADD PRIMARY KEY (`idType`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aeroclub`
--
ALTER TABLE `aeroclub`
  MODIFY `idAeroclub` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `avions`
--
ALTER TABLE `avions`
  MODIFY `idAvion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `idEvent` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `identification`
--
ALTER TABLE `identification`
  MODIFY `idUser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
