-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 10 juin 2023 à 13:45
-- Version du serveur : 5.7.24
-- Version de PHP : 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `couturepro`
--

-- --------------------------------------------------------

--
-- Structure de la table `cp_article`
--

CREATE TABLE `cp_article` (
  `ID_ARTICLE` int(11) NOT NULL,
  `NOM` varchar(100) NOT NULL,
  `DESCRIPTION` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cp_article`
--

INSERT INTO `cp_article` (`ID_ARTICLE`, `NOM`, `DESCRIPTION`) VALUES
(1, 'Gaaré', 'Grand boubou à l\'africaine');

-- --------------------------------------------------------

--
-- Structure de la table `cp_autre_mesure`
--

CREATE TABLE `cp_autre_mesure` (
  `ID_AUTRE_MESURE` int(11) NOT NULL,
  `INTITULEE` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cp_autre_mesure`
--

INSERT INTO `cp_autre_mesure` (`ID_AUTRE_MESURE`, `INTITULEE`) VALUES
(1, 'Long. Gaaré');

-- --------------------------------------------------------

--
-- Structure de la table `cp_autre_mesure_client`
--

CREATE TABLE `cp_autre_mesure_client` (
  `ID_AUTRE_MESURE_CLIENT` int(11) NOT NULL,
  `VALEUR` varchar(100) NOT NULL,
  `ID_AUTRE_MESURE` int(11) NOT NULL,
  `ID_CLIENT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cp_client`
--

CREATE TABLE `cp_client` (
  `ID_CLIENT` int(11) NOT NULL,
  `NOM` varchar(250) NOT NULL,
  `PRENOM` varchar(250) DEFAULT NULL,
  `ADRESSE` varchar(250) DEFAULT NULL,
  `TELEPHONE` varchar(250) DEFAULT NULL,
  `EPAULE` double DEFAULT NULL,
  `LONGMANCHE` double DEFAULT NULL,
  `POITRINE` double DEFAULT NULL,
  `LARMANCHE` double DEFAULT NULL,
  `TOURMANCHE` double DEFAULT NULL,
  `COU` double DEFAULT NULL,
  `LONGPANTALON` double DEFAULT NULL,
  `PIED` double DEFAULT NULL,
  `CUISSE` double DEFAULT NULL,
  `REIN` double DEFAULT NULL,
  `LAST_UPDATE` date DEFAULT NULL,
  `CREATION_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cp_client`
--

INSERT INTO `cp_client` (`ID_CLIENT`, `NOM`, `PRENOM`, `ADRESSE`, `TELEPHONE`, `EPAULE`, `LONGMANCHE`, `POITRINE`, `LARMANCHE`, `TOURMANCHE`, `COU`, `LONGPANTALON`, `PIED`, `CUISSE`, `REIN`, `LAST_UPDATE`, `CREATION_DATE`) VALUES
(1, 'Aliou', 'Garga', 'Ngaoundéré', '697 88 07 99', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cp_commande`
--

CREATE TABLE `cp_commande` (
  `ID_COMMANDE` int(11) NOT NULL,
  `STATUT` varchar(100) NOT NULL,
  `DATE_DEPOT` date NOT NULL,
  `DATE_LIVRAISON` date NOT NULL,
  `CREATION_CREATION` date NOT NULL,
  `LAST_UPDATE` date NOT NULL,
  `ID_CLIENT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cp_image`
--

CREATE TABLE `cp_image` (
  `ID_IMAGE` int(11) NOT NULL,
  `URL` longtext NOT NULL,
  `ID_MODELE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cp_modele`
--

CREATE TABLE `cp_modele` (
  `ID_MODELE` int(11) NOT NULL,
  `NUMERO` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cp_paiement`
--

CREATE TABLE `cp_paiement` (
  `ID_PAIEMENT` int(11) NOT NULL,
  `DATE_OPERATION` date DEFAULT NULL,
  `DATE_PAIEMENT` date DEFAULT NULL,
  `MONTANT` double DEFAULT NULL,
  `ID_COMMANDE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cp_paquet`
--

CREATE TABLE `cp_paquet` (
  `ID_PAQUET` int(11) NOT NULL,
  `PRIX_UNITAIRE` double NOT NULL,
  `QUANTITE` int(11) NOT NULL,
  `ID_COMMANDE` int(11) NOT NULL,
  `ID_ARTICLE` int(11) NOT NULL,
  `ID_MODELE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cp_privilege`
--

CREATE TABLE `cp_privilege` (
  `ID_PRIVILEGE` int(11) NOT NULL,
  `ID_USER` int(11) NOT NULL,
  `ID_ROLE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cp_role`
--

CREATE TABLE `cp_role` (
  `ID_ROLE` int(11) NOT NULL,
  `NAME` varchar(250) NOT NULL,
  `DESCRIPTION` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cp_role`
--

INSERT INTO `cp_role` (`ID_ROLE`, `NAME`, `DESCRIPTION`) VALUES
(1, 'ADMIN', 'Administrateur du système');

-- --------------------------------------------------------

--
-- Structure de la table `cp_user`
--

CREATE TABLE `cp_user` (
  `ID_USER` int(11) NOT NULL,
  `FIRSTNAME` varchar(250) NOT NULL,
  `LASTNAME` varchar(250) NOT NULL,
  `EMAIL` varchar(250) NOT NULL,
  `LOGIN` varchar(250) NOT NULL,
  `PASSWORD` varchar(250) NOT NULL,
  `IS_ACTIVE` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cp_user`
--

INSERT INTO `cp_user` (`ID_USER`, `FIRSTNAME`, `LASTNAME`, `EMAIL`, `LOGIN`, `PASSWORD`, `IS_ACTIVE`) VALUES
(1, 'Mohammad', 'Eljay', 'admin@saare-getzner.com', 'admin', '$2a$12$hADP9vu9ZYheQ.1Y5SM4bOXn4MEN7AUc9fll7IDad1hoJ7wifQ3A2', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cp_article`
--
ALTER TABLE `cp_article`
  ADD PRIMARY KEY (`ID_ARTICLE`);

--
-- Index pour la table `cp_autre_mesure`
--
ALTER TABLE `cp_autre_mesure`
  ADD PRIMARY KEY (`ID_AUTRE_MESURE`);

--
-- Index pour la table `cp_autre_mesure_client`
--
ALTER TABLE `cp_autre_mesure_client`
  ADD PRIMARY KEY (`ID_AUTRE_MESURE_CLIENT`),
  ADD KEY `CP_AUTRE_MESURE_CLIENT_CP_AUTRE_MESURE_FK` (`ID_AUTRE_MESURE`),
  ADD KEY `CP_AUTRE_MESURE_CLIENT_CP_CLIENT0_FK` (`ID_CLIENT`);

--
-- Index pour la table `cp_client`
--
ALTER TABLE `cp_client`
  ADD PRIMARY KEY (`ID_CLIENT`);

--
-- Index pour la table `cp_commande`
--
ALTER TABLE `cp_commande`
  ADD PRIMARY KEY (`ID_COMMANDE`),
  ADD KEY `CP_COMMANDE_CP_CLIENT_FK` (`ID_CLIENT`);

--
-- Index pour la table `cp_image`
--
ALTER TABLE `cp_image`
  ADD PRIMARY KEY (`ID_IMAGE`),
  ADD KEY `CP_IMAGE_CP_MODELE_FK` (`ID_MODELE`);

--
-- Index pour la table `cp_modele`
--
ALTER TABLE `cp_modele`
  ADD PRIMARY KEY (`ID_MODELE`);

--
-- Index pour la table `cp_paiement`
--
ALTER TABLE `cp_paiement`
  ADD PRIMARY KEY (`ID_PAIEMENT`),
  ADD KEY `CP_PAIEMENT_CP_COMMANDE_FK` (`ID_COMMANDE`);

--
-- Index pour la table `cp_paquet`
--
ALTER TABLE `cp_paquet`
  ADD PRIMARY KEY (`ID_PAQUET`),
  ADD KEY `CP_PAQUET_CP_COMMANDE_FK` (`ID_COMMANDE`),
  ADD KEY `CP_PAQUET_CP_ARTICLE0_FK` (`ID_ARTICLE`),
  ADD KEY `CP_PAQUET_CP_MODELE1_FK` (`ID_MODELE`);

--
-- Index pour la table `cp_privilege`
--
ALTER TABLE `cp_privilege`
  ADD PRIMARY KEY (`ID_PRIVILEGE`),
  ADD KEY `CP_PRIVILEGE_CP_USER_FK` (`ID_USER`),
  ADD KEY `CP_PRIVILEGE_CP_ROLE0_FK` (`ID_ROLE`);

--
-- Index pour la table `cp_role`
--
ALTER TABLE `cp_role`
  ADD PRIMARY KEY (`ID_ROLE`);

--
-- Index pour la table `cp_user`
--
ALTER TABLE `cp_user`
  ADD PRIMARY KEY (`ID_USER`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cp_article`
--
ALTER TABLE `cp_article`
  MODIFY `ID_ARTICLE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cp_autre_mesure`
--
ALTER TABLE `cp_autre_mesure`
  MODIFY `ID_AUTRE_MESURE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cp_autre_mesure_client`
--
ALTER TABLE `cp_autre_mesure_client`
  MODIFY `ID_AUTRE_MESURE_CLIENT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cp_client`
--
ALTER TABLE `cp_client`
  MODIFY `ID_CLIENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cp_commande`
--
ALTER TABLE `cp_commande`
  MODIFY `ID_COMMANDE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cp_image`
--
ALTER TABLE `cp_image`
  MODIFY `ID_IMAGE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `cp_modele`
--
ALTER TABLE `cp_modele`
  MODIFY `ID_MODELE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `cp_paiement`
--
ALTER TABLE `cp_paiement`
  MODIFY `ID_PAIEMENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `cp_paquet`
--
ALTER TABLE `cp_paquet`
  MODIFY `ID_PAQUET` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cp_privilege`
--
ALTER TABLE `cp_privilege`
  MODIFY `ID_PRIVILEGE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cp_role`
--
ALTER TABLE `cp_role`
  MODIFY `ID_ROLE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cp_user`
--
ALTER TABLE `cp_user`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cp_autre_mesure_client`
--
ALTER TABLE `cp_autre_mesure_client`
  ADD CONSTRAINT `CP_AUTRE_MESURE_CLIENT_CP_AUTRE_MESURE_FK` FOREIGN KEY (`ID_AUTRE_MESURE`) REFERENCES `cp_autre_mesure` (`ID_AUTRE_MESURE`),
  ADD CONSTRAINT `CP_AUTRE_MESURE_CLIENT_CP_CLIENT0_FK` FOREIGN KEY (`ID_CLIENT`) REFERENCES `cp_client` (`ID_CLIENT`);

--
-- Contraintes pour la table `cp_commande`
--
ALTER TABLE `cp_commande`
  ADD CONSTRAINT `CP_COMMANDE_CP_CLIENT_FK` FOREIGN KEY (`ID_CLIENT`) REFERENCES `cp_client` (`ID_CLIENT`);

--
-- Contraintes pour la table `cp_image`
--
ALTER TABLE `cp_image`
  ADD CONSTRAINT `CP_IMAGE_CP_MODELE_FK` FOREIGN KEY (`ID_MODELE`) REFERENCES `cp_modele` (`ID_MODELE`);

--
-- Contraintes pour la table `cp_paiement`
--
ALTER TABLE `cp_paiement`
  ADD CONSTRAINT `CP_PAIEMENT_CP_COMMANDE_FK` FOREIGN KEY (`ID_COMMANDE`) REFERENCES `cp_commande` (`ID_COMMANDE`);

--
-- Contraintes pour la table `cp_paquet`
--
ALTER TABLE `cp_paquet`
  ADD CONSTRAINT `CP_PAQUET_CP_ARTICLE0_FK` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `cp_article` (`ID_ARTICLE`),
  ADD CONSTRAINT `CP_PAQUET_CP_COMMANDE_FK` FOREIGN KEY (`ID_COMMANDE`) REFERENCES `cp_commande` (`ID_COMMANDE`),
  ADD CONSTRAINT `CP_PAQUET_CP_MODELE1_FK` FOREIGN KEY (`ID_MODELE`) REFERENCES `cp_modele` (`ID_MODELE`);

--
-- Contraintes pour la table `cp_privilege`
--
ALTER TABLE `cp_privilege`
  ADD CONSTRAINT `CP_PRIVILEGE_CP_ROLE0_FK` FOREIGN KEY (`ID_ROLE`) REFERENCES `cp_role` (`ID_ROLE`),
  ADD CONSTRAINT `CP_PRIVILEGE_CP_USER_FK` FOREIGN KEY (`ID_USER`) REFERENCES `cp_user` (`ID_USER`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
