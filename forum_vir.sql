-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : Dim 19 avr. 2020 à 16:26
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `forum_vir`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `creationdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id_comment`, `content`, `user_id`, `post_id`, `creationdate`) VALUES
(13, 'coucou', 1, 20, '2020-04-19 15:10:08'),
(14, 'ccccc', 1, 19, '2020-04-19 15:13:48'),
(15, 'bimm !!!!&#13;&#10;', 1, 18, '2020-04-19 15:41:08');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id_post` int(11) NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `creationdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id_post`, `content`, `user_id`, `topic_id`, `creationdate`) VALUES
(3, 'test', 1, 9, '2020-04-17 14:02:18'),
(8, 'essai message supp', 4, 9, '2020-04-18 12:04:16'),
(9, 'un autre', 4, 9, '2020-04-18 12:04:26'),
(18, 'test&#13;&#10;', 1, 10, '2020-04-19 14:36:14'),
(19, 'a&#13;&#10;a&#13;&#10;a&#13;&#10;a&#13;&#10;a&#13;&#10;a&#13;&#10;a&#13;&#10;a&#13;&#10;a&#13;&#10;a&#13;&#10;a&#13;&#10;a&#13;&#10;a&#13;&#10;aa', 1, 10, '2020-04-19 14:56:38'),
(20, 'je&#13;&#10;suis assez &#13;&#10;toubmlé', 1, 10, '2020-04-19 14:57:06'),
(22, 'brrrrrr\r\n           ', 1, 11, '2020-04-19 17:19:52'),
(23, '        et bimla modif\r\n                         ', 4, 12, '2020-04-19 17:45:48');

-- --------------------------------------------------------

--
-- Structure de la table `signalement`
--

CREATE TABLE `signalement` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `creationdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `signalement`
--

INSERT INTO `signalement` (`user_id`, `post_id`, `creationdate`) VALUES
(1, 23, '2020-04-19 18:12:15'),
(1, 23, '2020-04-19 18:22:01');

-- --------------------------------------------------------

--
-- Structure de la table `topic`
--

CREATE TABLE `topic` (
  `id_topic` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `creationdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `closed` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `topic`
--

INSERT INTO `topic` (`id_topic`, `title`, `creationdate`, `user_id`, `closed`) VALUES
(9, 'test', '2020-04-17 14:02:18', 1, 0),
(10, 'sujet 2', '2020-04-17 14:06:03', 1, 0),
(11, '3', '2020-04-17 14:09:49', 1, 0),
(12, '1', '2020-04-17 14:22:05', 1, 0),
(13, 'Sujet après affich topic', '2020-04-17 17:29:17', 1, 0),
(14, 'essai avatar', '2020-04-18 19:03:30', 4, 0),
(15, 'nojveau sujet à 20h07', '2020-04-18 20:08:27', 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `registerdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `roles` json DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`, `registerdate`, `roles`, `avatar`) VALUES
(1, 'admin', 'gregory.pace@hotmail.fr', '$argon2i$v=19$m=1024,t=2,p=2$MU8vbEtqek1oWUR6OGwyZw$nCWN7R8B2/8YVwMrqQ6X97qrCAntQHtP6+tCl2ruFNc', '2020-04-15 13:40:25', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', 'public/img/acheter-un-chat (1).jpg'),
(2, 'test', 'toto@hotmail.fr', '$argon2i$v=19$m=1024,t=2,p=2$a1pkZE1GT0pWaVhJS1NFOQ$ySTQ6oWB4WCFa2QT64BBlwjIOF+ELzjLAVjFcQqPrX0', '2020-04-17 10:47:38', '[\"ROLE_USER\"]', NULL),
(4, 'toto', 'toto@toto.com', '$argon2i$v=19$m=1024,t=2,p=2$eVJGemw3QndoWkxFejIxNw$6GEfhWyYnqOlTSFqcMC5vzxJJtTvEpeuVBhYDuyil5E', '2020-04-18 11:17:19', '[\"ROLE_USER\"]', 'public/img/acheter-un-chat (1).jpg');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `user_id_FK` (`user_id`),
  ADD KEY `post_id_FK` (`post_id`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `topic_ibfk_2` (`topic_id`),
  ADD KEY `usert_ibfk_1` (`user_id`);

--
-- Index pour la table `signalement`
--
ALTER TABLE `signalement`
  ADD KEY `user_FK` (`user_id`),
  ADD KEY `post_FK` (`post_id`);

--
-- Index pour la table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id_topic`),
  ADD KEY `FK_topic_user` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `topic`
--
ALTER TABLE `topic`
  MODIFY `id_topic` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `post_id_FK` FOREIGN KEY (`post_id`) REFERENCES `post` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `topic_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id_topic`),
  ADD CONSTRAINT `usert_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `signalement`
--
ALTER TABLE `signalement`
  ADD CONSTRAINT `post_FK` FOREIGN KEY (`post_id`) REFERENCES `post` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `FK_topic_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
