-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 17 juin 2026 à 09:05
-- Version du serveur : 5.7.24
-- Version de PHP : 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `collection_perso`
--

-- --------------------------------------------------------

--
-- Structure de la table `collections`
--

CREATE TABLE `collections` (
  `id_collection` int(11) NOT NULL,
  `nom_collection` varchar(150) NOT NULL,
  `id_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `collections`
--

INSERT INTO `collections` (`id_collection`, `nom_collection`, `id_type`) VALUES
(1, 'One Piece', 1),
(2, 'Naruto', 1),
(3, 'Avatar 3', 2),
(4, 'Avatar 3', 2),
(5, 'Avatar 3', 2),
(6, 'Avatar 3', 2),
(7, 'Avatar 3', 2),
(8, 'Avatar 3', 2),
(9, 'Avatar 3', 2),
(10, 'Avatar 3', 2),
(11, 'Avatar 3', 2),
(12, 'Avatar 2', 2);

-- --------------------------------------------------------

--
-- Structure de la table `elements_collection`
--

CREATE TABLE `elements_collection` (
  `id_element` int(11) NOT NULL,
  `titre_element` varchar(150) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `possede` tinyint(1) DEFAULT '1',
  `id_collection` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `elements_collection`
--

INSERT INTO `elements_collection` (`id_element`, `titre_element`, `numero`, `possede`, `id_collection`) VALUES
(1, 'Tome 1', 1, 1, 1),
(2, 'Tome 2', 2, 1, 1),
(3, 'Tome 3', 3, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

CREATE TABLE `emprunts` (
  `id_emprunt` int(11) NOT NULL,
  `nom_emprunteur` varchar(100) DEFAULT NULL,
  `date_emprunt` date DEFAULT NULL,
  `date_retour` date DEFAULT NULL,
  `id_element` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `types_collection`
--

CREATE TABLE `types_collection` (
  `id_type` int(11) NOT NULL,
  `nom_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `types_collection`
--

INSERT INTO `types_collection` (`id_type`, `nom_type`) VALUES
(1, 'Manga'),
(2, 'Film'),
(3, 'Jeu vidéo');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id_collection`),
  ADD KEY `id_type` (`id_type`);

--
-- Index pour la table `elements_collection`
--
ALTER TABLE `elements_collection`
  ADD PRIMARY KEY (`id_element`),
  ADD KEY `id_collection` (`id_collection`);

--
-- Index pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD PRIMARY KEY (`id_emprunt`),
  ADD KEY `id_element` (`id_element`);

--
-- Index pour la table `types_collection`
--
ALTER TABLE `types_collection`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `collections`
--
ALTER TABLE `collections`
  MODIFY `id_collection` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `elements_collection`
--
ALTER TABLE `elements_collection`
  MODIFY `id_element` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `emprunts`
--
ALTER TABLE `emprunts`
  MODIFY `id_emprunt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `types_collection`
--
ALTER TABLE `types_collection`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `collections`
--
ALTER TABLE `collections`
  ADD CONSTRAINT `collections_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `types_collection` (`id_type`);

--
-- Contraintes pour la table `elements_collection`
--
ALTER TABLE `elements_collection`
  ADD CONSTRAINT `elements_collection_ibfk_1` FOREIGN KEY (`id_collection`) REFERENCES `collections` (`id_collection`);

--
-- Contraintes pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`id_element`) REFERENCES `elements_collection` (`id_element`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
