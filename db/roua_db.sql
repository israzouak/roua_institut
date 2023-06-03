-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 03 juin 2023 à 22:36
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `roua_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `affectation`
--

DROP TABLE IF EXISTS `affectation`;
CREATE TABLE IF NOT EXISTS `affectation` (
  `id_affectation` bigint(21) NOT NULL AUTO_INCREMENT,
  `former_affectation` bigint(21) DEFAULT NULL,
  `formation_affectation` bigint(21) DEFAULT NULL,
  PRIMARY KEY (`id_affectation`),
  KEY `FK_former_has_affectations` (`former_affectation`),
  KEY `FK_formation_has_affectations` (`formation_affectation`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `affectation`
--

INSERT INTO `affectation` (`id_affectation`, `former_affectation`, `formation_affectation`) VALUES
(1, 2, 1),
(2, 4, 2),
(3, 2, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

DROP TABLE IF EXISTS `domaine`;
CREATE TABLE IF NOT EXISTS `domaine` (
  `id_domaine` bigint(21) NOT NULL AUTO_INCREMENT,
  `reference_domaine` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_domaine` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_domaine` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_domaine`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `domaine`
--

INSERT INTO `domaine` (`id_domaine`, `reference_domaine`, `title_domaine`, `state_domaine`) VALUES
(1, '1111', 'Langues', 1),
(2, '2222', 'Informatique', 1),
(3, '3333', 'Couture', 1),
(4, '4444', 'Cuisine', 1);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `id_formation` bigint(21) NOT NULL AUTO_INCREMENT,
  `reference_formation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_formation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary_formation` longtext COLLATE utf8_unicode_ci,
  `image_formation` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default.jpg',
  `duration_formation` int(10) DEFAULT NULL,
  `price_formation` bigint(21) DEFAULT '0',
  `promotion_formation` bigint(21) DEFAULT '0',
  `added_date_formation` datetime DEFAULT CURRENT_TIMESTAMP,
  `level_formation` int(2) DEFAULT '1',
  `views_number_formation` bigint(21) DEFAULT '0',
  `type_formation` tinyint(1) DEFAULT '1',
  `state_formation` tinyint(1) DEFAULT '1',
  `domaine_formation` bigint(21) DEFAULT NULL,
  PRIMARY KEY (`id_formation`),
  KEY `FK_domaine_has_formations` (`domaine_formation`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id_formation`, `reference_formation`, `title_formation`, `summary_formation`, `image_formation`, `duration_formation`, `price_formation`, `promotion_formation`, `added_date_formation`, `level_formation`, `views_number_formation`, `type_formation`, `state_formation`, `domaine_formation`) VALUES
(1, '1111', 'English', 'Summary of Englis Formation', 'default.jpg', 20, 20000, 20000, '2023-06-03 00:00:00', 1, 0, 1, 1, 1),
(2, '2222', 'Programmation avec Python', 'Sammary of python formation', 'default.jpg', 20, 20000, 0, '2023-06-03 00:00:00', 1, 0, 1, 1, 2),
(3, '3333', 'Stylisme', 'Sammary if Stylism', 'default.jpg', 20, 20000, 0, '2023-06-03 00:00:00', 1, 0, 1, 1, 3),
(4, '4444', 'Cake Design', 'Sammary of Cake Design Formation', 'default.jpg', 20, 20000, 0, '2023-06-03 00:00:00', 1, 0, 1, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
CREATE TABLE IF NOT EXISTS `subscription` (
  `id_subscription` bigint(21) NOT NULL AUTO_INCREMENT,
  `reference_subscription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_subscription` bigint(21) DEFAULT NULL,
  `start_date_subscription` date DEFAULT NULL,
  `end_date_subscription` date DEFAULT NULL,
  `added_date_subscription` datetime DEFAULT CURRENT_TIMESTAMP,
  `evaluation_subscription` tinyint(1) DEFAULT NULL,
  `state_subscription` tinyint(1) DEFAULT '1',
  `learner_subscription` bigint(21) DEFAULT NULL,
  `formation_subscription` bigint(21) DEFAULT NULL,
  PRIMARY KEY (`id_subscription`),
  KEY `FK_formation_has_subscriptions` (`formation_subscription`),
  KEY `FK_learner_has_subscriptions` (`learner_subscription`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `subscription`
--

INSERT INTO `subscription` (`id_subscription`, `reference_subscription`, `payment_subscription`, `start_date_subscription`, `end_date_subscription`, `added_date_subscription`, `evaluation_subscription`, `state_subscription`, `learner_subscription`, `formation_subscription`) VALUES
(1, '5956f5d4', NULL, NULL, NULL, '2023-06-03 20:34:39', NULL, 1, 3, 1),
(2, '590201cb', NULL, NULL, NULL, '2023-06-03 20:35:56', NULL, 1, 3, 2),
(3, '3333', 0, NULL, NULL, '2023-06-03 21:25:00', NULL, 1, 3, 3),
(4, '20c4dba2', NULL, NULL, NULL, '2023-06-03 23:35:13', NULL, 1, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` bigint(21) NOT NULL AUTO_INCREMENT,
  `reference_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name_user` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name_user` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date_user` date DEFAULT NULL,
  `biography_user` longtext COLLATE utf8_unicode_ci,
  `login_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_user` tinyint(1) DEFAULT '1',
  `state_user` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `reference_user`, `first_name_user`, `last_name_user`, `email_user`, `mobile_user`, `address_user`, `birth_date_user`, `biography_user`, `login_user`, `password_user`, `type_user`, `state_user`) VALUES
(1, '11111111', 'Isra', 'ZOUAK', 'isra_zouak@gmail.com', '06 00 00 00 00', 'Annaba 23000', '2000-01-01', NULL, 'isra_zouak', '123456', 3, 1),
(2, '22222222', 'Khansa', 'ZOUAK', 'khansa_zouak@gmail.com', '06 00 00 00 00', 'Annaba 23000', '1992-01-01', 'Parcours professionnel de Khansa ZOUAK', 'khansa_zouak', '123456', 2, 1),
(3, '33333333', 'Salsabil', 'ZOUAK', 'salsabil_zouak@gmail.com', '06 00 00 00 00', 'Annaba 23000', '1995-01-01', NULL, 'salsabil_zouak', '123456', 1, 1),
(4, 'e280f632', 'SAID', 'MALLEM', 'said.mallem.info@gmail.com', '+213666008907', '33 E Coopérative Ennaoures', '1980-01-01', 'Expert en informatique...', 'said_mallem', '123456', 2, 1),
(5, 'aae2c7cd', 'TAT', 'TATA', 'tata@gmail.com', '0600000000', 'TATA', '2000-01-01', 'TATA', 'tata', 'tata', 1, 1),
(6, 'aeaf2e60', 'SAID', 'MALLEM', 'saidmallem@gmail.com', '+213666008907', '33 E Coopérative Ennaoures', '1981-05-04', 'RAS', 'said_mallem_', '123456', 1, 1),
(7, '71df7225', 'SAID', 'MALLEM', 'saidmallem@gmail.com', '+213666008907', '33 E Coopérative Ennaoures', '2000-01-01', 'RAS', 'azerty', '123456', 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
