-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 01 juin 2023 à 17:19
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `affectation`
--

INSERT INTO `affectation` (`id_affectation`, `former_affectation`, `formation_affectation`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 4, 10),
(6, 4, 12);

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `domaine`
--

INSERT INTO `domaine` (`id_domaine`, `reference_domaine`, `title_domaine`, `state_domaine`) VALUES
(1, '1111', 'Langues', 1),
(2, '2222', 'Programmation', 1),
(3, '3333', 'Bureautique', 1),
(4, '4444', 'Couture', 1),
(5, '5555', 'Cuisine', 1),
(6, '6666', 'Développement Web', 1);

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
  `added_date_formation` date DEFAULT NULL,
  `level_formation` int(2) DEFAULT '1',
  `views_number_formation` bigint(21) DEFAULT '0',
  `type_formation` tinyint(1) DEFAULT NULL,
  `state_formation` tinyint(1) DEFAULT '1',
  `domaine_formation` bigint(21) DEFAULT NULL,
  PRIMARY KEY (`id_formation`),
  KEY `FK_domaine_has_formations` (`domaine_formation`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id_formation`, `reference_formation`, `title_formation`, `summary_formation`, `image_formation`, `duration_formation`, `price_formation`, `promotion_formation`, `added_date_formation`, `level_formation`, `views_number_formation`, `type_formation`, `state_formation`, `domaine_formation`) VALUES
(1, '111111', 'Donec tempor', 'amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc', 'default.jpg', 20, 9000, 0, '2023-05-20', 1, 0, 1, 1, 1),
(2, '76012784', 'eleifend. Cras sed', 'velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat.', 'default.jpg', 19, 15901, 0, '2021-11-21', 1, 0, 1, 1, 1),
(3, '425742671', 'Donec tempor, est', 'Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit,', 'default.jpg', 13, 8922, 0, '2023-05-07', 1, 0, 1, 1, 4),
(4, '1486306', 'dignissim pharetra. Nam', 'amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc', 'default.jpg', 13, 35300, 0, '2023-05-13', 1, 0, 1, 1, 2),
(5, '322237146', 'non, egestas a,', 'scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed', 'default.jpg', 15, 11118, 0, '2022-07-20', 1, 0, 2, 1, 1),
(6, '78452528', 'Suspendisse dui. Fusce', 'sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi', 'default.jpg', 10, 24539, 0, '2022-12-05', 1, 0, 1, 1, 3),
(7, '29968861', 'semper pretium neque.', 'feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque', 'default.jpg', 15, 19207, 0, '2020-06-02', 2, 0, 2, 1, 2),
(8, '357677777', 'interdum. Sed auctor', 'elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra,', 'default.jpg', 13, 15795, 0, '2022-10-14', 2, 0, 1, 1, 3),
(9, '336768268', 'metus. In nec', 'Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 'default.jpg', 16, 14666, 0, '2020-07-27', 3, 0, 2, 1, 3),
(10, '446267299', 'Vestibulum accumsan neque', 'diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique', 'default.jpg', 11, 14113, 0, '2023-03-22', 1, 0, 1, 1, 6),
(11, '3577775', 'arcu. Vivamus sit', 'augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas', 'default.jpg', 17, 8124, 0, '2021-12-07', 2, 0, 2, 1, 2),
(12, '205248277', 'nunc sed pede.', 'ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet', 'default.jpg', 17, 39415, 0, '2021-12-16', 2, 0, 1, 1, 2),
(13, '85687379', 'et magnis dis', 'commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu', 'default.jpg', 19, 25985, 0, '2023-04-02', 3, 0, 1, 1, 2),
(14, '328443325', 'ligula eu enim.', 'Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit,', 'default.jpg', 15, 16805, 0, '2023-04-04', 1, 0, 2, 1, 5),
(15, '3847748K', 'blandit at, nisi.', 'tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis.', 'default.jpg', 13, 19142, 0, '2022-11-22', 2, 0, 1, 1, 3),
(16, '158807882', 'luctus aliquet odio.', 'diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris', 'default.jpg', 19, 32064, 0, '2021-10-04', 3, 0, 1, 1, 5),
(17, '214019736', 'nunc sed pede.', 'vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus.', 'default.jpg', 18, 32213, 0, '2022-04-10', 2, 0, 1, 1, 3),
(18, '325444703', 'tellus, imperdiet non,', 'sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum.', 'default.jpg', 12, 14241, 0, '2021-04-30', 3, 0, 1, 1, 4),
(19, '293844488', 'Aliquam rutrum lorem', 'purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet', 'default.jpg', 19, 8694, 0, '2021-10-02', 2, 0, 1, 1, 2),
(20, '461555284', 'Fusce mollis. Duis', 'a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla', 'default.jpg', 14, 14051, 0, '2022-10-23', 3, 0, 1, 1, 2),
(21, '301599021', 'eu tellus. Phasellus', 'nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl.', 'default.jpg', 10, 34097, 0, '2020-06-11', 3, 0, 2, 1, 2),
(22, '35862782K', 'cursus in, hendrerit', 'nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere', 'default.jpg', 10, 31067, 0, '2022-01-02', 3, 0, 1, 1, 3),
(23, '321629032', 'mollis lectus pede', 'sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc', 'default.jpg', 10, 39184, 0, '2022-04-07', 2, 0, 1, 1, 6),
(24, '307003775', 'vestibulum massa rutrum', 'mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non', 'default.jpg', 19, 16615, 0, '2020-12-04', 1, 0, 1, 1, 3),
(25, '231696474', 'posuere cubilia Curae', 'felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla', 'default.jpg', 17, 33986, 0, '2020-06-20', 2, 0, 1, 1, 2),
(26, '203431279', 'dictum eleifend, nunc', 'Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer', 'default.jpg', 8, 36739, 0, '2022-09-03', 2, 0, 1, 1, 2),
(27, '279751620', 'lobortis ultrices. Vivamus', 'Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc', 'default.jpg', 9, 21402, 0, '2020-10-06', 3, 0, 1, 1, 1),
(28, '84842133', 'lacus. Aliquam rutrum', 'venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat', 'default.jpg', 16, 26508, 0, '2022-06-08', 2, 0, 2, 1, 5),
(29, '353886851', 'Integer urna. Vivamus', 'dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit', 'default.jpg', 12, 37544, 0, '2023-04-29', 2, 0, 2, 1, 5),
(30, '257357740', 'faucibus. Morbi vehicula.', 'ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc', 'default.jpg', 20, 12570, 0, '2022-06-23', 2, 0, 2, 1, 3),
(31, '355929523', 'non, bibendum sed,', 'adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien,', 'default.jpg', 10, 31848, 0, '2022-05-06', 1, 0, 2, 1, 3),
(32, '285219736', 'faucibus ut, nulla.', 'Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies', 'default.jpg', 17, 30855, 0, '2023-04-04', 2, 0, 1, 1, 5),
(33, '467053507', 'commodo at, libero.', 'Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In', 'default.jpg', 13, 11730, 0, '2020-12-22', 1, 0, 2, 1, 5),
(34, '94358671', 'fames ac turpis', 'posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris', 'default.jpg', 19, 24265, 0, '2022-08-28', 1, 0, 1, 1, 1),
(35, '272787808', 'fringilla est. Mauris', 'Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut', 'default.jpg', 8, 22353, 0, '2020-08-17', 3, 0, 2, 1, 2),
(36, '27172873', 'et magnis dis', 'fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget,', 'default.jpg', 20, 10015, 0, '2022-11-29', 2, 0, 2, 1, 5),
(37, '8844313', 'sed dui. Fusce', 'aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque', 'default.jpg', 12, 22683, 0, '2022-04-06', 2, 0, 1, 1, 3),
(38, '398729080', 'orci. Ut sagittis', 'cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio', 'default.jpg', 17, 36873, 0, '2020-11-08', 1, 0, 1, 1, 3),
(39, '353713701', 'imperdiet ullamcorper. Duis', 'nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum', 'default.jpg', 16, 9014, 0, '2022-05-01', 2, 0, 1, 1, 5),
(40, '21336297', 'fermentum fermentum arcu.', 'ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique', 'default.jpg', 12, 9034, 0, '2023-04-19', 3, 0, 1, 1, 3),
(41, '245641761', 'mollis non, cursus', 'nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras', 'default.jpg', 14, 11601, 0, '2021-09-14', 2, 0, 2, 1, 1),
(42, '325291680', 'molestie tortor nibh', 'lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam', 'default.jpg', 19, 26446, 0, '2023-03-31', 2, 0, 2, 1, 2),
(43, '231116435', 'ac, fermentum vel,', 'eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam.', 'default.jpg', 9, 10446, 0, '2022-09-20', 1, 0, 2, 1, 1),
(44, '344206678', 'rutrum eu, ultrices', 'Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices', 'default.jpg', 16, 26041, 0, '2020-06-05', 2, 0, 1, 1, 4),
(45, '49166281', 'Sed nunc est,', 'ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales', 'default.jpg', 11, 14230, 0, '2022-12-05', 1, 0, 1, 1, 2),
(46, '348291440', 'tristique aliquet. Phasellus', 'euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod', 'default.jpg', 18, 28226, 0, '2022-01-07', 3, 0, 2, 1, 5),
(47, '36947845', 'Pellentesque habitant morbi', 'Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at', 'default.jpg', 16, 32689, 0, '2020-12-29', 1, 0, 1, 1, 4),
(48, '339737339', 'at pretium aliquet,', 'sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus', 'default.jpg', 19, 12653, 0, '2022-01-24', 2, 0, 1, 1, 3),
(49, '17648845', 'eu sem. Pellentesque', 'a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed', 'default.jpg', 18, 18134, 0, '2022-04-28', 3, 0, 1, 1, 4),
(50, '87147533', 'malesuada vel, venenatis', 'interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus.', 'default.jpg', 13, 16913, 0, '2022-03-24', 2, 0, 2, 1, 4),
(51, '144934458', 'adipiscing elit. Curabitur', 'Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla', 'default.jpg', 12, 19823, 0, '2023-02-22', 2, 0, 1, 1, 6),
(52, '294506519', 'rutrum, justo. Praesent', 'nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem', 'default.jpg', 18, 10126, 0, '2023-04-09', 3, 0, 2, 1, 4),
(53, '202657095', 'adipiscing lobortis risus.', 'quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt', 'default.jpg', 19, 33797, 0, '2023-03-15', 2, 0, 1, 1, 4),
(54, '359523548', 'blandit. Nam nulla', 'Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc', 'default.jpg', 17, 30331, 0, '2023-04-20', 1, 0, 2, 1, 1),
(55, '124874890', 'lacinia vitae, sodales', 'lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi', 'default.jpg', 9, 20020, 0, '2022-12-10', 1, 0, 1, 1, 3),
(56, '289177221', 'Cras vehicula aliquet', 'nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus', 'default.jpg', 16, 36065, 0, '2020-06-25', 2, 0, 1, 1, 2),
(57, '261619830', 'suscipit nonummy. Fusce', 'nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl', 'default.jpg', 16, 16503, 0, '2021-01-24', 2, 0, 2, 1, 3),
(58, '149586687', 'odio a purus.', 'tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus', 'default.jpg', 20, 17212, 0, '2022-08-17', 3, 0, 2, 1, 2),
(59, '42646408K', 'eu eros. Nam', 'Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis', 'default.jpg', 16, 27652, 0, '2020-11-11', 3, 0, 2, 1, 5),
(60, '472289659', 'ornare, elit elit', 'Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem,', 'default.jpg', 17, 29046, 0, '2022-04-04', 3, 0, 1, 1, 6),
(61, '211094133', 'at, egestas a,', 'accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare', 'default.jpg', 11, 26227, 0, '2020-06-20', 1, 0, 1, 1, 5),
(62, '263466403', 'non arcu. Vivamus', 'Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper', 'default.jpg', 15, 32931, 0, '2020-12-18', 2, 0, 2, 1, 3),
(63, '37499199K', 'sit amet lorem', 'leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus.', 'default.jpg', 11, 34770, 0, '2022-05-25', 2, 0, 2, 1, 6),
(64, '321409377', 'lectus. Nullam suscipit,', 'enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies', 'default.jpg', 13, 13305, 0, '2022-08-02', 3, 0, 2, 1, 1),
(65, '4558111', 'Sed eu eros.', 'magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et,', 'default.jpg', 12, 9847, 0, '2023-01-27', 1, 0, 1, 1, 6),
(66, '349649632', 'ac, feugiat non,', 'massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate,', 'default.jpg', 13, 33814, 0, '2023-03-27', 2, 0, 2, 1, 4),
(67, '94288169', 'arcu. Vivamus sit', 'aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce', 'default.jpg', 12, 11236, 0, '2022-07-31', 2, 0, 2, 1, 5),
(68, '136669656', 'sagittis felis. Donec', 'vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi', 'default.jpg', 8, 37499, 0, '2020-11-24', 3, 0, 1, 1, 4),
(69, '20837713', 'nunc. In at', 'dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor', 'default.jpg', 15, 26243, 0, '2023-02-05', 2, 0, 1, 1, 4),
(70, '122333361', 'id, blandit at,', 'gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam', 'default.jpg', 11, 24516, 0, '2020-09-23', 2, 0, 2, 1, 5),
(71, '31773302K', 'elementum, dui quis', 'eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam.', 'default.jpg', 12, 24728, 0, '2021-05-14', 2, 0, 2, 1, 2),
(72, '30785127K', 'scelerisque sed, sapien.', 'vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo', 'default.jpg', 16, 36681, 0, '2021-06-03', 2, 0, 1, 1, 3),
(73, '261299461', 'lacinia at, iaculis', 'erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis.', 'default.jpg', 9, 16125, 0, '2022-11-12', 1, 0, 1, 1, 4),
(74, '32250343', 'eget mollis lectus', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh.', 'default.jpg', 14, 37936, 0, '2023-03-14', 1, 0, 1, 1, 3),
(75, '275606081', 'felis. Donec tempor,', 'euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu.', 'default.jpg', 13, 13360, 0, '2020-06-07', 2, 0, 1, 1, 3),
(76, '231356754', 'interdum ligula eu', 'eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam', 'default.jpg', 17, 33042, 0, '2023-01-03', 3, 0, 2, 1, 4),
(77, '28772157', 'eget tincidunt dui', 'natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra.', 'default.jpg', 9, 23880, 0, '2022-12-10', 2, 0, 1, 1, 3),
(78, '298318296', 'turpis vitae purus', 'libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc', 'default.jpg', 19, 25894, 0, '2021-03-19', 1, 0, 2, 1, 2),
(79, '46649486', 'Proin non massa', 'eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer', 'default.jpg', 12, 17931, 0, '2020-11-13', 3, 0, 1, 1, 3),
(80, '107054960', 'turpis egestas. Fusce', 'cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec', 'default.jpg', 15, 16948, 0, '2021-09-11', 1, 0, 2, 1, 4),
(81, '321134068', 'Proin ultrices. Duis', 'est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at,', 'default.jpg', 15, 37863, 0, '2023-01-05', 2, 0, 2, 1, 5),
(82, '94594723', 'libero at auctor', 'purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem', 'default.jpg', 14, 17493, 0, '2021-09-07', 3, 0, 1, 1, 4),
(83, '103274281', 'aliquet diam. Sed', 'convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede.', 'default.jpg', 20, 33163, 0, '2023-04-13', 3, 0, 2, 1, 4),
(84, '486947896', 'Aliquam erat volutpat.', 'feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec,', 'default.jpg', 12, 25315, 0, '2020-12-14', 1, 0, 1, 1, 5),
(85, '295965061', 'Proin vel arcu', 'eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum', 'default.jpg', 13, 38787, 0, '2021-10-02', 3, 0, 1, 1, 5),
(86, '378648572', 'risus varius orci,', 'pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 'default.jpg', 17, 29117, 0, '2022-05-10', 3, 0, 1, 1, 4),
(87, '474972976', 'dictum eleifend, nunc', 'Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris', 'default.jpg', 16, 14674, 0, '2020-10-08', 3, 0, 2, 1, 4),
(88, '152975198', 'bibendum. Donec felis', 'felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu,', 'default.jpg', 13, 21657, 0, '2022-10-09', 1, 0, 2, 1, 3),
(89, '119654084', 'nulla. In tincidunt', 'at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh', 'default.jpg', 12, 15669, 0, '2021-05-04', 2, 0, 2, 1, 6),
(90, '463064687', 'consequat auctor, nunc', 'arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada', 'default.jpg', 14, 23679, 0, '2022-05-28', 2, 0, 2, 1, 5),
(91, '85079867', 'nisl sem, consequat', 'felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam.', 'default.jpg', 13, 22907, 0, '2022-10-25', 3, 0, 1, 1, 3),
(92, '506405114', 'eleifend, nunc risus', 'neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam', 'default.jpg', 14, 35958, 0, '2021-07-27', 3, 0, 2, 1, 3),
(93, '261612267', 'Aliquam ornare, libero', 'erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in,', 'default.jpg', 20, 21824, 0, '2021-06-23', 1, 0, 2, 1, 3),
(94, '128469028', 'non, hendrerit id,', 'id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus', 'default.jpg', 19, 25681, 0, '2020-08-29', 1, 0, 1, 1, 4),
(95, '319542094', 'tellus. Phasellus elit', 'at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta', 'default.jpg', 14, 30040, 0, '2021-08-19', 2, 0, 2, 1, 1),
(96, '30461002', 'odio. Aliquam vulputate', 'tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac', 'default.jpg', 10, 24644, 0, '2022-12-08', 2, 0, 2, 1, 2),
(97, '32589198K', 'ante. Maecenas mi', 'ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam.', 'default.jpg', 19, 8143, 0, '2022-01-10', 3, 0, 1, 1, 3),
(98, '492047139', 'amet ultricies sem', 'montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent', 'default.jpg', 18, 31365, 0, '2020-08-28', 2, 0, 2, 1, 3),
(99, '10460727', 'risus. Duis a', 'lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper', 'default.jpg', 10, 21160, 0, '2021-05-15', 2, 0, 2, 1, 4),
(100, '296404276', 'malesuada. Integer id', 'Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec', 'default.jpg', 17, 11666, 0, '2021-06-29', 3, 0, 1, 1, 6),
(101, '342935427', 'enim, sit amet', 'vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque', 'default.jpg', 19, 30427, 0, '2023-02-19', 2, 0, 2, 1, 5);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=11112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `reference_user`, `first_name_user`, `last_name_user`, `email_user`, `mobile_user`, `address_user`, `birth_date_user`, `biography_user`, `login_user`, `password_user`, `type_user`, `state_user`) VALUES
(1, '1111', 'Isra', 'ZOUAK', 'isra.zouak@gmail.com', '0600000000', 'Annaba', '1980-01-01', NULL, 'isra_zouak', '123456', 2, 1),
(2, '2222', 'Khansa', 'ZOUAK', 'khensa.zouak@gmail.com', '0600000000', 'Annaba', '2000-01-01', NULL, 'khensa_zouak', '123456', 2, 1),
(3, '3333', 'Asma', 'ZENTAR', 'asmazentar@gmail.com', '06 66 66 66 66', 'Annaba', '2000-01-01', NULL, 'asma_zentar', '123456', 1, 1),
(4, '4444', 'Saïd', 'MALLEM', 'saidmallem@gmail.com', '06 00 00 00 00', '23000 Annaba Algérie', '1981-05-04', NULL, 'said_mallem', '123456', 3, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
