-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 01 Juin 2017 à 16:32
-- Version du serveur: 5.5.49-MariaDB-1ubuntu0.14.04.1
-- Version de PHP: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `db_komidi`
--

-- --------------------------------------------------------

--
-- Structure de la table `kdi_genre`
--

CREATE TABLE IF NOT EXISTS `kdi_genre` (
  `Gre_code` int(11) NOT NULL AUTO_INCREMENT,
  `Gre_nom` varchar(30) NOT NULL DEFAULT 'Comédie',
  PRIMARY KEY (`Gre_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `kdi_horaire`
--

CREATE TABLE IF NOT EXISTS `kdi_horaire` (
  `Hor_id` int(11) NOT NULL AUTO_INCREMENT,
  `Hor_Début` time NOT NULL,
  PRIMARY KEY (`Hor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `kdi_salle`
--

CREATE TABLE IF NOT EXISTS `kdi_salle` (
  `Sal_id` int(11) NOT NULL,
  `Sal_nom` varchar(30) NOT NULL,
  `Sal_latitude` double DEFAULT NULL,
  `Sal_longitude` double DEFAULT NULL,
  `Sal_jauge` smallint(4) DEFAULT NULL,
  `Sal_adresse` varchar(255) DEFAULT 'Inconnue',
  PRIMARY KEY (`Sal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `kdi_seance`
--

CREATE TABLE IF NOT EXISTS `kdi_seance` (
  `Sec_idSal` int(11) NOT NULL,
  `Sec_idHor` int(11) NOT NULL,
  `Sec_date` date NOT NULL,
  `Sec_idSpec` int(11) NOT NULL,
  PRIMARY KEY (`Sec_idSal`,`Sec_idHor`,`Sec_date`,`Sec_idSpec`),
  KEY `FK_spcsnc` (`Sec_idSpec`),
  KEY `FK_horsnc` (`Sec_idHor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `kdi_spectacle`
--

CREATE TABLE IF NOT EXISTS `kdi_spectacle` (
  `Spe_id` int(11) NOT NULL AUTO_INCREMENT,
  `Spe_titre` varchar(50) NOT NULL,
  `Spe_mes` varchar(50) NOT NULL,
  `Spe_acteur` text,
  `Spe_cie` varchar(80) NOT NULL,
  `Spe_genre` varchar(30) DEFAULT NULL,
  `Spe_duree` int(11) NOT NULL,
  `Spe_Lang` varchar(30) DEFAULT 'Français',
  `Spe_public` enum('tout','Scolaire') DEFAULT 'Scolaire',
  `Spe_affiche` varchar(50) NOT NULL,
  `Spe_resume_court` varchar(500) NOT NULL,
  `Spe_resume_long` text,
  PRIMARY KEY (`Spe_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `kdi_spectacle`
--

INSERT INTO `kdi_spectacle` (`Spe_id`, `Spe_titre`, `Spe_mes`, `Spe_acteur`, `Spe_cie`, `Spe_genre`, `Spe_duree`, `Spe_Lang`, `Spe_public`, `Spe_affiche`, `Spe_resume_court`, `Spe_resume_long`) VALUES
(1, 'Plouf!', 'Cyrille Louge, Ghislaine Laglantine', 'Ghislaine Laglantine', 'sans', 'Enfance', 60, 'Fr', 'tout', 'plouc.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(2, 'Plouf2', 'Ghislaine Laglantine', 'Cyrille Louge, Ghislaine Laglantine', 'Partage', 'Enfance', 60, 'Fr', NULL, '995062.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(3, 'Plouf3!', 'Cyrille Louge, Ghislaine Laglantine', 'Ghislaine Laglantine', 'sans', 'Enfance', 60, 'Fr', NULL, 'plouc.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(4, 'Plouf4', 'Ghislaine Laglantine', 'Cyrille Louge, Ghislaine Laglantine', 'Partage', 'Enfance', 60, 'Fr', NULL, 'plouc.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(5, 'Plouf5!', 'Cyrille Louge, Ghislaine Laglantine', 'Ghislaine Laglantine', 'sans', 'Enfance', 60, 'Fr', 'Scolaire', 'plouc.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(6, 'Plouf6', 'Ghislaine Laglantine', 'Cyrille Louge, Ghislaine Laglantine', 'Partage', 'Enfance', 60, 'Fr', NULL, 'Everest.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(7, 'Plouf7!', 'Cyrille Louge, Ghislaine Laglantine', 'Ghislaine Laglantine', 'sans', 'Enfance', 60, 'Fr', NULL, '995062.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(8, 'Plouf8', 'Ghislaine Laglantine', 'Cyrille Louge, Ghislaine Laglantine', 'Partage', 'Enfance', 60, 'Fr', NULL, 'MadMax.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(9, 'Plouf9!', 'Cyrille Louge, Ghislaine Laglantine', 'Ghislaine Laglantine', 'sans', 'Enfance', 60, 'Fr', NULL, 'plouc.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(10, 'Plouf10', 'Ghislaine Laglantine', 'Cyrille Louge, Ghislaine Laglantine', 'Partage', 'Enfance', 60, 'Fr', NULL, 'Everest.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(11, 'Plouf11!', 'Cyrille Louge, Ghislaine Laglantine', 'Ghislaine Laglantine', 'sans', 'Enfance', 60, 'Fr', 'Scolaire', '995062.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(12, 'Plouf12', 'Ghislaine Laglantine', 'Cyrille Louge, Ghislaine Laglantine', 'Partage', 'Enfance', 60, 'Fr', NULL, 'plouc.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(13, 'Plouf13!', 'Cyrille Louge, Ghislaine Laglantine', 'Ghislaine Laglantine', 'sans', 'Enfance', 60, 'Fr', 'Scolaire', 'MadMax.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur'),
(14, 'Plouf14', 'Ghislaine Laglantine', 'Cyrille Louge, Ghislaine Laglantine', 'Partage', 'Enfance', 60, 'Fr', NULL, 'Everest.jpg', 'Un loup-scie, un cochon quality-électrique, des lapins-pinces et une samba-grenouille vont vous emmener dans cette folle aventure très librement adaptée du célèbre album Plouf ! de Philippe Corentin.', 'Faits d''objets détournés, transformés et assemblés en marionnettes aimantées, ces drôles d''animaux affamés vont jouer au jeu du tel est pris qui croyait prendre en se piégeant à tour de rôle au fond d''un puits où, semble-t-il, le reflet de la lune se serait transformé en un alléchant fromage...\r\nAu centre de ce puits, composé de bois, de métal, la marionnettiste - tout à la fois conteuse, comédienne et bruiteuse - orchestre ce petit monde dans un style proche du cartoon mettant ainsi en valeur l''humour décalé de l''auteur');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE IF NOT EXISTS `membres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `motdepasse` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `membres`
--

INSERT INTO `membres` (`id`, `pseudo`, `mail`, `motdepasse`) VALUES
(1, 'Lucas', 'rochefeuillelucasjb@gmail.com', 'ceb9a8b7407ffeb2c52f57df4a1c6ecabd93f8f2'),
(2, 'User01', 'user01@gmail.com', 'd0a3d2822f2a0a06bde101148d7f9860b9ebc382'),
(3, 'User02', 'user02@gmail.com', '516b4c8ce797ffb8df1885dfe03061ec29fa6297'),
(4, 'User04', 'user04@gmail.com', '11b5abfbc0914db858d26ca8aa6f2226fef36f59'),
(5, 'User05', 'user05@gmail.com', 'ceb9a8b7407ffeb2c52f57df4a1c6ecabd93f8f2'),
(7, 'user08', 'user08@gmail.com', '1ea51bf32497d1b3708522b430b288a129f65307'),
(8, 'user07', 'user07@gmail.com', '39f193cfd7d0955cc821f3074a82b7d4b89d22bc'),
(9, 'admin', 'admin@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997'),
(10, 'adm', 'adm@gmail.com', '42ef63e7836ef622d9185c1a456051edf16095cc'),
(11, 'lucas', 'l@g.com', '10c25665e49274c39b8e8f7ad6e2a3d0b0bc5052'),
(12, 'adm2', 'adm2@g.com', '7b52009b64fd0a2a49e6d8a939753077792b0554'),
(13, 'a', 'a@a.c', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `kdi_seance`
--
ALTER TABLE `kdi_seance`
  ADD CONSTRAINT `FK_horsnc` FOREIGN KEY (`Sec_idHor`) REFERENCES `kdi_horaire` (`Hor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_sasncl` FOREIGN KEY (`Sec_idSal`) REFERENCES `kdi_salle` (`Sal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_spcsnc` FOREIGN KEY (`Sec_idSpec`) REFERENCES `kdi_spectacle` (`Spe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
